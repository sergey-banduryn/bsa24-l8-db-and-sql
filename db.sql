CREATE DATABASE "bsa24-l8-db-and-sql"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'en_US.UTF-8'
    LC_CTYPE = 'en_US.UTF-8'
    LOCALE_PROVIDER = 'libc'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

CREATE SCHEMA IF NOT EXISTS public
    AUTHORIZATION pg_database_owner;

CREATE SEQUENCE IF NOT EXISTS public.characters_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1
    OWNED BY characters.id;

CREATE SEQUENCE IF NOT EXISTS public.files_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1
    OWNED BY files.id;

CREATE SEQUENCE IF NOT EXISTS public.movies_genres_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1
    OWNED BY movies_genres.id;

CREATE SEQUENCE IF NOT EXISTS public.movies_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1
    OWNED BY movies.id;

CREATE SEQUENCE IF NOT EXISTS public.persons_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1
    OWNED BY persons.id;

CREATE SEQUENCE IF NOT EXISTS public.persons_photos_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1
    OWNED BY persons_photos.id;

CREATE SEQUENCE IF NOT EXISTS public.users_favorite_movies_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1
    OWNED BY users_favorite_movies.id;

CREATE SEQUENCE IF NOT EXISTS public.users_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1
    OWNED BY users.id;

CREATE TYPE public.gender AS ENUM
    ('Not set', 'Female', 'Male', 'Non-binary');

CREATE TYPE public.role AS ENUM
    ('leading', 'supporting', 'background');

    
CREATE TABLE IF NOT EXISTS public.characters
(
    id integer NOT NULL DEFAULT nextval('characters_id_seq'::regclass),
    name character varying(50) COLLATE pg_catalog."default",
    description text COLLATE pg_catalog."default",
    role role NOT NULL,
    movie_id integer NOT NULL,
    person_id integer,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone,
    CONSTRAINT characters_pkey PRIMARY KEY (id),
    CONSTRAINT characters_movie_id_fkey FOREIGN KEY (movie_id)
        REFERENCES public.movies (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT characters_person_id_fkey FOREIGN KEY (person_id)
        REFERENCES public.persons (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

CREATE TABLE IF NOT EXISTS public.countries
(
    iso_3166_1 character(2) COLLATE pg_catalog."default" NOT NULL,
    english_name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    native_name character varying(50) COLLATE pg_catalog."default",
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    CONSTRAINT countries_pkey PRIMARY KEY (iso_3166_1)
)

CREATE TABLE IF NOT EXISTS public.files
(
    id integer NOT NULL DEFAULT nextval('files_id_seq'::regclass),
    file_name character varying COLLATE pg_catalog."default" NOT NULL,
    mime_type character varying COLLATE pg_catalog."default" NOT NULL,
    key character varying COLLATE pg_catalog."default" NOT NULL,
    url character varying COLLATE pg_catalog."default" NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone,
    CONSTRAINT files_pkey PRIMARY KEY (id)
)

CREATE TABLE IF NOT EXISTS public.genres
(
    id smallint NOT NULL,
    name character varying(20) COLLATE pg_catalog."default" NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    CONSTRAINT genres_pkey PRIMARY KEY (id)
)

CREATE TABLE IF NOT EXISTS public.movies
(
    id integer NOT NULL DEFAULT nextval('movies_id_seq'::regclass),
    title character varying(255) COLLATE pg_catalog."default" NOT NULL,
    description text COLLATE pg_catalog."default",
    budget money,
    release_date date,
    duration smallint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone,
    director integer,
    origin_country character(2) COLLATE pg_catalog."default",
    poster integer,
    CONSTRAINT movies_pkey PRIMARY KEY (id),
    CONSTRAINT movies_director_fkey FOREIGN KEY (director)
        REFERENCES public.persons (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT movies_origin_country_fkey FOREIGN KEY (origin_country)
        REFERENCES public.countries (iso_3166_1) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT movies_poster_fkey FOREIGN KEY (poster)
        REFERENCES public.files (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

CREATE TABLE IF NOT EXISTS public.movies_genres
(
    id integer NOT NULL DEFAULT nextval('movies_genres_id_seq'::regclass),
    movie_id integer NOT NULL,
    genre_id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone,
    CONSTRAINT movies_genres_pkey PRIMARY KEY (id),
    CONSTRAINT movies_genres_movie_id_genre_id_key UNIQUE (movie_id, genre_id),
    CONSTRAINT movies_genres_genre_id_fkey FOREIGN KEY (genre_id)
        REFERENCES public.genres (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT movies_genres_movie_id_fkey FOREIGN KEY (movie_id)
        REFERENCES public.movies (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

CREATE TABLE IF NOT EXISTS public.persons
(
    id integer NOT NULL DEFAULT nextval('persons_id_seq'::regclass),
    first_name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    last_name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    biography text COLLATE pg_catalog."default",
    birthday date,
    gender gender NOT NULL DEFAULT 'Not set'::gender,
    country character(2) COLLATE pg_catalog."default",
    main_photo integer,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone,
    CONSTRAINT persons_pkey PRIMARY KEY (id),
    CONSTRAINT persons_country_fkey FOREIGN KEY (country)
        REFERENCES public.countries (iso_3166_1) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT persons_main_photo_fkey FOREIGN KEY (main_photo)
        REFERENCES public.files (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

CREATE TABLE IF NOT EXISTS public.persons_photos
(
    id integer NOT NULL DEFAULT nextval('persons_photos_id_seq'::regclass),
    person_id integer NOT NULL,
    photo_id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone,
    CONSTRAINT persons_photos_pkey PRIMARY KEY (id),
    CONSTRAINT persons_photos_person_id_photo_id_key UNIQUE (person_id, photo_id),
    CONSTRAINT persons_photos_person_id_fkey FOREIGN KEY (person_id)
        REFERENCES public.persons (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT persons_photos_photo_id_fkey FOREIGN KEY (photo_id)
        REFERENCES public.files (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

CREATE TABLE IF NOT EXISTS public.users
(
    id integer NOT NULL DEFAULT nextval('users_id_seq'::regclass),
    email character varying(320) COLLATE pg_catalog."default" NOT NULL,
    password character varying(50) COLLATE pg_catalog."default" NOT NULL,
    username character varying(50) COLLATE pg_catalog."default" NOT NULL,
    first_name character varying(50) COLLATE pg_catalog."default",
    last_name character varying(50) COLLATE pg_catalog."default",
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone,
    avatar integer,
    CONSTRAINT users_pkey PRIMARY KEY (id),
    CONSTRAINT email UNIQUE (email),
    CONSTRAINT username UNIQUE (username),
    CONSTRAINT users_avatar_fkey FOREIGN KEY (avatar)
        REFERENCES public.files (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

CREATE TABLE IF NOT EXISTS public.users_favorite_movies
(
    id integer NOT NULL DEFAULT nextval('users_favorite_movies_id_seq'::regclass),
    user_id integer NOT NULL,
    movie_id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone,
    CONSTRAINT users_favorite_movies_pkey PRIMARY KEY (id),
    CONSTRAINT users_favorite_movies_user_id_movie_id_key UNIQUE (user_id, movie_id),
    CONSTRAINT users_favorite_movies_movie_id_fkey FOREIGN KEY (movie_id)
        REFERENCES public.movies (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT users_favorite_movies_user_id_fkey FOREIGN KEY (user_id)
        REFERENCES public.users (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
