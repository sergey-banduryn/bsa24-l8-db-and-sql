PGDMP     '    *                |           bsa24-l8-db-and-sql    15.5    15.5 Y    m           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            n           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            o           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            p           1262    40977    bsa24-l8-db-and-sql    DATABASE     �   CREATE DATABASE "bsa24-l8-db-and-sql" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.UTF-8';
 %   DROP DATABASE "bsa24-l8-db-and-sql";
                postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                pg_database_owner    false            q           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   pg_database_owner    false    4            q           1247    41085    gender    TYPE     a   CREATE TYPE public.gender AS ENUM (
    'Not set',
    'Female',
    'Male',
    'Non-binary'
);
    DROP TYPE public.gender;
       public          postgres    false    4            k           1247    41068    role    TYPE     W   CREATE TYPE public.role AS ENUM (
    'leading',
    'supporting',
    'background'
);
    DROP TYPE public.role;
       public          postgres    false    4            �            1259    41076 
   characters    TABLE     "  CREATE TABLE public.characters (
    id integer NOT NULL,
    name character varying(50),
    description text,
    role public.role NOT NULL,
    movie_id integer NOT NULL,
    person_id integer,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone
);
    DROP TABLE public.characters;
       public         heap    postgres    false    4    875            �            1259    41075    characters_id_seq    SEQUENCE     �   CREATE SEQUENCE public.characters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.characters_id_seq;
       public          postgres    false    4    227            r           0    0    characters_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.characters_id_seq OWNED BY public.characters.id;
          public          postgres    false    226            �            1259    40978 	   countries    TABLE     �   CREATE TABLE public.countries (
    iso_3166_1 character(2) NOT NULL,
    english_name character varying(50) NOT NULL,
    native_name character varying(50),
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);
    DROP TABLE public.countries;
       public         heap    postgres    false    4            �            1259    40981    files    TABLE     .  CREATE TABLE public.files (
    id integer NOT NULL,
    file_name character varying NOT NULL,
    mime_type character varying NOT NULL,
    key character varying NOT NULL,
    url character varying NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone
);
    DROP TABLE public.files;
       public         heap    postgres    false    4            �            1259    40986    files_id_seq    SEQUENCE     �   CREATE SEQUENCE public.files_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.files_id_seq;
       public          postgres    false    4    215            s           0    0    files_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.files_id_seq OWNED BY public.files.id;
          public          postgres    false    216            �            1259    40987    genres    TABLE     �   CREATE TABLE public.genres (
    id smallint NOT NULL,
    name character varying(20) NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);
    DROP TABLE public.genres;
       public         heap    postgres    false    4            �            1259    40990    movies    TABLE     h  CREATE TABLE public.movies (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    description text,
    budget money,
    release_date date,
    duration smallint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone,
    director integer,
    origin_country character(2),
    poster integer
);
    DROP TABLE public.movies;
       public         heap    postgres    false    4            �            1259    41049    movies_genres    TABLE     �   CREATE TABLE public.movies_genres (
    id integer NOT NULL,
    movie_id integer NOT NULL,
    genre_id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone
);
 !   DROP TABLE public.movies_genres;
       public         heap    postgres    false    4            �            1259    41048    movies_genres_id_seq    SEQUENCE     �   CREATE SEQUENCE public.movies_genres_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.movies_genres_id_seq;
       public          postgres    false    225    4            t           0    0    movies_genres_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.movies_genres_id_seq OWNED BY public.movies_genres.id;
          public          postgres    false    224            �            1259    40995    movies_id_seq    SEQUENCE     �   CREATE SEQUENCE public.movies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.movies_id_seq;
       public          postgres    false    218    4            u           0    0    movies_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.movies_id_seq OWNED BY public.movies.id;
          public          postgres    false    219            �            1259    40996    persons    TABLE     �  CREATE TABLE public.persons (
    id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    biography text,
    birthday date,
    gender public.gender DEFAULT 'Not set'::public.gender NOT NULL,
    country character(2),
    main_photo integer,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone
);
    DROP TABLE public.persons;
       public         heap    postgres    false    881    4    881            �            1259    41001    persons_id_seq    SEQUENCE     �   CREATE SEQUENCE public.persons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.persons_id_seq;
       public          postgres    false    220    4            v           0    0    persons_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.persons_id_seq OWNED BY public.persons.id;
          public          postgres    false    221            �            1259    49175    persons_photos    TABLE     �   CREATE TABLE public.persons_photos (
    id integer NOT NULL,
    person_id integer NOT NULL,
    photo_id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone
);
 "   DROP TABLE public.persons_photos;
       public         heap    postgres    false    4            �            1259    49174    persons_photos_id_seq    SEQUENCE     �   CREATE SEQUENCE public.persons_photos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.persons_photos_id_seq;
       public          postgres    false    229    4            w           0    0    persons_photos_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.persons_photos_id_seq OWNED BY public.persons_photos.id;
          public          postgres    false    228            �            1259    41002    users    TABLE     v  CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying(320) NOT NULL,
    password character varying(50) NOT NULL,
    username character varying(50) NOT NULL,
    first_name character varying(50),
    last_name character varying(50),
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone,
    avatar integer
);
    DROP TABLE public.users;
       public         heap    postgres    false    4            �            1259    49192    users_favorite_movies    TABLE     �   CREATE TABLE public.users_favorite_movies (
    id integer NOT NULL,
    user_id integer NOT NULL,
    movie_id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone
);
 )   DROP TABLE public.users_favorite_movies;
       public         heap    postgres    false    4            �            1259    49191    users_favorite_movies_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_favorite_movies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.users_favorite_movies_id_seq;
       public          postgres    false    4    231            x           0    0    users_favorite_movies_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.users_favorite_movies_id_seq OWNED BY public.users_favorite_movies.id;
          public          postgres    false    230            �            1259    41007    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    222    4            y           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    223            �           2604    41079    characters id    DEFAULT     n   ALTER TABLE ONLY public.characters ALTER COLUMN id SET DEFAULT nextval('public.characters_id_seq'::regclass);
 <   ALTER TABLE public.characters ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    227    226    227            �           2604    41008    files id    DEFAULT     d   ALTER TABLE ONLY public.files ALTER COLUMN id SET DEFAULT nextval('public.files_id_seq'::regclass);
 7   ALTER TABLE public.files ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215            �           2604    41009 	   movies id    DEFAULT     f   ALTER TABLE ONLY public.movies ALTER COLUMN id SET DEFAULT nextval('public.movies_id_seq'::regclass);
 8   ALTER TABLE public.movies ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218            �           2604    41052    movies_genres id    DEFAULT     t   ALTER TABLE ONLY public.movies_genres ALTER COLUMN id SET DEFAULT nextval('public.movies_genres_id_seq'::regclass);
 ?   ALTER TABLE public.movies_genres ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    225    225            �           2604    41010 
   persons id    DEFAULT     h   ALTER TABLE ONLY public.persons ALTER COLUMN id SET DEFAULT nextval('public.persons_id_seq'::regclass);
 9   ALTER TABLE public.persons ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    220            �           2604    49178    persons_photos id    DEFAULT     v   ALTER TABLE ONLY public.persons_photos ALTER COLUMN id SET DEFAULT nextval('public.persons_photos_id_seq'::regclass);
 @   ALTER TABLE public.persons_photos ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    228    229    229            �           2604    41011    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    222            �           2604    49195    users_favorite_movies id    DEFAULT     �   ALTER TABLE ONLY public.users_favorite_movies ALTER COLUMN id SET DEFAULT nextval('public.users_favorite_movies_id_seq'::regclass);
 G   ALTER TABLE public.users_favorite_movies ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    230    231    231            f          0    41076 
   characters 
   TABLE DATA           n   COPY public.characters (id, name, description, role, movie_id, person_id, created_at, updated_at) FROM stdin;
    public          postgres    false    227   Zn       Y          0    40978 	   countries 
   TABLE DATA           b   COPY public.countries (iso_3166_1, english_name, native_name, created_at, updated_at) FROM stdin;
    public          postgres    false    214   �n       Z          0    40981    files 
   TABLE DATA           [   COPY public.files (id, file_name, mime_type, key, url, created_at, updated_at) FROM stdin;
    public          postgres    false    215   �y       \          0    40987    genres 
   TABLE DATA           B   COPY public.genres (id, name, created_at, updated_at) FROM stdin;
    public          postgres    false    217   z       ]          0    40990    movies 
   TABLE DATA           �   COPY public.movies (id, title, description, budget, release_date, duration, created_at, updated_at, director, origin_country, poster) FROM stdin;
    public          postgres    false    218   �z       d          0    41049    movies_genres 
   TABLE DATA           W   COPY public.movies_genres (id, movie_id, genre_id, created_at, updated_at) FROM stdin;
    public          postgres    false    225   b~       _          0    40996    persons 
   TABLE DATA           �   COPY public.persons (id, first_name, last_name, biography, birthday, gender, country, main_photo, created_at, updated_at) FROM stdin;
    public          postgres    false    220   �~       h          0    49175    persons_photos 
   TABLE DATA           Y   COPY public.persons_photos (id, person_id, photo_id, created_at, updated_at) FROM stdin;
    public          postgres    false    229   c       a          0    41002    users 
   TABLE DATA           u   COPY public.users (id, email, password, username, first_name, last_name, created_at, updated_at, avatar) FROM stdin;
    public          postgres    false    222   �       j          0    49192    users_favorite_movies 
   TABLE DATA           ^   COPY public.users_favorite_movies (id, user_id, movie_id, created_at, updated_at) FROM stdin;
    public          postgres    false    231   �       z           0    0    characters_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.characters_id_seq', 1, false);
          public          postgres    false    226            {           0    0    files_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.files_id_seq', 1, false);
          public          postgres    false    216            |           0    0    movies_genres_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.movies_genres_id_seq', 1, false);
          public          postgres    false    224            }           0    0    movies_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.movies_id_seq', 1, false);
          public          postgres    false    219            ~           0    0    persons_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.persons_id_seq', 1, false);
          public          postgres    false    221                       0    0    persons_photos_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.persons_photos_id_seq', 1, false);
          public          postgres    false    228            �           0    0    users_favorite_movies_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.users_favorite_movies_id_seq', 1, false);
          public          postgres    false    230            �           0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 1, false);
          public          postgres    false    223            �           2606    41083    characters characters_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.characters
    ADD CONSTRAINT characters_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.characters DROP CONSTRAINT characters_pkey;
       public            postgres    false    227            �           2606    41013    countries countries_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (iso_3166_1);
 B   ALTER TABLE ONLY public.countries DROP CONSTRAINT countries_pkey;
       public            postgres    false    214            �           2606    41015    users email 
   CONSTRAINT     G   ALTER TABLE ONLY public.users
    ADD CONSTRAINT email UNIQUE (email);
 5   ALTER TABLE ONLY public.users DROP CONSTRAINT email;
       public            postgres    false    222            �           2606    41017    files files_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.files DROP CONSTRAINT files_pkey;
       public            postgres    false    215            �           2606    41019    genres genres_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.genres
    ADD CONSTRAINT genres_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.genres DROP CONSTRAINT genres_pkey;
       public            postgres    false    217            �           2606    41066 1   movies_genres movies_genres_movie_id_genre_id_key 
   CONSTRAINT     z   ALTER TABLE ONLY public.movies_genres
    ADD CONSTRAINT movies_genres_movie_id_genre_id_key UNIQUE (movie_id, genre_id);
 [   ALTER TABLE ONLY public.movies_genres DROP CONSTRAINT movies_genres_movie_id_genre_id_key;
       public            postgres    false    225    225            �           2606    41054     movies_genres movies_genres_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.movies_genres
    ADD CONSTRAINT movies_genres_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.movies_genres DROP CONSTRAINT movies_genres_pkey;
       public            postgres    false    225            �           2606    41021    movies movies_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.movies DROP CONSTRAINT movies_pkey;
       public            postgres    false    218            �           2606    49209 4   persons_photos persons_photos_person_id_photo_id_key 
   CONSTRAINT     ~   ALTER TABLE ONLY public.persons_photos
    ADD CONSTRAINT persons_photos_person_id_photo_id_key UNIQUE (person_id, photo_id);
 ^   ALTER TABLE ONLY public.persons_photos DROP CONSTRAINT persons_photos_person_id_photo_id_key;
       public            postgres    false    229    229            �           2606    49180 "   persons_photos persons_photos_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.persons_photos
    ADD CONSTRAINT persons_photos_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.persons_photos DROP CONSTRAINT persons_photos_pkey;
       public            postgres    false    229            �           2606    41023    persons persons_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.persons
    ADD CONSTRAINT persons_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.persons DROP CONSTRAINT persons_pkey;
       public            postgres    false    220            �           2606    41025    users username 
   CONSTRAINT     M   ALTER TABLE ONLY public.users
    ADD CONSTRAINT username UNIQUE (username);
 8   ALTER TABLE ONLY public.users DROP CONSTRAINT username;
       public            postgres    false    222            �           2606    49197 0   users_favorite_movies users_favorite_movies_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.users_favorite_movies
    ADD CONSTRAINT users_favorite_movies_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.users_favorite_movies DROP CONSTRAINT users_favorite_movies_pkey;
       public            postgres    false    231            �           2606    49211 @   users_favorite_movies users_favorite_movies_user_id_movie_id_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.users_favorite_movies
    ADD CONSTRAINT users_favorite_movies_user_id_movie_id_key UNIQUE (user_id, movie_id);
 j   ALTER TABLE ONLY public.users_favorite_movies DROP CONSTRAINT users_favorite_movies_user_id_movie_id_key;
       public            postgres    false    231    231            �           2606    41027    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    222            �           2606    41094 #   characters characters_movie_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.characters
    ADD CONSTRAINT characters_movie_id_fkey FOREIGN KEY (movie_id) REFERENCES public.movies(id) NOT VALID;
 M   ALTER TABLE ONLY public.characters DROP CONSTRAINT characters_movie_id_fkey;
       public          postgres    false    218    3238    227            �           2606    41099 $   characters characters_person_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.characters
    ADD CONSTRAINT characters_person_id_fkey FOREIGN KEY (person_id) REFERENCES public.persons(id) NOT VALID;
 N   ALTER TABLE ONLY public.characters DROP CONSTRAINT characters_person_id_fkey;
       public          postgres    false    227    220    3240            �           2606    41028    movies movies_director_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_director_fkey FOREIGN KEY (director) REFERENCES public.persons(id) NOT VALID;
 E   ALTER TABLE ONLY public.movies DROP CONSTRAINT movies_director_fkey;
       public          postgres    false    218    220    3240            �           2606    41060 )   movies_genres movies_genres_genre_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.movies_genres
    ADD CONSTRAINT movies_genres_genre_id_fkey FOREIGN KEY (genre_id) REFERENCES public.genres(id) NOT VALID;
 S   ALTER TABLE ONLY public.movies_genres DROP CONSTRAINT movies_genres_genre_id_fkey;
       public          postgres    false    3236    225    217            �           2606    41055 )   movies_genres movies_genres_movie_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.movies_genres
    ADD CONSTRAINT movies_genres_movie_id_fkey FOREIGN KEY (movie_id) REFERENCES public.movies(id);
 S   ALTER TABLE ONLY public.movies_genres DROP CONSTRAINT movies_genres_movie_id_fkey;
       public          postgres    false    225    218    3238            �           2606    41033 !   movies movies_origin_country_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_origin_country_fkey FOREIGN KEY (origin_country) REFERENCES public.countries(iso_3166_1) NOT VALID;
 K   ALTER TABLE ONLY public.movies DROP CONSTRAINT movies_origin_country_fkey;
       public          postgres    false    218    214    3232            �           2606    41038    movies movies_poster_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_poster_fkey FOREIGN KEY (poster) REFERENCES public.files(id) NOT VALID;
 C   ALTER TABLE ONLY public.movies DROP CONSTRAINT movies_poster_fkey;
       public          postgres    false    218    215    3234            �           2606    49164    persons persons_country_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.persons
    ADD CONSTRAINT persons_country_fkey FOREIGN KEY (country) REFERENCES public.countries(iso_3166_1) NOT VALID;
 F   ALTER TABLE ONLY public.persons DROP CONSTRAINT persons_country_fkey;
       public          postgres    false    3232    220    214            �           2606    49169    persons persons_main_photo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.persons
    ADD CONSTRAINT persons_main_photo_fkey FOREIGN KEY (main_photo) REFERENCES public.files(id) NOT VALID;
 I   ALTER TABLE ONLY public.persons DROP CONSTRAINT persons_main_photo_fkey;
       public          postgres    false    215    3234    220            �           2606    49181 ,   persons_photos persons_photos_person_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.persons_photos
    ADD CONSTRAINT persons_photos_person_id_fkey FOREIGN KEY (person_id) REFERENCES public.persons(id);
 V   ALTER TABLE ONLY public.persons_photos DROP CONSTRAINT persons_photos_person_id_fkey;
       public          postgres    false    220    229    3240            �           2606    49186 +   persons_photos persons_photos_photo_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.persons_photos
    ADD CONSTRAINT persons_photos_photo_id_fkey FOREIGN KEY (photo_id) REFERENCES public.files(id);
 U   ALTER TABLE ONLY public.persons_photos DROP CONSTRAINT persons_photos_photo_id_fkey;
       public          postgres    false    229    215    3234            �           2606    41043    users users_avatar_fkey    FK CONSTRAINT        ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_avatar_fkey FOREIGN KEY (avatar) REFERENCES public.files(id) NOT VALID;
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_avatar_fkey;
       public          postgres    false    3234    222    215            �           2606    49203 9   users_favorite_movies users_favorite_movies_movie_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.users_favorite_movies
    ADD CONSTRAINT users_favorite_movies_movie_id_fkey FOREIGN KEY (movie_id) REFERENCES public.movies(id);
 c   ALTER TABLE ONLY public.users_favorite_movies DROP CONSTRAINT users_favorite_movies_movie_id_fkey;
       public          postgres    false    3238    231    218            �           2606    49198 8   users_favorite_movies users_favorite_movies_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.users_favorite_movies
    ADD CONSTRAINT users_favorite_movies_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);
 b   ALTER TABLE ONLY public.users_favorite_movies DROP CONSTRAINT users_favorite_movies_user_id_fkey;
       public          postgres    false    222    231    3246            f   �   x��ν�0����Ut7�����N&.,�6����@�w�n&����!�Ɣ�e�c�П!�� �@d��M���&�5�%[w@��C�)�y+�/*��G������#�sn'a�������}�,?*�!�;��TJ�q�>�      Y   �
  x��YMv"9^G�"W��E�0`��	��� ���he&nX�5z=�^�nnP7��LH��)l��{<E��B�R(��:��w�Q��'�����2W��%-#6I���(e�1�"���?�\��ot���R�+��|����v���j�����2�(�F��6\��%�1��Q:Ą&�<H�q�Eb��2��� �Lm�ڷ������-�V�*�9���\U."dJ��4l�'�8j�6����4v� �Y���۫6)�5���l��fפQ=}ߢ{]�4��Ks�{}�|w��=ٕ;]4
�#�>;Ybt��e�Wձ� �2/�F� 
}��I��l/�l�
�>7u0B�1�5U�N��#w ��.8�9�$�	�si���0UQ�L��)OX�ζo� �l(�*pj{*���%��*{f  /� �)�7V�e�
����`��pY�
��P@=�U�#�%���U��v��\��p��z����<�\:��R���(�ȣ޲Q�d.O�&cEM�@&΀kPyq��%}�6(��I�?7��	���4e��*��ԭ�)}U�������I��Y+#���ߜ����ݐ��K4?Q&#jT&��L���:oPk�K�S�S�:��o�Z5g�}q2��*RA���k�뼔�����Զ��ݸ���;z��J���Uпq�	���6}���ڗ�ݓ��Ծ��!Z�۬7�t��GX�Z�x��7��U�Ԑwd~楖 ���G���P��v���g{�;�'�m�n+v��� ��-Jm/� A�����J� ��$�R{���o�0�Sר�HQK�N�}�����A��CP<�0���U�#ߔO �Ad/֨��� ��i��F��"���a�Q=qVsz0"�� <�kQOl���}l���w��6���t�/Hv�i��.	�[�9o�^������O������zj���H9��~����>�	q�9�5��y$��Nҩҫ��P��J���j���{�s��k��������8ob]�GSξ*���~��w?2C���R�R�4�K}�	���^�M^�����[/<�R�o�d�I�%ik��n�?��f�涣s�5[�Sw�	�ؚw�ᐠV@�7��KQK�Ŏ̧ �ԯr�.��ĠC����j4�]�vS� F4(��Y�'�
_QS	GC�WT��e�<�n%�i�ܓ�C��/��O �m.�	��[�x{��J�]�z�qL�nY$�)=j��j! ���dQ�zpإ��/)�/f�6N��аo��SU+�4TFmxY����.j	bBi���TYn�M�Yv�3�h�Gi��ˏu�q�<�0x�a�ʛ,�|W�߲M�s��ٚ��*^nF"�ӣ��NfR�2�S�|Z�P��F��~�ă�v30��<��r@#�G2|1�w��ѐR����_D���s������rG
]t-A,ز<T��h �4����*��U�+si���m���K�n�o���0��-�v�nu-A�ȅÝ ��|��gQK]���w��Gc�B��������䳬�� ���ʝt䈡L�G
<G۬���'R����]~����jj[ڥ�;/>�i����>6�9:�CE����_�Q�X=g�bW'�(kt�f�`o(�X��P
� ��GUE��\Y۝:ˢQ@=YD��  �Fc���������⢲��ZsO�6�pCnTOOZ4Ge�� A�i"_��ȰԷ9ui�8\F
��.�W�����,�z���Z�!�d� oR��D���_�ntLms��`�4�$2� �<��TH.�Q�� Z�ѯ��Éto0ӔݪO<4kь7�Q�K3�m�P��tv�w�; �=��T��v�; �}��U�N7:�\���P#���  ��מ)����Pv'e��#��AQlB3Un�2��y���4�Y%M��X��0H��������%���b�j�+_+��lY�/}
�n�]�S_Z�E�xߧ�wi.�\�����
�)����� A�w}��4�
����h��%��pڢTT;��[U���=G'y���aȗ��l�}h�T�J+}�`��W��y�{���L�8@�4�}�Y�2�wZ��P���@\+�)=�l��Ga��EF���E��2��Q@���֍'#��m&�Rr��9س�.� ALy���Cp� 8�㛀݂lP�I�َt,�:Y�?�3.�U�,L�������	�����0J-����e�t��&�u3~�eg��#�a�L��ު>��C?�5o�9՞�n�*�L~��p�/ڴ�̋����^GOܽ�Q�C���P�?�l��?v��C=Z��	�>-��V@=�B|Sp��
z���H�L�1���G¯#���F�����9⫎30�0��w� ��4� g�E���b��5!/A ^Ђ���	�N^荰�����|����UA ~�Q�n�� ��|~u��V<�l����E k	�G˽�z���[PZ�?���ɵI�U�]����f�9��E�:���������r�A� ִ�n$vB�zzբ>_�I*%��ÉQ[����?�V|�e^�_a��,we��]L��.���\����W��W��U�1 �؀��[�M���Z�KaWVKKr^����'���;�����x��P����;.�S�Ԭ����da��G |v���d�< �G�w L�4ԅ>� <�ܥgɇ)@�0�貔����j����^����?'���i��%��O��9���>�Dku܈ͫlO���ӧO����      Z      x������ � �      \   �   x�UP�j�0<��"_Pd�!�hB.��%��`Y������uS���b�E�J����R��=´��j�O݋�j�O1ܞ��*왢8���טc���8��N�2M���4n�:�l���Z�h^Җ�N�9�R+�a��Ku[[�y	���>Rt����X|z
�����1
�ݐ$����4��_�k\����~Z%��V�7��^�      ]   [  x���ώ�6��ڧ�[���c{/E6A�4�`�ۢ�%�-�����r�K�Y�(}�~C{�H/�Dr����WU������)�Lo��M����o�9���{wF�Gz`�M���>��{w^���g>��F�����-�8���t���L8�&�Y�^����R���,>�Q���|�G7+��?z����;�����Sӡ��I:�Ϊq�n�\u�������x��� � 	�G�~����ￊ��X��UEQ��&/vح�Y��zE��.o�bYm�?u��cVn�U��^oʪʄڽ��3�G�	�� �y�6�ׁ�4
T�w^Xj2���0��d�\%�ؽ0��9;o�<W��ѝ��'���VR$l/ͽ��Er��Gj�02��O�_�`/����y�0�� ���wl�;�^�ߊ�x>�2ܑ
iݺ�^��Y�����hOU��vI�8.�rp�FN ���0�$='>iCF@]����A�4���܂�=�q�j����ki9|��IGOjH��D��9�="~v�LÂNɾ��cI۫�2�{ �cbҀn�\�W�
�`y03�at!h!�e�/�C�n���k�����V/:����k�='۫כzU��;�ѝ�a�Gq�|�9{�����;F��Vި1*m��{���{.s�u�r�臐�@~lqt�&��i"�O�wlN0k��&�^��:+���ֻ�vU^UV�U&N����R��k��g���Q� y��.�h4F�ej��u�D��*\��FH>o=�I��mFކ9 _��t�0��A�x�}�Z7Y�,����A+L���aQ!� ֠�� c�?\r�`�Nt��K ټ`��آ��r��߶���������      d   =   x�3�457616�4��4202�50�52S04�26�26�32��60���2��4$�2F��� �'      _   �   x���M
�0���)����L�]D� 覛��&���<A`6���PTp7�D8�q^������XM�7�L�(K�/�l8m8VL��m%T��S��&֯��Q��[t�O.�%��u��v���h�;SJ��:�Ŧw� ��:&��?���d8}E���e�      h      x������ � �      a   M   x�3�LL���3t��+M��9�S��S+�2��*�<N(����D��\��L��������@���B���3���b���� ��z      j   8   x�3�4�42�4202�50�52S04�26�26�32��60���2*2$�*F��� <h9     