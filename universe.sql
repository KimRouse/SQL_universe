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
    name character varying(30) NOT NULL,
    star_id integer NOT NULL,
    symbolism character varying(30),
    area_in_square_degrees integer,
    listed_by_ptolemy boolean,
    stars_with_planets integer
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_type text NOT NULL,
    constellation_id integer,
    distance_from_earth_in_million_light_years double precision
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
    name character varying(20) NOT NULL,
    planet_id integer NOT NULL,
    mean_solar_density numeric(10,5),
    surface_gravity double precision,
    mean_solar_radius double precision
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
    name character varying(30) NOT NULL,
    planet_type character varying(20) NOT NULL,
    orbital_period numeric(13,5),
    star_id integer,
    has_moon boolean
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
    name character varying(30) NOT NULL,
    star_class character varying(10) NOT NULL,
    galaxy_id integer,
    solar_mass double precision,
    solar_radius double precision
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

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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

INSERT INTO public.constellation VALUES (12, 'Andromeda', 6, 'chained woman', 722, true, 12);
INSERT INTO public.constellation VALUES (13, 'Ara', 7, 'altar', 237, true, 12);
INSERT INTO public.constellation VALUES (14, 'Cancer', 8, 'crab', 506, true, 10);
INSERT INTO public.constellation VALUES (15, 'Carnes Venatici', 9, 'hunting dogs', 465, false, 4);
INSERT INTO public.constellation VALUES (16, 'Hydra', 10, 'sea serpent', 1303, true, 18);
INSERT INTO public.constellation VALUES (17, 'Leo', 11, 'lion', 947, true, 13);
INSERT INTO public.constellation VALUES (18, 'Sagittarius', 14, 'archer', 867, true, 32);
INSERT INTO public.constellation VALUES (19, 'Sculptor', 15, 'sculptor', 475, false, 6);
INSERT INTO public.constellation VALUES (20, 'Triangulum', 16, 'triangle', 132, true, 3);
INSERT INTO public.constellation VALUES (21, 'Ursa Major', 17, 'great bear', 1280, true, 21);
INSERT INTO public.constellation VALUES (22, 'Virgo', 18, 'maiden', 1294, true, 29);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (8, 'Large Magellanic Cloud', 'barred dwarf spiral', NULL, 0.163);
INSERT INTO public.galaxy VALUES (9, 'Sextants', 'dwarf irregular', NULL, 4.31);
INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'barred spiral', 12, 2.5);
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 'barred spiral', 18, 0);
INSERT INTO public.galaxy VALUES (3, 'Whirlpool', 'interacting grand-design spiral', 15, 31);
INSERT INTO public.galaxy VALUES (4, 'Triangulum', 'spiral', 20, 2.73);
INSERT INTO public.galaxy VALUES (5, 'Cigar', 'starburst', 21, 12);
INSERT INTO public.galaxy VALUES (6, 'Cartwheel', 'lenticular ring', 19, 500);
INSERT INTO public.galaxy VALUES (7, 'Peekaboo', 'irregular compact blue dwarf', 16, 22);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Phobos', 4, 1.86100, 0.0067, 11.1);
INSERT INTO public.moon VALUES (2, 'Deimos', 4, 1.46500, 0.003, 6.2);
INSERT INTO public.moon VALUES (3, 'Moon', 3, 3.34400, 1.622, 1737.4);
INSERT INTO public.moon VALUES (4, 'Io', 5, 3.52800, 1.7965, 1821.6);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 3.01300, 1.314, 1560.8);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 1.93600, 1.428, 2.631);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 1.83440, 1.235, 2.41);
INSERT INTO public.moon VALUES (8, 'Mimas', 6, 1.15010, 0.064, 198.2);
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, 1.60970, 0.113, 252.1);
INSERT INTO public.moon VALUES (10, 'Tethys', 6, 0.98400, 0.146, 531.1);
INSERT INTO public.moon VALUES (11, 'Dione', 6, 1.47810, 0.232, 561.4);
INSERT INTO public.moon VALUES (12, 'Rhea', 6, 1.23720, 0.264, 763.5);
INSERT INTO public.moon VALUES (13, 'Titan', 6, 1.87980, 1.352, 2574.73);
INSERT INTO public.moon VALUES (14, 'Iapetus', 6, 1.08870, 0.223, 734.4);
INSERT INTO public.moon VALUES (15, 'Mirand', 7, 1.20000, 0.77, 235.8);
INSERT INTO public.moon VALUES (16, 'Ariel', 7, 1.59200, 0.249, 578.9);
INSERT INTO public.moon VALUES (17, 'Umbriel', 7, 1.39000, 0.25, 584.7);
INSERT INTO public.moon VALUES (18, 'Titania', 7, 1.71100, 0.365, 788.4);
INSERT INTO public.moon VALUES (19, 'Oberon', 7, 1.63000, 0.354, 761.4);
INSERT INTO public.moon VALUES (20, 'Triton', 8, 2.06100, 0.78, 1353.4);
INSERT INTO public.moon VALUES (21, 'Proteus', 8, 1.30000, 0.07, 210);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'terrestrial', 87.96900, 2, false);
INSERT INTO public.planet VALUES (2, 'Venus', 'terrestrial', 224.70000, 2, false);
INSERT INTO public.planet VALUES (3, 'Earth', 'terrestrial', 365.25640, 2, true);
INSERT INTO public.planet VALUES (4, 'Mars', 'terrestrial', 687.00000, 2, true);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'gas giant', 4328.90000, 2, true);
INSERT INTO public.planet VALUES (6, 'Saturn', 'gas giant', 10759.00000, 2, true);
INSERT INTO public.planet VALUES (7, 'Uranus', 'ice giant', 30660.00000, 2, true);
INSERT INTO public.planet VALUES (8, 'Neptune', 'ice giant', 60148.35000, 2, true);
INSERT INTO public.planet VALUES (9, 'Saffar', 'gas giant', 4.61700, 1, false);
INSERT INTO public.planet VALUES (10, 'Samh', 'gas giant', 241.30000, 1, false);
INSERT INTO public.planet VALUES (11, 'Majriti', 'gas giant', 1276.50000, 1, true);
INSERT INTO public.planet VALUES (12, 'Dulcinea', 'hot neptune', 9.60000, 3, false);
INSERT INTO public.planet VALUES (13, 'Rocinante', 'gas giant', 310.55000, 3, false);
INSERT INTO public.planet VALUES (14, 'Quijote', 'gas giant', 643.25000, 3, NULL);
INSERT INTO public.planet VALUES (15, 'Sancho', 'gas giant', 4205.80000, 3, false);
INSERT INTO public.planet VALUES (16, 'Upsilon Leonis b', 'gas giant', 385.20000, 4, NULL);
INSERT INTO public.planet VALUES (17, 'Janssen', 'super earth', 0.73650, 5, false);
INSERT INTO public.planet VALUES (18, 'Galileo', 'gas giant', 14.65000, 5, false);
INSERT INTO public.planet VALUES (19, 'Brahe', 'gas giant', 44.34000, 5, false);
INSERT INTO public.planet VALUES (20, 'Harriot', 'gas giant', 262.00000, 5, NULL);
INSERT INTO public.planet VALUES (21, 'Lipperhey', 'gas giant', 4867.00000, 5, false);
INSERT INTO public.planet VALUES (22, 'Beta Cancri b', 'gas giant', 605.00000, 8, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'Sun', 'G-type', 2, 1, 1);
INSERT INTO public.star VALUES (3, 'Cervantes', 'G-type', 2, 1.1, 1.36);
INSERT INTO public.star VALUES (4, 'Upsilon Leonis', 'G-type', 2, 2.58, 11);
INSERT INTO public.star VALUES (5, 'Copernicus', 'K-type', 2, 0.905, 0.943);
INSERT INTO public.star VALUES (6, 'Alpheratz', 'B-type', 1, 3.8, 2.7);
INSERT INTO public.star VALUES (7, 'Beta Arae', 'K-type', 2, 8.21, 142);
INSERT INTO public.star VALUES (8, 'Tarf', 'K-type', 2, 1.7, 47.2);
INSERT INTO public.star VALUES (12, 'WOH G64', 'M-type', 8, 25, 1730);
INSERT INTO public.star VALUES (13, 'Alpha Sextantis', 'A-type', 9, 2.57, 3.07);
INSERT INTO public.star VALUES (14, 'Kaus Australis', 'B-type', 2, 3.515, 6.8);
INSERT INTO public.star VALUES (15, 'Alpha Sculptoris', 'B-type', 2, 5.01, 7.52);
INSERT INTO public.star VALUES (1, 'Titawin', 'F-type', 1, 1.27, 1.48);
INSERT INTO public.star VALUES (9, 'Cor Caroli', 'A-type', 1, 2.97, 2.49);
INSERT INTO public.star VALUES (10, 'Alphard', 'K-type', 1, 3.03, 50.5);
INSERT INTO public.star VALUES (11, 'Regulas', 'B-type', 1, 3.8, 4.35);
INSERT INTO public.star VALUES (16, 'Beta Trianguli', 'A-type', 1, 3.5, NULL);
INSERT INTO public.star VALUES (17, 'Alioth', 'A-type', 1, 2.91, 4.14);
INSERT INTO public.star VALUES (18, 'Spica', 'B-type', 1, 11.43, 7.47);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 22, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 9, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 22, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 18, true);


--
-- Name: constellation constellation_constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


--
-- Name: galaxy galaxy_galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_panet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_panet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_name_key UNIQUE (name);


--
-- Name: constellation constellation_brightest_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_brightest_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: galaxy galaxy_constellation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_constellation_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


--
-- Name: moon moon_of_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_of_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

