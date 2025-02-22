PGDMP         	                {            Cuentas_Primer_Parcial    15.4    15.4 ,    )           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            *           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            +           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ,           1262    16444    Cuentas_Primer_Parcial    DATABASE     �   CREATE DATABASE "Cuentas_Primer_Parcial" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';
 (   DROP DATABASE "Cuentas_Primer_Parcial";
                postgres    false            �            1259    16596    ciudades    TABLE     �   CREATE TABLE public.ciudades (
    id_ciudad integer NOT NULL,
    ciudad character varying(30) NOT NULL,
    departamento character varying(30) NOT NULL,
    cod_postal integer NOT NULL
);
    DROP TABLE public.ciudades;
       public         heap    postgres    false            �            1259    16595    Ciudades_Id_Ciudad_seq    SEQUENCE     �   CREATE SEQUENCE public."Ciudades_Id_Ciudad_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public."Ciudades_Id_Ciudad_seq";
       public          postgres    false    223            -           0    0    Ciudades_Id_Ciudad_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public."Ciudades_Id_Ciudad_seq" OWNED BY public.ciudades.id_ciudad;
          public          postgres    false    222            �            1259    16533    clientes    TABLE     �   CREATE TABLE public.clientes (
    id_cliente integer NOT NULL,
    id_persona integer NOT NULL,
    fecha_ingreso date NOT NULL,
    calificacion character varying(50) NOT NULL,
    estado character varying(15) NOT NULL
);
    DROP TABLE public.clientes;
       public         heap    postgres    false            �            1259    16532    Clientes_Id_Cliente_seq    SEQUENCE     �   CREATE SEQUENCE public."Clientes_Id_Cliente_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public."Clientes_Id_Cliente_seq";
       public          postgres    false    215            .           0    0    Clientes_Id_Cliente_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public."Clientes_Id_Cliente_seq" OWNED BY public.clientes.id_cliente;
          public          postgres    false    214            �            1259    16540    cuentas    TABLE     �  CREATE TABLE public.cuentas (
    id_cuenta integer NOT NULL,
    id_cliente integer NOT NULL,
    nro_cuenta character varying(20) NOT NULL,
    fecha_alta date NOT NULL,
    tipo_cuenta character varying(30) NOT NULL,
    estado character varying(15) NOT NULL,
    saldo numeric(20,2),
    nrocuenta character varying(50),
    nrocontrato character varying(40),
    costo_mantenimiento numeric(20,2),
    promedio_acreditacion character varying(50),
    moneda character varying(50)
);
    DROP TABLE public.cuentas;
       public         heap    postgres    false            �            1259    16539    Cuentas_Id_Cuenta_seq    SEQUENCE     �   CREATE SEQUENCE public."Cuentas_Id_Cuenta_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public."Cuentas_Id_Cuenta_seq";
       public          postgres    false    217            /           0    0    Cuentas_Id_Cuenta_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public."Cuentas_Id_Cuenta_seq" OWNED BY public.cuentas.id_cuenta;
          public          postgres    false    216            �            1259    16547    movimientos    TABLE     �  CREATE TABLE public.movimientos (
    id_movimiento integer NOT NULL,
    id_cuenta integer NOT NULL,
    fecha_movimiento date NOT NULL,
    tipo_movimiento character varying(50) NOT NULL,
    saldo_anterior numeric(18,2),
    saldo_actual numeric(18,2),
    monto_movimiento numeric(18,2),
    cuenta_origen numeric(18,2),
    cuenta_destino numeric(18,2),
    canal numeric(18,2)
);
    DROP TABLE public.movimientos;
       public         heap    postgres    false            �            1259    16546    Movimientos_Id_Movimiento_seq    SEQUENCE     �   CREATE SEQUENCE public."Movimientos_Id_Movimiento_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public."Movimientos_Id_Movimiento_seq";
       public          postgres    false    219            0           0    0    Movimientos_Id_Movimiento_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public."Movimientos_Id_Movimiento_seq" OWNED BY public.movimientos.id_movimiento;
          public          postgres    false    218            �            1259    16554    personas    TABLE     �  CREATE TABLE public.personas (
    id_persona integer NOT NULL,
    id_ciudad integer NOT NULL,
    nombre character varying(40) NOT NULL,
    apellido character varying(40) NOT NULL,
    tipo_docu character varying(30) NOT NULL,
    nro_docu character varying(10) NOT NULL,
    direccion character varying(40) NOT NULL,
    celular character varying(15) NOT NULL,
    email character varying(255) NOT NULL,
    estado character varying(15) NOT NULL
);
    DROP TABLE public.personas;
       public         heap    postgres    false            �            1259    16553    Personas_Id_Personas_seq    SEQUENCE     �   CREATE SEQUENCE public."Personas_Id_Personas_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public."Personas_Id_Personas_seq";
       public          postgres    false    221            1           0    0    Personas_Id_Personas_seq    SEQUENCE OWNED BY     V   ALTER SEQUENCE public."Personas_Id_Personas_seq" OWNED BY public.personas.id_persona;
          public          postgres    false    220            }           2604    16599    ciudades id_ciudad    DEFAULT     z   ALTER TABLE ONLY public.ciudades ALTER COLUMN id_ciudad SET DEFAULT nextval('public."Ciudades_Id_Ciudad_seq"'::regclass);
 A   ALTER TABLE public.ciudades ALTER COLUMN id_ciudad DROP DEFAULT;
       public          postgres    false    222    223    223            y           2604    16536    clientes id_cliente    DEFAULT     |   ALTER TABLE ONLY public.clientes ALTER COLUMN id_cliente SET DEFAULT nextval('public."Clientes_Id_Cliente_seq"'::regclass);
 B   ALTER TABLE public.clientes ALTER COLUMN id_cliente DROP DEFAULT;
       public          postgres    false    214    215    215            z           2604    16543    cuentas id_cuenta    DEFAULT     x   ALTER TABLE ONLY public.cuentas ALTER COLUMN id_cuenta SET DEFAULT nextval('public."Cuentas_Id_Cuenta_seq"'::regclass);
 @   ALTER TABLE public.cuentas ALTER COLUMN id_cuenta DROP DEFAULT;
       public          postgres    false    216    217    217            {           2604    16550    movimientos id_movimiento    DEFAULT     �   ALTER TABLE ONLY public.movimientos ALTER COLUMN id_movimiento SET DEFAULT nextval('public."Movimientos_Id_Movimiento_seq"'::regclass);
 H   ALTER TABLE public.movimientos ALTER COLUMN id_movimiento DROP DEFAULT;
       public          postgres    false    219    218    219            |           2604    16557    personas id_persona    DEFAULT     }   ALTER TABLE ONLY public.personas ALTER COLUMN id_persona SET DEFAULT nextval('public."Personas_Id_Personas_seq"'::regclass);
 B   ALTER TABLE public.personas ALTER COLUMN id_persona DROP DEFAULT;
       public          postgres    false    220    221    221            &          0    16596    ciudades 
   TABLE DATA           O   COPY public.ciudades (id_ciudad, ciudad, departamento, cod_postal) FROM stdin;
    public          postgres    false    223   �8                 0    16533    clientes 
   TABLE DATA           _   COPY public.clientes (id_cliente, id_persona, fecha_ingreso, calificacion, estado) FROM stdin;
    public          postgres    false    215   9                  0    16540    cuentas 
   TABLE DATA           �   COPY public.cuentas (id_cuenta, id_cliente, nro_cuenta, fecha_alta, tipo_cuenta, estado, saldo, nrocuenta, nrocontrato, costo_mantenimiento, promedio_acreditacion, moneda) FROM stdin;
    public          postgres    false    217   �9       "          0    16547    movimientos 
   TABLE DATA           �   COPY public.movimientos (id_movimiento, id_cuenta, fecha_movimiento, tipo_movimiento, saldo_anterior, saldo_actual, monto_movimiento, cuenta_origen, cuenta_destino, canal) FROM stdin;
    public          postgres    false    219   j:       $          0    16554    personas 
   TABLE DATA           �   COPY public.personas (id_persona, id_ciudad, nombre, apellido, tipo_docu, nro_docu, direccion, celular, email, estado) FROM stdin;
    public          postgres    false    221   �:       2           0    0    Ciudades_Id_Ciudad_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public."Ciudades_Id_Ciudad_seq"', 9, true);
          public          postgres    false    222            3           0    0    Clientes_Id_Cliente_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public."Clientes_Id_Cliente_seq"', 4, true);
          public          postgres    false    214            4           0    0    Cuentas_Id_Cuenta_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public."Cuentas_Id_Cuenta_seq"', 4, true);
          public          postgres    false    216            5           0    0    Movimientos_Id_Movimiento_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public."Movimientos_Id_Movimiento_seq"', 5, true);
          public          postgres    false    218            6           0    0    Personas_Id_Personas_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public."Personas_Id_Personas_seq"', 4, true);
          public          postgres    false    220            �           2606    16603 .   ciudades Ciudades_Id_Ciudad_Ciudad_Descrip_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.ciudades
    ADD CONSTRAINT "Ciudades_Id_Ciudad_Ciudad_Descrip_key" UNIQUE (id_ciudad) INCLUDE (ciudad);
 Z   ALTER TABLE ONLY public.ciudades DROP CONSTRAINT "Ciudades_Id_Ciudad_Ciudad_Descrip_key";
       public            postgres    false    223    223            �           2606    16601    ciudades Ciudades_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.ciudades
    ADD CONSTRAINT "Ciudades_pkey" PRIMARY KEY (id_ciudad);
 B   ALTER TABLE ONLY public.ciudades DROP CONSTRAINT "Ciudades_pkey";
       public            postgres    false    223                       2606    16538    clientes Clientes_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT "Clientes_pkey" PRIMARY KEY (id_cliente);
 B   ALTER TABLE ONLY public.clientes DROP CONSTRAINT "Clientes_pkey";
       public            postgres    false    215            �           2606    16545    cuentas Cuentas_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.cuentas
    ADD CONSTRAINT "Cuentas_pkey" PRIMARY KEY (id_cuenta);
 @   ALTER TABLE ONLY public.cuentas DROP CONSTRAINT "Cuentas_pkey";
       public            postgres    false    217            �           2606    16552    movimientos Movimientos_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.movimientos
    ADD CONSTRAINT "Movimientos_pkey" PRIMARY KEY (id_movimiento);
 H   ALTER TABLE ONLY public.movimientos DROP CONSTRAINT "Movimientos_pkey";
       public            postgres    false    219            �           2606    16605 /   personas Personas_Id_Personas_Nro_Documento_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.personas
    ADD CONSTRAINT "Personas_Id_Personas_Nro_Documento_key" UNIQUE (id_persona) INCLUDE (nro_docu);
 [   ALTER TABLE ONLY public.personas DROP CONSTRAINT "Personas_Id_Personas_Nro_Documento_key";
       public            postgres    false    221    221            �           2606    16559    personas Personas_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.personas
    ADD CONSTRAINT "Personas_pkey" PRIMARY KEY (id_persona);
 B   ALTER TABLE ONLY public.personas DROP CONSTRAINT "Personas_pkey";
       public            postgres    false    221            �           2606    16560 !   clientes Clientes_Id_Persona_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT "Clientes_Id_Persona_fkey" FOREIGN KEY (id_persona) REFERENCES public.personas(id_persona) ON UPDATE SET DEFAULT ON DELETE CASCADE NOT VALID;
 M   ALTER TABLE ONLY public.clientes DROP CONSTRAINT "Clientes_Id_Persona_fkey";
       public          postgres    false    215    221    3207            �           2606    16565    cuentas Cuentas_Id_Cliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cuentas
    ADD CONSTRAINT "Cuentas_Id_Cliente_fkey" FOREIGN KEY (id_cliente) REFERENCES public.clientes(id_cliente) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 K   ALTER TABLE ONLY public.cuentas DROP CONSTRAINT "Cuentas_Id_Cliente_fkey";
       public          postgres    false    3199    217    215            �           2606    16570 &   movimientos Movimientos_Id_Cuenta_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.movimientos
    ADD CONSTRAINT "Movimientos_Id_Cuenta_fkey" FOREIGN KEY (id_cuenta) REFERENCES public.cuentas(id_cuenta) NOT VALID;
 R   ALTER TABLE ONLY public.movimientos DROP CONSTRAINT "Movimientos_Id_Cuenta_fkey";
       public          postgres    false    217    3201    219            &   u   x�3�t,.�K�<�9��9� �$1������˘�'3� 3��95��(jnai�e������_��W��2426���)-,ME��qq�&e&��+�%s��4q��qqq Dx(�         X   x�3�4�4202�50�52�JM/�I,�tL.�,��2�4F���/�ḾI�p� K�\P����5�4��X�qz����� җ �          �   x�m���0 �3{��@�B�eG��/��%΃K���K�3�R8 Q�("�Y:�K�OS�;/���8���H"V�) 
���A�%��Q�r��[G@�*��V�GG
�c��K?��ٲ�+���*`V[�^��*l$m�V����a0�c�B2dV�b�Xk�ڦ�;.E��¦�f(p�7#.���1�a���1���ԯa�2�u���`�      "   l   x���=
�0��9�K˗�;�1��N�x�Xş��K��I �"Zaj�4N�L���"�q$@�]�2��uiȜ<r�?鳨*�L��jќ? nd9�gO*{�3�l�L�      $   �   x���Mn�0���^6,�G����"q�n��
n;rL�Q�ы��XTl��}zÀA���3�~N��).�&%#�B�$��e]j�+�W\	@����6ږ־���v�O��M�6"q�އhn��|ָh��b�<L-�Wk>�D���'���Bs&�>���wߛ�0],�e��S%��7��۞}��ſ:٧a���D����4˲+Km�     