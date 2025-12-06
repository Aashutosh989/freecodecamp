--
-- PostgreSQL database dump
--

\restrict zEFFootugkpZgsB2qWuKTE8FHhhKksMphJu5X4F6Knj5o9mmVMYYoYfNWnjjkin

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.1

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: astroid_belt; Type: TABLE; Schema: public; Owner: Ashu
--

CREATE TABLE public.astroid_belt (
    astroid_belt_id integer CONSTRAINT astroid_belt_belt_id_not_null NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying(40)
);



--
-- Name: astroid_belt_belt_id_seq; Type: SEQUENCE; Schema: public; Owner: Ashu
--

CREATE SEQUENCE public.astroid_belt_belt_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



--
-- Name: astroid_belt_belt_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Ashu
--

ALTER SEQUENCE public.astroid_belt_belt_id_seq OWNED BY public.astroid_belt.astroid_belt_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: Ashu
--

CREATE TABLE public.galaxy (
    galaxy_id integer CONSTRAINT galaxy_id_not_null NOT NULL,
    galaxy_types text,
    name character varying(30) NOT NULL,
    has_life boolean NOT NULL,
    age_in_million_years integer
);



--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: Ashu
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Ashu
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: Ashu
--

CREATE TABLE public.moon (
    moon_id integer CONSTRAINT moon_id_not_null NOT NULL,
    name character varying(30),
    planet_id integer NOT NULL,
    is_spherical boolean DEFAULT false NOT NULL,
    has_water boolean DEFAULT false,
    galaxy_id integer
);



--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: Ashu
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Ashu
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: Ashu
--

CREATE TABLE public.planet (
    has_life boolean NOT NULL,
    name character varying(30),
    description text,
    galaxy_id integer,
    planet_id integer NOT NULL,
    star_id integer
);


ALTER TABLE public.planet OWNER TO "Ashu";

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: Ashu
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.planet_planet_id_seq OWNER TO "Ashu";

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Ashu
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: Ashu
--

CREATE TABLE public.star (
    star_id integer CONSTRAINT star_id_not_null NOT NULL,
    name character varying(30),
    galaxy_id integer,
    ag_in_million_of_years integer DEFAULT 1 NOT NULL,
    mass_in_cubic numeric
);


ALTER TABLE public.star OWNER TO "Ashu";

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: Ashu
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.star_id_seq OWNER TO "Ashu";

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Ashu
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: astroid_belt astroid_belt_id; Type: DEFAULT; Schema: public; Owner: Ashu
--

