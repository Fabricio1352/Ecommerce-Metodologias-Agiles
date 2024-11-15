PGDMP  ,    6            
    |            pw_usuarios    17.0    17.0     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false                        0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false                       1262    16417    pw_usuarios    DATABASE     ~   CREATE DATABASE pw_usuarios WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';
    DROP DATABASE pw_usuarios;
                     postgres    false            �            1259    16419    roles    TABLE     �   CREATE TABLE public.roles (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    descripcion character varying(100)
);
    DROP TABLE public.roles;
       public         heap r       postgres    false            �            1259    16418    roles_id_seq    SEQUENCE     �   CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.roles_id_seq;
       public               postgres    false    218                       0    0    roles_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;
          public               postgres    false    217            �            1259    16428    usuarios    TABLE     '  CREATE TABLE public.usuarios (
    id_usuario integer NOT NULL,
    nombre character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    contrasena character varying(255) NOT NULL,
    rol_id integer,
    fecha_registro timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.usuarios;
       public         heap r       postgres    false            �            1259    16427    usuarios_id_usuario_seq    SEQUENCE     �   CREATE SEQUENCE public.usuarios_id_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.usuarios_id_usuario_seq;
       public               postgres    false    220                       0    0    usuarios_id_usuario_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.usuarios_id_usuario_seq OWNED BY public.usuarios.id_usuario;
          public               postgres    false    219            \           2604    16422    roles id    DEFAULT     d   ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);
 7   ALTER TABLE public.roles ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    218    217    218            ]           2604    16431    usuarios id_usuario    DEFAULT     z   ALTER TABLE ONLY public.usuarios ALTER COLUMN id_usuario SET DEFAULT nextval('public.usuarios_id_usuario_seq'::regclass);
 B   ALTER TABLE public.usuarios ALTER COLUMN id_usuario DROP DEFAULT;
       public               postgres    false    219    220    220            �          0    16419    roles 
   TABLE DATA           8   COPY public.roles (id, nombre, descripcion) FROM stdin;
    public               postgres    false    218   4       �          0    16428    usuarios 
   TABLE DATA           a   COPY public.usuarios (id_usuario, nombre, email, contrasena, rol_id, fecha_registro) FROM stdin;
    public               postgres    false    220   Q                  0    0    roles_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.roles_id_seq', 1, false);
          public               postgres    false    217                       0    0    usuarios_id_usuario_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.usuarios_id_usuario_seq', 1, false);
          public               postgres    false    219            `           2606    16426    roles roles_nombre_key 
   CONSTRAINT     S   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_nombre_key UNIQUE (nombre);
 @   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_nombre_key;
       public                 postgres    false    218            b           2606    16424    roles roles_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_pkey;
       public                 postgres    false    218            d           2606    16436    usuarios usuarios_email_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key UNIQUE (email);
 E   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_email_key;
       public                 postgres    false    220            f           2606    16434    usuarios usuarios_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id_usuario);
 @   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_pkey;
       public                 postgres    false    220            g           2606    16437    usuarios usuarios_rol_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_rol_id_fkey FOREIGN KEY (rol_id) REFERENCES public.roles(id) ON DELETE SET NULL;
 G   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_rol_id_fkey;
       public               postgres    false    220    218    4706            �      x������ � �      �      x������ � �     