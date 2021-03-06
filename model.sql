PGDMP         (                y            Vaccination _System    11.12 (Debian 11.12-0+deb10u1)    11.12 (Debian 11.12-0+deb10u1) -    ?           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            ?           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            ?           1262    16452    Vaccination _System    DATABASE     ?   CREATE DATABASE "Vaccination _System" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';
 %   DROP DATABASE "Vaccination _System";
             postgres    false            ?            1259    16875    tbl_hescode    TABLE     ?  CREATE TABLE public.tbl_hescode (
    "personId" integer NOT NULL,
    "hes_vaccineId" integer,
    "hesCode" character varying(8) NOT NULL,
    "stateofHealty" text NOT NULL,
    "vaccinationInfo" text NOT NULL,
    "vaccinationDate" date,
    CONSTRAINT chech_vaccination CHECK (("vaccinationInfo" = ANY (ARRAY['vaccinated'::text, 'unvaccinated'::text]))),
    CONSTRAINT check_healty CHECK (("stateofHealty" = ANY (ARRAY['risky'::text, 'risk-free'::text])))
);
    DROP TABLE public.tbl_hescode;
       public         postgres    false            ?            1259    16756    tbl_medicalcenter    TABLE       CREATE TABLE public.tbl_medicalcenter (
    "mcId" integer NOT NULL,
    "mcName" character varying(40) NOT NULL,
    "mcCity" character varying(20) NOT NULL,
    "mcDistrict" character varying(20) NOT NULL,
    "mcFulladress" character varying(40) NOT NULL
);
 %   DROP TABLE public.tbl_medicalcenter;
       public         postgres    false            ?            1259    16754    tbl_medicalcenter_mcId_seq    SEQUENCE     ?   CREATE SEQUENCE public."tbl_medicalcenter_mcId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public."tbl_medicalcenter_mcId_seq";
       public       postgres    false    199            ?           0    0    tbl_medicalcenter_mcId_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public."tbl_medicalcenter_mcId_seq" OWNED BY public.tbl_medicalcenter."mcId";
            public       postgres    false    198            ?            1259    16949 	   tbl_nurse    TABLE     ?  CREATE TABLE public.tbl_nurse (
    "nurseId" integer NOT NULL,
    "nurseName" character varying(20) NOT NULL,
    "nurseSurname" character varying(20) NOT NULL,
    "nursePnumber" bigint NOT NULL,
    "nurse_mcId" integer NOT NULL,
    "nurse_vacId" integer NOT NULL,
    "stateofNurse" text NOT NULL,
    CONSTRAINT check_healtyn CHECK (("stateofNurse" = ANY (ARRAY['risky'::text, 'risk-free'::text])))
);
    DROP TABLE public.tbl_nurse;
       public         postgres    false            ?            1259    16947    tbl_nurse_nurseId_seq    SEQUENCE     ?   CREATE SEQUENCE public."tbl_nurse_nurseId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public."tbl_nurse_nurseId_seq";
       public       postgres    false    204            ?           0    0    tbl_nurse_nurseId_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public."tbl_nurse_nurseId_seq" OWNED BY public.tbl_nurse."nurseId";
            public       postgres    false    203            ?            1259    16740 
   tbl_person    TABLE     )  CREATE TABLE public.tbl_person (
    "personId" integer NOT NULL,
    "personName" character varying(20) NOT NULL,
    "personSurname" character varying(20) NOT NULL,
    "personAge" integer NOT NULL,
    "personGender" text,
    "personDistrict" character varying(25) NOT NULL,
    "personCity" character varying(25) NOT NULL,
    "personFulladress" character varying(40) NOT NULL,
    "personPnumber" integer NOT NULL,
    "hesCode" integer NOT NULL,
    CONSTRAINT check_gender CHECK (("personGender" = ANY (ARRAY['Male'::text, 'Female'::text])))
);
    DROP TABLE public.tbl_person;
       public         postgres    false            ?            1259    16738    tbl_person_personId_seq    SEQUENCE     ?   CREATE SEQUENCE public."tbl_person_personId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public."tbl_person_personId_seq";
       public       postgres    false    197            ?           0    0    tbl_person_personId_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public."tbl_person_personId_seq" OWNED BY public.tbl_person."personId";
            public       postgres    false    196            ?            1259    16766    tbl_vaccineinfo    TABLE     ?   CREATE TABLE public.tbl_vaccineinfo (
    "vaccineId" integer NOT NULL,
    "vaccineName" character varying(10) NOT NULL,
    "vaccineCountry" character varying(20) NOT NULL
);
 #   DROP TABLE public.tbl_vaccineinfo;
       public         postgres    false            ?            1259    16764    tbl_vaccineinfo_vaccineId_seq    SEQUENCE     ?   CREATE SEQUENCE public."tbl_vaccineinfo_vaccineId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public."tbl_vaccineinfo_vaccineId_seq";
       public       postgres    false    201            ?           0    0    tbl_vaccineinfo_vaccineId_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public."tbl_vaccineinfo_vaccineId_seq" OWNED BY public.tbl_vaccineinfo."vaccineId";
            public       postgres    false    200            ?
           2604    16759    tbl_medicalcenter mcId    DEFAULT     ?   ALTER TABLE ONLY public.tbl_medicalcenter ALTER COLUMN "mcId" SET DEFAULT nextval('public."tbl_medicalcenter_mcId_seq"'::regclass);
 G   ALTER TABLE public.tbl_medicalcenter ALTER COLUMN "mcId" DROP DEFAULT;
       public       postgres    false    198    199    199            ?
           2604    16952    tbl_nurse nurseId    DEFAULT     z   ALTER TABLE ONLY public.tbl_nurse ALTER COLUMN "nurseId" SET DEFAULT nextval('public."tbl_nurse_nurseId_seq"'::regclass);
 B   ALTER TABLE public.tbl_nurse ALTER COLUMN "nurseId" DROP DEFAULT;
       public       postgres    false    203    204    204            ?
           2604    16743    tbl_person personId    DEFAULT     ~   ALTER TABLE ONLY public.tbl_person ALTER COLUMN "personId" SET DEFAULT nextval('public."tbl_person_personId_seq"'::regclass);
 D   ALTER TABLE public.tbl_person ALTER COLUMN "personId" DROP DEFAULT;
       public       postgres    false    196    197    197            ?
           2604    16769    tbl_vaccineinfo vaccineId    DEFAULT     ?   ALTER TABLE ONLY public.tbl_vaccineinfo ALTER COLUMN "vaccineId" SET DEFAULT nextval('public."tbl_vaccineinfo_vaccineId_seq"'::regclass);
 J   ALTER TABLE public.tbl_vaccineinfo ALTER COLUMN "vaccineId" DROP DEFAULT;
       public       postgres    false    201    200    201            ?          0    16875    tbl_hescode 
   TABLE DATA               ?   COPY public.tbl_hescode ("personId", "hes_vaccineId", "hesCode", "stateofHealty", "vaccinationInfo", "vaccinationDate") FROM stdin;
    public       postgres    false    202   ?9       ?          0    16756    tbl_medicalcenter 
   TABLE DATA               e   COPY public.tbl_medicalcenter ("mcId", "mcName", "mcCity", "mcDistrict", "mcFulladress") FROM stdin;
    public       postgres    false    199   \:       ?          0    16949 	   tbl_nurse 
   TABLE DATA               ?   COPY public.tbl_nurse ("nurseId", "nurseName", "nurseSurname", "nursePnumber", "nurse_mcId", "nurse_vacId", "stateofNurse") FROM stdin;
    public       postgres    false    204   ?:       ?          0    16740 
   tbl_person 
   TABLE DATA               ?   COPY public.tbl_person ("personId", "personName", "personSurname", "personAge", "personGender", "personDistrict", "personCity", "personFulladress", "personPnumber", "hesCode") FROM stdin;
    public       postgres    false    197   $;       ?          0    16766    tbl_vaccineinfo 
   TABLE DATA               W   COPY public.tbl_vaccineinfo ("vaccineId", "vaccineName", "vaccineCountry") FROM stdin;
    public       postgres    false    201   /<       ?           0    0    tbl_medicalcenter_mcId_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public."tbl_medicalcenter_mcId_seq"', 3, true);
            public       postgres    false    198            ?           0    0    tbl_nurse_nurseId_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public."tbl_nurse_nurseId_seq"', 3, true);
            public       postgres    false    203            ?           0    0    tbl_person_personId_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public."tbl_person_personId_seq"', 8, true);
            public       postgres    false    196            ?           0    0    tbl_vaccineinfo_vaccineId_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public."tbl_vaccineinfo_vaccineId_seq"', 3, true);
            public       postgres    false    200                       2606    16884    tbl_hescode pk_hesCode 
   CONSTRAINT     ]   ALTER TABLE ONLY public.tbl_hescode
    ADD CONSTRAINT "pk_hesCode" PRIMARY KEY ("hesCode");
 B   ALTER TABLE ONLY public.tbl_hescode DROP CONSTRAINT "pk_hesCode";
       public         postgres    false    202            ?
           2606    16761    tbl_medicalcenter pk_mcId 
   CONSTRAINT     ]   ALTER TABLE ONLY public.tbl_medicalcenter
    ADD CONSTRAINT "pk_mcId" PRIMARY KEY ("mcId");
 E   ALTER TABLE ONLY public.tbl_medicalcenter DROP CONSTRAINT "pk_mcId";
       public         postgres    false    199            	           2606    16958    tbl_nurse pk_nurseId 
   CONSTRAINT     [   ALTER TABLE ONLY public.tbl_nurse
    ADD CONSTRAINT "pk_nurseId" PRIMARY KEY ("nurseId");
 @   ALTER TABLE ONLY public.tbl_nurse DROP CONSTRAINT "pk_nurseId";
       public         postgres    false    204            ?
           2606    16749    tbl_person pk_personId 
   CONSTRAINT     ^   ALTER TABLE ONLY public.tbl_person
    ADD CONSTRAINT "pk_personId" PRIMARY KEY ("personId");
 B   ALTER TABLE ONLY public.tbl_person DROP CONSTRAINT "pk_personId";
       public         postgres    false    197                       2606    16771    tbl_vaccineinfo pk_vaccineId 
   CONSTRAINT     e   ALTER TABLE ONLY public.tbl_vaccineinfo
    ADD CONSTRAINT "pk_vaccineId" PRIMARY KEY ("vaccineId");
 H   ALTER TABLE ONLY public.tbl_vaccineinfo DROP CONSTRAINT "pk_vaccineId";
       public         postgres    false    201            ?
           2606    16753    tbl_person un_hesCode 
   CONSTRAINT     W   ALTER TABLE ONLY public.tbl_person
    ADD CONSTRAINT "un_hesCode" UNIQUE ("hesCode");
 A   ALTER TABLE ONLY public.tbl_person DROP CONSTRAINT "un_hesCode";
       public         postgres    false    197                       2606    16763    tbl_medicalcenter un_mcName 
   CONSTRAINT     \   ALTER TABLE ONLY public.tbl_medicalcenter
    ADD CONSTRAINT "un_mcName" UNIQUE ("mcName");
 G   ALTER TABLE ONLY public.tbl_medicalcenter DROP CONSTRAINT "un_mcName";
       public         postgres    false    199                       2606    16960    tbl_nurse un_nurseId 
   CONSTRAINT     [   ALTER TABLE ONLY public.tbl_nurse
    ADD CONSTRAINT "un_nurseId" UNIQUE ("nursePnumber");
 @   ALTER TABLE ONLY public.tbl_nurse DROP CONSTRAINT "un_nurseId";
       public         postgres    false    204                       2606    16962    tbl_nurse un_nurseName 
   CONSTRAINT     ]   ALTER TABLE ONLY public.tbl_nurse
    ADD CONSTRAINT "un_nurseName" UNIQUE ("nurseSurname");
 B   ALTER TABLE ONLY public.tbl_nurse DROP CONSTRAINT "un_nurseName";
       public         postgres    false    204            ?
           2606    16751    tbl_person un_personPnumber 
   CONSTRAINT     c   ALTER TABLE ONLY public.tbl_person
    ADD CONSTRAINT "un_personPnumber" UNIQUE ("personPnumber");
 G   ALTER TABLE ONLY public.tbl_person DROP CONSTRAINT "un_personPnumber";
       public         postgres    false    197                       2606    16773    tbl_vaccineinfo un_vaccineName 
   CONSTRAINT     d   ALTER TABLE ONLY public.tbl_vaccineinfo
    ADD CONSTRAINT "un_vaccineName" UNIQUE ("vaccineName");
 J   ALTER TABLE ONLY public.tbl_vaccineinfo DROP CONSTRAINT "un_vaccineName";
       public         postgres    false    201                       2606    16963    tbl_nurse for_key_mcId    FK CONSTRAINT     ?   ALTER TABLE ONLY public.tbl_nurse
    ADD CONSTRAINT "for_key_mcId" FOREIGN KEY ("nurse_mcId") REFERENCES public.tbl_medicalcenter("mcId") ON UPDATE CASCADE ON DELETE CASCADE;
 B   ALTER TABLE ONLY public.tbl_nurse DROP CONSTRAINT "for_key_mcId";
       public       postgres    false    204    199    2815                       2606    16885    tbl_hescode for_key_personId    FK CONSTRAINT     ?   ALTER TABLE ONLY public.tbl_hescode
    ADD CONSTRAINT "for_key_personId" FOREIGN KEY ("personId") REFERENCES public.tbl_person("personId") ON UPDATE CASCADE ON DELETE CASCADE;
 H   ALTER TABLE ONLY public.tbl_hescode DROP CONSTRAINT "for_key_personId";
       public       postgres    false    197    202    2809                       2606    16968    tbl_nurse for_key_vacId    FK CONSTRAINT     ?   ALTER TABLE ONLY public.tbl_nurse
    ADD CONSTRAINT "for_key_vacId" FOREIGN KEY ("nurse_vacId") REFERENCES public.tbl_vaccineinfo("vaccineId") ON UPDATE CASCADE ON DELETE CASCADE;
 C   ALTER TABLE ONLY public.tbl_nurse DROP CONSTRAINT "for_key_vacId";
       public       postgres    false    204    2819    201                       2606    16890    tbl_hescode for_key_vaccineId    FK CONSTRAINT     ?   ALTER TABLE ONLY public.tbl_hescode
    ADD CONSTRAINT "for_key_vaccineId" FOREIGN KEY ("hes_vaccineId") REFERENCES public.tbl_vaccineinfo("vaccineId") ON UPDATE CASCADE ON DELETE CASCADE;
 I   ALTER TABLE ONLY public.tbl_hescode DROP CONSTRAINT "for_key_vaccineId";
       public       postgres    false    201    202    2819            ?   e   x?3????4??,?,??M+JM?,?+KLN??K,IMJr?pr? )@?6202?50?52?2db
VW?a??c?f?sqPf?eTfiJPY? }&>?      ?   N   x?3?t??.?Rp??9?'G!4/?,??8??R?#?? ?$1?3?*7??3)1'9?,F?$rq????ӑ_???#F??? w|(?      ?   Z   x?=̱
?0?9???M????!??,U???B9???????/1`???????~H?R?h??}??? ?a??e?N?52?E????      ?   ?   x?uбN?0????)xԜ}?=???2?\?
???JH??e?y?`8?? C????vwU?G??? ??(m??R??a???k?D`??hb??v??:???д????bo?ۤ?Q:T C?a?~V?\??p????l?Vv??Q?t)?Ҕr??C???wۑ???f?&?4???q?x=5фy?ʱ???[?_?????-?(?l????=??n?cZir??#\?ӎY:kVI㛃"? iŬ?????/DI9Ƨ[D?Q&?\      ?   D   x?3????/KL?t???K?2?t???+IM??tO-?M̫?2?.(-???V?*-..?L?????? H??     