ALTER TABLE ONLY public.astroid_belt ALTER COLUMN astroid_belt_id SET DEFAULT nextval('public.astroid_belt_belt_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: Ashu
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: Ashu
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: Ashu
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: Ashu
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: astroid_belt; Type: TABLE DATA; Schema: public; Owner: Ashu
--

INSERT INTO public.astroid_belt VALUES (1, 2, 'kuiper Belt');
INSERT INTO public.astroid_belt VALUES (2, 1, 'Oort Cloud');
INSERT INTO public.astroid_belt VALUES (3, 4, 'Vesta');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: Ashu
--

INSERT INTO public.galaxy VALUES (5, 'Dwarf', 'Draco', true, 2352);
INSERT INTO public.galaxy VALUES (3, 'Dwarf', 'Ursa Minor', false, 1462);
INSERT INTO public.galaxy VALUES (1, 'Irregular', 'Leo A', false, 1254);
INSERT INTO public.galaxy VALUES (2, 'Dwarf', 'Sagittarius', true, 1154);
INSERT INTO public.galaxy VALUES (6, 'Irregular', 'Sextans A', false, 1834);
INSERT INTO public.galaxy VALUES (4, 'Dwarf', 'Sculptor', true, 1547);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: Ashu
--

INSERT INTO public.moon VALUES (13, 'Enceladus', 6, false, false, 2);
INSERT INTO public.moon VALUES (15, 'Dione', 6, true, false, 4);
INSERT INTO public.moon VALUES (9, 'Charon', 10, false, true, 2);
INSERT INTO public.moon VALUES (11, 'Rhea', 6, false, false, 4);
INSERT INTO public.moon VALUES (17, 'Titania', 7, false, false, 3);
INSERT INTO public.moon VALUES (7, 'Titan', 6, false, false, 5);
INSERT INTO public.moon VALUES (5, 'IO', 5, false, false, 6);
INSERT INTO public.moon VALUES (3, 'Europa', 5, false, false, 4);
INSERT INTO public.moon VALUES (20, 'Tethys', 6, false, false, 6);
INSERT INTO public.moon VALUES (16, 'Oberon', 7, false, false, 2);
INSERT INTO public.moon VALUES (14, 'Mimas', 6, true, true, 6);
INSERT INTO public.moon VALUES (12, 'Iapetus', 6, false, false, 3);
INSERT INTO public.moon VALUES (10, 'Miranda', 7, true, false, 5);
INSERT INTO public.moon VALUES (6, 'Callisto', 9, false, false, 1);
INSERT INTO public.moon VALUES (8, 'Triton', 8, false, false, 2);
INSERT INTO public.moon VALUES (2, 'Deimos', 4, false, true, 5);
INSERT INTO public.moon VALUES (1, 'Phobos', 4, true, false, 1);
INSERT INTO public.moon VALUES (19, 'Bhuru', 3, true, true, 1);
INSERT INTO public.moon VALUES (18, 'Ariel', 7, false, false, 5);
INSERT INTO public.moon VALUES (4, 'Ganymede', 5, true, true, 3);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: Ashu
--

INSERT INTO public.planet VALUES (false, 'Mars', 'Famous for its rusty color and home to the solar system''s largest volcano, Olympus Mons.', 3, 4, 1);
INSERT INTO public.planet VALUES (false, 'Eris', 'One of the most massive dwarf planet in scattered disk beyond kuiper belt.', 6, 12, 1);
INSERT INTO public.planet VALUES (false, 'Saturn', 'A gas giant famous for its spectacular view and complex ring system.', 3, 6, 4);
INSERT INTO public.planet VALUES (false, 'Jupiter', 'Largest planet, a gas giant with the great red spot.', 1, 5, 3);
INSERT INTO public.planet VALUES (false, 'Ceres', 'The only dwarf planet in the inner solar system.', 6, 9, 3);
INSERT INTO public.planet VALUES (false, 'Neptune', 'The outermost and coldest of major planets, an ice giant.', 4, 8, 4);
INSERT INTO public.planet VALUES (true, 'Pluto', 'The most famous dwarf planet in kuiper belt.', 4, 10, 1);
INSERT INTO public.planet VALUES (true, 'Earth', 'Our home planet.', 2, 3, 5);
INSERT INTO public.planet VALUES (true, 'Uranus', 'An ice giant known for orbiting the sun on its side.', 5, 7, 2);
INSERT INTO public.planet VALUES (false, 'Mercury', 'Smallest planet and closet to sun.', 1, 1, 5);
INSERT INTO public.planet VALUES (false, 'Venus', 'Hottest due to a thick atmosphere causing a runaway greenhouse effect.', 2, 2, 2);
INSERT INTO public.planet VALUES (false, 'Haumea', 'Notable for its rapid rotation, which has distorted its shape into an ellipse(egg-like).', 5, 11, 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: Ashu
--

INSERT INTO public.star VALUES (2, 'Denebola', 2, 164, 264);
INSERT INTO public.star VALUES (4, 'Zosma', 5, 654, 354);
INSERT INTO public.star VALUES (1, 'Regulus', 1, 145, 241);
INSERT INTO public.star VALUES (6, 'Sirius', 6, 431, 245);
INSERT INTO public.star VALUES (5, 'Vega', 4, 275, 642);
INSERT INTO public.star VALUES (3, 'Algieba', 3, 240, 481);


--
-- Name: astroid_belt_belt_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Ashu
--

SELECT pg_catalog.setval('public.astroid_belt_belt_id_seq', 3, true);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Ashu
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Ashu
--

SELECT pg_catalog.setval('public.moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Ashu
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Ashu
--

SELECT pg_catalog.setval('public.star_id_seq', 1, false);


--
-- Name: astroid_belt astroid_belt_name_key; Type: CONSTRAINT; Schema: public; Owner: Ashu
--

ALTER TABLE ONLY public.astroid_belt
    ADD CONSTRAINT astroid_belt_name_key UNIQUE (name);


--
-- Name: astroid_belt astroid_belt_pkey; Type: CONSTRAINT; Schema: public; Owner: Ashu
--

ALTER TABLE ONLY public.astroid_belt
    ADD CONSTRAINT astroid_belt_pkey PRIMARY KEY (astroid_belt_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: Ashu
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: Ashu
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: Ashu
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: Ashu
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: Ashu
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: Ashu
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: Ashu
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: Ashu
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: astroid_belt astroid_belt_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Ashu
--

ALTER TABLE ONLY public.astroid_belt
    ADD CONSTRAINT astroid_belt_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Ashu
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_galaxy_galaxy_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: Ashu
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_galaxy_galaxy_id_fk FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: planet planet_planet_planet_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: Ashu
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_planet_id_fk FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Ashu
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Ashu
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

\unrestrict zEFFootugkpZgsB2qWuKTE8FHhhKksMphJu5X4F6Knj5o9mmVMYYoYfNWnjjkin

