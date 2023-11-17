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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(100) NOT NULL,
    shape text,
    visible_from_earth boolean NOT NULL,
    galaxy_id integer
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constallation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constallation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constallation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constallation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constallation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    size numeric,
    is_spiral boolean NOT NULL,
    has_ring boolean
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
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    type character varying(50),
    is_inhabited boolean,
    planet_id integer,
    is_satellite boolean NOT NULL,
    crater_count integer,
    surface_temperature integer
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
    name character varying(100) NOT NULL,
    type character varying(50),
    is_habitable boolean NOT NULL,
    star_id integer,
    has_ring boolean
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
    name character varying(100) NOT NULL,
    type character varying(50),
    is_sun boolean NOT NULL,
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constallation_constellation_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


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
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Orion', 'Hunter', true, 1);
INSERT INTO public.constellation VALUES (2, 'Ursa Major', 'Bear', true, 2);
INSERT INTO public.constellation VALUES (3, 'Cygnus', 'Swan', true, 1);
INSERT INTO public.constellation VALUES (4, 'Leo', 'Lion', true, 3);
INSERT INTO public.constellation VALUES (5, 'Pegasus', 'Winged Horse', true, 2);
INSERT INTO public.constellation VALUES (6, 'Draco', 'Dragon', true, 4);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100000, true, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 120000, true, false);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 50000, false, false);
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 150000, true, true);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 75000, false, true);
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 80000, true, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 'Rocky', false, 1, true, 5000, -50);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Rocky', false, 12, true, 200, -20);
INSERT INTO public.moon VALUES (3, 'Europa', 'Icy', false, 6, true, 100, -150);
INSERT INTO public.moon VALUES (4, 'Titan', 'Icy', false, 4, true, 500, -180);
INSERT INTO public.moon VALUES (5, 'Ganymede', 'Icy', false, 5, true, 700, -160);
INSERT INTO public.moon VALUES (6, 'Yavin 4', 'Forest', true, 7, true, NULL, NULL);
INSERT INTO public.moon VALUES (7, 'Endor Moon', 'Forest', false, 8, true, NULL, NULL);
INSERT INTO public.moon VALUES (8, 'Hoth Moon 1', 'Ice', false, 9, true, NULL, NULL);
INSERT INTO public.moon VALUES (9, 'Alderaan Moon', 'Rocky', false, 10, true, NULL, NULL);
INSERT INTO public.moon VALUES (10, 'Pandora Moon 1', 'Rocky', false, 11, true, NULL, NULL);
INSERT INTO public.moon VALUES (11, 'Exomoon-1', 'Unknown', false, 1, true, NULL, NULL);
INSERT INTO public.moon VALUES (12, 'Exomoon-2', 'Unknown', false, 2, true, NULL, NULL);
INSERT INTO public.moon VALUES (13, 'Exomoon-3', 'Unknown', false, 3, true, NULL, NULL);
INSERT INTO public.moon VALUES (14, 'Exomoon-4', 'Unknown', false, 4, true, NULL, NULL);
INSERT INTO public.moon VALUES (15, 'Exomoon-5', 'Unknown', false, 5, true, NULL, NULL);
INSERT INTO public.moon VALUES (16, 'Exomoon-6', 'Unknown', false, 6, true, NULL, NULL);
INSERT INTO public.moon VALUES (17, 'Exomoon-7', 'Unknown', false, 7, true, NULL, NULL);
INSERT INTO public.moon VALUES (18, 'Exomoon-8', 'Unknown', false, 8, true, NULL, NULL);
INSERT INTO public.moon VALUES (19, 'Exomoon-9', 'Unknown', false, 9, true, NULL, NULL);
INSERT INTO public.moon VALUES (20, 'Exomoon-10', 'Unknown', false, 10, true, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Terrestrial', true, 1, false);
INSERT INTO public.planet VALUES (2, 'Mars', 'Terrestrial', false, 1, false);
INSERT INTO public.planet VALUES (3, 'Jupiter', 'Gas Giant', false, 1, true);
INSERT INTO public.planet VALUES (4, 'Saturn', 'Gas Giant', false, 1, true);
INSERT INTO public.planet VALUES (5, 'Neptune', 'Ice Giant', false, 1, true);
INSERT INTO public.planet VALUES (6, 'Tatooine', 'Desert', false, 5, false);
INSERT INTO public.planet VALUES (7, 'Endor', 'Forest', false, 5, false);
INSERT INTO public.planet VALUES (8, 'Hoth', 'Ice', false, 5, false);
INSERT INTO public.planet VALUES (9, 'Alderaan', 'Terrestrial', true, 5, false);
INSERT INTO public.planet VALUES (10, 'Pandora', 'Forest', false, 2, false);
INSERT INTO public.planet VALUES (11, 'Exoplanet-1', 'Unknown', false, 3, false);
INSERT INTO public.planet VALUES (12, 'Exoplanet-2', 'Unknown', false, 4, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'G-type', true, 1);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 'Red Supergiant', false, 1);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 'M-type', false, 1);
INSERT INTO public.star VALUES (4, 'Alpha Centauri A', 'G-type', false, 1);
INSERT INTO public.star VALUES (5, 'Sirius', 'A-type', false, 1);
INSERT INTO public.star VALUES (6, 'Antares', 'Red Supergiant', false, 2);
INSERT INTO public.star VALUES (7, 'Vega', 'A-type', false, 4);
INSERT INTO public.star VALUES (8, 'Aldebaran', 'K-type', false, 5);


--
-- Name: constallation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constallation_constellation_id_seq', 6, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


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

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: constellation constallation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constallation_name_key UNIQUE (name);


--
-- Name: constellation constallation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constallation_pkey PRIMARY KEY (constellation_id);


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
-- Name: constellation constallation_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constallation_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

