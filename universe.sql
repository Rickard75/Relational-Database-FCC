--
-- PostgreSQL database dump
--

-- Dumped from database version 14.18 (Ubuntu 14.18-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.18 (Ubuntu 14.18-0ubuntu0.22.04.1)

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
-- Name: black_hole; Type: TABLE; Schema: public; Owner: rick
--

CREATE TABLE public.black_hole (
    blackhole_id integer NOT NULL,
    name character varying(60) NOT NULL,
    type text,
    solar_masses numeric(10,3),
    distance_ly integer,
    radius_km integer,
    galaxy_id integer
);


ALTER TABLE public.black_hole OWNER TO rick;

--
-- Name: black_hole_blackhole_id_seq; Type: SEQUENCE; Schema: public; Owner: rick
--

CREATE SEQUENCE public.black_hole_blackhole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.black_hole_blackhole_id_seq OWNER TO rick;

--
-- Name: black_hole_blackhole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rick
--

ALTER SEQUENCE public.black_hole_blackhole_id_seq OWNED BY public.black_hole.blackhole_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: rick
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(60),
    traditional_name text,
    distance_mpc numeric(10,3),
    ngc_id integer,
    ugc_id integer,
    dwarf boolean NOT NULL,
    beauty boolean NOT NULL
);


ALTER TABLE public.galaxy OWNER TO rick;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: rick
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO rick;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rick
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: rick
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(60),
    discoverer text,
    orbital_period_dd numeric,
    diameter_km integer,
    year_discovery integer,
    magnetic_activity boolean NOT NULL,
    vulcanic_activity boolean NOT NULL,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO rick;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: rick
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO rick;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rick
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: rick
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(60) NOT NULL,
    first_mission text,
    mass_1e24kg numeric,
    density integer,
    has_moons boolean,
    in_solar_system boolean,
    star_id integer,
    diameter integer
);


ALTER TABLE public.planet OWNER TO rick;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: rick
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO rick;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rick
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: rick
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(60),
    spectral_class text,
    distance_ly numeric(10,3),
    celestial_x integer,
    celestial_y integer,
    celestial_z integer,
    naked_eye_visible boolean NOT NULL,
    has_planets boolean NOT NULL,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO rick;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: rick
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO rick;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rick
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: black_hole blackhole_id; Type: DEFAULT; Schema: public; Owner: rick
--

ALTER TABLE ONLY public.black_hole ALTER COLUMN blackhole_id SET DEFAULT nextval('public.black_hole_blackhole_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: rick
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: rick
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: rick
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: rick
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: black_hole; Type: TABLE DATA; Schema: public; Owner: rick
--

COPY public.black_hole (blackhole_id, name, type, solar_masses, distance_ly, radius_km, galaxy_id) FROM stdin;
1	Sagittarius A*	supermassiccio	4300000.000	26500	12700000	1
2	Cygnus X-1	stellare	21.000	6070	62	1
3	V404 Cygni	stellare	9.000	7800	27	1
\.


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: rick
--

COPY public.galaxy (galaxy_id, name, traditional_name, distance_mpc, ngc_id, ugc_id, dwarf, beauty) FROM stdin;
1	Milky Way	The Galaxy	0.008	0	0	f	t
2	M31	Andromeda	0.790	224	454	f	t
3	M33	Triangulum	0.810	598	1117	f	t
4	M82	Sigar	3.530	3034	5322	f	t
5	LMC	Large Magellanic Cloud	0.050	292	\N	f	t
6	UMD	Ursa Minor Dwarf	0.063	\N	9749	t	f
\.


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: rick
--

COPY public.moon (moon_id, name, discoverer, orbital_period_dd, diameter_km, year_discovery, magnetic_activity, vulcanic_activity, planet_id) FROM stdin;
1	Moon	Prehistoric Population	27.321	3474	0	f	t	1
4	Ganymede	Galileo	7.155	5262	1610	t	f	5
2	Io	Prehistoric Population	1.769	3652	0	f	t	5
3	Europa	Galileo	3.551	3138	1610	f	f	5
5	Callisto	Galileo	16.689	4800	1610	f	f	5
7	Enceladus	William Herschel	1.370	505	1789	f	t	6
8	Rhea	Cassini	4.519	1528	1672	f	f	6
6	Titan	Christiaan Huygens	15.945	5152	1655	f	f	6
10	Oberon	William Herschel	13.463	1522	1787	f	f	7
11	Miranda	Gerard Kuiper	1.413	470	1948	f	f	7
9	Titania	William Herschel	8.706	1578	1787	f	f	7
12	Triton	William Lassell	-5.877	2706	1846	f	f	8
13	Nereid	Gerard Kuiper	360.136	340	1949	f	f	8
20	Proteus	Voyager 2 Team	1.12	420	1989	f	f	8
18	Ariel	William Lassell	2.52	1158	1851	f	f	7
19	Umbriel	William Lassell	4.14	1169	1851	f	f	7
14	Phoebe	William Pickering	550.48	213	1899	f	f	6
15	Iapetus	Giovanni Cassini	79.32	1469	1671	f	f	6
16	Hyperion	William Bond et al.	21.28	270	1848	f	f	6
17	Dione	Giovanni Cassini	2.737	1123	1684	f	f	6
\.


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: rick
--

COPY public.planet (planet_id, name, first_mission, mass_1e24kg, density, has_moons, in_solar_system, star_id, diameter) FROM stdin;
1	Mercury	Mariner 10	0.330	5429	f	t	1	4879
2	Venus	Venera 1	4.87	5243	f	t	1	12104
3	Earth	Human Age	5.97	5514	t	t	1	12756
4	Mars	Mariner 4	0.642	3934	t	t	1	6792
5	Jupiter	Pioneer 10	1898	1326	t	t	1	142984
6	Saturn	Pioneer 11	568	687	t	t	1	120536
7	Uranus	Voyager 2	86.8	1270	t	t	1	51118
8	Neptune	Voyager 2	102.0	1638	t	t	1	49528
9	Pluto	New Horizons	0.0130	1850	t	t	1	2376
10	Trappist-1d	No mission yet	2.315	4354	f	f	7	10041
11	Trappist-1e	No mission yet	4.13	4885	f	f	7	11726
12	Trappist-1f	No mission yet	6.205	5009	f	f	7	13316
\.


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: rick
--

COPY public.star (star_id, name, spectral_class, distance_ly, celestial_x, celestial_y, celestial_z, naked_eye_visible, has_planets, galaxy_id) FROM stdin;
1	Sun	G2V	0.000	0	0	0	t	t	1
2	Sirius	A1	8.601	-2	8	-2	t	f	1
3	Vega	A0	25.300	3	-19	16	t	f	1
4	Alpha Centauri	G2V	4.395	-2	-1	-4	t	t	1
5	Procyon	F5V	11.410	-5	10	1	t	f	1
6	Betelgeuse	M2Ib	427.000	9	424	55	t	f	1
7	Trappist-1	M8V	40.660	38	-9	-3	f	f	1
\.


--
-- Name: black_hole_blackhole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rick
--

SELECT pg_catalog.setval('public.black_hole_blackhole_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rick
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rick
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rick
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rick
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: black_hole black_hole_blackhole_id_key; Type: CONSTRAINT; Schema: public; Owner: rick
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_blackhole_id_key UNIQUE (blackhole_id);


--
-- Name: black_hole black_hole_pkey; Type: CONSTRAINT; Schema: public; Owner: rick
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_pkey PRIMARY KEY (blackhole_id);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: rick
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: rick
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: rick
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: rick
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: rick
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: rick
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: rick
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: rick
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rick
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rick
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rick
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

