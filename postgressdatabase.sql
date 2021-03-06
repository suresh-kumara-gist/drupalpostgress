PGDMP                         u            mydb    9.5.7    9.5.7 �   )           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            *           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            +           1262    32816    mydb    DATABASE     v   CREATE DATABASE mydb WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';
    DROP DATABASE mydb;
             vagrant    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            ,           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    6                        3079    12395    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            -           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1                       1255    32824     concat(anynonarray, anynonarray)    FUNCTION     �   CREATE FUNCTION concat(anynonarray, anynonarray) RETURNS text
    LANGUAGE sql
    AS $_$SELECT CAST($1 AS text) || CAST($2 AS text);$_$;
 7   DROP FUNCTION public.concat(anynonarray, anynonarray);
       public       vagrant    false    6                       1255    32826    concat(anynonarray, text)    FUNCTION     u   CREATE FUNCTION concat(anynonarray, text) RETURNS text
    LANGUAGE sql
    AS $_$SELECT CAST($1 AS text) || $2;$_$;
 0   DROP FUNCTION public.concat(anynonarray, text);
       public       vagrant    false    6            (           1255    32825    concat(text, anynonarray)    FUNCTION     u   CREATE FUNCTION concat(text, anynonarray) RETURNS text
    LANGUAGE sql
    AS $_$SELECT $1 || CAST($2 AS text);$_$;
 0   DROP FUNCTION public.concat(text, anynonarray);
       public       vagrant    false    6                       1255    32827    concat(text, text)    FUNCTION     `   CREATE FUNCTION concat(text, text) RETURNS text
    LANGUAGE sql
    AS $_$SELECT $1 || $2;$_$;
 )   DROP FUNCTION public.concat(text, text);
       public       vagrant    false    6                       1255    32820    greatest(numeric, numeric)    FUNCTION     �   CREATE FUNCTION "greatest"(numeric, numeric) RETURNS numeric
    LANGUAGE sql
    AS $_$SELECT CASE WHEN (($1 > $2) OR ($2 IS NULL)) THEN $1 ELSE $2 END;$_$;
 3   DROP FUNCTION public."greatest"(numeric, numeric);
       public       vagrant    false    6                       1255    32821 #   greatest(numeric, numeric, numeric)    FUNCTION     �   CREATE FUNCTION "greatest"(numeric, numeric, numeric) RETURNS numeric
    LANGUAGE sql
    AS $_$SELECT greatest($1, greatest($2, $3));$_$;
 <   DROP FUNCTION public."greatest"(numeric, numeric, numeric);
       public       vagrant    false    6                       1255    32822    rand()    FUNCTION     ^   CREATE FUNCTION rand() RETURNS double precision
    LANGUAGE sql
    AS $$SELECT random();$$;
    DROP FUNCTION public.rand();
       public       vagrant    false    6            '           1255    32823 $   substring_index(text, text, integer)    FUNCTION     �   CREATE FUNCTION substring_index(text, text, integer) RETURNS text
    LANGUAGE sql
    AS $_$SELECT array_to_string((string_to_array($1, $2)) [1:$3], $2);$_$;
 ;   DROP FUNCTION public.substring_index(text, text, integer);
       public       vagrant    false    6            �            1259    32837    actions    TABLE     ]  CREATE TABLE actions (
    aid character varying(255) DEFAULT '0'::character varying NOT NULL,
    type character varying(32) DEFAULT ''::character varying NOT NULL,
    callback character varying(255) DEFAULT ''::character varying NOT NULL,
    parameters bytea NOT NULL,
    label character varying(255) DEFAULT '0'::character varying NOT NULL
);
    DROP TABLE public.actions;
       public         vagrant    false    6            .           0    0    TABLE actions    COMMENT     :   COMMENT ON TABLE actions IS 'Stores action information.';
            public       vagrant    false    182            /           0    0    COLUMN actions.aid    COMMENT     D   COMMENT ON COLUMN actions.aid IS 'Primary Key: Unique actions ID.';
            public       vagrant    false    182            0           0    0    COLUMN actions.type    COMMENT     x   COMMENT ON COLUMN actions.type IS 'The object that that action acts on (node, user, comment, system or custom types.)';
            public       vagrant    false    182            1           0    0    COLUMN actions.callback    COMMENT     c   COMMENT ON COLUMN actions.callback IS 'The callback function that executes when the action runs.';
            public       vagrant    false    182            2           0    0    COLUMN actions.parameters    COMMENT     ]   COMMENT ON COLUMN actions.parameters IS 'Parameters to be passed to the callback function.';
            public       vagrant    false    182            3           0    0    COLUMN actions.label    COMMENT     ;   COMMENT ON COLUMN actions.label IS 'Label of the action.';
            public       vagrant    false    182            �            1259    33214    authmap    TABLE     "  CREATE TABLE authmap (
    aid integer NOT NULL,
    uid integer DEFAULT 0 NOT NULL,
    authname character varying(128) DEFAULT ''::character varying NOT NULL,
    module character varying(128) DEFAULT ''::character varying NOT NULL,
    CONSTRAINT authmap_aid_check CHECK ((aid >= 0))
);
    DROP TABLE public.authmap;
       public         vagrant    false    6            4           0    0    TABLE authmap    COMMENT     J   COMMENT ON TABLE authmap IS 'Stores distributed authentication mapping.';
            public       vagrant    false    216            5           0    0    COLUMN authmap.aid    COMMENT     D   COMMENT ON COLUMN authmap.aid IS 'Primary Key: Unique authmap ID.';
            public       vagrant    false    216            6           0    0    COLUMN authmap.uid    COMMENT     7   COMMENT ON COLUMN authmap.uid IS 'User''s users.uid.';
            public       vagrant    false    216            7           0    0    COLUMN authmap.authname    COMMENT     E   COMMENT ON COLUMN authmap.authname IS 'Unique authentication name.';
            public       vagrant    false    216            8           0    0    COLUMN authmap.module    COMMENT     W   COMMENT ON COLUMN authmap.module IS 'Module which is controlling the authentication.';
            public       vagrant    false    216            �            1259    33212    authmap_aid_seq    SEQUENCE     q   CREATE SEQUENCE authmap_aid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.authmap_aid_seq;
       public       vagrant    false    216    6            9           0    0    authmap_aid_seq    SEQUENCE OWNED BY     5   ALTER SEQUENCE authmap_aid_seq OWNED BY authmap.aid;
            public       vagrant    false    215            �            1259    32849    batch    TABLE     �   CREATE TABLE batch (
    bid bigint NOT NULL,
    token character varying(64) NOT NULL,
    "timestamp" integer NOT NULL,
    batch bytea,
    CONSTRAINT batch_bid_check CHECK ((bid >= 0))
);
    DROP TABLE public.batch;
       public         vagrant    false    6            :           0    0    TABLE batch    COMMENT     j   COMMENT ON TABLE batch IS 'Stores details about batches (processes that run in multiple HTTP requests).';
            public       vagrant    false    183            ;           0    0    COLUMN batch.bid    COMMENT     @   COMMENT ON COLUMN batch.bid IS 'Primary Key: Unique batch ID.';
            public       vagrant    false    183            <           0    0    COLUMN batch.token    COMMENT     �   COMMENT ON COLUMN batch.token IS 'A string token generated against the current user''s session id and the batch id, used to ensure that only the user who submitted the batch can effectively access it.';
            public       vagrant    false    183            =           0    0    COLUMN batch."timestamp"    COMMENT     �   COMMENT ON COLUMN batch."timestamp" IS 'A Unix timestamp indicating when this batch was submitted for processing. Stale batches are purged at cron time.';
            public       vagrant    false    183            >           0    0    COLUMN batch.batch    COMMENT     e   COMMENT ON COLUMN batch.batch IS 'A serialized array containing the processing data for the batch.';
            public       vagrant    false    183            �            1259    33507    block    TABLE     �  CREATE TABLE block (
    bid integer NOT NULL,
    module character varying(64) DEFAULT ''::character varying NOT NULL,
    delta character varying(32) DEFAULT '0'::character varying NOT NULL,
    theme character varying(64) DEFAULT ''::character varying NOT NULL,
    status smallint DEFAULT 0 NOT NULL,
    weight integer DEFAULT 0 NOT NULL,
    region character varying(64) DEFAULT ''::character varying NOT NULL,
    custom smallint DEFAULT 0 NOT NULL,
    visibility smallint DEFAULT 0 NOT NULL,
    pages text NOT NULL,
    title character varying(255) DEFAULT ''::character varying NOT NULL,
    cache smallint DEFAULT 1 NOT NULL
);
    DROP TABLE public.block;
       public         vagrant    false    6            ?           0    0    TABLE block    COMMENT     \   COMMENT ON TABLE block IS 'Stores block settings, such as region and visibility settings.';
            public       vagrant    false    239            @           0    0    COLUMN block.bid    COMMENT     @   COMMENT ON COLUMN block.bid IS 'Primary Key: Unique block ID.';
            public       vagrant    false    239            A           0    0    COLUMN block.module    COMMENT     �   COMMENT ON COLUMN block.module IS 'The module from which the block originates; for example, ''user'' for the Who''s Online block, and ''block'' for any custom blocks.';
            public       vagrant    false    239            B           0    0    COLUMN block.delta    COMMENT     I   COMMENT ON COLUMN block.delta IS 'Unique ID for block within a module.';
            public       vagrant    false    239            C           0    0    COLUMN block.theme    COMMENT     T   COMMENT ON COLUMN block.theme IS 'The theme under which the block settings apply.';
            public       vagrant    false    239            D           0    0    COLUMN block.status    COMMENT     W   COMMENT ON COLUMN block.status IS 'Block enabled status. (1 = enabled, 0 = disabled)';
            public       vagrant    false    239            E           0    0    COLUMN block.weight    COMMENT     A   COMMENT ON COLUMN block.weight IS 'Block weight within region.';
            public       vagrant    false    239            F           0    0    COLUMN block.region    COMMENT     Q   COMMENT ON COLUMN block.region IS 'Theme region within which the block is set.';
            public       vagrant    false    239            G           0    0    COLUMN block.custom    COMMENT     �   COMMENT ON COLUMN block.custom IS 'Flag to indicate how users may control visibility of the block. (0 = Users cannot control, 1 = On by default, but can be hidden, 2 = Hidden by default, but can be shown)';
            public       vagrant    false    239            H           0    0    COLUMN block.visibility    COMMENT     �   COMMENT ON COLUMN block.visibility IS 'Flag to indicate how to show blocks on pages. (0 = Show on all pages except listed pages, 1 = Show only on listed pages, 2 = Use custom PHP code to determine visibility)';
            public       vagrant    false    239            I           0    0    COLUMN block.pages    COMMENT     �   COMMENT ON COLUMN block.pages IS 'Contents of the "Pages" block; contains either a list of paths on which to include/exclude the block or PHP code, depending on "visibility" setting.';
            public       vagrant    false    239            J           0    0    COLUMN block.title    COMMENT     �   COMMENT ON COLUMN block.title IS 'Custom title for the block. (Empty string will use block default title, <none> will remove the title, text will cause block to use specified title.)';
            public       vagrant    false    239            K           0    0    COLUMN block.cache    COMMENT       COMMENT ON COLUMN block.cache IS 'Binary flag to indicate block cache mode. (-2: Custom cache, -1: Do not cache, 1: Cache per role, 2: Cache per user, 4: Cache per page, 8: Block cache global) See DRUPAL_CACHE_* constants in ../includes/common.inc for more detailed information.';
            public       vagrant    false    239            �            1259    33505    block_bid_seq    SEQUENCE     o   CREATE SEQUENCE block_bid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.block_bid_seq;
       public       vagrant    false    239    6            L           0    0    block_bid_seq    SEQUENCE OWNED BY     1   ALTER SEQUENCE block_bid_seq OWNED BY block.bid;
            public       vagrant    false    238            �            1259    33538    block_custom    TABLE     �   CREATE TABLE block_custom (
    bid integer NOT NULL,
    body text,
    info character varying(128) DEFAULT ''::character varying NOT NULL,
    format character varying(255),
    CONSTRAINT block_custom_bid_check CHECK ((bid >= 0))
);
     DROP TABLE public.block_custom;
       public         vagrant    false    6            M           0    0    TABLE block_custom    COMMENT     K   COMMENT ON TABLE block_custom IS 'Stores contents of custom-made blocks.';
            public       vagrant    false    242            N           0    0    COLUMN block_custom.bid    COMMENT     A   COMMENT ON COLUMN block_custom.bid IS 'The block''s block.bid.';
            public       vagrant    false    242            O           0    0    COLUMN block_custom.body    COMMENT     :   COMMENT ON COLUMN block_custom.body IS 'Block contents.';
            public       vagrant    false    242            P           0    0    COLUMN block_custom.info    COMMENT     =   COMMENT ON COLUMN block_custom.info IS 'Block description.';
            public       vagrant    false    242            Q           0    0    COLUMN block_custom.format    COMMENT     X   COMMENT ON COLUMN block_custom.format IS 'The filter_format.format of the block body.';
            public       vagrant    false    242            �            1259    33536    block_custom_bid_seq    SEQUENCE     v   CREATE SEQUENCE block_custom_bid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.block_custom_bid_seq;
       public       vagrant    false    6    242            R           0    0    block_custom_bid_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE block_custom_bid_seq OWNED BY block_custom.bid;
            public       vagrant    false    241            �            1259    33384    block_node_type    TABLE     �   CREATE TABLE block_node_type (
    module character varying(64) NOT NULL,
    delta character varying(32) NOT NULL,
    type character varying(32) NOT NULL
);
 #   DROP TABLE public.block_node_type;
       public         vagrant    false    6            S           0    0    TABLE block_node_type    COMMENT     b   COMMENT ON TABLE block_node_type IS 'Sets up display criteria for blocks based on content types';
            public       vagrant    false    228            T           0    0    COLUMN block_node_type.module    COMMENT     ^   COMMENT ON COLUMN block_node_type.module IS 'The block''s origin module, from block.module.';
            public       vagrant    false    228            U           0    0    COLUMN block_node_type.delta    COMMENT     i   COMMENT ON COLUMN block_node_type.delta IS 'The block''s unique delta within module, from block.delta.';
            public       vagrant    false    228            V           0    0    COLUMN block_node_type.type    COMMENT     i   COMMENT ON COLUMN block_node_type.type IS 'The machine-readable name of this type from node_type.type.';
            public       vagrant    false    228            �            1259    33529 
   block_role    TABLE     �   CREATE TABLE block_role (
    module character varying(64) NOT NULL,
    delta character varying(32) NOT NULL,
    rid bigint NOT NULL,
    CONSTRAINT block_role_rid_check CHECK ((rid >= 0))
);
    DROP TABLE public.block_role;
       public         vagrant    false    6            W           0    0    TABLE block_role    COMMENT     \   COMMENT ON TABLE block_role IS 'Sets up access permissions for blocks based on user roles';
            public       vagrant    false    240            X           0    0    COLUMN block_role.module    COMMENT     Y   COMMENT ON COLUMN block_role.module IS 'The block''s origin module, from block.module.';
            public       vagrant    false    240            Y           0    0    COLUMN block_role.delta    COMMENT     d   COMMENT ON COLUMN block_role.delta IS 'The block''s unique delta within module, from block.delta.';
            public       vagrant    false    240            Z           0    0    COLUMN block_role.rid    COMMENT     Q   COMMENT ON COLUMN block_role.rid IS 'The user''s role ID from users_roles.rid.';
            public       vagrant    false    240            �            1259    32861    blocked_ips    TABLE     �   CREATE TABLE blocked_ips (
    iid integer NOT NULL,
    ip character varying(40) DEFAULT ''::character varying NOT NULL,
    CONSTRAINT blocked_ips_iid_check CHECK ((iid >= 0))
);
    DROP TABLE public.blocked_ips;
       public         vagrant    false    6            [           0    0    TABLE blocked_ips    COMMENT     @   COMMENT ON TABLE blocked_ips IS 'Stores blocked IP addresses.';
            public       vagrant    false    185            \           0    0    COLUMN blocked_ips.iid    COMMENT     Q   COMMENT ON COLUMN blocked_ips.iid IS 'Primary Key: unique ID for IP addresses.';
            public       vagrant    false    185            ]           0    0    COLUMN blocked_ips.ip    COMMENT     2   COMMENT ON COLUMN blocked_ips.ip IS 'IP address';
            public       vagrant    false    185            �            1259    32859    blocked_ips_iid_seq    SEQUENCE     u   CREATE SEQUENCE blocked_ips_iid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.blocked_ips_iid_seq;
       public       vagrant    false    185    6            ^           0    0    blocked_ips_iid_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE blocked_ips_iid_seq OWNED BY blocked_ips.iid;
            public       vagrant    false    184            �            1259    32870    cache    TABLE     �   CREATE TABLE cache (
    cid character varying(255) DEFAULT ''::character varying NOT NULL,
    data bytea,
    expire integer DEFAULT 0 NOT NULL,
    created integer DEFAULT 0 NOT NULL,
    serialized smallint DEFAULT 0 NOT NULL
);
    DROP TABLE public.cache;
       public         vagrant    false    6            _           0    0    TABLE cache    COMMENT     �   COMMENT ON TABLE cache IS 'Generic cache table for caching things not separated out into their own tables. Contributed modules may also use this to store cached items.';
            public       vagrant    false    186            `           0    0    COLUMN cache.cid    COMMENT     @   COMMENT ON COLUMN cache.cid IS 'Primary Key: Unique cache ID.';
            public       vagrant    false    186            a           0    0    COLUMN cache.data    COMMENT     B   COMMENT ON COLUMN cache.data IS 'A collection of data to cache.';
            public       vagrant    false    186            b           0    0    COLUMN cache.expire    COMMENT     u   COMMENT ON COLUMN cache.expire IS 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.';
            public       vagrant    false    186            c           0    0    COLUMN cache.created    COMMENT     d   COMMENT ON COLUMN cache.created IS 'A Unix timestamp indicating when the cache entry was created.';
            public       vagrant    false    186            d           0    0    COLUMN cache.serialized    COMMENT     j   COMMENT ON COLUMN cache.serialized IS 'A flag to indicate whether content is serialized (1) or not (0).';
            public       vagrant    false    186            �            1259    33551    cache_block    TABLE     �   CREATE TABLE cache_block (
    cid character varying(255) DEFAULT ''::character varying NOT NULL,
    data bytea,
    expire integer DEFAULT 0 NOT NULL,
    created integer DEFAULT 0 NOT NULL,
    serialized smallint DEFAULT 0 NOT NULL
);
    DROP TABLE public.cache_block;
       public         vagrant    false    6            e           0    0    TABLE cache_block    COMMENT     �   COMMENT ON TABLE cache_block IS 'Cache table for the Block module to store already built blocks, identified by module, delta, and various contexts which may change the block, such as theme, locale, and caching mode defined for the block.';
            public       vagrant    false    243            f           0    0    COLUMN cache_block.cid    COMMENT     F   COMMENT ON COLUMN cache_block.cid IS 'Primary Key: Unique cache ID.';
            public       vagrant    false    243            g           0    0    COLUMN cache_block.data    COMMENT     H   COMMENT ON COLUMN cache_block.data IS 'A collection of data to cache.';
            public       vagrant    false    243            h           0    0    COLUMN cache_block.expire    COMMENT     {   COMMENT ON COLUMN cache_block.expire IS 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.';
            public       vagrant    false    243            i           0    0    COLUMN cache_block.created    COMMENT     j   COMMENT ON COLUMN cache_block.created IS 'A Unix timestamp indicating when the cache entry was created.';
            public       vagrant    false    243            j           0    0    COLUMN cache_block.serialized    COMMENT     p   COMMENT ON COLUMN cache_block.serialized IS 'A flag to indicate whether content is serialized (1) or not (0).';
            public       vagrant    false    243            �            1259    32883    cache_bootstrap    TABLE     �   CREATE TABLE cache_bootstrap (
    cid character varying(255) DEFAULT ''::character varying NOT NULL,
    data bytea,
    expire integer DEFAULT 0 NOT NULL,
    created integer DEFAULT 0 NOT NULL,
    serialized smallint DEFAULT 0 NOT NULL
);
 #   DROP TABLE public.cache_bootstrap;
       public         vagrant    false    6            k           0    0    TABLE cache_bootstrap    COMMENT     �   COMMENT ON TABLE cache_bootstrap IS 'Cache table for data required to bootstrap Drupal, may be routed to a shared memory cache.';
            public       vagrant    false    187            l           0    0    COLUMN cache_bootstrap.cid    COMMENT     J   COMMENT ON COLUMN cache_bootstrap.cid IS 'Primary Key: Unique cache ID.';
            public       vagrant    false    187            m           0    0    COLUMN cache_bootstrap.data    COMMENT     L   COMMENT ON COLUMN cache_bootstrap.data IS 'A collection of data to cache.';
            public       vagrant    false    187            n           0    0    COLUMN cache_bootstrap.expire    COMMENT        COMMENT ON COLUMN cache_bootstrap.expire IS 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.';
            public       vagrant    false    187            o           0    0    COLUMN cache_bootstrap.created    COMMENT     n   COMMENT ON COLUMN cache_bootstrap.created IS 'A Unix timestamp indicating when the cache entry was created.';
            public       vagrant    false    187            p           0    0 !   COLUMN cache_bootstrap.serialized    COMMENT     t   COMMENT ON COLUMN cache_bootstrap.serialized IS 'A flag to indicate whether content is serialized (1) or not (0).';
            public       vagrant    false    187            �            1259    33486    cache_field    TABLE     �   CREATE TABLE cache_field (
    cid character varying(255) DEFAULT ''::character varying NOT NULL,
    data bytea,
    expire integer DEFAULT 0 NOT NULL,
    created integer DEFAULT 0 NOT NULL,
    serialized smallint DEFAULT 0 NOT NULL
);
    DROP TABLE public.cache_field;
       public         vagrant    false    6            q           0    0    TABLE cache_field    COMMENT     n   COMMENT ON TABLE cache_field IS 'Cache table for the Field module to store already built field information.';
            public       vagrant    false    237            r           0    0    COLUMN cache_field.cid    COMMENT     F   COMMENT ON COLUMN cache_field.cid IS 'Primary Key: Unique cache ID.';
            public       vagrant    false    237            s           0    0    COLUMN cache_field.data    COMMENT     H   COMMENT ON COLUMN cache_field.data IS 'A collection of data to cache.';
            public       vagrant    false    237            t           0    0    COLUMN cache_field.expire    COMMENT     {   COMMENT ON COLUMN cache_field.expire IS 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.';
            public       vagrant    false    237            u           0    0    COLUMN cache_field.created    COMMENT     j   COMMENT ON COLUMN cache_field.created IS 'A Unix timestamp indicating when the cache entry was created.';
            public       vagrant    false    237            v           0    0    COLUMN cache_field.serialized    COMMENT     p   COMMENT ON COLUMN cache_field.serialized IS 'A flag to indicate whether content is serialized (1) or not (0).';
            public       vagrant    false    237            �            1259    33429    cache_filter    TABLE     �   CREATE TABLE cache_filter (
    cid character varying(255) DEFAULT ''::character varying NOT NULL,
    data bytea,
    expire integer DEFAULT 0 NOT NULL,
    created integer DEFAULT 0 NOT NULL,
    serialized smallint DEFAULT 0 NOT NULL
);
     DROP TABLE public.cache_filter;
       public         vagrant    false    6            w           0    0    TABLE cache_filter    COMMENT     �   COMMENT ON TABLE cache_filter IS 'Cache table for the Filter module to store already filtered pieces of text, identified by text format and hash of the text.';
            public       vagrant    false    232            x           0    0    COLUMN cache_filter.cid    COMMENT     G   COMMENT ON COLUMN cache_filter.cid IS 'Primary Key: Unique cache ID.';
            public       vagrant    false    232            y           0    0    COLUMN cache_filter.data    COMMENT     I   COMMENT ON COLUMN cache_filter.data IS 'A collection of data to cache.';
            public       vagrant    false    232            z           0    0    COLUMN cache_filter.expire    COMMENT     |   COMMENT ON COLUMN cache_filter.expire IS 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.';
            public       vagrant    false    232            {           0    0    COLUMN cache_filter.created    COMMENT     k   COMMENT ON COLUMN cache_filter.created IS 'A Unix timestamp indicating when the cache entry was created.';
            public       vagrant    false    232            |           0    0    COLUMN cache_filter.serialized    COMMENT     q   COMMENT ON COLUMN cache_filter.serialized IS 'A flag to indicate whether content is serialized (1) or not (0).';
            public       vagrant    false    232            �            1259    32896 
   cache_form    TABLE     �   CREATE TABLE cache_form (
    cid character varying(255) DEFAULT ''::character varying NOT NULL,
    data bytea,
    expire integer DEFAULT 0 NOT NULL,
    created integer DEFAULT 0 NOT NULL,
    serialized smallint DEFAULT 0 NOT NULL
);
    DROP TABLE public.cache_form;
       public         vagrant    false    6            }           0    0    TABLE cache_form    COMMENT     �   COMMENT ON TABLE cache_form IS 'Cache table for the form system to store recently built forms and their storage data, to be used in subsequent page requests.';
            public       vagrant    false    188            ~           0    0    COLUMN cache_form.cid    COMMENT     E   COMMENT ON COLUMN cache_form.cid IS 'Primary Key: Unique cache ID.';
            public       vagrant    false    188                       0    0    COLUMN cache_form.data    COMMENT     G   COMMENT ON COLUMN cache_form.data IS 'A collection of data to cache.';
            public       vagrant    false    188            �           0    0    COLUMN cache_form.expire    COMMENT     z   COMMENT ON COLUMN cache_form.expire IS 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.';
            public       vagrant    false    188            �           0    0    COLUMN cache_form.created    COMMENT     i   COMMENT ON COLUMN cache_form.created IS 'A Unix timestamp indicating when the cache entry was created.';
            public       vagrant    false    188            �           0    0    COLUMN cache_form.serialized    COMMENT     o   COMMENT ON COLUMN cache_form.serialized IS 'A flag to indicate whether content is serialized (1) or not (0).';
            public       vagrant    false    188            �            1259    33693    cache_image    TABLE     �   CREATE TABLE cache_image (
    cid character varying(255) DEFAULT ''::character varying NOT NULL,
    data bytea,
    expire integer DEFAULT 0 NOT NULL,
    created integer DEFAULT 0 NOT NULL,
    serialized smallint DEFAULT 0 NOT NULL
);
    DROP TABLE public.cache_image;
       public         vagrant    false    6            �           0    0    TABLE cache_image    COMMENT     y   COMMENT ON TABLE cache_image IS 'Cache table used to store information about image manipulations that are in-progress.';
            public       vagrant    false    255            �           0    0    COLUMN cache_image.cid    COMMENT     F   COMMENT ON COLUMN cache_image.cid IS 'Primary Key: Unique cache ID.';
            public       vagrant    false    255            �           0    0    COLUMN cache_image.data    COMMENT     H   COMMENT ON COLUMN cache_image.data IS 'A collection of data to cache.';
            public       vagrant    false    255            �           0    0    COLUMN cache_image.expire    COMMENT     {   COMMENT ON COLUMN cache_image.expire IS 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.';
            public       vagrant    false    255            �           0    0    COLUMN cache_image.created    COMMENT     j   COMMENT ON COLUMN cache_image.created IS 'A Unix timestamp indicating when the cache entry was created.';
            public       vagrant    false    255            �           0    0    COLUMN cache_image.serialized    COMMENT     p   COMMENT ON COLUMN cache_image.serialized IS 'A flag to indicate whether content is serialized (1) or not (0).';
            public       vagrant    false    255            �            1259    32922 
   cache_menu    TABLE     �   CREATE TABLE cache_menu (
    cid character varying(255) DEFAULT ''::character varying NOT NULL,
    data bytea,
    expire integer DEFAULT 0 NOT NULL,
    created integer DEFAULT 0 NOT NULL,
    serialized smallint DEFAULT 0 NOT NULL
);
    DROP TABLE public.cache_menu;
       public         vagrant    false    6            �           0    0    TABLE cache_menu    COMMENT     �   COMMENT ON TABLE cache_menu IS 'Cache table for the menu system to store router information as well as generated link trees for various menu/page/user combinations.';
            public       vagrant    false    190            �           0    0    COLUMN cache_menu.cid    COMMENT     E   COMMENT ON COLUMN cache_menu.cid IS 'Primary Key: Unique cache ID.';
            public       vagrant    false    190            �           0    0    COLUMN cache_menu.data    COMMENT     G   COMMENT ON COLUMN cache_menu.data IS 'A collection of data to cache.';
            public       vagrant    false    190            �           0    0    COLUMN cache_menu.expire    COMMENT     z   COMMENT ON COLUMN cache_menu.expire IS 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.';
            public       vagrant    false    190            �           0    0    COLUMN cache_menu.created    COMMENT     i   COMMENT ON COLUMN cache_menu.created IS 'A Unix timestamp indicating when the cache entry was created.';
            public       vagrant    false    190            �           0    0    COLUMN cache_menu.serialized    COMMENT     o   COMMENT ON COLUMN cache_menu.serialized IS 'A flag to indicate whether content is serialized (1) or not (0).';
            public       vagrant    false    190            �            1259    32909 
   cache_page    TABLE     �   CREATE TABLE cache_page (
    cid character varying(255) DEFAULT ''::character varying NOT NULL,
    data bytea,
    expire integer DEFAULT 0 NOT NULL,
    created integer DEFAULT 0 NOT NULL,
    serialized smallint DEFAULT 0 NOT NULL
);
    DROP TABLE public.cache_page;
       public         vagrant    false    6            �           0    0    TABLE cache_page    COMMENT     ~   COMMENT ON TABLE cache_page IS 'Cache table used to store compressed pages for anonymous users, if page caching is enabled.';
            public       vagrant    false    189            �           0    0    COLUMN cache_page.cid    COMMENT     E   COMMENT ON COLUMN cache_page.cid IS 'Primary Key: Unique cache ID.';
            public       vagrant    false    189            �           0    0    COLUMN cache_page.data    COMMENT     G   COMMENT ON COLUMN cache_page.data IS 'A collection of data to cache.';
            public       vagrant    false    189            �           0    0    COLUMN cache_page.expire    COMMENT     z   COMMENT ON COLUMN cache_page.expire IS 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.';
            public       vagrant    false    189            �           0    0    COLUMN cache_page.created    COMMENT     i   COMMENT ON COLUMN cache_page.created IS 'A Unix timestamp indicating when the cache entry was created.';
            public       vagrant    false    189            �           0    0    COLUMN cache_page.serialized    COMMENT     o   COMMENT ON COLUMN cache_page.serialized IS 'A flag to indicate whether content is serialized (1) or not (0).';
            public       vagrant    false    189            �            1259    32935 
   cache_path    TABLE     �   CREATE TABLE cache_path (
    cid character varying(255) DEFAULT ''::character varying NOT NULL,
    data bytea,
    expire integer DEFAULT 0 NOT NULL,
    created integer DEFAULT 0 NOT NULL,
    serialized smallint DEFAULT 0 NOT NULL
);
    DROP TABLE public.cache_path;
       public         vagrant    false    6            �           0    0    TABLE cache_path    COMMENT     E   COMMENT ON TABLE cache_path IS 'Cache table for path alias lookup.';
            public       vagrant    false    191            �           0    0    COLUMN cache_path.cid    COMMENT     E   COMMENT ON COLUMN cache_path.cid IS 'Primary Key: Unique cache ID.';
            public       vagrant    false    191            �           0    0    COLUMN cache_path.data    COMMENT     G   COMMENT ON COLUMN cache_path.data IS 'A collection of data to cache.';
            public       vagrant    false    191            �           0    0    COLUMN cache_path.expire    COMMENT     z   COMMENT ON COLUMN cache_path.expire IS 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.';
            public       vagrant    false    191            �           0    0    COLUMN cache_path.created    COMMENT     i   COMMENT ON COLUMN cache_path.created IS 'A Unix timestamp indicating when the cache entry was created.';
            public       vagrant    false    191            �           0    0    COLUMN cache_path.serialized    COMMENT     o   COMMENT ON COLUMN cache_path.serialized IS 'A flag to indicate whether content is serialized (1) or not (0).';
            public       vagrant    false    191                       1259    34154    cache_update    TABLE     �   CREATE TABLE cache_update (
    cid character varying(255) DEFAULT ''::character varying NOT NULL,
    data bytea,
    expire integer DEFAULT 0 NOT NULL,
    created integer DEFAULT 0 NOT NULL,
    serialized smallint DEFAULT 0 NOT NULL
);
     DROP TABLE public.cache_update;
       public         vagrant    false    6            �           0    0    TABLE cache_update    COMMENT     �   COMMENT ON TABLE cache_update IS 'Cache table for the Update module to store information about available releases, fetched from central server.';
            public       vagrant    false    276            �           0    0    COLUMN cache_update.cid    COMMENT     G   COMMENT ON COLUMN cache_update.cid IS 'Primary Key: Unique cache ID.';
            public       vagrant    false    276            �           0    0    COLUMN cache_update.data    COMMENT     I   COMMENT ON COLUMN cache_update.data IS 'A collection of data to cache.';
            public       vagrant    false    276            �           0    0    COLUMN cache_update.expire    COMMENT     |   COMMENT ON COLUMN cache_update.expire IS 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.';
            public       vagrant    false    276            �           0    0    COLUMN cache_update.created    COMMENT     k   COMMENT ON COLUMN cache_update.created IS 'A Unix timestamp indicating when the cache entry was created.';
            public       vagrant    false    276            �           0    0    COLUMN cache_update.serialized    COMMENT     q   COMMENT ON COLUMN cache_update.serialized IS 'A flag to indicate whether content is serialized (1) or not (0).';
            public       vagrant    false    276            �            1259    33566    comment    TABLE     �  CREATE TABLE comment (
    cid integer NOT NULL,
    pid integer DEFAULT 0 NOT NULL,
    nid integer DEFAULT 0 NOT NULL,
    uid integer DEFAULT 0 NOT NULL,
    subject character varying(64) DEFAULT ''::character varying NOT NULL,
    hostname character varying(128) DEFAULT ''::character varying NOT NULL,
    created integer DEFAULT 0 NOT NULL,
    changed integer DEFAULT 0 NOT NULL,
    status integer DEFAULT 1 NOT NULL,
    thread character varying(255) NOT NULL,
    name character varying(60),
    mail character varying(64),
    homepage character varying(255),
    language character varying(12) DEFAULT ''::character varying NOT NULL,
    CONSTRAINT comment_status_check CHECK ((status >= 0))
);
    DROP TABLE public.comment;
       public         vagrant    false    6            �           0    0    TABLE comment    COMMENT     D   COMMENT ON TABLE comment IS 'Stores comments and associated data.';
            public       vagrant    false    245            �           0    0    COLUMN comment.cid    COMMENT     D   COMMENT ON COLUMN comment.cid IS 'Primary Key: Unique comment ID.';
            public       vagrant    false    245            �           0    0    COLUMN comment.pid    COMMENT     �   COMMENT ON COLUMN comment.pid IS 'The comment.cid to which this comment is a reply. If set to 0, this comment is not a reply to an existing comment.';
            public       vagrant    false    245            �           0    0    COLUMN comment.nid    COMMENT     S   COMMENT ON COLUMN comment.nid IS 'The node.nid to which this comment is a reply.';
            public       vagrant    false    245            �           0    0    COLUMN comment.uid    COMMENT     �   COMMENT ON COLUMN comment.uid IS 'The users.uid who authored the comment. If set to 0, this comment was created by an anonymous user.';
            public       vagrant    false    245            �           0    0    COLUMN comment.subject    COMMENT     ;   COMMENT ON COLUMN comment.subject IS 'The comment title.';
            public       vagrant    false    245            �           0    0    COLUMN comment.hostname    COMMENT     B   COMMENT ON COLUMN comment.hostname IS 'The author''s host name.';
            public       vagrant    false    245            �           0    0    COLUMN comment.created    COMMENT     d   COMMENT ON COLUMN comment.created IS 'The time that the comment was created, as a Unix timestamp.';
            public       vagrant    false    245            �           0    0    COLUMN comment.changed    COMMENT     h   COMMENT ON COLUMN comment.changed IS 'The time that the comment was last edited, as a Unix timestamp.';
            public       vagrant    false    245            �           0    0    COLUMN comment.status    COMMENT     m   COMMENT ON COLUMN comment.status IS 'The published status of a comment. (0 = Not Published, 1 = Published)';
            public       vagrant    false    245            �           0    0    COLUMN comment.thread    COMMENT     g   COMMENT ON COLUMN comment.thread IS 'The vancode representation of the comment''s place in a thread.';
            public       vagrant    false    245            �           0    0    COLUMN comment.name    COMMENT     �   COMMENT ON COLUMN comment.name IS 'The comment author''s name. Uses users.name if the user is logged in, otherwise uses the value typed into the comment form.';
            public       vagrant    false    245            �           0    0    COLUMN comment.mail    COMMENT     �   COMMENT ON COLUMN comment.mail IS 'The comment author''s e-mail address from the comment form, if user is anonymous, and the ''Anonymous users may/must leave their contact information'' setting is turned on.';
            public       vagrant    false    245            �           0    0    COLUMN comment.homepage    COMMENT     �   COMMENT ON COLUMN comment.homepage IS 'The comment author''s home page address from the comment form, if user is anonymous, and the ''Anonymous users may/must leave their contact information'' setting is turned on.';
            public       vagrant    false    245            �           0    0    COLUMN comment.language    COMMENT     Q   COMMENT ON COLUMN comment.language IS 'The languages.language of this comment.';
            public       vagrant    false    245            �            1259    33564    comment_cid_seq    SEQUENCE     q   CREATE SEQUENCE comment_cid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.comment_cid_seq;
       public       vagrant    false    6    245            �           0    0    comment_cid_seq    SEQUENCE OWNED BY     5   ALTER SEQUENCE comment_cid_seq OWNED BY comment.cid;
            public       vagrant    false    244            �            1259    32967    date_format_locale    TABLE     �   CREATE TABLE date_format_locale (
    format character varying(100) NOT NULL,
    type character varying(64) NOT NULL,
    language character varying(12) NOT NULL
);
 &   DROP TABLE public.date_format_locale;
       public         vagrant    false    6            �           0    0    TABLE date_format_locale    COMMENT     Z   COMMENT ON TABLE date_format_locale IS 'Stores configured date formats for each locale.';
            public       vagrant    false    195            �           0    0     COLUMN date_format_locale.format    COMMENT     J   COMMENT ON COLUMN date_format_locale.format IS 'The date format string.';
            public       vagrant    false    195            �           0    0    COLUMN date_format_locale.type    COMMENT     S   COMMENT ON COLUMN date_format_locale.type IS 'The date format type, e.g. medium.';
            public       vagrant    false    195            �           0    0 "   COLUMN date_format_locale.language    COMMENT     j   COMMENT ON COLUMN date_format_locale.language IS 'A languages.language for this format to be used with.';
            public       vagrant    false    195            �            1259    32948    date_format_type    TABLE     �   CREATE TABLE date_format_type (
    type character varying(64) NOT NULL,
    title character varying(255) NOT NULL,
    locked smallint DEFAULT 0 NOT NULL
);
 $   DROP TABLE public.date_format_type;
       public         vagrant    false    6            �           0    0    TABLE date_format_type    COMMENT     M   COMMENT ON TABLE date_format_type IS 'Stores configured date format types.';
            public       vagrant    false    192            �           0    0    COLUMN date_format_type.type    COMMENT     Q   COMMENT ON COLUMN date_format_type.type IS 'The date format type, e.g. medium.';
            public       vagrant    false    192            �           0    0    COLUMN date_format_type.title    COMMENT     [   COMMENT ON COLUMN date_format_type.title IS 'The human readable name of the format type.';
            public       vagrant    false    192            �           0    0    COLUMN date_format_type.locked    COMMENT     a   COMMENT ON COLUMN date_format_type.locked IS 'Whether or not this is a system provided format.';
            public       vagrant    false    192            �            1259    32957    date_formats    TABLE     �   CREATE TABLE date_formats (
    dfid integer NOT NULL,
    format character varying(100) NOT NULL,
    type character varying(64) NOT NULL,
    locked smallint DEFAULT 0 NOT NULL,
    CONSTRAINT date_formats_dfid_check CHECK ((dfid >= 0))
);
     DROP TABLE public.date_formats;
       public         vagrant    false    6            �           0    0    TABLE date_formats    COMMENT     D   COMMENT ON TABLE date_formats IS 'Stores configured date formats.';
            public       vagrant    false    194            �           0    0    COLUMN date_formats.dfid    COMMENT     F   COMMENT ON COLUMN date_formats.dfid IS 'The date format identifier.';
            public       vagrant    false    194            �           0    0    COLUMN date_formats.format    COMMENT     D   COMMENT ON COLUMN date_formats.format IS 'The date format string.';
            public       vagrant    false    194            �           0    0    COLUMN date_formats.type    COMMENT     M   COMMENT ON COLUMN date_formats.type IS 'The date format type, e.g. medium.';
            public       vagrant    false    194            �           0    0    COLUMN date_formats.locked    COMMENT     X   COMMENT ON COLUMN date_formats.locked IS 'Whether or not this format can be modified.';
            public       vagrant    false    194            �            1259    32955    date_formats_dfid_seq    SEQUENCE     w   CREATE SEQUENCE date_formats_dfid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.date_formats_dfid_seq;
       public       vagrant    false    6    194            �           0    0    date_formats_dfid_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE date_formats_dfid_seq OWNED BY date_formats.dfid;
            public       vagrant    false    193            �            1259    33444    field_config    TABLE     {  CREATE TABLE field_config (
    id integer NOT NULL,
    field_name character varying(32) NOT NULL,
    type character varying(128) NOT NULL,
    module character varying(128) DEFAULT ''::character varying NOT NULL,
    active smallint DEFAULT 0 NOT NULL,
    storage_type character varying(128) NOT NULL,
    storage_module character varying(128) DEFAULT ''::character varying NOT NULL,
    storage_active smallint DEFAULT 0 NOT NULL,
    locked smallint DEFAULT 0 NOT NULL,
    data bytea NOT NULL,
    cardinality smallint DEFAULT 0 NOT NULL,
    translatable smallint DEFAULT 0 NOT NULL,
    deleted smallint DEFAULT 0 NOT NULL
);
     DROP TABLE public.field_config;
       public         vagrant    false    6            �           0    0    COLUMN field_config.id    COMMENT     K   COMMENT ON COLUMN field_config.id IS 'The primary identifier for a field';
            public       vagrant    false    234            �           0    0    COLUMN field_config.field_name    COMMENT     �   COMMENT ON COLUMN field_config.field_name IS 'The name of this field. Non-deleted field names are unique, but multiple deleted fields can have the same name.';
            public       vagrant    false    234            �           0    0    COLUMN field_config.type    COMMENT     B   COMMENT ON COLUMN field_config.type IS 'The type of this field.';
            public       vagrant    false    234            �           0    0    COLUMN field_config.module    COMMENT     W   COMMENT ON COLUMN field_config.module IS 'The module that implements the field type.';
            public       vagrant    false    234            �           0    0    COLUMN field_config.active    COMMENT     }   COMMENT ON COLUMN field_config.active IS 'Boolean indicating whether the module that implements the field type is enabled.';
            public       vagrant    false    234            �           0    0     COLUMN field_config.storage_type    COMMENT     U   COMMENT ON COLUMN field_config.storage_type IS 'The storage backend for the field.';
            public       vagrant    false    234            �           0    0 "   COLUMN field_config.storage_module    COMMENT     d   COMMENT ON COLUMN field_config.storage_module IS 'The module that implements the storage backend.';
            public       vagrant    false    234            �           0    0 "   COLUMN field_config.storage_active    COMMENT     �   COMMENT ON COLUMN field_config.storage_active IS 'Boolean indicating whether the module that implements the storage backend is enabled.';
            public       vagrant    false    234            �           0    0    COLUMN field_config.locked    COMMENT     2   COMMENT ON COLUMN field_config.locked IS '@TODO';
            public       vagrant    false    234            �           0    0    COLUMN field_config.data    COMMENT     �   COMMENT ON COLUMN field_config.data IS 'Serialized data containing the field properties that do not warrant a dedicated column.';
            public       vagrant    false    234            �            1259    33442    field_config_id_seq    SEQUENCE     u   CREATE SEQUENCE field_config_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.field_config_id_seq;
       public       vagrant    false    6    234            �           0    0    field_config_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE field_config_id_seq OWNED BY field_config.id;
            public       vagrant    false    233            �            1259    33471    field_config_instance    TABLE     �  CREATE TABLE field_config_instance (
    id integer NOT NULL,
    field_id integer NOT NULL,
    field_name character varying(32) DEFAULT ''::character varying NOT NULL,
    entity_type character varying(32) DEFAULT ''::character varying NOT NULL,
    bundle character varying(128) DEFAULT ''::character varying NOT NULL,
    data bytea NOT NULL,
    deleted smallint DEFAULT 0 NOT NULL
);
 )   DROP TABLE public.field_config_instance;
       public         vagrant    false    6            �           0    0    COLUMN field_config_instance.id    COMMENT     ]   COMMENT ON COLUMN field_config_instance.id IS 'The primary identifier for a field instance';
            public       vagrant    false    236            �           0    0 %   COLUMN field_config_instance.field_id    COMMENT     m   COMMENT ON COLUMN field_config_instance.field_id IS 'The identifier of the field attached by this instance';
            public       vagrant    false    236            �            1259    33469    field_config_instance_id_seq    SEQUENCE     ~   CREATE SEQUENCE field_config_instance_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.field_config_instance_id_seq;
       public       vagrant    false    6    236            �           0    0    field_config_instance_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE field_config_instance_id_seq OWNED BY field_config_instance.id;
            public       vagrant    false    235                       1259    33913    field_data_body    TABLE     �  CREATE TABLE field_data_body (
    entity_type character varying(128) DEFAULT ''::character varying NOT NULL,
    bundle character varying(128) DEFAULT ''::character varying NOT NULL,
    deleted smallint DEFAULT 0 NOT NULL,
    entity_id bigint NOT NULL,
    revision_id bigint,
    language character varying(32) DEFAULT ''::character varying NOT NULL,
    delta bigint NOT NULL,
    body_value text,
    body_summary text,
    body_format character varying(255),
    CONSTRAINT field_data_body_delta_check CHECK ((delta >= 0)),
    CONSTRAINT field_data_body_entity_id_check CHECK ((entity_id >= 0)),
    CONSTRAINT field_data_body_revision_id_check CHECK ((revision_id >= 0))
);
 #   DROP TABLE public.field_data_body;
       public         vagrant    false    6            �           0    0    TABLE field_data_body    COMMENT     G   COMMENT ON TABLE field_data_body IS 'Data storage for field 2 (body)';
            public       vagrant    false    270            �           0    0 "   COLUMN field_data_body.entity_type    COMMENT     ]   COMMENT ON COLUMN field_data_body.entity_type IS 'The entity type this data is attached to';
            public       vagrant    false    270            �           0    0    COLUMN field_data_body.bundle    COMMENT     �   COMMENT ON COLUMN field_data_body.bundle IS 'The field instance bundle to which this row belongs, used when deleting a field instance';
            public       vagrant    false    270            �           0    0    COLUMN field_data_body.deleted    COMMENT     m   COMMENT ON COLUMN field_data_body.deleted IS 'A boolean indicating whether this data item has been deleted';
            public       vagrant    false    270            �           0    0     COLUMN field_data_body.entity_id    COMMENT     Y   COMMENT ON COLUMN field_data_body.entity_id IS 'The entity id this data is attached to';
            public       vagrant    false    270            �           0    0 "   COLUMN field_data_body.revision_id    COMMENT     �   COMMENT ON COLUMN field_data_body.revision_id IS 'The entity revision id this data is attached to, or NULL if the entity type is not versioned';
            public       vagrant    false    270            �           0    0    COLUMN field_data_body.language    COMMENT     R   COMMENT ON COLUMN field_data_body.language IS 'The language for this data item.';
            public       vagrant    false    270            �           0    0    COLUMN field_data_body.delta    COMMENT     r   COMMENT ON COLUMN field_data_body.delta IS 'The sequence number for this data item, used for multi-value fields';
            public       vagrant    false    270                       1259    33854    field_data_comment_body    TABLE     �  CREATE TABLE field_data_comment_body (
    entity_type character varying(128) DEFAULT ''::character varying NOT NULL,
    bundle character varying(128) DEFAULT ''::character varying NOT NULL,
    deleted smallint DEFAULT 0 NOT NULL,
    entity_id bigint NOT NULL,
    revision_id bigint,
    language character varying(32) DEFAULT ''::character varying NOT NULL,
    delta bigint NOT NULL,
    comment_body_value text,
    comment_body_format character varying(255),
    CONSTRAINT field_data_comment_body_delta_check CHECK ((delta >= 0)),
    CONSTRAINT field_data_comment_body_entity_id_check CHECK ((entity_id >= 0)),
    CONSTRAINT field_data_comment_body_revision_id_check CHECK ((revision_id >= 0))
);
 +   DROP TABLE public.field_data_comment_body;
       public         vagrant    false    6            �           0    0    TABLE field_data_comment_body    COMMENT     W   COMMENT ON TABLE field_data_comment_body IS 'Data storage for field 1 (comment_body)';
            public       vagrant    false    268            �           0    0 *   COLUMN field_data_comment_body.entity_type    COMMENT     e   COMMENT ON COLUMN field_data_comment_body.entity_type IS 'The entity type this data is attached to';
            public       vagrant    false    268            �           0    0 %   COLUMN field_data_comment_body.bundle    COMMENT     �   COMMENT ON COLUMN field_data_comment_body.bundle IS 'The field instance bundle to which this row belongs, used when deleting a field instance';
            public       vagrant    false    268            �           0    0 &   COLUMN field_data_comment_body.deleted    COMMENT     u   COMMENT ON COLUMN field_data_comment_body.deleted IS 'A boolean indicating whether this data item has been deleted';
            public       vagrant    false    268            �           0    0 (   COLUMN field_data_comment_body.entity_id    COMMENT     a   COMMENT ON COLUMN field_data_comment_body.entity_id IS 'The entity id this data is attached to';
            public       vagrant    false    268            �           0    0 *   COLUMN field_data_comment_body.revision_id    COMMENT     �   COMMENT ON COLUMN field_data_comment_body.revision_id IS 'The entity revision id this data is attached to, or NULL if the entity type is not versioned';
            public       vagrant    false    268            �           0    0 '   COLUMN field_data_comment_body.language    COMMENT     Z   COMMENT ON COLUMN field_data_comment_body.language IS 'The language for this data item.';
            public       vagrant    false    268            �           0    0 $   COLUMN field_data_comment_body.delta    COMMENT     z   COMMENT ON COLUMN field_data_comment_body.delta IS 'The sequence number for this data item, used for multi-value fields';
            public       vagrant    false    268                       1259    34042    field_data_field_image    TABLE     E  CREATE TABLE field_data_field_image (
    entity_type character varying(128) DEFAULT ''::character varying NOT NULL,
    bundle character varying(128) DEFAULT ''::character varying NOT NULL,
    deleted smallint DEFAULT 0 NOT NULL,
    entity_id bigint NOT NULL,
    revision_id bigint,
    language character varying(32) DEFAULT ''::character varying NOT NULL,
    delta bigint NOT NULL,
    field_image_fid bigint,
    field_image_alt character varying(512),
    field_image_title character varying(1024),
    field_image_width bigint,
    field_image_height bigint,
    CONSTRAINT field_data_field_image_delta_check CHECK ((delta >= 0)),
    CONSTRAINT field_data_field_image_entity_id_check CHECK ((entity_id >= 0)),
    CONSTRAINT field_data_field_image_field_image_fid_check CHECK ((field_image_fid >= 0)),
    CONSTRAINT field_data_field_image_field_image_height_check CHECK ((field_image_height >= 0)),
    CONSTRAINT field_data_field_image_field_image_width_check CHECK ((field_image_width >= 0)),
    CONSTRAINT field_data_field_image_revision_id_check CHECK ((revision_id >= 0))
);
 *   DROP TABLE public.field_data_field_image;
       public         vagrant    false    6            �           0    0    TABLE field_data_field_image    COMMENT     U   COMMENT ON TABLE field_data_field_image IS 'Data storage for field 4 (field_image)';
            public       vagrant    false    274            �           0    0 )   COLUMN field_data_field_image.entity_type    COMMENT     d   COMMENT ON COLUMN field_data_field_image.entity_type IS 'The entity type this data is attached to';
            public       vagrant    false    274            �           0    0 $   COLUMN field_data_field_image.bundle    COMMENT     �   COMMENT ON COLUMN field_data_field_image.bundle IS 'The field instance bundle to which this row belongs, used when deleting a field instance';
            public       vagrant    false    274            �           0    0 %   COLUMN field_data_field_image.deleted    COMMENT     t   COMMENT ON COLUMN field_data_field_image.deleted IS 'A boolean indicating whether this data item has been deleted';
            public       vagrant    false    274            �           0    0 '   COLUMN field_data_field_image.entity_id    COMMENT     `   COMMENT ON COLUMN field_data_field_image.entity_id IS 'The entity id this data is attached to';
            public       vagrant    false    274            �           0    0 )   COLUMN field_data_field_image.revision_id    COMMENT     �   COMMENT ON COLUMN field_data_field_image.revision_id IS 'The entity revision id this data is attached to, or NULL if the entity type is not versioned';
            public       vagrant    false    274            �           0    0 &   COLUMN field_data_field_image.language    COMMENT     Y   COMMENT ON COLUMN field_data_field_image.language IS 'The language for this data item.';
            public       vagrant    false    274            �           0    0 #   COLUMN field_data_field_image.delta    COMMENT     y   COMMENT ON COLUMN field_data_field_image.delta IS 'The sequence number for this data item, used for multi-value fields';
            public       vagrant    false    274            �           0    0 -   COLUMN field_data_field_image.field_image_fid    COMMENT     t   COMMENT ON COLUMN field_data_field_image.field_image_fid IS 'The file_managed.fid being referenced in this field.';
            public       vagrant    false    274            �           0    0 -   COLUMN field_data_field_image.field_image_alt    COMMENT     {   COMMENT ON COLUMN field_data_field_image.field_image_alt IS 'Alternative image text, for the image''s ''alt'' attribute.';
            public       vagrant    false    274            �           0    0 /   COLUMN field_data_field_image.field_image_title    COMMENT     y   COMMENT ON COLUMN field_data_field_image.field_image_title IS 'Image title text, for the image''s ''title'' attribute.';
            public       vagrant    false    274            �           0    0 /   COLUMN field_data_field_image.field_image_width    COMMENT     c   COMMENT ON COLUMN field_data_field_image.field_image_width IS 'The width of the image in pixels.';
            public       vagrant    false    274            �           0    0 0   COLUMN field_data_field_image.field_image_height    COMMENT     e   COMMENT ON COLUMN field_data_field_image.field_image_height IS 'The height of the image in pixels.';
            public       vagrant    false    274                       1259    33992    field_data_field_tags    TABLE     �  CREATE TABLE field_data_field_tags (
    entity_type character varying(128) DEFAULT ''::character varying NOT NULL,
    bundle character varying(128) DEFAULT ''::character varying NOT NULL,
    deleted smallint DEFAULT 0 NOT NULL,
    entity_id bigint NOT NULL,
    revision_id bigint,
    language character varying(32) DEFAULT ''::character varying NOT NULL,
    delta bigint NOT NULL,
    field_tags_tid bigint,
    CONSTRAINT field_data_field_tags_delta_check CHECK ((delta >= 0)),
    CONSTRAINT field_data_field_tags_entity_id_check CHECK ((entity_id >= 0)),
    CONSTRAINT field_data_field_tags_field_tags_tid_check CHECK ((field_tags_tid >= 0)),
    CONSTRAINT field_data_field_tags_revision_id_check CHECK ((revision_id >= 0))
);
 )   DROP TABLE public.field_data_field_tags;
       public         vagrant    false    6            �           0    0    TABLE field_data_field_tags    COMMENT     S   COMMENT ON TABLE field_data_field_tags IS 'Data storage for field 3 (field_tags)';
            public       vagrant    false    272            �           0    0 (   COLUMN field_data_field_tags.entity_type    COMMENT     c   COMMENT ON COLUMN field_data_field_tags.entity_type IS 'The entity type this data is attached to';
            public       vagrant    false    272            �           0    0 #   COLUMN field_data_field_tags.bundle    COMMENT     �   COMMENT ON COLUMN field_data_field_tags.bundle IS 'The field instance bundle to which this row belongs, used when deleting a field instance';
            public       vagrant    false    272            �           0    0 $   COLUMN field_data_field_tags.deleted    COMMENT     s   COMMENT ON COLUMN field_data_field_tags.deleted IS 'A boolean indicating whether this data item has been deleted';
            public       vagrant    false    272            �           0    0 &   COLUMN field_data_field_tags.entity_id    COMMENT     _   COMMENT ON COLUMN field_data_field_tags.entity_id IS 'The entity id this data is attached to';
            public       vagrant    false    272            �           0    0 (   COLUMN field_data_field_tags.revision_id    COMMENT     �   COMMENT ON COLUMN field_data_field_tags.revision_id IS 'The entity revision id this data is attached to, or NULL if the entity type is not versioned';
            public       vagrant    false    272            �           0    0 %   COLUMN field_data_field_tags.language    COMMENT     X   COMMENT ON COLUMN field_data_field_tags.language IS 'The language for this data item.';
            public       vagrant    false    272            �           0    0 "   COLUMN field_data_field_tags.delta    COMMENT     x   COMMENT ON COLUMN field_data_field_tags.delta IS 'The sequence number for this data item, used for multi-value fields';
            public       vagrant    false    272                       1259    33935    field_revision_body    TABLE     �  CREATE TABLE field_revision_body (
    entity_type character varying(128) DEFAULT ''::character varying NOT NULL,
    bundle character varying(128) DEFAULT ''::character varying NOT NULL,
    deleted smallint DEFAULT 0 NOT NULL,
    entity_id bigint NOT NULL,
    revision_id bigint NOT NULL,
    language character varying(32) DEFAULT ''::character varying NOT NULL,
    delta bigint NOT NULL,
    body_value text,
    body_summary text,
    body_format character varying(255),
    CONSTRAINT field_revision_body_delta_check CHECK ((delta >= 0)),
    CONSTRAINT field_revision_body_entity_id_check CHECK ((entity_id >= 0)),
    CONSTRAINT field_revision_body_revision_id_check CHECK ((revision_id >= 0))
);
 '   DROP TABLE public.field_revision_body;
       public         vagrant    false    6            �           0    0    TABLE field_revision_body    COMMENT     W   COMMENT ON TABLE field_revision_body IS 'Revision archive storage for field 2 (body)';
            public       vagrant    false    271            �           0    0 &   COLUMN field_revision_body.entity_type    COMMENT     a   COMMENT ON COLUMN field_revision_body.entity_type IS 'The entity type this data is attached to';
            public       vagrant    false    271            �           0    0 !   COLUMN field_revision_body.bundle    COMMENT     �   COMMENT ON COLUMN field_revision_body.bundle IS 'The field instance bundle to which this row belongs, used when deleting a field instance';
            public       vagrant    false    271            �           0    0 "   COLUMN field_revision_body.deleted    COMMENT     q   COMMENT ON COLUMN field_revision_body.deleted IS 'A boolean indicating whether this data item has been deleted';
            public       vagrant    false    271            �           0    0 $   COLUMN field_revision_body.entity_id    COMMENT     ]   COMMENT ON COLUMN field_revision_body.entity_id IS 'The entity id this data is attached to';
            public       vagrant    false    271            �           0    0 &   COLUMN field_revision_body.revision_id    COMMENT     h   COMMENT ON COLUMN field_revision_body.revision_id IS 'The entity revision id this data is attached to';
            public       vagrant    false    271            �           0    0 #   COLUMN field_revision_body.language    COMMENT     V   COMMENT ON COLUMN field_revision_body.language IS 'The language for this data item.';
            public       vagrant    false    271            �           0    0     COLUMN field_revision_body.delta    COMMENT     v   COMMENT ON COLUMN field_revision_body.delta IS 'The sequence number for this data item, used for multi-value fields';
            public       vagrant    false    271                       1259    33876    field_revision_comment_body    TABLE     �  CREATE TABLE field_revision_comment_body (
    entity_type character varying(128) DEFAULT ''::character varying NOT NULL,
    bundle character varying(128) DEFAULT ''::character varying NOT NULL,
    deleted smallint DEFAULT 0 NOT NULL,
    entity_id bigint NOT NULL,
    revision_id bigint NOT NULL,
    language character varying(32) DEFAULT ''::character varying NOT NULL,
    delta bigint NOT NULL,
    comment_body_value text,
    comment_body_format character varying(255),
    CONSTRAINT field_revision_comment_body_delta_check CHECK ((delta >= 0)),
    CONSTRAINT field_revision_comment_body_entity_id_check CHECK ((entity_id >= 0)),
    CONSTRAINT field_revision_comment_body_revision_id_check CHECK ((revision_id >= 0))
);
 /   DROP TABLE public.field_revision_comment_body;
       public         vagrant    false    6            �           0    0 !   TABLE field_revision_comment_body    COMMENT     g   COMMENT ON TABLE field_revision_comment_body IS 'Revision archive storage for field 1 (comment_body)';
            public       vagrant    false    269            �           0    0 .   COLUMN field_revision_comment_body.entity_type    COMMENT     i   COMMENT ON COLUMN field_revision_comment_body.entity_type IS 'The entity type this data is attached to';
            public       vagrant    false    269            �           0    0 )   COLUMN field_revision_comment_body.bundle    COMMENT     �   COMMENT ON COLUMN field_revision_comment_body.bundle IS 'The field instance bundle to which this row belongs, used when deleting a field instance';
            public       vagrant    false    269            �           0    0 *   COLUMN field_revision_comment_body.deleted    COMMENT     y   COMMENT ON COLUMN field_revision_comment_body.deleted IS 'A boolean indicating whether this data item has been deleted';
            public       vagrant    false    269            �           0    0 ,   COLUMN field_revision_comment_body.entity_id    COMMENT     e   COMMENT ON COLUMN field_revision_comment_body.entity_id IS 'The entity id this data is attached to';
            public       vagrant    false    269            �           0    0 .   COLUMN field_revision_comment_body.revision_id    COMMENT     p   COMMENT ON COLUMN field_revision_comment_body.revision_id IS 'The entity revision id this data is attached to';
            public       vagrant    false    269                        0    0 +   COLUMN field_revision_comment_body.language    COMMENT     ^   COMMENT ON COLUMN field_revision_comment_body.language IS 'The language for this data item.';
            public       vagrant    false    269                       0    0 (   COLUMN field_revision_comment_body.delta    COMMENT     ~   COMMENT ON COLUMN field_revision_comment_body.delta IS 'The sequence number for this data item, used for multi-value fields';
            public       vagrant    false    269                       1259    34067    field_revision_field_image    TABLE     j  CREATE TABLE field_revision_field_image (
    entity_type character varying(128) DEFAULT ''::character varying NOT NULL,
    bundle character varying(128) DEFAULT ''::character varying NOT NULL,
    deleted smallint DEFAULT 0 NOT NULL,
    entity_id bigint NOT NULL,
    revision_id bigint NOT NULL,
    language character varying(32) DEFAULT ''::character varying NOT NULL,
    delta bigint NOT NULL,
    field_image_fid bigint,
    field_image_alt character varying(512),
    field_image_title character varying(1024),
    field_image_width bigint,
    field_image_height bigint,
    CONSTRAINT field_revision_field_image_delta_check CHECK ((delta >= 0)),
    CONSTRAINT field_revision_field_image_entity_id_check CHECK ((entity_id >= 0)),
    CONSTRAINT field_revision_field_image_field_image_fid_check CHECK ((field_image_fid >= 0)),
    CONSTRAINT field_revision_field_image_field_image_height_check CHECK ((field_image_height >= 0)),
    CONSTRAINT field_revision_field_image_field_image_width_check CHECK ((field_image_width >= 0)),
    CONSTRAINT field_revision_field_image_revision_id_check CHECK ((revision_id >= 0))
);
 .   DROP TABLE public.field_revision_field_image;
       public         vagrant    false    6                       0    0     TABLE field_revision_field_image    COMMENT     e   COMMENT ON TABLE field_revision_field_image IS 'Revision archive storage for field 4 (field_image)';
            public       vagrant    false    275                       0    0 -   COLUMN field_revision_field_image.entity_type    COMMENT     h   COMMENT ON COLUMN field_revision_field_image.entity_type IS 'The entity type this data is attached to';
            public       vagrant    false    275                       0    0 (   COLUMN field_revision_field_image.bundle    COMMENT     �   COMMENT ON COLUMN field_revision_field_image.bundle IS 'The field instance bundle to which this row belongs, used when deleting a field instance';
            public       vagrant    false    275                       0    0 )   COLUMN field_revision_field_image.deleted    COMMENT     x   COMMENT ON COLUMN field_revision_field_image.deleted IS 'A boolean indicating whether this data item has been deleted';
            public       vagrant    false    275                       0    0 +   COLUMN field_revision_field_image.entity_id    COMMENT     d   COMMENT ON COLUMN field_revision_field_image.entity_id IS 'The entity id this data is attached to';
            public       vagrant    false    275                       0    0 -   COLUMN field_revision_field_image.revision_id    COMMENT     o   COMMENT ON COLUMN field_revision_field_image.revision_id IS 'The entity revision id this data is attached to';
            public       vagrant    false    275                       0    0 *   COLUMN field_revision_field_image.language    COMMENT     ]   COMMENT ON COLUMN field_revision_field_image.language IS 'The language for this data item.';
            public       vagrant    false    275            	           0    0 '   COLUMN field_revision_field_image.delta    COMMENT     }   COMMENT ON COLUMN field_revision_field_image.delta IS 'The sequence number for this data item, used for multi-value fields';
            public       vagrant    false    275            
           0    0 1   COLUMN field_revision_field_image.field_image_fid    COMMENT     x   COMMENT ON COLUMN field_revision_field_image.field_image_fid IS 'The file_managed.fid being referenced in this field.';
            public       vagrant    false    275                       0    0 1   COLUMN field_revision_field_image.field_image_alt    COMMENT        COMMENT ON COLUMN field_revision_field_image.field_image_alt IS 'Alternative image text, for the image''s ''alt'' attribute.';
            public       vagrant    false    275                       0    0 3   COLUMN field_revision_field_image.field_image_title    COMMENT     }   COMMENT ON COLUMN field_revision_field_image.field_image_title IS 'Image title text, for the image''s ''title'' attribute.';
            public       vagrant    false    275                       0    0 3   COLUMN field_revision_field_image.field_image_width    COMMENT     g   COMMENT ON COLUMN field_revision_field_image.field_image_width IS 'The width of the image in pixels.';
            public       vagrant    false    275                       0    0 4   COLUMN field_revision_field_image.field_image_height    COMMENT     i   COMMENT ON COLUMN field_revision_field_image.field_image_height IS 'The height of the image in pixels.';
            public       vagrant    false    275                       1259    34012    field_revision_field_tags    TABLE        CREATE TABLE field_revision_field_tags (
    entity_type character varying(128) DEFAULT ''::character varying NOT NULL,
    bundle character varying(128) DEFAULT ''::character varying NOT NULL,
    deleted smallint DEFAULT 0 NOT NULL,
    entity_id bigint NOT NULL,
    revision_id bigint NOT NULL,
    language character varying(32) DEFAULT ''::character varying NOT NULL,
    delta bigint NOT NULL,
    field_tags_tid bigint,
    CONSTRAINT field_revision_field_tags_delta_check CHECK ((delta >= 0)),
    CONSTRAINT field_revision_field_tags_entity_id_check CHECK ((entity_id >= 0)),
    CONSTRAINT field_revision_field_tags_field_tags_tid_check CHECK ((field_tags_tid >= 0)),
    CONSTRAINT field_revision_field_tags_revision_id_check CHECK ((revision_id >= 0))
);
 -   DROP TABLE public.field_revision_field_tags;
       public         vagrant    false    6                       0    0    TABLE field_revision_field_tags    COMMENT     c   COMMENT ON TABLE field_revision_field_tags IS 'Revision archive storage for field 3 (field_tags)';
            public       vagrant    false    273                       0    0 ,   COLUMN field_revision_field_tags.entity_type    COMMENT     g   COMMENT ON COLUMN field_revision_field_tags.entity_type IS 'The entity type this data is attached to';
            public       vagrant    false    273                       0    0 '   COLUMN field_revision_field_tags.bundle    COMMENT     �   COMMENT ON COLUMN field_revision_field_tags.bundle IS 'The field instance bundle to which this row belongs, used when deleting a field instance';
            public       vagrant    false    273                       0    0 (   COLUMN field_revision_field_tags.deleted    COMMENT     w   COMMENT ON COLUMN field_revision_field_tags.deleted IS 'A boolean indicating whether this data item has been deleted';
            public       vagrant    false    273                       0    0 *   COLUMN field_revision_field_tags.entity_id    COMMENT     c   COMMENT ON COLUMN field_revision_field_tags.entity_id IS 'The entity id this data is attached to';
            public       vagrant    false    273                       0    0 ,   COLUMN field_revision_field_tags.revision_id    COMMENT     n   COMMENT ON COLUMN field_revision_field_tags.revision_id IS 'The entity revision id this data is attached to';
            public       vagrant    false    273                       0    0 )   COLUMN field_revision_field_tags.language    COMMENT     \   COMMENT ON COLUMN field_revision_field_tags.language IS 'The language for this data item.';
            public       vagrant    false    273                       0    0 &   COLUMN field_revision_field_tags.delta    COMMENT     |   COMMENT ON COLUMN field_revision_field_tags.delta IS 'The sequence number for this data item, used for multi-value fields';
            public       vagrant    false    273            �            1259    32974    file_managed    TABLE     �  CREATE TABLE file_managed (
    fid integer NOT NULL,
    uid bigint DEFAULT 0 NOT NULL,
    filename character varying(255) DEFAULT ''::character varying NOT NULL,
    uri character varying(255) DEFAULT ''::character varying NOT NULL,
    filemime character varying(255) DEFAULT ''::character varying NOT NULL,
    filesize bigint DEFAULT 0 NOT NULL,
    status smallint DEFAULT 0 NOT NULL,
    "timestamp" bigint DEFAULT 0 NOT NULL,
    CONSTRAINT file_managed_fid_check CHECK ((fid >= 0)),
    CONSTRAINT file_managed_filesize_check CHECK ((filesize >= 0)),
    CONSTRAINT file_managed_timestamp_check CHECK (("timestamp" >= 0)),
    CONSTRAINT file_managed_uid_check CHECK ((uid >= 0))
);
     DROP TABLE public.file_managed;
       public         vagrant    false    6                       0    0    TABLE file_managed    COMMENT     K   COMMENT ON TABLE file_managed IS 'Stores information for uploaded files.';
            public       vagrant    false    197                       0    0    COLUMN file_managed.fid    COMMENT     2   COMMENT ON COLUMN file_managed.fid IS 'File ID.';
            public       vagrant    false    197                       0    0    COLUMN file_managed.uid    COMMENT     d   COMMENT ON COLUMN file_managed.uid IS 'The users.uid of the user who is associated with the file.';
            public       vagrant    false    197                       0    0    COLUMN file_managed.filename    COMMENT     �   COMMENT ON COLUMN file_managed.filename IS 'Name of the file with no path components. This may differ from the basename of the URI if the file is renamed to avoid overwriting an existing file.';
            public       vagrant    false    197                       0    0    COLUMN file_managed.uri    COMMENT     ^   COMMENT ON COLUMN file_managed.uri IS 'The URI to access the file (either local or remote).';
            public       vagrant    false    197                       0    0    COLUMN file_managed.filemime    COMMENT     E   COMMENT ON COLUMN file_managed.filemime IS 'The file''s MIME type.';
            public       vagrant    false    197                       0    0    COLUMN file_managed.filesize    COMMENT     M   COMMENT ON COLUMN file_managed.filesize IS 'The size of the file in bytes.';
            public       vagrant    false    197                       0    0    COLUMN file_managed.status    COMMENT     �   COMMENT ON COLUMN file_managed.status IS 'A field indicating the status of the file. Two status are defined in core: temporary (0) and permanent (1). Temporary files older than DRUPAL_MAXIMUM_TEMP_FILE_AGE will be removed during a cron run.';
            public       vagrant    false    197                       0    0    COLUMN file_managed."timestamp"    COMMENT     ]   COMMENT ON COLUMN file_managed."timestamp" IS 'UNIX timestamp for when the file was added.';
            public       vagrant    false    197            �            1259    32972    file_managed_fid_seq    SEQUENCE     v   CREATE SEQUENCE file_managed_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.file_managed_fid_seq;
       public       vagrant    false    197    6                        0    0    file_managed_fid_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE file_managed_fid_seq OWNED BY file_managed.fid;
            public       vagrant    false    196            �            1259    32999 
   file_usage    TABLE     �  CREATE TABLE file_usage (
    fid bigint NOT NULL,
    module character varying(255) DEFAULT ''::character varying NOT NULL,
    type character varying(64) DEFAULT ''::character varying NOT NULL,
    id bigint DEFAULT 0 NOT NULL,
    count bigint DEFAULT 0 NOT NULL,
    CONSTRAINT file_usage_count_check CHECK ((count >= 0)),
    CONSTRAINT file_usage_fid_check CHECK ((fid >= 0)),
    CONSTRAINT file_usage_id_check CHECK ((id >= 0))
);
    DROP TABLE public.file_usage;
       public         vagrant    false    6            !           0    0    TABLE file_usage    COMMENT     >   COMMENT ON TABLE file_usage IS 'Track where a file is used.';
            public       vagrant    false    198            "           0    0    COLUMN file_usage.fid    COMMENT     0   COMMENT ON COLUMN file_usage.fid IS 'File ID.';
            public       vagrant    false    198            #           0    0    COLUMN file_usage.module    COMMENT     Y   COMMENT ON COLUMN file_usage.module IS 'The name of the module that is using the file.';
            public       vagrant    false    198            $           0    0    COLUMN file_usage.type    COMMENT     _   COMMENT ON COLUMN file_usage.type IS 'The name of the object type in which the file is used.';
            public       vagrant    false    198            %           0    0    COLUMN file_usage.id    COMMENT     T   COMMENT ON COLUMN file_usage.id IS 'The primary key of the object using the file.';
            public       vagrant    false    198            &           0    0    COLUMN file_usage.count    COMMENT     _   COMMENT ON COLUMN file_usage.count IS 'The number of times this file is used by this object.';
            public       vagrant    false    198            �            1259    33400    filter    TABLE     6  CREATE TABLE filter (
    format character varying(255) NOT NULL,
    module character varying(64) DEFAULT ''::character varying NOT NULL,
    name character varying(32) DEFAULT ''::character varying NOT NULL,
    weight integer DEFAULT 0 NOT NULL,
    status integer DEFAULT 0 NOT NULL,
    settings bytea
);
    DROP TABLE public.filter;
       public         vagrant    false    6            '           0    0    TABLE filter    COMMENT     h   COMMENT ON TABLE filter IS 'Table that maps filters (HTML corrector) to text formats (Filtered HTML).';
            public       vagrant    false    230            (           0    0    COLUMN filter.format    COMMENT     n   COMMENT ON COLUMN filter.format IS 'Foreign key: The filter_format.format to which this filter is assigned.';
            public       vagrant    false    230            )           0    0    COLUMN filter.module    COMMENT     G   COMMENT ON COLUMN filter.module IS 'The origin module of the filter.';
            public       vagrant    false    230            *           0    0    COLUMN filter.name    COMMENT     I   COMMENT ON COLUMN filter.name IS 'Name of the filter being referenced.';
            public       vagrant    false    230            +           0    0    COLUMN filter.weight    COMMENT     F   COMMENT ON COLUMN filter.weight IS 'Weight of filter within format.';
            public       vagrant    false    230            ,           0    0    COLUMN filter.status    COMMENT     Y   COMMENT ON COLUMN filter.status IS 'Filter enabled status. (1 = enabled, 0 = disabled)';
            public       vagrant    false    230            -           0    0    COLUMN filter.settings    COMMENT     �   COMMENT ON COLUMN filter.settings IS 'A serialized array of name value pairs that store the filter settings for the specific format.';
            public       vagrant    false    230            �            1259    33413    filter_format    TABLE     I  CREATE TABLE filter_format (
    format character varying(255) NOT NULL,
    name character varying(255) DEFAULT ''::character varying NOT NULL,
    cache smallint DEFAULT 0 NOT NULL,
    status integer DEFAULT 1 NOT NULL,
    weight integer DEFAULT 0 NOT NULL,
    CONSTRAINT filter_format_status_check CHECK ((status >= 0))
);
 !   DROP TABLE public.filter_format;
       public         vagrant    false    6            .           0    0    TABLE filter_format    COMMENT     n   COMMENT ON TABLE filter_format IS 'Stores text formats: custom groupings of filters, such as Filtered HTML.';
            public       vagrant    false    231            /           0    0    COLUMN filter_format.format    COMMENT     ]   COMMENT ON COLUMN filter_format.format IS 'Primary Key: Unique machine name of the format.';
            public       vagrant    false    231            0           0    0    COLUMN filter_format.name    COMMENT     T   COMMENT ON COLUMN filter_format.name IS 'Name of the text format (Filtered HTML).';
            public       vagrant    false    231            1           0    0    COLUMN filter_format.cache    COMMENT     }   COMMENT ON COLUMN filter_format.cache IS 'Flag to indicate whether format is cacheable. (1 = cacheable, 0 = not cacheable)';
            public       vagrant    false    231            2           0    0    COLUMN filter_format.status    COMMENT     h   COMMENT ON COLUMN filter_format.status IS 'The status of the text format. (1 = enabled, 0 = disabled)';
            public       vagrant    false    231            3           0    0    COLUMN filter_format.weight    COMMENT     X   COMMENT ON COLUMN filter_format.weight IS 'Weight of text format to use when listing.';
            public       vagrant    false    231            �            1259    33016    flood    TABLE       CREATE TABLE flood (
    fid integer NOT NULL,
    event character varying(64) DEFAULT ''::character varying NOT NULL,
    identifier character varying(128) DEFAULT ''::character varying NOT NULL,
    "timestamp" integer DEFAULT 0 NOT NULL,
    expiration integer DEFAULT 0 NOT NULL
);
    DROP TABLE public.flood;
       public         vagrant    false    6            4           0    0    TABLE flood    COMMENT     m   COMMENT ON TABLE flood IS 'Flood controls the threshold of events, such as the number of contact attempts.';
            public       vagrant    false    200            5           0    0    COLUMN flood.fid    COMMENT     9   COMMENT ON COLUMN flood.fid IS 'Unique flood event ID.';
            public       vagrant    false    200            6           0    0    COLUMN flood.event    COMMENT     B   COMMENT ON COLUMN flood.event IS 'Name of event (e.g. contact).';
            public       vagrant    false    200            7           0    0    COLUMN flood.identifier    COMMENT     g   COMMENT ON COLUMN flood.identifier IS 'Identifier of the visitor, such as an IP address or hostname.';
            public       vagrant    false    200            8           0    0    COLUMN flood."timestamp"    COMMENT     B   COMMENT ON COLUMN flood."timestamp" IS 'Timestamp of the event.';
            public       vagrant    false    200            9           0    0    COLUMN flood.expiration    COMMENT     f   COMMENT ON COLUMN flood.expiration IS 'Expiration timestamp. Expired events are purged on cron run.';
            public       vagrant    false    200            �            1259    33014    flood_fid_seq    SEQUENCE     o   CREATE SEQUENCE flood_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.flood_fid_seq;
       public       vagrant    false    200    6            :           0    0    flood_fid_seq    SEQUENCE OWNED BY     1   ALTER SEQUENCE flood_fid_seq OWNED BY flood.fid;
            public       vagrant    false    199            �            1259    33390    history    TABLE     �   CREATE TABLE history (
    uid integer DEFAULT 0 NOT NULL,
    nid bigint DEFAULT 0 NOT NULL,
    "timestamp" integer DEFAULT 0 NOT NULL,
    CONSTRAINT history_nid_check CHECK ((nid >= 0))
);
    DROP TABLE public.history;
       public         vagrant    false    6            ;           0    0    TABLE history    COMMENT     N   COMMENT ON TABLE history IS 'A record of which users have read which nodes.';
            public       vagrant    false    229            <           0    0    COLUMN history.uid    COMMENT     J   COMMENT ON COLUMN history.uid IS 'The users.uid that read the node nid.';
            public       vagrant    false    229            =           0    0    COLUMN history.nid    COMMENT     @   COMMENT ON COLUMN history.nid IS 'The node.nid that was read.';
            public       vagrant    false    229            >           0    0    COLUMN history."timestamp"    COMMENT     [   COMMENT ON COLUMN history."timestamp" IS 'The Unix timestamp at which the read occurred.';
            public       vagrant    false    229                       1259    33723    image_effects    TABLE     B  CREATE TABLE image_effects (
    ieid integer NOT NULL,
    isid bigint DEFAULT 0 NOT NULL,
    weight integer DEFAULT 0 NOT NULL,
    name character varying(255) NOT NULL,
    data bytea NOT NULL,
    CONSTRAINT image_effects_ieid_check CHECK ((ieid >= 0)),
    CONSTRAINT image_effects_isid_check CHECK ((isid >= 0))
);
 !   DROP TABLE public.image_effects;
       public         vagrant    false    6            ?           0    0    TABLE image_effects    COMMENT     U   COMMENT ON TABLE image_effects IS 'Stores configuration options for image effects.';
            public       vagrant    false    259            @           0    0    COLUMN image_effects.ieid    COMMENT     W   COMMENT ON COLUMN image_effects.ieid IS 'The primary identifier for an image effect.';
            public       vagrant    false    259            A           0    0    COLUMN image_effects.isid    COMMENT     U   COMMENT ON COLUMN image_effects.isid IS 'The image_styles.isid for an image style.';
            public       vagrant    false    259            B           0    0    COLUMN image_effects.weight    COMMENT     T   COMMENT ON COLUMN image_effects.weight IS 'The weight of the effect in the style.';
            public       vagrant    false    259            C           0    0    COLUMN image_effects.name    COMMENT     Y   COMMENT ON COLUMN image_effects.name IS 'The unique name of the effect to be executed.';
            public       vagrant    false    259            D           0    0    COLUMN image_effects.data    COMMENT     R   COMMENT ON COLUMN image_effects.data IS 'The configuration data for the effect.';
            public       vagrant    false    259                       1259    33721    image_effects_ieid_seq    SEQUENCE     x   CREATE SEQUENCE image_effects_ieid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.image_effects_ieid_seq;
       public       vagrant    false    259    6            E           0    0    image_effects_ieid_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE image_effects_ieid_seq OWNED BY image_effects.ieid;
            public       vagrant    false    258                       1259    33708    image_styles    TABLE     �   CREATE TABLE image_styles (
    isid integer NOT NULL,
    name character varying(255) NOT NULL,
    label character varying(255) DEFAULT ''::character varying NOT NULL,
    CONSTRAINT image_styles_isid_check CHECK ((isid >= 0))
);
     DROP TABLE public.image_styles;
       public         vagrant    false    6            F           0    0    TABLE image_styles    COMMENT     S   COMMENT ON TABLE image_styles IS 'Stores configuration options for image styles.';
            public       vagrant    false    257            G           0    0    COLUMN image_styles.isid    COMMENT     U   COMMENT ON COLUMN image_styles.isid IS 'The primary identifier for an image style.';
            public       vagrant    false    257            H           0    0    COLUMN image_styles.name    COMMENT     B   COMMENT ON COLUMN image_styles.name IS 'The style machine name.';
            public       vagrant    false    257            I           0    0    COLUMN image_styles.label    COMMENT     J   COMMENT ON COLUMN image_styles.label IS 'The style administrative name.';
            public       vagrant    false    257                        1259    33706    image_styles_isid_seq    SEQUENCE     w   CREATE SEQUENCE image_styles_isid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.image_styles_isid_seq;
       public       vagrant    false    6    257            J           0    0    image_styles_isid_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE image_styles_isid_seq OWNED BY image_styles.isid;
            public       vagrant    false    256                       1259    33740    menu_custom    TABLE     �   CREATE TABLE menu_custom (
    menu_name character varying(32) DEFAULT ''::character varying NOT NULL,
    title character varying(255) DEFAULT ''::character varying NOT NULL,
    description text
);
    DROP TABLE public.menu_custom;
       public         vagrant    false    6            K           0    0    TABLE menu_custom    COMMENT     j   COMMENT ON TABLE menu_custom IS 'Holds definitions for top-level custom menus (for example, Main menu).';
            public       vagrant    false    260            L           0    0    COLUMN menu_custom.menu_name    COMMENT        COMMENT ON COLUMN menu_custom.menu_name IS 'Primary Key: Unique key for menu. This is used as a block delta so length is 32.';
            public       vagrant    false    260            M           0    0    COLUMN menu_custom.title    COMMENT     Q   COMMENT ON COLUMN menu_custom.title IS 'Menu title; displayed at top of block.';
            public       vagrant    false    260            N           0    0    COLUMN menu_custom.description    COMMENT     B   COMMENT ON COLUMN menu_custom.description IS 'Menu description.';
            public       vagrant    false    260            �            1259    33058 
   menu_links    TABLE     �  CREATE TABLE menu_links (
    menu_name character varying(32) DEFAULT ''::character varying NOT NULL,
    mlid integer NOT NULL,
    plid bigint DEFAULT 0 NOT NULL,
    link_path character varying(255) DEFAULT ''::character varying NOT NULL,
    router_path character varying(255) DEFAULT ''::character varying NOT NULL,
    link_title character varying(255) DEFAULT ''::character varying NOT NULL,
    options bytea,
    module character varying(255) DEFAULT 'system'::character varying NOT NULL,
    hidden smallint DEFAULT 0 NOT NULL,
    external smallint DEFAULT 0 NOT NULL,
    has_children smallint DEFAULT 0 NOT NULL,
    expanded smallint DEFAULT 0 NOT NULL,
    weight integer DEFAULT 0 NOT NULL,
    depth smallint DEFAULT 0 NOT NULL,
    customized smallint DEFAULT 0 NOT NULL,
    p1 bigint DEFAULT 0 NOT NULL,
    p2 bigint DEFAULT 0 NOT NULL,
    p3 bigint DEFAULT 0 NOT NULL,
    p4 bigint DEFAULT 0 NOT NULL,
    p5 bigint DEFAULT 0 NOT NULL,
    p6 bigint DEFAULT 0 NOT NULL,
    p7 bigint DEFAULT 0 NOT NULL,
    p8 bigint DEFAULT 0 NOT NULL,
    p9 bigint DEFAULT 0 NOT NULL,
    updated smallint DEFAULT 0 NOT NULL,
    CONSTRAINT menu_links_mlid_check CHECK ((mlid >= 0)),
    CONSTRAINT menu_links_p1_check CHECK ((p1 >= 0)),
    CONSTRAINT menu_links_p2_check CHECK ((p2 >= 0)),
    CONSTRAINT menu_links_p3_check CHECK ((p3 >= 0)),
    CONSTRAINT menu_links_p4_check CHECK ((p4 >= 0)),
    CONSTRAINT menu_links_p5_check CHECK ((p5 >= 0)),
    CONSTRAINT menu_links_p6_check CHECK ((p6 >= 0)),
    CONSTRAINT menu_links_p7_check CHECK ((p7 >= 0)),
    CONSTRAINT menu_links_p8_check CHECK ((p8 >= 0)),
    CONSTRAINT menu_links_p9_check CHECK ((p9 >= 0)),
    CONSTRAINT menu_links_plid_check CHECK ((plid >= 0))
);
    DROP TABLE public.menu_links;
       public         vagrant    false    6            O           0    0    TABLE menu_links    COMMENT     O   COMMENT ON TABLE menu_links IS 'Contains the individual links within a menu.';
            public       vagrant    false    203            P           0    0    COLUMN menu_links.menu_name    COMMENT     �   COMMENT ON COLUMN menu_links.menu_name IS 'The menu name. All links with the same menu name (such as ''navigation'') are part of the same menu.';
            public       vagrant    false    203            Q           0    0    COLUMN menu_links.mlid    COMMENT     \   COMMENT ON COLUMN menu_links.mlid IS 'The menu link ID (mlid) is the integer primary key.';
            public       vagrant    false    203            R           0    0    COLUMN menu_links.plid    COMMENT     �   COMMENT ON COLUMN menu_links.plid IS 'The parent link ID (plid) is the mlid of the link above in the hierarchy, or zero if the link is at the top level in its menu.';
            public       vagrant    false    203            S           0    0    COLUMN menu_links.link_path    COMMENT     c   COMMENT ON COLUMN menu_links.link_path IS 'The Drupal path or external path this link points to.';
            public       vagrant    false    203            T           0    0    COLUMN menu_links.router_path    COMMENT     �   COMMENT ON COLUMN menu_links.router_path IS 'For links corresponding to a Drupal path (external = 0), this connects the link to a menu_router.path for joins.';
            public       vagrant    false    203            U           0    0    COLUMN menu_links.link_title    COMMENT     �   COMMENT ON COLUMN menu_links.link_title IS 'The text displayed for the link, which may be modified by a title callback stored in menu_router.';
            public       vagrant    false    203            V           0    0    COLUMN menu_links.options    COMMENT     �   COMMENT ON COLUMN menu_links.options IS 'A serialized array of options to be passed to the url() or l() function, such as a query string or HTML attributes.';
            public       vagrant    false    203            W           0    0    COLUMN menu_links.module    COMMENT     [   COMMENT ON COLUMN menu_links.module IS 'The name of the module that generated this link.';
            public       vagrant    false    203            X           0    0    COLUMN menu_links.hidden    COMMENT     �   COMMENT ON COLUMN menu_links.hidden IS 'A flag for whether the link should be rendered in menus. (1 = a disabled menu item that may be shown on admin screens, -1 = a menu callback, 0 = a normal, visible link)';
            public       vagrant    false    203            Y           0    0    COLUMN menu_links.external    COMMENT     �   COMMENT ON COLUMN menu_links.external IS 'A flag to indicate if the link points to a full URL starting with a protocol,::text like http:// (1 = external, 0 = internal).';
            public       vagrant    false    203            Z           0    0    COLUMN menu_links.has_children    COMMENT     �   COMMENT ON COLUMN menu_links.has_children IS 'Flag indicating whether any links have this link as a parent (1 = children exist, 0 = no children).';
            public       vagrant    false    203            [           0    0    COLUMN menu_links.expanded    COMMENT     �   COMMENT ON COLUMN menu_links.expanded IS 'Flag for whether this link should be rendered as expanded in menus - expanded links always have their child links displayed, instead of only when the link is in the active trail (1 = expanded, 0 = not expanded)';
            public       vagrant    false    203            \           0    0    COLUMN menu_links.weight    COMMENT     f   COMMENT ON COLUMN menu_links.weight IS 'Link weight among links in the same menu at the same depth.';
            public       vagrant    false    203            ]           0    0    COLUMN menu_links.depth    COMMENT     z   COMMENT ON COLUMN menu_links.depth IS 'The depth relative to the top level. A link with plid == 0 will have depth == 1.';
            public       vagrant    false    203            ^           0    0    COLUMN menu_links.customized    COMMENT     �   COMMENT ON COLUMN menu_links.customized IS 'A flag to indicate that the user has manually created or edited the link (1 = customized, 0 = not customized).';
            public       vagrant    false    203            _           0    0    COLUMN menu_links.p1    COMMENT       COMMENT ON COLUMN menu_links.p1 IS 'The first mlid in the materialized path. If N = depth, then pN must equal the mlid. If depth > 1 then p(N-1) must equal the plid. All pX where X > depth must equal zero. The columns p1 .. p9 are also called the parents.';
            public       vagrant    false    203            `           0    0    COLUMN menu_links.p2    COMMENT     X   COMMENT ON COLUMN menu_links.p2 IS 'The second mlid in the materialized path. See p1.';
            public       vagrant    false    203            a           0    0    COLUMN menu_links.p3    COMMENT     W   COMMENT ON COLUMN menu_links.p3 IS 'The third mlid in the materialized path. See p1.';
            public       vagrant    false    203            b           0    0    COLUMN menu_links.p4    COMMENT     X   COMMENT ON COLUMN menu_links.p4 IS 'The fourth mlid in the materialized path. See p1.';
            public       vagrant    false    203            c           0    0    COLUMN menu_links.p5    COMMENT     W   COMMENT ON COLUMN menu_links.p5 IS 'The fifth mlid in the materialized path. See p1.';
            public       vagrant    false    203            d           0    0    COLUMN menu_links.p6    COMMENT     W   COMMENT ON COLUMN menu_links.p6 IS 'The sixth mlid in the materialized path. See p1.';
            public       vagrant    false    203            e           0    0    COLUMN menu_links.p7    COMMENT     Y   COMMENT ON COLUMN menu_links.p7 IS 'The seventh mlid in the materialized path. See p1.';
            public       vagrant    false    203            f           0    0    COLUMN menu_links.p8    COMMENT     X   COMMENT ON COLUMN menu_links.p8 IS 'The eighth mlid in the materialized path. See p1.';
            public       vagrant    false    203            g           0    0    COLUMN menu_links.p9    COMMENT     W   COMMENT ON COLUMN menu_links.p9 IS 'The ninth mlid in the materialized path. See p1.';
            public       vagrant    false    203            h           0    0    COLUMN menu_links.updated    COMMENT     }   COMMENT ON COLUMN menu_links.updated IS 'Flag that indicates that this link was generated during the update from Drupal 5.';
            public       vagrant    false    203            �            1259    33056    menu_links_mlid_seq    SEQUENCE     u   CREATE SEQUENCE menu_links_mlid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.menu_links_mlid_seq;
       public       vagrant    false    6    203            i           0    0    menu_links_mlid_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE menu_links_mlid_seq OWNED BY menu_links.mlid;
            public       vagrant    false    202            �            1259    33028    menu_router    TABLE     S  CREATE TABLE menu_router (
    path character varying(255) DEFAULT ''::character varying NOT NULL,
    load_functions bytea NOT NULL,
    to_arg_functions bytea NOT NULL,
    access_callback character varying(255) DEFAULT ''::character varying NOT NULL,
    access_arguments bytea,
    page_callback character varying(255) DEFAULT ''::character varying NOT NULL,
    page_arguments bytea,
    delivery_callback character varying(255) DEFAULT ''::character varying NOT NULL,
    fit integer DEFAULT 0 NOT NULL,
    number_parts smallint DEFAULT 0 NOT NULL,
    context integer DEFAULT 0 NOT NULL,
    tab_parent character varying(255) DEFAULT ''::character varying NOT NULL,
    tab_root character varying(255) DEFAULT ''::character varying NOT NULL,
    title character varying(255) DEFAULT ''::character varying NOT NULL,
    title_callback character varying(255) DEFAULT ''::character varying NOT NULL,
    title_arguments character varying(255) DEFAULT ''::character varying NOT NULL,
    theme_callback character varying(255) DEFAULT ''::character varying NOT NULL,
    theme_arguments character varying(255) DEFAULT ''::character varying NOT NULL,
    type integer DEFAULT 0 NOT NULL,
    description text NOT NULL,
    "position" character varying(255) DEFAULT ''::character varying NOT NULL,
    weight integer DEFAULT 0 NOT NULL,
    include_file text
);
    DROP TABLE public.menu_router;
       public         vagrant    false    6            j           0    0    TABLE menu_router    COMMENT     \   COMMENT ON TABLE menu_router IS 'Maps paths to various callbacks (access, page and title)';
            public       vagrant    false    201            k           0    0    COLUMN menu_router.path    COMMENT     [   COMMENT ON COLUMN menu_router.path IS 'Primary Key: the Drupal path this entry describes';
            public       vagrant    false    201            l           0    0 !   COLUMN menu_router.load_functions    COMMENT     �   COMMENT ON COLUMN menu_router.load_functions IS 'A serialized array of function names (like node_load) to be called to load an object corresponding to a part of the current path.';
            public       vagrant    false    201            m           0    0 #   COLUMN menu_router.to_arg_functions    COMMENT     �   COMMENT ON COLUMN menu_router.to_arg_functions IS 'A serialized array of function names (like user_uid_optional_to_arg) to be called to replace a part of the router path with another string.';
            public       vagrant    false    201            n           0    0 "   COLUMN menu_router.access_callback    COMMENT     �   COMMENT ON COLUMN menu_router.access_callback IS 'The callback which determines the access to this router path. Defaults to user_access.';
            public       vagrant    false    201            o           0    0 #   COLUMN menu_router.access_arguments    COMMENT     n   COMMENT ON COLUMN menu_router.access_arguments IS 'A serialized array of arguments for the access callback.';
            public       vagrant    false    201            p           0    0     COLUMN menu_router.page_callback    COMMENT     b   COMMENT ON COLUMN menu_router.page_callback IS 'The name of the function that renders the page.';
            public       vagrant    false    201            q           0    0 !   COLUMN menu_router.page_arguments    COMMENT     j   COMMENT ON COLUMN menu_router.page_arguments IS 'A serialized array of arguments for the page callback.';
            public       vagrant    false    201            r           0    0 $   COLUMN menu_router.delivery_callback    COMMENT     �   COMMENT ON COLUMN menu_router.delivery_callback IS 'The name of the function that sends the result of the page_callback function to the browser.';
            public       vagrant    false    201            s           0    0    COLUMN menu_router.fit    COMMENT     ^   COMMENT ON COLUMN menu_router.fit IS 'A numeric representation of how specific the path is.';
            public       vagrant    false    201            t           0    0    COLUMN menu_router.number_parts    COMMENT     V   COMMENT ON COLUMN menu_router.number_parts IS 'Number of parts in this router path.';
            public       vagrant    false    201            u           0    0    COLUMN menu_router.context    COMMENT     �   COMMENT ON COLUMN menu_router.context IS 'Only for local tasks (tabs) - the context of a local task to control its placement.';
            public       vagrant    false    201            v           0    0    COLUMN menu_router.tab_parent    COMMENT     �   COMMENT ON COLUMN menu_router.tab_parent IS 'Only for local tasks (tabs) - the router path of the parent page (which may also be a local task).';
            public       vagrant    false    201            w           0    0    COLUMN menu_router.tab_root    COMMENT     �   COMMENT ON COLUMN menu_router.tab_root IS 'Router path of the closest non-tab parent page. For pages that are not local tasks, this will be the same as the path.';
            public       vagrant    false    201            x           0    0    COLUMN menu_router.title    COMMENT     |   COMMENT ON COLUMN menu_router.title IS 'The title for the current page, or the title for the tab if this is a local task.';
            public       vagrant    false    201            y           0    0 !   COLUMN menu_router.title_callback    COMMENT     j   COMMENT ON COLUMN menu_router.title_callback IS 'A function which will alter the title. Defaults to t()';
            public       vagrant    false    201            z           0    0 "   COLUMN menu_router.title_arguments    COMMENT     �   COMMENT ON COLUMN menu_router.title_arguments IS 'A serialized array of arguments for the title callback. If empty, the title will be used as the sole argument for the title callback.';
            public       vagrant    false    201            {           0    0 !   COLUMN menu_router.theme_callback    COMMENT     �   COMMENT ON COLUMN menu_router.theme_callback IS 'A function which returns the name of the theme that will be used to render this page. If left empty, the default theme will be used.';
            public       vagrant    false    201            |           0    0 "   COLUMN menu_router.theme_arguments    COMMENT     l   COMMENT ON COLUMN menu_router.theme_arguments IS 'A serialized array of arguments for the theme callback.';
            public       vagrant    false    201            }           0    0    COLUMN menu_router.type    COMMENT     z   COMMENT ON COLUMN menu_router.type IS 'Numeric representation of the type of the menu item,::text like MENU_LOCAL_TASK.';
            public       vagrant    false    201            ~           0    0    COLUMN menu_router.description    COMMENT     L   COMMENT ON COLUMN menu_router.description IS 'A description of this item.';
            public       vagrant    false    201                       0    0    COLUMN menu_router."position"    COMMENT     �   COMMENT ON COLUMN menu_router."position" IS 'The position of the block (left or right) on the system administration page for this item.';
            public       vagrant    false    201            �           0    0    COLUMN menu_router.weight    COMMENT     z   COMMENT ON COLUMN menu_router.weight IS 'Weight of the element. Lighter weights are higher up, heavier weights go down.';
            public       vagrant    false    201            �           0    0    COLUMN menu_router.include_file    COMMENT     �   COMMENT ON COLUMN menu_router.include_file IS 'The file to include for this element, usually the page callback function lives in this file.';
            public       vagrant    false    201            �            1259    33296    node    TABLE       CREATE TABLE node (
    nid integer NOT NULL,
    vid bigint,
    type character varying(32) DEFAULT ''::character varying NOT NULL,
    language character varying(12) DEFAULT ''::character varying NOT NULL,
    title character varying(255) DEFAULT ''::character varying NOT NULL,
    uid integer DEFAULT 0 NOT NULL,
    status integer DEFAULT 1 NOT NULL,
    created integer DEFAULT 0 NOT NULL,
    changed integer DEFAULT 0 NOT NULL,
    comment integer DEFAULT 0 NOT NULL,
    promote integer DEFAULT 0 NOT NULL,
    sticky integer DEFAULT 0 NOT NULL,
    tnid bigint DEFAULT 0 NOT NULL,
    translate integer DEFAULT 0 NOT NULL,
    CONSTRAINT node_nid_check CHECK ((nid >= 0)),
    CONSTRAINT node_tnid_check CHECK ((tnid >= 0)),
    CONSTRAINT node_vid_check CHECK ((vid >= 0))
);
    DROP TABLE public.node;
       public         vagrant    false    6            �           0    0 
   TABLE node    COMMENT     6   COMMENT ON TABLE node IS 'The base table for nodes.';
            public       vagrant    false    223            �           0    0    COLUMN node.nid    COMMENT     D   COMMENT ON COLUMN node.nid IS 'The primary identifier for a node.';
            public       vagrant    false    223            �           0    0    COLUMN node.vid    COMMENT     S   COMMENT ON COLUMN node.vid IS 'The current node_revision.vid version identifier.';
            public       vagrant    false    223            �           0    0    COLUMN node.type    COMMENT     C   COMMENT ON COLUMN node.type IS 'The node_type.type of this node.';
            public       vagrant    false    223            �           0    0    COLUMN node.language    COMMENT     K   COMMENT ON COLUMN node.language IS 'The languages.language of this node.';
            public       vagrant    false    223            �           0    0    COLUMN node.title    COMMENT     d   COMMENT ON COLUMN node.title IS 'The title of this node, always treated as non-markup plain text.';
            public       vagrant    false    223            �           0    0    COLUMN node.uid    COMMENT     q   COMMENT ON COLUMN node.uid IS 'The users.uid that owns this node; initially, this is the user that created it.';
            public       vagrant    false    223            �           0    0    COLUMN node.status    COMMENT     v   COMMENT ON COLUMN node.status IS 'Boolean indicating whether the node is published (visible to non-administrators).';
            public       vagrant    false    223            �           0    0    COLUMN node.created    COMMENT     S   COMMENT ON COLUMN node.created IS 'The Unix timestamp when the node was created.';
            public       vagrant    false    223            �           0    0    COLUMN node.changed    COMMENT     _   COMMENT ON COLUMN node.changed IS 'The Unix timestamp when the node was most recently saved.';
            public       vagrant    false    223            �           0    0    COLUMN node.comment    COMMENT     �   COMMENT ON COLUMN node.comment IS 'Whether comments are allowed on this node: 0 = no, 1 = closed (read only), 2 = open (read/write).';
            public       vagrant    false    223            �           0    0    COLUMN node.promote    COMMENT     p   COMMENT ON COLUMN node.promote IS 'Boolean indicating whether the node should be displayed on the front page.';
            public       vagrant    false    223            �           0    0    COLUMN node.sticky    COMMENT     �   COMMENT ON COLUMN node.sticky IS 'Boolean indicating whether the node should be displayed at the top of lists in which it appears.';
            public       vagrant    false    223            �           0    0    COLUMN node.tnid    COMMENT     �   COMMENT ON COLUMN node.tnid IS 'The translation set id for this node, which equals the node id of the source post in each set.';
            public       vagrant    false    223            �           0    0    COLUMN node.translate    COMMENT     o   COMMENT ON COLUMN node.translate IS 'A boolean indicating whether this translation page needs to be updated.';
            public       vagrant    false    223            �            1259    33329    node_access    TABLE     �  CREATE TABLE node_access (
    nid bigint DEFAULT 0 NOT NULL,
    gid bigint DEFAULT 0 NOT NULL,
    realm character varying(255) DEFAULT ''::character varying NOT NULL,
    grant_view integer DEFAULT 0 NOT NULL,
    grant_update integer DEFAULT 0 NOT NULL,
    grant_delete integer DEFAULT 0 NOT NULL,
    CONSTRAINT node_access_gid_check CHECK ((gid >= 0)),
    CONSTRAINT node_access_grant_delete_check CHECK ((grant_delete >= 0)),
    CONSTRAINT node_access_grant_update_check CHECK ((grant_update >= 0)),
    CONSTRAINT node_access_grant_view_check CHECK ((grant_view >= 0)),
    CONSTRAINT node_access_nid_check CHECK ((nid >= 0))
);
    DROP TABLE public.node_access;
       public         vagrant    false    6            �           0    0    TABLE node_access    COMMENT     �   COMMENT ON TABLE node_access IS 'Identifies which realm/grant pairs a user must possess in order to view, update, or delete specific nodes.';
            public       vagrant    false    224            �           0    0    COLUMN node_access.nid    COMMENT     J   COMMENT ON COLUMN node_access.nid IS 'The node.nid this record affects.';
            public       vagrant    false    224            �           0    0    COLUMN node_access.gid    COMMENT     �   COMMENT ON COLUMN node_access.gid IS 'The grant ID a user must possess in the specified realm to gain this row''s privileges on the node.';
            public       vagrant    false    224            �           0    0    COLUMN node_access.realm    COMMENT     �   COMMENT ON COLUMN node_access.realm IS 'The realm in which the user must possess the grant ID. Each node access node can define one or more realms.';
            public       vagrant    false    224            �           0    0    COLUMN node_access.grant_view    COMMENT        COMMENT ON COLUMN node_access.grant_view IS 'Boolean indicating whether a user with the realm/grant pair can view this node.';
            public       vagrant    false    224            �           0    0    COLUMN node_access.grant_update    COMMENT     �   COMMENT ON COLUMN node_access.grant_update IS 'Boolean indicating whether a user with the realm/grant pair can edit this node.';
            public       vagrant    false    224            �           0    0    COLUMN node_access.grant_delete    COMMENT     �   COMMENT ON COLUMN node_access.grant_delete IS 'Boolean indicating whether a user with the realm/grant pair can delete this node.';
            public       vagrant    false    224            �            1259    33590    node_comment_statistics    TABLE     �  CREATE TABLE node_comment_statistics (
    nid bigint DEFAULT 0 NOT NULL,
    cid integer DEFAULT 0 NOT NULL,
    last_comment_timestamp integer DEFAULT 0 NOT NULL,
    last_comment_name character varying(60),
    last_comment_uid integer DEFAULT 0 NOT NULL,
    comment_count bigint DEFAULT 0 NOT NULL,
    CONSTRAINT node_comment_statistics_comment_count_check CHECK ((comment_count >= 0)),
    CONSTRAINT node_comment_statistics_nid_check CHECK ((nid >= 0))
);
 +   DROP TABLE public.node_comment_statistics;
       public         vagrant    false    6            �           0    0    TABLE node_comment_statistics    COMMENT     �   COMMENT ON TABLE node_comment_statistics IS 'Maintains statistics of node and comments posts to show "new" and "updated" flags.';
            public       vagrant    false    246            �           0    0 "   COLUMN node_comment_statistics.nid    COMMENT     h   COMMENT ON COLUMN node_comment_statistics.nid IS 'The node.nid for which the statistics are compiled.';
            public       vagrant    false    246            �           0    0 "   COLUMN node_comment_statistics.cid    COMMENT     Y   COMMENT ON COLUMN node_comment_statistics.cid IS 'The comment.cid of the last comment.';
            public       vagrant    false    246            �           0    0 5   COLUMN node_comment_statistics.last_comment_timestamp    COMMENT     �   COMMENT ON COLUMN node_comment_statistics.last_comment_timestamp IS 'The Unix timestamp of the last comment that was posted within this node, from comment.changed.';
            public       vagrant    false    246            �           0    0 0   COLUMN node_comment_statistics.last_comment_name    COMMENT     �   COMMENT ON COLUMN node_comment_statistics.last_comment_name IS 'The name of the latest author to post a comment on this node, from comment.name.';
            public       vagrant    false    246            �           0    0 /   COLUMN node_comment_statistics.last_comment_uid    COMMENT     �   COMMENT ON COLUMN node_comment_statistics.last_comment_uid IS 'The user ID of the latest author to post a comment on this node, from comment.uid.';
            public       vagrant    false    246            �           0    0 ,   COLUMN node_comment_statistics.comment_count    COMMENT     i   COMMENT ON COLUMN node_comment_statistics.comment_count IS 'The total number of comments on this node.';
            public       vagrant    false    246            �            1259    33294    node_nid_seq    SEQUENCE     n   CREATE SEQUENCE node_nid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.node_nid_seq;
       public       vagrant    false    223    6            �           0    0    node_nid_seq    SEQUENCE OWNED BY     /   ALTER SEQUENCE node_nid_seq OWNED BY node.nid;
            public       vagrant    false    222            �            1259    33347    node_revision    TABLE        CREATE TABLE node_revision (
    nid bigint DEFAULT 0 NOT NULL,
    vid integer NOT NULL,
    uid integer DEFAULT 0 NOT NULL,
    title character varying(255) DEFAULT ''::character varying NOT NULL,
    log text NOT NULL,
    "timestamp" integer DEFAULT 0 NOT NULL,
    status integer DEFAULT 1 NOT NULL,
    comment integer DEFAULT 0 NOT NULL,
    promote integer DEFAULT 0 NOT NULL,
    sticky integer DEFAULT 0 NOT NULL,
    CONSTRAINT node_revision_nid_check CHECK ((nid >= 0)),
    CONSTRAINT node_revision_vid_check CHECK ((vid >= 0))
);
 !   DROP TABLE public.node_revision;
       public         vagrant    false    6            �           0    0    TABLE node_revision    COMMENT     \   COMMENT ON TABLE node_revision IS 'Stores information about each saved version of a node.';
            public       vagrant    false    226            �           0    0    COLUMN node_revision.nid    COMMENT     L   COMMENT ON COLUMN node_revision.nid IS 'The node this version belongs to.';
            public       vagrant    false    226            �           0    0    COLUMN node_revision.vid    COMMENT     S   COMMENT ON COLUMN node_revision.vid IS 'The primary identifier for this version.';
            public       vagrant    false    226            �           0    0    COLUMN node_revision.uid    COMMENT     S   COMMENT ON COLUMN node_revision.uid IS 'The users.uid that created this version.';
            public       vagrant    false    226            �           0    0    COLUMN node_revision.title    COMMENT     G   COMMENT ON COLUMN node_revision.title IS 'The title of this version.';
            public       vagrant    false    226            �           0    0    COLUMN node_revision.log    COMMENT     `   COMMENT ON COLUMN node_revision.log IS 'The log entry explaining the changes in this version.';
            public       vagrant    false    226            �           0    0     COLUMN node_revision."timestamp"    COMMENT     m   COMMENT ON COLUMN node_revision."timestamp" IS 'A Unix timestamp indicating when this version was created.';
            public       vagrant    false    226            �           0    0    COLUMN node_revision.status    COMMENT     �   COMMENT ON COLUMN node_revision.status IS 'Boolean indicating whether the node (at the time of this revision) is published (visible to non-administrators).';
            public       vagrant    false    226            �           0    0    COLUMN node_revision.comment    COMMENT     �   COMMENT ON COLUMN node_revision.comment IS 'Whether comments are allowed on this node (at the time of this revision): 0 = no, 1 = closed (read only), 2 = open (read/write).';
            public       vagrant    false    226            �           0    0    COLUMN node_revision.promote    COMMENT     �   COMMENT ON COLUMN node_revision.promote IS 'Boolean indicating whether the node (at the time of this revision) should be displayed on the front page.';
            public       vagrant    false    226            �           0    0    COLUMN node_revision.sticky    COMMENT     �   COMMENT ON COLUMN node_revision.sticky IS 'Boolean indicating whether the node (at the time of this revision) should be displayed at the top of lists in which it appears.';
            public       vagrant    false    226            �            1259    33345    node_revision_vid_seq    SEQUENCE     w   CREATE SEQUENCE node_revision_vid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.node_revision_vid_seq;
       public       vagrant    false    226    6            �           0    0    node_revision_vid_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE node_revision_vid_seq OWNED BY node_revision.vid;
            public       vagrant    false    225            �            1259    33368 	   node_type    TABLE     �  CREATE TABLE node_type (
    type character varying(32) NOT NULL,
    name character varying(255) DEFAULT ''::character varying NOT NULL,
    base character varying(255) NOT NULL,
    module character varying(255) NOT NULL,
    description text NOT NULL,
    help text NOT NULL,
    has_title integer NOT NULL,
    title_label character varying(255) DEFAULT ''::character varying NOT NULL,
    custom smallint DEFAULT 0 NOT NULL,
    modified smallint DEFAULT 0 NOT NULL,
    locked smallint DEFAULT 0 NOT NULL,
    disabled smallint DEFAULT 0 NOT NULL,
    orig_type character varying(255) DEFAULT ''::character varying NOT NULL,
    CONSTRAINT node_type_has_title_check CHECK ((has_title >= 0))
);
    DROP TABLE public.node_type;
       public         vagrant    false    6            �           0    0    TABLE node_type    COMMENT     R   COMMENT ON TABLE node_type IS 'Stores information about all defined node types.';
            public       vagrant    false    227            �           0    0    COLUMN node_type.type    COMMENT     O   COMMENT ON COLUMN node_type.type IS 'The machine-readable name of this type.';
            public       vagrant    false    227            �           0    0    COLUMN node_type.name    COMMENT     M   COMMENT ON COLUMN node_type.name IS 'The human-readable name of this type.';
            public       vagrant    false    227            �           0    0    COLUMN node_type.base    COMMENT     t   COMMENT ON COLUMN node_type.base IS 'The base string used to construct callbacks corresponding to this node type.';
            public       vagrant    false    227            �           0    0    COLUMN node_type.module    COMMENT     M   COMMENT ON COLUMN node_type.module IS 'The module defining this node type.';
            public       vagrant    false    227            �           0    0    COLUMN node_type.description    COMMENT     P   COMMENT ON COLUMN node_type.description IS 'A brief description of this type.';
            public       vagrant    false    227            �           0    0    COLUMN node_type.help    COMMENT     m   COMMENT ON COLUMN node_type.help IS 'Help information shown to the user when creating a node of this type.';
            public       vagrant    false    227            �           0    0    COLUMN node_type.has_title    COMMENT     l   COMMENT ON COLUMN node_type.has_title IS 'Boolean indicating whether this type uses the node.title field.';
            public       vagrant    false    227            �           0    0    COLUMN node_type.title_label    COMMENT     h   COMMENT ON COLUMN node_type.title_label IS 'The label displayed for the title field on the edit form.';
            public       vagrant    false    227            �           0    0    COLUMN node_type.custom    COMMENT     �   COMMENT ON COLUMN node_type.custom IS 'A boolean indicating whether this type is defined by a module (FALSE) or by a user via Add content type (TRUE).';
            public       vagrant    false    227            �           0    0    COLUMN node_type.modified    COMMENT     �   COMMENT ON COLUMN node_type.modified IS 'A boolean indicating whether this type has been modified by an administrator; currently not used in any way.';
            public       vagrant    false    227            �           0    0    COLUMN node_type.locked    COMMENT     �   COMMENT ON COLUMN node_type.locked IS 'A boolean indicating whether the administrator can change the machine name of this type.';
            public       vagrant    false    227            �           0    0    COLUMN node_type.disabled    COMMENT     c   COMMENT ON COLUMN node_type.disabled IS 'A boolean indicating whether the node type is disabled.';
            public       vagrant    false    227            �           0    0    COLUMN node_type.orig_type    COMMENT     �   COMMENT ON COLUMN node_type.orig_type IS 'The original machine-readable name of this node type. This may be different from the current type name if the locked field is 0.';
            public       vagrant    false    227            �            1259    33107    queue    TABLE       CREATE TABLE queue (
    item_id integer NOT NULL,
    name character varying(255) DEFAULT ''::character varying NOT NULL,
    data bytea,
    expire integer DEFAULT 0 NOT NULL,
    created integer DEFAULT 0 NOT NULL,
    CONSTRAINT queue_item_id_check CHECK ((item_id >= 0))
);
    DROP TABLE public.queue;
       public         vagrant    false    6            �           0    0    TABLE queue    COMMENT     5   COMMENT ON TABLE queue IS 'Stores items in queues.';
            public       vagrant    false    205            �           0    0    COLUMN queue.item_id    COMMENT     C   COMMENT ON COLUMN queue.item_id IS 'Primary Key: Unique item ID.';
            public       vagrant    false    205            �           0    0    COLUMN queue.name    COMMENT     3   COMMENT ON COLUMN queue.name IS 'The queue name.';
            public       vagrant    false    205            �           0    0    COLUMN queue.data    COMMENT     D   COMMENT ON COLUMN queue.data IS 'The arbitrary data for the item.';
            public       vagrant    false    205            �           0    0    COLUMN queue.expire    COMMENT     Y   COMMENT ON COLUMN queue.expire IS 'Timestamp when the claim lease expires on the item.';
            public       vagrant    false    205            �           0    0    COLUMN queue.created    COMMENT     K   COMMENT ON COLUMN queue.created IS 'Timestamp when the item was created.';
            public       vagrant    false    205            �            1259    33105    queue_item_id_seq    SEQUENCE     s   CREATE SEQUENCE queue_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.queue_item_id_seq;
       public       vagrant    false    205    6            �           0    0    queue_item_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE queue_item_id_seq OWNED BY queue.item_id;
            public       vagrant    false    204                       1259    33781    rdf_mapping    TABLE     �   CREATE TABLE rdf_mapping (
    type character varying(128) NOT NULL,
    bundle character varying(128) NOT NULL,
    mapping bytea
);
    DROP TABLE public.rdf_mapping;
       public         vagrant    false    6            �           0    0    TABLE rdf_mapping    COMMENT     �   COMMENT ON TABLE rdf_mapping IS 'Stores custom RDF mappings for user defined content types or overriden module-defined mappings';
            public       vagrant    false    261            �           0    0    COLUMN rdf_mapping.type    COMMENT     w   COMMENT ON COLUMN rdf_mapping.type IS 'The name of the entity type a mapping applies to (node, user, comment, etc.).';
            public       vagrant    false    261            �           0    0    COLUMN rdf_mapping.bundle    COMMENT     X   COMMENT ON COLUMN rdf_mapping.bundle IS 'The name of the bundle a mapping applies to.';
            public       vagrant    false    261            �           0    0    COLUMN rdf_mapping.mapping    COMMENT     o   COMMENT ON COLUMN rdf_mapping.mapping IS 'The serialized mapping of the bundle type and fields to RDF terms.';
            public       vagrant    false    261            �            1259    33122    registry    TABLE     G  CREATE TABLE registry (
    name character varying(255) DEFAULT ''::character varying NOT NULL,
    type character varying(9) DEFAULT ''::character varying NOT NULL,
    filename character varying(255) NOT NULL,
    module character varying(255) DEFAULT ''::character varying NOT NULL,
    weight integer DEFAULT 0 NOT NULL
);
    DROP TABLE public.registry;
       public         vagrant    false    6            �           0    0    TABLE registry    COMMENT     k   COMMENT ON TABLE registry IS 'Each record is a function, class, or interface name and the file it is in.';
            public       vagrant    false    206            �           0    0    COLUMN registry.name    COMMENT     U   COMMENT ON COLUMN registry.name IS 'The name of the function, class, or interface.';
            public       vagrant    false    206            �           0    0    COLUMN registry.type    COMMENT     M   COMMENT ON COLUMN registry.type IS 'Either function or class or interface.';
            public       vagrant    false    206            �           0    0    COLUMN registry.filename    COMMENT     <   COMMENT ON COLUMN registry.filename IS 'Name of the file.';
            public       vagrant    false    206            �           0    0    COLUMN registry.module    COMMENT     P   COMMENT ON COLUMN registry.module IS 'Name of the module the file belongs to.';
            public       vagrant    false    206            �           0    0    COLUMN registry.weight    COMMENT     �   COMMENT ON COLUMN registry.weight IS 'The order in which this module''s hooks should be invoked relative to other modules. Equal-weighted modules are ordered by name.';
            public       vagrant    false    206            �            1259    33135    registry_file    TABLE     v   CREATE TABLE registry_file (
    filename character varying(255) NOT NULL,
    hash character varying(64) NOT NULL
);
 !   DROP TABLE public.registry_file;
       public         vagrant    false    6            �           0    0    TABLE registry_file    COMMENT     I   COMMENT ON TABLE registry_file IS 'Files parsed to build the registry.';
            public       vagrant    false    207            �           0    0    COLUMN registry_file.filename    COMMENT     A   COMMENT ON COLUMN registry_file.filename IS 'Path to the file.';
            public       vagrant    false    207            �           0    0    COLUMN registry_file.hash    COMMENT     b   COMMENT ON COLUMN registry_file.hash IS 'sha-256 hash of the file''s contents when last parsed.';
            public       vagrant    false    207            �            1259    33238    role    TABLE     �   CREATE TABLE role (
    rid integer NOT NULL,
    name character varying(64) DEFAULT ''::character varying NOT NULL,
    weight integer DEFAULT 0 NOT NULL,
    CONSTRAINT role_rid_check CHECK ((rid >= 0))
);
    DROP TABLE public.role;
       public         vagrant    false    6            �           0    0 
   TABLE role    COMMENT     /   COMMENT ON TABLE role IS 'Stores user roles.';
            public       vagrant    false    219            �           0    0    COLUMN role.rid    COMMENT     >   COMMENT ON COLUMN role.rid IS 'Primary Key: Unique role ID.';
            public       vagrant    false    219            �           0    0    COLUMN role.name    COMMENT     4   COMMENT ON COLUMN role.name IS 'Unique role name.';
            public       vagrant    false    219            �           0    0    COLUMN role.weight    COMMENT     `   COMMENT ON COLUMN role.weight IS 'The weight of this role in listings and the user interface.';
            public       vagrant    false    219            �            1259    33227    role_permission    TABLE       CREATE TABLE role_permission (
    rid bigint NOT NULL,
    permission character varying(128) DEFAULT ''::character varying NOT NULL,
    module character varying(255) DEFAULT ''::character varying NOT NULL,
    CONSTRAINT role_permission_rid_check CHECK ((rid >= 0))
);
 #   DROP TABLE public.role_permission;
       public         vagrant    false    6            �           0    0    TABLE role_permission    COMMENT     V   COMMENT ON TABLE role_permission IS 'Stores the permissions assigned to user roles.';
            public       vagrant    false    217            �           0    0    COLUMN role_permission.rid    COMMENT     C   COMMENT ON COLUMN role_permission.rid IS 'Foreign Key: role.rid.';
            public       vagrant    false    217            �           0    0 !   COLUMN role_permission.permission    COMMENT     n   COMMENT ON COLUMN role_permission.permission IS 'A single permission granted to the role identified by rid.';
            public       vagrant    false    217            �           0    0    COLUMN role_permission.module    COMMENT     T   COMMENT ON COLUMN role_permission.module IS 'The module declaring the permission.';
            public       vagrant    false    217            �            1259    33236    role_rid_seq    SEQUENCE     n   CREATE SEQUENCE role_rid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.role_rid_seq;
       public       vagrant    false    6    219            �           0    0    role_rid_seq    SEQUENCE OWNED BY     /   ALTER SEQUENCE role_rid_seq OWNED BY role.rid;
            public       vagrant    false    218                       1259    33789    search_dataset    TABLE     +  CREATE TABLE search_dataset (
    sid bigint DEFAULT 0 NOT NULL,
    type character varying(16) NOT NULL,
    data text NOT NULL,
    reindex bigint DEFAULT 0 NOT NULL,
    CONSTRAINT search_dataset_reindex_check CHECK ((reindex >= 0)),
    CONSTRAINT search_dataset_sid_check CHECK ((sid >= 0))
);
 "   DROP TABLE public.search_dataset;
       public         vagrant    false    6            �           0    0    TABLE search_dataset    COMMENT     J   COMMENT ON TABLE search_dataset IS 'Stores items that will be searched.';
            public       vagrant    false    262            �           0    0    COLUMN search_dataset.sid    COMMENT     S   COMMENT ON COLUMN search_dataset.sid IS 'Search item ID, e.g. node ID for nodes.';
            public       vagrant    false    262            �           0    0    COLUMN search_dataset.type    COMMENT     E   COMMENT ON COLUMN search_dataset.type IS 'Type of item, e.g. node.';
            public       vagrant    false    262            �           0    0    COLUMN search_dataset.data    COMMENT     Y   COMMENT ON COLUMN search_dataset.data IS 'List of space-separated words from the item.';
            public       vagrant    false    262            �           0    0    COLUMN search_dataset.reindex    COMMENT     M   COMMENT ON COLUMN search_dataset.reindex IS 'Set to force node reindexing.';
            public       vagrant    false    262                       1259    33801    search_index    TABLE     �   CREATE TABLE search_index (
    word character varying(50) DEFAULT ''::character varying NOT NULL,
    sid bigint DEFAULT 0 NOT NULL,
    type character varying(16) NOT NULL,
    score real,
    CONSTRAINT search_index_sid_check CHECK ((sid >= 0))
);
     DROP TABLE public.search_index;
       public         vagrant    false    6            �           0    0    TABLE search_index    COMMENT     b   COMMENT ON TABLE search_index IS 'Stores the search index, associating words, items and scores.';
            public       vagrant    false    263            �           0    0    COLUMN search_index.word    COMMENT     i   COMMENT ON COLUMN search_index.word IS 'The search_total.word that is associated with the search item.';
            public       vagrant    false    263            �           0    0    COLUMN search_index.sid    COMMENT     r   COMMENT ON COLUMN search_index.sid IS 'The search_dataset.sid of the searchable item to which the word belongs.';
            public       vagrant    false    263            �           0    0    COLUMN search_index.type    COMMENT     t   COMMENT ON COLUMN search_index.type IS 'The search_dataset.type of the searchable item to which the word belongs.';
            public       vagrant    false    263            �           0    0    COLUMN search_index.score    COMMENT     g   COMMENT ON COLUMN search_index.score IS 'The numeric score of the word, higher being more important.';
            public       vagrant    false    263            	           1259    33816    search_node_links    TABLE     @  CREATE TABLE search_node_links (
    sid bigint DEFAULT 0 NOT NULL,
    type character varying(16) DEFAULT ''::character varying NOT NULL,
    nid bigint DEFAULT 0 NOT NULL,
    caption text,
    CONSTRAINT search_node_links_nid_check CHECK ((nid >= 0)),
    CONSTRAINT search_node_links_sid_check CHECK ((sid >= 0))
);
 %   DROP TABLE public.search_node_links;
       public         vagrant    false    6            �           0    0    TABLE search_node_links    COMMENT     �   COMMENT ON TABLE search_node_links IS 'Stores items (like nodes) that link to other nodes, used to improve search scores for nodes that are frequently linked to.';
            public       vagrant    false    265            �           0    0    COLUMN search_node_links.sid    COMMENT     }   COMMENT ON COLUMN search_node_links.sid IS 'The search_dataset.sid of the searchable item containing the link to the node.';
            public       vagrant    false    265            �           0    0    COLUMN search_node_links.type    COMMENT        COMMENT ON COLUMN search_node_links.type IS 'The search_dataset.type of the searchable item containing the link to the node.';
            public       vagrant    false    265            �           0    0    COLUMN search_node_links.nid    COMMENT     T   COMMENT ON COLUMN search_node_links.nid IS 'The node.nid that this item links to.';
            public       vagrant    false    265            �           0    0     COLUMN search_node_links.caption    COMMENT     Y   COMMENT ON COLUMN search_node_links.caption IS 'The text used to link to the node.nid.';
            public       vagrant    false    265                       1259    33810    search_total    TABLE     u   CREATE TABLE search_total (
    word character varying(50) DEFAULT ''::character varying NOT NULL,
    count real
);
     DROP TABLE public.search_total;
       public         vagrant    false    6            �           0    0    TABLE search_total    COMMENT     D   COMMENT ON TABLE search_total IS 'Stores search totals for words.';
            public       vagrant    false    264            �           0    0    COLUMN search_total.word    COMMENT     X   COMMENT ON COLUMN search_total.word IS 'Primary Key: Unique word in the search index.';
            public       vagrant    false    264            �           0    0    COLUMN search_total.count    COMMENT     �   COMMENT ON COLUMN search_total.count IS 'The count of the word in the index using Zipf''s law to equalize the probability distribution.';
            public       vagrant    false    264            �            1259    33140 	   semaphore    TABLE     �   CREATE TABLE semaphore (
    name character varying(255) DEFAULT ''::character varying NOT NULL,
    value character varying(255) DEFAULT ''::character varying NOT NULL,
    expire double precision NOT NULL
);
    DROP TABLE public.semaphore;
       public         vagrant    false    6            �           0    0    TABLE semaphore    COMMENT     �   COMMENT ON TABLE semaphore IS 'Table for holding semaphores, locks, flags, etc. that cannot be stored as Drupal variables since they must not be cached.';
            public       vagrant    false    208            �           0    0    COLUMN semaphore.name    COMMENT     A   COMMENT ON COLUMN semaphore.name IS 'Primary Key: Unique name.';
            public       vagrant    false    208            �           0    0    COLUMN semaphore.value    COMMENT     C   COMMENT ON COLUMN semaphore.value IS 'A value for the semaphore.';
            public       vagrant    false    208            �           0    0    COLUMN semaphore.expire    COMMENT     y   COMMENT ON COLUMN semaphore.expire IS 'A Unix timestamp with microseconds indicating when the semaphore should expire.';
            public       vagrant    false    208            �            1259    33154 	   sequences    TABLE     r   CREATE TABLE sequences (
    value integer NOT NULL,
    CONSTRAINT sequences_value_check CHECK ((value >= 0))
);
    DROP TABLE public.sequences;
       public         vagrant    false    6            �           0    0    TABLE sequences    COMMENT     -   COMMENT ON TABLE sequences IS 'Stores IDs.';
            public       vagrant    false    210            �           0    0    COLUMN sequences.value    COMMENT     C   COMMENT ON COLUMN sequences.value IS 'The value of the sequence.';
            public       vagrant    false    210            �            1259    33152    sequences_value_seq    SEQUENCE     u   CREATE SEQUENCE sequences_value_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.sequences_value_seq;
       public       vagrant    false    210    6            �           0    0    sequences_value_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE sequences_value_seq OWNED BY sequences.value;
            public       vagrant    false    209            �            1259    33161    sessions    TABLE     �  CREATE TABLE sessions (
    uid bigint NOT NULL,
    sid character varying(128) NOT NULL,
    ssid character varying(128) DEFAULT ''::character varying NOT NULL,
    hostname character varying(128) DEFAULT ''::character varying NOT NULL,
    "timestamp" integer DEFAULT 0 NOT NULL,
    cache integer DEFAULT 0 NOT NULL,
    session bytea,
    CONSTRAINT sessions_uid_check CHECK ((uid >= 0))
);
    DROP TABLE public.sessions;
       public         vagrant    false    6            �           0    0    TABLE sessions    COMMENT     �   COMMENT ON TABLE sessions IS 'Drupal''s session handlers read and write into the sessions table. Each record represents a user session, either anonymous or authenticated.';
            public       vagrant    false    211            �           0    0    COLUMN sessions.uid    COMMENT     h   COMMENT ON COLUMN sessions.uid IS 'The users.uid corresponding to a session, or 0 for anonymous user.';
            public       vagrant    false    211            �           0    0    COLUMN sessions.sid    COMMENT     i   COMMENT ON COLUMN sessions.sid IS 'A session ID. The value is generated by Drupal''s session handlers.';
            public       vagrant    false    211            �           0    0    COLUMN sessions.ssid    COMMENT     o   COMMENT ON COLUMN sessions.ssid IS 'Secure session ID. The value is generated by Drupal''s session handlers.';
            public       vagrant    false    211            �           0    0    COLUMN sessions.hostname    COMMENT     _   COMMENT ON COLUMN sessions.hostname IS 'The IP address that last used this session ID (sid).';
            public       vagrant    false    211            �           0    0    COLUMN sessions."timestamp"    COMMENT     �   COMMENT ON COLUMN sessions."timestamp" IS 'The Unix timestamp when this session last requested a page. Old records are purged by PHP automatically.';
            public       vagrant    false    211            �           0    0    COLUMN sessions.cache    COMMENT     �   COMMENT ON COLUMN sessions.cache IS 'The time of this user''s last post. This is used when the site has specified a minimum_cache_lifetime. See cache_get().';
            public       vagrant    false    211            �           0    0    COLUMN sessions.session    COMMENT     �   COMMENT ON COLUMN sessions.session IS 'The serialized contents of $_SESSION, an array of name/value pairs that persists across page requests by this session ID. Drupal loads $_SESSION from here at the start of each request and saves it at the end.';
            public       vagrant    false    211            
           1259    33830    shortcut_set    TABLE     �   CREATE TABLE shortcut_set (
    set_name character varying(32) DEFAULT ''::character varying NOT NULL,
    title character varying(255) DEFAULT ''::character varying NOT NULL
);
     DROP TABLE public.shortcut_set;
       public         vagrant    false    6            �           0    0    TABLE shortcut_set    COMMENT     V   COMMENT ON TABLE shortcut_set IS 'Stores information about sets of shortcuts links.';
            public       vagrant    false    266            �           0    0    COLUMN shortcut_set.set_name    COMMENT     }   COMMENT ON COLUMN shortcut_set.set_name IS 'Primary Key: The menu_links.menu_name under which the set''s links are stored.';
            public       vagrant    false    266            �           0    0    COLUMN shortcut_set.title    COMMENT     A   COMMENT ON COLUMN shortcut_set.title IS 'The title of the set.';
            public       vagrant    false    266                       1259    33837    shortcut_set_users    TABLE     �   CREATE TABLE shortcut_set_users (
    uid bigint DEFAULT 0 NOT NULL,
    set_name character varying(32) DEFAULT ''::character varying NOT NULL,
    CONSTRAINT shortcut_set_users_uid_check CHECK ((uid >= 0))
);
 &   DROP TABLE public.shortcut_set_users;
       public         vagrant    false    6            �           0    0    TABLE shortcut_set_users    COMMENT     G   COMMENT ON TABLE shortcut_set_users IS 'Maps users to shortcut sets.';
            public       vagrant    false    267            �           0    0    COLUMN shortcut_set_users.uid    COMMENT     K   COMMENT ON COLUMN shortcut_set_users.uid IS 'The users.uid for this set.';
            public       vagrant    false    267            �           0    0 "   COLUMN shortcut_set_users.set_name    COMMENT     t   COMMENT ON COLUMN shortcut_set_users.set_name IS 'The shortcut_set.set_name that will be displayed for this user.';
            public       vagrant    false    267            �            1259    33177    system    TABLE        CREATE TABLE system (
    filename character varying(255) DEFAULT ''::character varying NOT NULL,
    name character varying(255) DEFAULT ''::character varying NOT NULL,
    type character varying(12) DEFAULT ''::character varying NOT NULL,
    owner character varying(255) DEFAULT ''::character varying NOT NULL,
    status integer DEFAULT 0 NOT NULL,
    bootstrap integer DEFAULT 0 NOT NULL,
    schema_version smallint DEFAULT '-1'::integer NOT NULL,
    weight integer DEFAULT 0 NOT NULL,
    info bytea
);
    DROP TABLE public.system;
       public         vagrant    false    6            �           0    0    TABLE system    COMMENT     �   COMMENT ON TABLE system IS 'A list of all modules, themes, and theme engines that are or have been installed in Drupal''s file system.';
            public       vagrant    false    212            �           0    0    COLUMN system.filename    COMMENT     �   COMMENT ON COLUMN system.filename IS 'The path of the primary file for this item, relative to the Drupal root; e.g. modules/node/node.module.';
            public       vagrant    false    212                        0    0    COLUMN system.name    COMMENT     E   COMMENT ON COLUMN system.name IS 'The name of the item; e.g. node.';
            public       vagrant    false    212                       0    0    COLUMN system.type    COMMENT     a   COMMENT ON COLUMN system.type IS 'The type of the item, either module, theme, or theme_engine.';
            public       vagrant    false    212                       0    0    COLUMN system.owner    COMMENT     a   COMMENT ON COLUMN system.owner IS 'A theme''s ''parent'' . Can be either a theme or an engine.';
            public       vagrant    false    212                       0    0    COLUMN system.status    COMMENT     ^   COMMENT ON COLUMN system.status IS 'Boolean indicating whether or not this item is enabled.';
            public       vagrant    false    212                       0    0    COLUMN system.bootstrap    COMMENT     �   COMMENT ON COLUMN system.bootstrap IS 'Boolean indicating whether this module is loaded during Drupal''s early bootstrapping phase (e.g. even before the page cache is consulted).';
            public       vagrant    false    212                       0    0    COLUMN system.schema_version    COMMENT       COMMENT ON COLUMN system.schema_version IS 'The module''s database schema version number. -1 if the module is not installed (its tables do not exist); 0 or the largest N of the module''s hook_update_N() function that has either been run or existed when the module was first installed.';
            public       vagrant    false    212                       0    0    COLUMN system.weight    COMMENT     �   COMMENT ON COLUMN system.weight IS 'The order in which this module''s hooks should be invoked relative to other modules. Equal-weighted modules are ordered by name.';
            public       vagrant    false    212                       0    0    COLUMN system.info    COMMENT     �   COMMENT ON COLUMN system.info IS 'A serialized array containing information from the module''s .info file; keys can include name, description, package, version, core, dependencies, and php.';
            public       vagrant    false    212            �            1259    33679    taxonomy_index    TABLE     %  CREATE TABLE taxonomy_index (
    nid bigint DEFAULT 0 NOT NULL,
    tid bigint DEFAULT 0 NOT NULL,
    sticky smallint DEFAULT 0,
    created integer DEFAULT 0 NOT NULL,
    CONSTRAINT taxonomy_index_nid_check CHECK ((nid >= 0)),
    CONSTRAINT taxonomy_index_tid_check CHECK ((tid >= 0))
);
 "   DROP TABLE public.taxonomy_index;
       public         vagrant    false    6                       0    0    TABLE taxonomy_index    COMMENT     h   COMMENT ON TABLE taxonomy_index IS 'Maintains denormalized information about node/term relationships.';
            public       vagrant    false    254            	           0    0    COLUMN taxonomy_index.nid    COMMENT     L   COMMENT ON COLUMN taxonomy_index.nid IS 'The node.nid this record tracks.';
            public       vagrant    false    254            
           0    0    COLUMN taxonomy_index.tid    COMMENT     8   COMMENT ON COLUMN taxonomy_index.tid IS 'The term ID.';
            public       vagrant    false    254                       0    0    COLUMN taxonomy_index.sticky    COMMENT     ]   COMMENT ON COLUMN taxonomy_index.sticky IS 'Boolean indicating whether the node is sticky.';
            public       vagrant    false    254                       0    0    COLUMN taxonomy_index.created    COMMENT     ]   COMMENT ON COLUMN taxonomy_index.created IS 'The Unix timestamp when the node was created.';
            public       vagrant    false    254            �            1259    33631    taxonomy_term_data    TABLE     �  CREATE TABLE taxonomy_term_data (
    tid integer NOT NULL,
    vid bigint DEFAULT 0 NOT NULL,
    name character varying(255) DEFAULT ''::character varying NOT NULL,
    description text,
    format character varying(255),
    weight integer DEFAULT 0 NOT NULL,
    CONSTRAINT taxonomy_term_data_tid_check CHECK ((tid >= 0)),
    CONSTRAINT taxonomy_term_data_vid_check CHECK ((vid >= 0))
);
 &   DROP TABLE public.taxonomy_term_data;
       public         vagrant    false    6                       0    0    TABLE taxonomy_term_data    COMMENT     C   COMMENT ON TABLE taxonomy_term_data IS 'Stores term information.';
            public       vagrant    false    250                       0    0    COLUMN taxonomy_term_data.tid    COMMENT     L   COMMENT ON COLUMN taxonomy_term_data.tid IS 'Primary Key: Unique term ID.';
            public       vagrant    false    250                       0    0    COLUMN taxonomy_term_data.vid    COMMENT     |   COMMENT ON COLUMN taxonomy_term_data.vid IS 'The taxonomy_vocabulary.vid of the vocabulary to which the term is assigned.';
            public       vagrant    false    250                       0    0    COLUMN taxonomy_term_data.name    COMMENT     ?   COMMENT ON COLUMN taxonomy_term_data.name IS 'The term name.';
            public       vagrant    false    250                       0    0 %   COLUMN taxonomy_term_data.description    COMMENT     R   COMMENT ON COLUMN taxonomy_term_data.description IS 'A description of the term.';
            public       vagrant    false    250                       0    0     COLUMN taxonomy_term_data.format    COMMENT     _   COMMENT ON COLUMN taxonomy_term_data.format IS 'The filter_format.format of the description.';
            public       vagrant    false    250                       0    0     COLUMN taxonomy_term_data.weight    COMMENT     f   COMMENT ON COLUMN taxonomy_term_data.weight IS 'The weight of this term in relation to other terms.';
            public       vagrant    false    250            �            1259    33629    taxonomy_term_data_tid_seq    SEQUENCE     |   CREATE SEQUENCE taxonomy_term_data_tid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.taxonomy_term_data_tid_seq;
       public       vagrant    false    6    250                       0    0    taxonomy_term_data_tid_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE taxonomy_term_data_tid_seq OWNED BY taxonomy_term_data.tid;
            public       vagrant    false    249            �            1259    33648    taxonomy_term_hierarchy    TABLE       CREATE TABLE taxonomy_term_hierarchy (
    tid bigint DEFAULT 0 NOT NULL,
    parent bigint DEFAULT 0 NOT NULL,
    CONSTRAINT taxonomy_term_hierarchy_parent_check CHECK ((parent >= 0)),
    CONSTRAINT taxonomy_term_hierarchy_tid_check CHECK ((tid >= 0))
);
 +   DROP TABLE public.taxonomy_term_hierarchy;
       public         vagrant    false    6                       0    0    TABLE taxonomy_term_hierarchy    COMMENT     c   COMMENT ON TABLE taxonomy_term_hierarchy IS 'Stores the hierarchical relationship between terms.';
            public       vagrant    false    251                       0    0 "   COLUMN taxonomy_term_hierarchy.tid    COMMENT     i   COMMENT ON COLUMN taxonomy_term_hierarchy.tid IS 'Primary Key: The taxonomy_term_data.tid of the term.';
            public       vagrant    false    251                       0    0 %   COLUMN taxonomy_term_hierarchy.parent    COMMENT     �   COMMENT ON COLUMN taxonomy_term_hierarchy.parent IS 'Primary Key: The taxonomy_term_data.tid of the term''s parent. 0 indicates no parent.';
            public       vagrant    false    251            �            1259    33660    taxonomy_vocabulary    TABLE       CREATE TABLE taxonomy_vocabulary (
    vid integer NOT NULL,
    name character varying(255) DEFAULT ''::character varying NOT NULL,
    machine_name character varying(255) DEFAULT ''::character varying NOT NULL,
    description text,
    hierarchy integer DEFAULT 0 NOT NULL,
    module character varying(255) DEFAULT ''::character varying NOT NULL,
    weight integer DEFAULT 0 NOT NULL,
    CONSTRAINT taxonomy_vocabulary_hierarchy_check CHECK ((hierarchy >= 0)),
    CONSTRAINT taxonomy_vocabulary_vid_check CHECK ((vid >= 0))
);
 '   DROP TABLE public.taxonomy_vocabulary;
       public         vagrant    false    6                       0    0    TABLE taxonomy_vocabulary    COMMENT     J   COMMENT ON TABLE taxonomy_vocabulary IS 'Stores vocabulary information.';
            public       vagrant    false    253                       0    0    COLUMN taxonomy_vocabulary.vid    COMMENT     S   COMMENT ON COLUMN taxonomy_vocabulary.vid IS 'Primary Key: Unique vocabulary ID.';
            public       vagrant    false    253                       0    0    COLUMN taxonomy_vocabulary.name    COMMENT     I   COMMENT ON COLUMN taxonomy_vocabulary.name IS 'Name of the vocabulary.';
            public       vagrant    false    253                       0    0 '   COLUMN taxonomy_vocabulary.machine_name    COMMENT     V   COMMENT ON COLUMN taxonomy_vocabulary.machine_name IS 'The vocabulary machine name.';
            public       vagrant    false    253                       0    0 &   COLUMN taxonomy_vocabulary.description    COMMENT     W   COMMENT ON COLUMN taxonomy_vocabulary.description IS 'Description of the vocabulary.';
            public       vagrant    false    253                       0    0 $   COLUMN taxonomy_vocabulary.hierarchy    COMMENT     �   COMMENT ON COLUMN taxonomy_vocabulary.hierarchy IS 'The type of hierarchy allowed within the vocabulary. (0 = disabled, 1 = single, 2 = multiple)';
            public       vagrant    false    253                       0    0 !   COLUMN taxonomy_vocabulary.module    COMMENT     \   COMMENT ON COLUMN taxonomy_vocabulary.module IS 'The module which created the vocabulary.';
            public       vagrant    false    253                       0    0 !   COLUMN taxonomy_vocabulary.weight    COMMENT     t   COMMENT ON COLUMN taxonomy_vocabulary.weight IS 'The weight of this vocabulary in relation to other vocabularies.';
            public       vagrant    false    253            �            1259    33658    taxonomy_vocabulary_vid_seq    SEQUENCE     }   CREATE SEQUENCE taxonomy_vocabulary_vid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.taxonomy_vocabulary_vid_seq;
       public       vagrant    false    6    253                        0    0    taxonomy_vocabulary_vid_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE taxonomy_vocabulary_vid_seq OWNED BY taxonomy_vocabulary.vid;
            public       vagrant    false    252            �            1259    33197 	   url_alias    TABLE     J  CREATE TABLE url_alias (
    pid integer NOT NULL,
    source character varying(255) DEFAULT ''::character varying NOT NULL,
    alias character varying(255) DEFAULT ''::character varying NOT NULL,
    language character varying(12) DEFAULT ''::character varying NOT NULL,
    CONSTRAINT url_alias_pid_check CHECK ((pid >= 0))
);
    DROP TABLE public.url_alias;
       public         vagrant    false    6            !           0    0    TABLE url_alias    COMMENT     �   COMMENT ON TABLE url_alias IS 'A list of URL aliases for Drupal paths; a user may visit either the source or destination path.';
            public       vagrant    false    214            "           0    0    COLUMN url_alias.pid    COMMENT     F   COMMENT ON COLUMN url_alias.pid IS 'A unique path alias identifier.';
            public       vagrant    false    214            #           0    0    COLUMN url_alias.source    COMMENT     Z   COMMENT ON COLUMN url_alias.source IS 'The Drupal path this alias is for; e.g. node/12.';
            public       vagrant    false    214            $           0    0    COLUMN url_alias.alias    COMMENT     Z   COMMENT ON COLUMN url_alias.alias IS 'The alias for this path; e.g. title-of-the-story.';
            public       vagrant    false    214            %           0    0    COLUMN url_alias.language    COMMENT     �   COMMENT ON COLUMN url_alias.language IS 'The language this alias is for; if ''und'', the alias will be used for unknown languages. Each Drupal path can have an alias for each supported language.';
            public       vagrant    false    214            �            1259    33195    url_alias_pid_seq    SEQUENCE     s   CREATE SEQUENCE url_alias_pid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.url_alias_pid_seq;
       public       vagrant    false    6    214            &           0    0    url_alias_pid_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE url_alias_pid_seq OWNED BY url_alias.pid;
            public       vagrant    false    213            �            1259    33250    users    TABLE     �  CREATE TABLE users (
    uid bigint DEFAULT 0 NOT NULL,
    name character varying(60) DEFAULT ''::character varying NOT NULL,
    pass character varying(128) DEFAULT ''::character varying NOT NULL,
    mail character varying(254) DEFAULT ''::character varying,
    theme character varying(255) DEFAULT ''::character varying NOT NULL,
    signature character varying(255) DEFAULT ''::character varying NOT NULL,
    signature_format character varying(255),
    created integer DEFAULT 0 NOT NULL,
    access integer DEFAULT 0 NOT NULL,
    login integer DEFAULT 0 NOT NULL,
    status smallint DEFAULT 0 NOT NULL,
    timezone character varying(32),
    language character varying(12) DEFAULT ''::character varying NOT NULL,
    picture integer DEFAULT 0 NOT NULL,
    init character varying(254) DEFAULT ''::character varying,
    data bytea,
    CONSTRAINT users_uid_check CHECK ((uid >= 0))
);
    DROP TABLE public.users;
       public         vagrant    false    6            '           0    0    TABLE users    COMMENT     /   COMMENT ON TABLE users IS 'Stores user data.';
            public       vagrant    false    220            (           0    0    COLUMN users.uid    COMMENT     ?   COMMENT ON COLUMN users.uid IS 'Primary Key: Unique user ID.';
            public       vagrant    false    220            )           0    0    COLUMN users.name    COMMENT     5   COMMENT ON COLUMN users.name IS 'Unique user name.';
            public       vagrant    false    220            *           0    0    COLUMN users.pass    COMMENT     >   COMMENT ON COLUMN users.pass IS 'User''s password (hashed).';
            public       vagrant    false    220            +           0    0    COLUMN users.mail    COMMENT     ;   COMMENT ON COLUMN users.mail IS 'User''s e-mail address.';
            public       vagrant    false    220            ,           0    0    COLUMN users.theme    COMMENT     ;   COMMENT ON COLUMN users.theme IS 'User''s default theme.';
            public       vagrant    false    220            -           0    0    COLUMN users.signature    COMMENT     ;   COMMENT ON COLUMN users.signature IS 'User''s signature.';
            public       vagrant    false    220            .           0    0    COLUMN users.signature_format    COMMENT     Z   COMMENT ON COLUMN users.signature_format IS 'The filter_format.format of the signature.';
            public       vagrant    false    220            /           0    0    COLUMN users.created    COMMENT     K   COMMENT ON COLUMN users.created IS 'Timestamp for when user was created.';
            public       vagrant    false    220            0           0    0    COLUMN users.access    COMMENT     Y   COMMENT ON COLUMN users.access IS 'Timestamp for previous time user accessed the site.';
            public       vagrant    false    220            1           0    0    COLUMN users.login    COMMENT     F   COMMENT ON COLUMN users.login IS 'Timestamp for user''s last login.';
            public       vagrant    false    220            2           0    0    COLUMN users.status    COMMENT     R   COMMENT ON COLUMN users.status IS 'Whether the user is active(1) or blocked(0).';
            public       vagrant    false    220            3           0    0    COLUMN users.timezone    COMMENT     :   COMMENT ON COLUMN users.timezone IS 'User''s time zone.';
            public       vagrant    false    220            4           0    0    COLUMN users.language    COMMENT     A   COMMENT ON COLUMN users.language IS 'User''s default language.';
            public       vagrant    false    220            5           0    0    COLUMN users.picture    COMMENT     X   COMMENT ON COLUMN users.picture IS 'Foreign key: file_managed.fid of user''s picture.';
            public       vagrant    false    220            6           0    0    COLUMN users.init    COMMENT     U   COMMENT ON COLUMN users.init IS 'E-mail address used for initial account creation.';
            public       vagrant    false    220            7           0    0    COLUMN users.data    COMMENT     1  COMMENT ON COLUMN users.data IS 'A serialized array of name value pairs that are related to the user. Any form values posted during user edit are stored and are loaded into the $user object during user_load(). Use of this field is discouraged and it will likely disappear in a future version of Drupal.';
            public       vagrant    false    220            �            1259    33278    users_roles    TABLE     �   CREATE TABLE users_roles (
    uid bigint DEFAULT 0 NOT NULL,
    rid bigint DEFAULT 0 NOT NULL,
    CONSTRAINT users_roles_rid_check CHECK ((rid >= 0)),
    CONSTRAINT users_roles_uid_check CHECK ((uid >= 0))
);
    DROP TABLE public.users_roles;
       public         vagrant    false    6            8           0    0    TABLE users_roles    COMMENT     8   COMMENT ON TABLE users_roles IS 'Maps users to roles.';
            public       vagrant    false    221            9           0    0    COLUMN users_roles.uid    COMMENT     I   COMMENT ON COLUMN users_roles.uid IS 'Primary Key: users.uid for user.';
            public       vagrant    false    221            :           0    0    COLUMN users_roles.rid    COMMENT     H   COMMENT ON COLUMN users_roles.rid IS 'Primary Key: role.rid for role.';
            public       vagrant    false    221            �            1259    32828    variable    TABLE     |   CREATE TABLE variable (
    name character varying(128) DEFAULT ''::character varying NOT NULL,
    value bytea NOT NULL
);
    DROP TABLE public.variable;
       public         vagrant    false    6            ;           0    0    TABLE variable    COMMENT     �   COMMENT ON TABLE variable IS 'Named variable/value pairs created by Drupal core or any other module or theme. All variables are cached in memory at the start of every Drupal request so developers should not be careless about what is stored here.';
            public       vagrant    false    181            <           0    0    COLUMN variable.name    COMMENT     @   COMMENT ON COLUMN variable.name IS 'The name of the variable.';
            public       vagrant    false    181            =           0    0    COLUMN variable.value    COMMENT     B   COMMENT ON COLUMN variable.value IS 'The value of the variable.';
            public       vagrant    false    181            �            1259    33610    watchdog    TABLE     &  CREATE TABLE watchdog (
    wid integer NOT NULL,
    uid integer DEFAULT 0 NOT NULL,
    type character varying(64) DEFAULT ''::character varying NOT NULL,
    message text NOT NULL,
    variables bytea NOT NULL,
    severity integer DEFAULT 0 NOT NULL,
    link character varying(255) DEFAULT ''::character varying,
    location text NOT NULL,
    referer text,
    hostname character varying(128) DEFAULT ''::character varying NOT NULL,
    "timestamp" integer DEFAULT 0 NOT NULL,
    CONSTRAINT watchdog_severity_check CHECK ((severity >= 0))
);
    DROP TABLE public.watchdog;
       public         vagrant    false    6            >           0    0    TABLE watchdog    COMMENT     O   COMMENT ON TABLE watchdog IS 'Table that contains logs of all system events.';
            public       vagrant    false    248            ?           0    0    COLUMN watchdog.wid    COMMENT     L   COMMENT ON COLUMN watchdog.wid IS 'Primary Key: Unique watchdog event ID.';
            public       vagrant    false    248            @           0    0    COLUMN watchdog.uid    COMMENT     X   COMMENT ON COLUMN watchdog.uid IS 'The users.uid of the user who triggered the event.';
            public       vagrant    false    248            A           0    0    COLUMN watchdog.type    COMMENT     c   COMMENT ON COLUMN watchdog.type IS 'Type of log message, for example "user" or "page not found."';
            public       vagrant    false    248            B           0    0    COLUMN watchdog.message    COMMENT     a   COMMENT ON COLUMN watchdog.message IS 'Text of log message to be passed into the t() function.';
            public       vagrant    false    248            C           0    0    COLUMN watchdog.variables    COMMENT     �   COMMENT ON COLUMN watchdog.variables IS 'Serialized array of variables that match the message string and that is passed into the t() function.';
            public       vagrant    false    248            D           0    0    COLUMN watchdog.severity    COMMENT     r   COMMENT ON COLUMN watchdog.severity IS 'The severity level of the event; ranges from 0 (Emergency) to 7 (Debug)';
            public       vagrant    false    248            E           0    0    COLUMN watchdog.link    COMMENT     L   COMMENT ON COLUMN watchdog.link IS 'Link to view the result of the event.';
            public       vagrant    false    248            F           0    0    COLUMN watchdog.location    COMMENT     J   COMMENT ON COLUMN watchdog.location IS 'URL of the origin of the event.';
            public       vagrant    false    248            G           0    0    COLUMN watchdog.referer    COMMENT     @   COMMENT ON COLUMN watchdog.referer IS 'URL of referring page.';
            public       vagrant    false    248            H           0    0    COLUMN watchdog.hostname    COMMENT     X   COMMENT ON COLUMN watchdog.hostname IS 'Hostname of the user who triggered the event.';
            public       vagrant    false    248            I           0    0    COLUMN watchdog."timestamp"    COMMENT     T   COMMENT ON COLUMN watchdog."timestamp" IS 'Unix timestamp of when event occurred.';
            public       vagrant    false    248            �            1259    33608    watchdog_wid_seq    SEQUENCE     r   CREATE SEQUENCE watchdog_wid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.watchdog_wid_seq;
       public       vagrant    false    248    6            J           0    0    watchdog_wid_seq    SEQUENCE OWNED BY     7   ALTER SEQUENCE watchdog_wid_seq OWNED BY watchdog.wid;
            public       vagrant    false    247            �	           2604    33217    aid    DEFAULT     \   ALTER TABLE ONLY authmap ALTER COLUMN aid SET DEFAULT nextval('authmap_aid_seq'::regclass);
 :   ALTER TABLE public.authmap ALTER COLUMN aid DROP DEFAULT;
       public       vagrant    false    216    215    216            h
           2604    33510    bid    DEFAULT     X   ALTER TABLE ONLY block ALTER COLUMN bid SET DEFAULT nextval('block_bid_seq'::regclass);
 8   ALTER TABLE public.block ALTER COLUMN bid DROP DEFAULT;
       public       vagrant    false    238    239    239            t
           2604    33541    bid    DEFAULT     f   ALTER TABLE ONLY block_custom ALTER COLUMN bid SET DEFAULT nextval('block_custom_bid_seq'::regclass);
 ?   ALTER TABLE public.block_custom ALTER COLUMN bid DROP DEFAULT;
       public       vagrant    false    241    242    242            o	           2604    32864    iid    DEFAULT     d   ALTER TABLE ONLY blocked_ips ALTER COLUMN iid SET DEFAULT nextval('blocked_ips_iid_seq'::regclass);
 >   ALTER TABLE public.blocked_ips ALTER COLUMN iid DROP DEFAULT;
       public       vagrant    false    184    185    185            ~
           2604    33569    cid    DEFAULT     \   ALTER TABLE ONLY comment ALTER COLUMN cid SET DEFAULT nextval('comment_cid_seq'::regclass);
 :   ALTER TABLE public.comment ALTER COLUMN cid DROP DEFAULT;
       public       vagrant    false    245    244    245            �	           2604    32960    dfid    DEFAULT     h   ALTER TABLE ONLY date_formats ALTER COLUMN dfid SET DEFAULT nextval('date_formats_dfid_seq'::regclass);
 @   ALTER TABLE public.date_formats ALTER COLUMN dfid DROP DEFAULT;
       public       vagrant    false    193    194    194            V
           2604    33447    id    DEFAULT     d   ALTER TABLE ONLY field_config ALTER COLUMN id SET DEFAULT nextval('field_config_id_seq'::regclass);
 >   ALTER TABLE public.field_config ALTER COLUMN id DROP DEFAULT;
       public       vagrant    false    234    233    234            _
           2604    33474    id    DEFAULT     v   ALTER TABLE ONLY field_config_instance ALTER COLUMN id SET DEFAULT nextval('field_config_instance_id_seq'::regclass);
 G   ALTER TABLE public.field_config_instance ALTER COLUMN id DROP DEFAULT;
       public       vagrant    false    236    235    236            �	           2604    32977    fid    DEFAULT     f   ALTER TABLE ONLY file_managed ALTER COLUMN fid SET DEFAULT nextval('file_managed_fid_seq'::regclass);
 ?   ALTER TABLE public.file_managed ALTER COLUMN fid DROP DEFAULT;
       public       vagrant    false    197    196    197            �	           2604    33019    fid    DEFAULT     X   ALTER TABLE ONLY flood ALTER COLUMN fid SET DEFAULT nextval('flood_fid_seq'::regclass);
 8   ALTER TABLE public.flood ALTER COLUMN fid DROP DEFAULT;
       public       vagrant    false    200    199    200            �
           2604    33726    ieid    DEFAULT     j   ALTER TABLE ONLY image_effects ALTER COLUMN ieid SET DEFAULT nextval('image_effects_ieid_seq'::regclass);
 A   ALTER TABLE public.image_effects ALTER COLUMN ieid DROP DEFAULT;
       public       vagrant    false    258    259    259            �
           2604    33711    isid    DEFAULT     h   ALTER TABLE ONLY image_styles ALTER COLUMN isid SET DEFAULT nextval('image_styles_isid_seq'::regclass);
 @   ALTER TABLE public.image_styles ALTER COLUMN isid DROP DEFAULT;
       public       vagrant    false    257    256    257            �	           2604    33062    mlid    DEFAULT     d   ALTER TABLE ONLY menu_links ALTER COLUMN mlid SET DEFAULT nextval('menu_links_mlid_seq'::regclass);
 >   ALTER TABLE public.menu_links ALTER COLUMN mlid DROP DEFAULT;
       public       vagrant    false    203    202    203            
           2604    33299    nid    DEFAULT     V   ALTER TABLE ONLY node ALTER COLUMN nid SET DEFAULT nextval('node_nid_seq'::regclass);
 7   ALTER TABLE public.node ALTER COLUMN nid DROP DEFAULT;
       public       vagrant    false    223    222    223            3
           2604    33351    vid    DEFAULT     h   ALTER TABLE ONLY node_revision ALTER COLUMN vid SET DEFAULT nextval('node_revision_vid_seq'::regclass);
 @   ALTER TABLE public.node_revision ALTER COLUMN vid DROP DEFAULT;
       public       vagrant    false    226    225    226            �	           2604    33110    item_id    DEFAULT     `   ALTER TABLE ONLY queue ALTER COLUMN item_id SET DEFAULT nextval('queue_item_id_seq'::regclass);
 <   ALTER TABLE public.queue ALTER COLUMN item_id DROP DEFAULT;
       public       vagrant    false    205    204    205            
           2604    33241    rid    DEFAULT     V   ALTER TABLE ONLY role ALTER COLUMN rid SET DEFAULT nextval('role_rid_seq'::regclass);
 7   ALTER TABLE public.role ALTER COLUMN rid DROP DEFAULT;
       public       vagrant    false    218    219    219            �	           2604    33157    value    DEFAULT     d   ALTER TABLE ONLY sequences ALTER COLUMN value SET DEFAULT nextval('sequences_value_seq'::regclass);
 >   ALTER TABLE public.sequences ALTER COLUMN value DROP DEFAULT;
       public       vagrant    false    210    209    210            �
           2604    33634    tid    DEFAULT     r   ALTER TABLE ONLY taxonomy_term_data ALTER COLUMN tid SET DEFAULT nextval('taxonomy_term_data_tid_seq'::regclass);
 E   ALTER TABLE public.taxonomy_term_data ALTER COLUMN tid DROP DEFAULT;
       public       vagrant    false    250    249    250            �
           2604    33663    vid    DEFAULT     t   ALTER TABLE ONLY taxonomy_vocabulary ALTER COLUMN vid SET DEFAULT nextval('taxonomy_vocabulary_vid_seq'::regclass);
 F   ALTER TABLE public.taxonomy_vocabulary ALTER COLUMN vid DROP DEFAULT;
       public       vagrant    false    252    253    253            �	           2604    33200    pid    DEFAULT     `   ALTER TABLE ONLY url_alias ALTER COLUMN pid SET DEFAULT nextval('url_alias_pid_seq'::regclass);
 <   ALTER TABLE public.url_alias ALTER COLUMN pid DROP DEFAULT;
       public       vagrant    false    213    214    214            �
           2604    33613    wid    DEFAULT     ^   ALTER TABLE ONLY watchdog ALTER COLUMN wid SET DEFAULT nextval('watchdog_wid_seq'::regclass);
 ;   ALTER TABLE public.watchdog ALTER COLUMN wid DROP DEFAULT;
       public       vagrant    false    247    248    248            �          0    32837    actions 
   TABLE DATA               B   COPY actions (aid, type, callback, parameters, label) FROM stdin;
    public       vagrant    false    182   �g      �          0    33214    authmap 
   TABLE DATA               6   COPY authmap (aid, uid, authname, module) FROM stdin;
    public       vagrant    false    216   �h      K           0    0    authmap_aid_seq    SEQUENCE SET     7   SELECT pg_catalog.setval('authmap_aid_seq', 1, false);
            public       vagrant    false    215            �          0    32849    batch 
   TABLE DATA               8   COPY batch (bid, token, "timestamp", batch) FROM stdin;
    public       vagrant    false    183   �h                0    33507    block 
   TABLE DATA               t   COPY block (bid, module, delta, theme, status, weight, region, custom, visibility, pages, title, cache) FROM stdin;
    public       vagrant    false    239   �h      L           0    0    block_bid_seq    SEQUENCE SET     5   SELECT pg_catalog.setval('block_bid_seq', 30, true);
            public       vagrant    false    238                      0    33538    block_custom 
   TABLE DATA               8   COPY block_custom (bid, body, info, format) FROM stdin;
    public       vagrant    false    242   `j      M           0    0    block_custom_bid_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('block_custom_bid_seq', 1, false);
            public       vagrant    false    241            �          0    33384    block_node_type 
   TABLE DATA               7   COPY block_node_type (module, delta, type) FROM stdin;
    public       vagrant    false    228   }j                0    33529 
   block_role 
   TABLE DATA               1   COPY block_role (module, delta, rid) FROM stdin;
    public       vagrant    false    240   �j      �          0    32861    blocked_ips 
   TABLE DATA               '   COPY blocked_ips (iid, ip) FROM stdin;
    public       vagrant    false    185   �j      N           0    0    blocked_ips_iid_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('blocked_ips_iid_seq', 1, false);
            public       vagrant    false    184            �          0    32870    cache 
   TABLE DATA               @   COPY cache (cid, data, expire, created, serialized) FROM stdin;
    public       vagrant    false    186   �j                0    33551    cache_block 
   TABLE DATA               F   COPY cache_block (cid, data, expire, created, serialized) FROM stdin;
    public       vagrant    false    243   (�      �          0    32883    cache_bootstrap 
   TABLE DATA               J   COPY cache_bootstrap (cid, data, expire, created, serialized) FROM stdin;
    public       vagrant    false    187   E�      �          0    33486    cache_field 
   TABLE DATA               F   COPY cache_field (cid, data, expire, created, serialized) FROM stdin;
    public       vagrant    false    237   %      �          0    33429    cache_filter 
   TABLE DATA               G   COPY cache_filter (cid, data, expire, created, serialized) FROM stdin;
    public       vagrant    false    232   B      �          0    32896 
   cache_form 
   TABLE DATA               E   COPY cache_form (cid, data, expire, created, serialized) FROM stdin;
    public       vagrant    false    188   _                0    33693    cache_image 
   TABLE DATA               F   COPY cache_image (cid, data, expire, created, serialized) FROM stdin;
    public       vagrant    false    255   |      �          0    32922 
   cache_menu 
   TABLE DATA               E   COPY cache_menu (cid, data, expire, created, serialized) FROM stdin;
    public       vagrant    false    190   �      �          0    32909 
   cache_page 
   TABLE DATA               E   COPY cache_page (cid, data, expire, created, serialized) FROM stdin;
    public       vagrant    false    189   �'      �          0    32935 
   cache_path 
   TABLE DATA               E   COPY cache_path (cid, data, expire, created, serialized) FROM stdin;
    public       vagrant    false    191   �'      &          0    34154    cache_update 
   TABLE DATA               G   COPY cache_update (cid, data, expire, created, serialized) FROM stdin;
    public       vagrant    false    276   �'                0    33566    comment 
   TABLE DATA               �   COPY comment (cid, pid, nid, uid, subject, hostname, created, changed, status, thread, name, mail, homepage, language) FROM stdin;
    public       vagrant    false    245   �C      O           0    0    comment_cid_seq    SEQUENCE SET     7   SELECT pg_catalog.setval('comment_cid_seq', 1, false);
            public       vagrant    false    244            �          0    32967    date_format_locale 
   TABLE DATA               =   COPY date_format_locale (format, type, language) FROM stdin;
    public       vagrant    false    195   �C      �          0    32948    date_format_type 
   TABLE DATA               8   COPY date_format_type (type, title, locked) FROM stdin;
    public       vagrant    false    192   D      �          0    32957    date_formats 
   TABLE DATA               ;   COPY date_formats (dfid, format, type, locked) FROM stdin;
    public       vagrant    false    194   VD      P           0    0    date_formats_dfid_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('date_formats_dfid_seq', 35, true);
            public       vagrant    false    193            �          0    33444    field_config 
   TABLE DATA               �   COPY field_config (id, field_name, type, module, active, storage_type, storage_module, storage_active, locked, data, cardinality, translatable, deleted) FROM stdin;
    public       vagrant    false    234   gE      Q           0    0    field_config_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('field_config_id_seq', 4, true);
            public       vagrant    false    233            �          0    33471    field_config_instance 
   TABLE DATA               f   COPY field_config_instance (id, field_id, field_name, entity_type, bundle, data, deleted) FROM stdin;
    public       vagrant    false    236   �G      R           0    0    field_config_instance_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('field_config_instance_id_seq', 6, true);
            public       vagrant    false    235                       0    33913    field_data_body 
   TABLE DATA               �   COPY field_data_body (entity_type, bundle, deleted, entity_id, revision_id, language, delta, body_value, body_summary, body_format) FROM stdin;
    public       vagrant    false    270   �K                0    33854    field_data_comment_body 
   TABLE DATA               �   COPY field_data_comment_body (entity_type, bundle, deleted, entity_id, revision_id, language, delta, comment_body_value, comment_body_format) FROM stdin;
    public       vagrant    false    268   L      $          0    34042    field_data_field_image 
   TABLE DATA               �   COPY field_data_field_image (entity_type, bundle, deleted, entity_id, revision_id, language, delta, field_image_fid, field_image_alt, field_image_title, field_image_width, field_image_height) FROM stdin;
    public       vagrant    false    274   0L      "          0    33992    field_data_field_tags 
   TABLE DATA                  COPY field_data_field_tags (entity_type, bundle, deleted, entity_id, revision_id, language, delta, field_tags_tid) FROM stdin;
    public       vagrant    false    272   ML      !          0    33935    field_revision_body 
   TABLE DATA               �   COPY field_revision_body (entity_type, bundle, deleted, entity_id, revision_id, language, delta, body_value, body_summary, body_format) FROM stdin;
    public       vagrant    false    271   jL                0    33876    field_revision_comment_body 
   TABLE DATA               �   COPY field_revision_comment_body (entity_type, bundle, deleted, entity_id, revision_id, language, delta, comment_body_value, comment_body_format) FROM stdin;
    public       vagrant    false    269   �L      %          0    34067    field_revision_field_image 
   TABLE DATA               �   COPY field_revision_field_image (entity_type, bundle, deleted, entity_id, revision_id, language, delta, field_image_fid, field_image_alt, field_image_title, field_image_width, field_image_height) FROM stdin;
    public       vagrant    false    275   �L      #          0    34012    field_revision_field_tags 
   TABLE DATA               �   COPY field_revision_field_tags (entity_type, bundle, deleted, entity_id, revision_id, language, delta, field_tags_tid) FROM stdin;
    public       vagrant    false    273   �L      �          0    32974    file_managed 
   TABLE DATA               a   COPY file_managed (fid, uid, filename, uri, filemime, filesize, status, "timestamp") FROM stdin;
    public       vagrant    false    197   �L      S           0    0    file_managed_fid_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('file_managed_fid_seq', 1, false);
            public       vagrant    false    196            �          0    32999 
   file_usage 
   TABLE DATA               ;   COPY file_usage (fid, module, type, id, count) FROM stdin;
    public       vagrant    false    198   �L      �          0    33400    filter 
   TABLE DATA               I   COPY filter (format, module, name, weight, status, settings) FROM stdin;
    public       vagrant    false    230   M      �          0    33413    filter_format 
   TABLE DATA               E   COPY filter_format (format, name, cache, status, weight) FROM stdin;
    public       vagrant    false    231   yN      �          0    33016    flood 
   TABLE DATA               I   COPY flood (fid, event, identifier, "timestamp", expiration) FROM stdin;
    public       vagrant    false    200   �N      T           0    0    flood_fid_seq    SEQUENCE SET     5   SELECT pg_catalog.setval('flood_fid_seq', 1, false);
            public       vagrant    false    199            �          0    33390    history 
   TABLE DATA               1   COPY history (uid, nid, "timestamp") FROM stdin;
    public       vagrant    false    229   �N                0    33723    image_effects 
   TABLE DATA               @   COPY image_effects (ieid, isid, weight, name, data) FROM stdin;
    public       vagrant    false    259   	O      U           0    0    image_effects_ieid_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('image_effects_ieid_seq', 1, false);
            public       vagrant    false    258                      0    33708    image_styles 
   TABLE DATA               2   COPY image_styles (isid, name, label) FROM stdin;
    public       vagrant    false    257   &O      V           0    0    image_styles_isid_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('image_styles_isid_seq', 1, false);
            public       vagrant    false    256                      0    33740    menu_custom 
   TABLE DATA               =   COPY menu_custom (menu_name, title, description) FROM stdin;
    public       vagrant    false    260   CO      �          0    33058 
   menu_links 
   TABLE DATA               �   COPY menu_links (menu_name, mlid, plid, link_path, router_path, link_title, options, module, hidden, external, has_children, expanded, weight, depth, customized, p1, p2, p3, p4, p5, p6, p7, p8, p9, updated) FROM stdin;
    public       vagrant    false    203   ZP      W           0    0    menu_links_mlid_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('menu_links_mlid_seq', 308, true);
            public       vagrant    false    202            �          0    33028    menu_router 
   TABLE DATA               K  COPY menu_router (path, load_functions, to_arg_functions, access_callback, access_arguments, page_callback, page_arguments, delivery_callback, fit, number_parts, context, tab_parent, tab_root, title, title_callback, title_arguments, theme_callback, theme_arguments, type, description, "position", weight, include_file) FROM stdin;
    public       vagrant    false    201   �r      �          0    33296    node 
   TABLE DATA               �   COPY node (nid, vid, type, language, title, uid, status, created, changed, comment, promote, sticky, tnid, translate) FROM stdin;
    public       vagrant    false    223   ��      �          0    33329    node_access 
   TABLE DATA               W   COPY node_access (nid, gid, realm, grant_view, grant_update, grant_delete) FROM stdin;
    public       vagrant    false    224   ��                0    33590    node_comment_statistics 
   TABLE DATA               �   COPY node_comment_statistics (nid, cid, last_comment_timestamp, last_comment_name, last_comment_uid, comment_count) FROM stdin;
    public       vagrant    false    246   ʰ      X           0    0    node_nid_seq    SEQUENCE SET     4   SELECT pg_catalog.setval('node_nid_seq', 1, false);
            public       vagrant    false    222            �          0    33347    node_revision 
   TABLE DATA               j   COPY node_revision (nid, vid, uid, title, log, "timestamp", status, comment, promote, sticky) FROM stdin;
    public       vagrant    false    226   �      Y           0    0    node_revision_vid_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('node_revision_vid_seq', 1, false);
            public       vagrant    false    225            �          0    33368 	   node_type 
   TABLE DATA               �   COPY node_type (type, name, base, module, description, help, has_title, title_label, custom, modified, locked, disabled, orig_type) FROM stdin;
    public       vagrant    false    227   �      �          0    33107    queue 
   TABLE DATA               >   COPY queue (item_id, name, data, expire, created) FROM stdin;
    public       vagrant    false    205   ��      Z           0    0    queue_item_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('queue_item_id_seq', 29, true);
            public       vagrant    false    204                      0    33781    rdf_mapping 
   TABLE DATA               5   COPY rdf_mapping (type, bundle, mapping) FROM stdin;
    public       vagrant    false    261   ޱ      �          0    33122    registry 
   TABLE DATA               A   COPY registry (name, type, filename, module, weight) FROM stdin;
    public       vagrant    false    206   ��      �          0    33135    registry_file 
   TABLE DATA               0   COPY registry_file (filename, hash) FROM stdin;
    public       vagrant    false    207   ��      �          0    33238    role 
   TABLE DATA               *   COPY role (rid, name, weight) FROM stdin;
    public       vagrant    false    219   ��      �          0    33227    role_permission 
   TABLE DATA               ;   COPY role_permission (rid, permission, module) FROM stdin;
    public       vagrant    false    217   *�      [           0    0    role_rid_seq    SEQUENCE SET     3   SELECT pg_catalog.setval('role_rid_seq', 3, true);
            public       vagrant    false    218                      0    33789    search_dataset 
   TABLE DATA               ;   COPY search_dataset (sid, type, data, reindex) FROM stdin;
    public       vagrant    false    262   ��                0    33801    search_index 
   TABLE DATA               7   COPY search_index (word, sid, type, score) FROM stdin;
    public       vagrant    false    263   ��                0    33816    search_node_links 
   TABLE DATA               =   COPY search_node_links (sid, type, nid, caption) FROM stdin;
    public       vagrant    false    265   ��                0    33810    search_total 
   TABLE DATA               ,   COPY search_total (word, count) FROM stdin;
    public       vagrant    false    264   ��      �          0    33140 	   semaphore 
   TABLE DATA               1   COPY semaphore (name, value, expire) FROM stdin;
    public       vagrant    false    208   �      �          0    33154 	   sequences 
   TABLE DATA               #   COPY sequences (value) FROM stdin;
    public       vagrant    false    210   "�      \           0    0    sequences_value_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('sequences_value_seq', 1, true);
            public       vagrant    false    209            �          0    33161    sessions 
   TABLE DATA               R   COPY sessions (uid, sid, ssid, hostname, "timestamp", cache, session) FROM stdin;
    public       vagrant    false    211   ?�                0    33830    shortcut_set 
   TABLE DATA               0   COPY shortcut_set (set_name, title) FROM stdin;
    public       vagrant    false    266   ��                0    33837    shortcut_set_users 
   TABLE DATA               4   COPY shortcut_set_users (uid, set_name) FROM stdin;
    public       vagrant    false    267   ��      �          0    33177    system 
   TABLE DATA               g   COPY system (filename, name, type, owner, status, bootstrap, schema_version, weight, info) FROM stdin;
    public       vagrant    false    212   �                0    33679    taxonomy_index 
   TABLE DATA               <   COPY taxonomy_index (nid, tid, sticky, created) FROM stdin;
    public       vagrant    false    254   �                0    33631    taxonomy_term_data 
   TABLE DATA               R   COPY taxonomy_term_data (tid, vid, name, description, format, weight) FROM stdin;
    public       vagrant    false    250   �      ]           0    0    taxonomy_term_data_tid_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('taxonomy_term_data_tid_seq', 1, false);
            public       vagrant    false    249                      0    33648    taxonomy_term_hierarchy 
   TABLE DATA               7   COPY taxonomy_term_hierarchy (tid, parent) FROM stdin;
    public       vagrant    false    251                   0    33660    taxonomy_vocabulary 
   TABLE DATA               g   COPY taxonomy_vocabulary (vid, name, machine_name, description, hierarchy, module, weight) FROM stdin;
    public       vagrant    false    253   2      ^           0    0    taxonomy_vocabulary_vid_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('taxonomy_vocabulary_vid_seq', 1, true);
            public       vagrant    false    252            �          0    33197 	   url_alias 
   TABLE DATA               :   COPY url_alias (pid, source, alias, language) FROM stdin;
    public       vagrant    false    214   �      _           0    0    url_alias_pid_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('url_alias_pid_seq', 1, false);
            public       vagrant    false    213            �          0    33250    users 
   TABLE DATA               �   COPY users (uid, name, pass, mail, theme, signature, signature_format, created, access, login, status, timezone, language, picture, init, data) FROM stdin;
    public       vagrant    false    220   �      �          0    33278    users_roles 
   TABLE DATA               (   COPY users_roles (uid, rid) FROM stdin;
    public       vagrant    false    221   r      �          0    32828    variable 
   TABLE DATA               (   COPY variable (name, value) FROM stdin;
    public       vagrant    false    181   �      
          0    33610    watchdog 
   TABLE DATA               y   COPY watchdog (wid, uid, type, message, variables, severity, link, location, referer, hostname, "timestamp") FROM stdin;
    public       vagrant    false    248   �      `           0    0    watchdog_wid_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('watchdog_wid_seq', 50, true);
            public       vagrant    false    247                       2606    32848    actions_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY actions
    ADD CONSTRAINT actions_pkey PRIMARY KEY (aid);
 >   ALTER TABLE ONLY public.actions DROP CONSTRAINT actions_pkey;
       public         vagrant    false    182    182            n           2606    33225    authmap_authname_key 
   CONSTRAINT     T   ALTER TABLE ONLY authmap
    ADD CONSTRAINT authmap_authname_key UNIQUE (authname);
 F   ALTER TABLE ONLY public.authmap DROP CONSTRAINT authmap_authname_key;
       public         vagrant    false    216    216            p           2606    33223    authmap_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY authmap
    ADD CONSTRAINT authmap_pkey PRIMARY KEY (aid);
 >   ALTER TABLE ONLY public.authmap DROP CONSTRAINT authmap_pkey;
       public         vagrant    false    216    216                       2606    32857 
   batch_pkey 
   CONSTRAINT     H   ALTER TABLE ONLY batch
    ADD CONSTRAINT batch_pkey PRIMARY KEY (bid);
 :   ALTER TABLE ONLY public.batch DROP CONSTRAINT batch_pkey;
       public         vagrant    false    183    183            �           2606    33550    block_custom_info_key 
   CONSTRAINT     V   ALTER TABLE ONLY block_custom
    ADD CONSTRAINT block_custom_info_key UNIQUE (info);
 L   ALTER TABLE ONLY public.block_custom DROP CONSTRAINT block_custom_info_key;
       public         vagrant    false    242    242            �           2606    33548    block_custom_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY block_custom
    ADD CONSTRAINT block_custom_pkey PRIMARY KEY (bid);
 H   ALTER TABLE ONLY public.block_custom DROP CONSTRAINT block_custom_pkey;
       public         vagrant    false    242    242            �           2606    33388    block_node_type_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY block_node_type
    ADD CONSTRAINT block_node_type_pkey PRIMARY KEY (module, delta, type);
 N   ALTER TABLE ONLY public.block_node_type DROP CONSTRAINT block_node_type_pkey;
       public         vagrant    false    228    228    228    228            �           2606    33525 
   block_pkey 
   CONSTRAINT     H   ALTER TABLE ONLY block
    ADD CONSTRAINT block_pkey PRIMARY KEY (bid);
 :   ALTER TABLE ONLY public.block DROP CONSTRAINT block_pkey;
       public         vagrant    false    239    239            �           2606    33534    block_role_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY block_role
    ADD CONSTRAINT block_role_pkey PRIMARY KEY (module, delta, rid);
 D   ALTER TABLE ONLY public.block_role DROP CONSTRAINT block_role_pkey;
       public         vagrant    false    240    240    240    240            �           2606    33527    block_tmd_key 
   CONSTRAINT     W   ALTER TABLE ONLY block
    ADD CONSTRAINT block_tmd_key UNIQUE (theme, module, delta);
 =   ALTER TABLE ONLY public.block DROP CONSTRAINT block_tmd_key;
       public         vagrant    false    239    239    239    239                       2606    32868    blocked_ips_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY blocked_ips
    ADD CONSTRAINT blocked_ips_pkey PRIMARY KEY (iid);
 F   ALTER TABLE ONLY public.blocked_ips DROP CONSTRAINT blocked_ips_pkey;
       public         vagrant    false    185    185            �           2606    33562    cache_block_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY cache_block
    ADD CONSTRAINT cache_block_pkey PRIMARY KEY (cid);
 F   ALTER TABLE ONLY public.cache_block DROP CONSTRAINT cache_block_pkey;
       public         vagrant    false    243    243                        2606    32894    cache_bootstrap_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY cache_bootstrap
    ADD CONSTRAINT cache_bootstrap_pkey PRIMARY KEY (cid);
 N   ALTER TABLE ONLY public.cache_bootstrap DROP CONSTRAINT cache_bootstrap_pkey;
       public         vagrant    false    187    187            �           2606    33497    cache_field_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY cache_field
    ADD CONSTRAINT cache_field_pkey PRIMARY KEY (cid);
 F   ALTER TABLE ONLY public.cache_field DROP CONSTRAINT cache_field_pkey;
       public         vagrant    false    237    237            �           2606    33440    cache_filter_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY cache_filter
    ADD CONSTRAINT cache_filter_pkey PRIMARY KEY (cid);
 H   ALTER TABLE ONLY public.cache_filter DROP CONSTRAINT cache_filter_pkey;
       public         vagrant    false    232    232            #           2606    32907    cache_form_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY cache_form
    ADD CONSTRAINT cache_form_pkey PRIMARY KEY (cid);
 D   ALTER TABLE ONLY public.cache_form DROP CONSTRAINT cache_form_pkey;
       public         vagrant    false    188    188            �           2606    33704    cache_image_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY cache_image
    ADD CONSTRAINT cache_image_pkey PRIMARY KEY (cid);
 F   ALTER TABLE ONLY public.cache_image DROP CONSTRAINT cache_image_pkey;
       public         vagrant    false    255    255            )           2606    32933    cache_menu_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY cache_menu
    ADD CONSTRAINT cache_menu_pkey PRIMARY KEY (cid);
 D   ALTER TABLE ONLY public.cache_menu DROP CONSTRAINT cache_menu_pkey;
       public         vagrant    false    190    190            &           2606    32920    cache_page_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY cache_page
    ADD CONSTRAINT cache_page_pkey PRIMARY KEY (cid);
 D   ALTER TABLE ONLY public.cache_page DROP CONSTRAINT cache_page_pkey;
       public         vagrant    false    189    189            ,           2606    32946    cache_path_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY cache_path
    ADD CONSTRAINT cache_path_pkey PRIMARY KEY (cid);
 D   ALTER TABLE ONLY public.cache_path DROP CONSTRAINT cache_path_pkey;
       public         vagrant    false    191    191                       2606    32881 
   cache_pkey 
   CONSTRAINT     H   ALTER TABLE ONLY cache
    ADD CONSTRAINT cache_pkey PRIMARY KEY (cid);
 :   ALTER TABLE ONLY public.cache DROP CONSTRAINT cache_pkey;
       public         vagrant    false    186    186            T           2606    34165    cache_update_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY cache_update
    ADD CONSTRAINT cache_update_pkey PRIMARY KEY (cid);
 H   ALTER TABLE ONLY public.cache_update DROP CONSTRAINT cache_update_pkey;
       public         vagrant    false    276    276            �           2606    33584    comment_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY comment
    ADD CONSTRAINT comment_pkey PRIMARY KEY (cid);
 >   ALTER TABLE ONLY public.comment DROP CONSTRAINT comment_pkey;
       public         vagrant    false    245    245            5           2606    32971    date_format_locale_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY date_format_locale
    ADD CONSTRAINT date_format_locale_pkey PRIMARY KEY (type, language);
 T   ALTER TABLE ONLY public.date_format_locale DROP CONSTRAINT date_format_locale_pkey;
       public         vagrant    false    195    195    195            .           2606    32953    date_format_type_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY date_format_type
    ADD CONSTRAINT date_format_type_pkey PRIMARY KEY (type);
 P   ALTER TABLE ONLY public.date_format_type DROP CONSTRAINT date_format_type_pkey;
       public         vagrant    false    192    192            1           2606    32966    date_formats_formats_key 
   CONSTRAINT     a   ALTER TABLE ONLY date_formats
    ADD CONSTRAINT date_formats_formats_key UNIQUE (format, type);
 O   ALTER TABLE ONLY public.date_formats DROP CONSTRAINT date_formats_formats_key;
       public         vagrant    false    194    194    194            3           2606    32964    date_formats_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY date_formats
    ADD CONSTRAINT date_formats_pkey PRIMARY KEY (dfid);
 H   ALTER TABLE ONLY public.date_formats DROP CONSTRAINT date_formats_pkey;
       public         vagrant    false    194    194            �           2606    33483    field_config_instance_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY field_config_instance
    ADD CONSTRAINT field_config_instance_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.field_config_instance DROP CONSTRAINT field_config_instance_pkey;
       public         vagrant    false    236    236            �           2606    33460    field_config_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY field_config
    ADD CONSTRAINT field_config_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.field_config DROP CONSTRAINT field_config_pkey;
       public         vagrant    false    234    234            #           2606    33927    field_data_body_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY field_data_body
    ADD CONSTRAINT field_data_body_pkey PRIMARY KEY (entity_type, entity_id, deleted, delta, language);
 N   ALTER TABLE ONLY public.field_data_body DROP CONSTRAINT field_data_body_pkey;
       public         vagrant    false    270    270    270    270    270    270                       2606    33868    field_data_comment_body_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY field_data_comment_body
    ADD CONSTRAINT field_data_comment_body_pkey PRIMARY KEY (entity_type, entity_id, deleted, delta, language);
 ^   ALTER TABLE ONLY public.field_data_comment_body DROP CONSTRAINT field_data_comment_body_pkey;
       public         vagrant    false    268    268    268    268    268    268            G           2606    34059    field_data_field_image_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY field_data_field_image
    ADD CONSTRAINT field_data_field_image_pkey PRIMARY KEY (entity_type, entity_id, deleted, delta, language);
 \   ALTER TABLE ONLY public.field_data_field_image DROP CONSTRAINT field_data_field_image_pkey;
       public         vagrant    false    274    274    274    274    274    274            5           2606    34004    field_data_field_tags_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY field_data_field_tags
    ADD CONSTRAINT field_data_field_tags_pkey PRIMARY KEY (entity_type, entity_id, deleted, delta, language);
 Z   ALTER TABLE ONLY public.field_data_field_tags DROP CONSTRAINT field_data_field_tags_pkey;
       public         vagrant    false    272    272    272    272    272    272            ,           2606    33949    field_revision_body_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY field_revision_body
    ADD CONSTRAINT field_revision_body_pkey PRIMARY KEY (entity_type, entity_id, revision_id, deleted, delta, language);
 V   ALTER TABLE ONLY public.field_revision_body DROP CONSTRAINT field_revision_body_pkey;
       public         vagrant    false    271    271    271    271    271    271    271                       2606    33890     field_revision_comment_body_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY field_revision_comment_body
    ADD CONSTRAINT field_revision_comment_body_pkey PRIMARY KEY (entity_type, entity_id, revision_id, deleted, delta, language);
 f   ALTER TABLE ONLY public.field_revision_comment_body DROP CONSTRAINT field_revision_comment_body_pkey;
       public         vagrant    false    269    269    269    269    269    269    269            P           2606    34084    field_revision_field_image_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY field_revision_field_image
    ADD CONSTRAINT field_revision_field_image_pkey PRIMARY KEY (entity_type, entity_id, revision_id, deleted, delta, language);
 d   ALTER TABLE ONLY public.field_revision_field_image DROP CONSTRAINT field_revision_field_image_pkey;
       public         vagrant    false    275    275    275    275    275    275    275            >           2606    34024    field_revision_field_tags_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY field_revision_field_tags
    ADD CONSTRAINT field_revision_field_tags_pkey PRIMARY KEY (entity_type, entity_id, revision_id, deleted, delta, language);
 b   ALTER TABLE ONLY public.field_revision_field_tags DROP CONSTRAINT field_revision_field_tags_pkey;
       public         vagrant    false    273    273    273    273    273    273    273            7           2606    32993    file_managed_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY file_managed
    ADD CONSTRAINT file_managed_pkey PRIMARY KEY (fid);
 H   ALTER TABLE ONLY public.file_managed DROP CONSTRAINT file_managed_pkey;
       public         vagrant    false    197    197            <           2606    32995    file_managed_uri_key 
   CONSTRAINT     T   ALTER TABLE ONLY file_managed
    ADD CONSTRAINT file_managed_uri_key UNIQUE (uri);
 K   ALTER TABLE ONLY public.file_managed DROP CONSTRAINT file_managed_uri_key;
       public         vagrant    false    197    197            @           2606    33010    file_usage_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY file_usage
    ADD CONSTRAINT file_usage_pkey PRIMARY KEY (fid, type, id, module);
 D   ALTER TABLE ONLY public.file_usage DROP CONSTRAINT file_usage_pkey;
       public         vagrant    false    198    198    198    198    198            �           2606    33427    filter_format_name_key 
   CONSTRAINT     X   ALTER TABLE ONLY filter_format
    ADD CONSTRAINT filter_format_name_key UNIQUE (name);
 N   ALTER TABLE ONLY public.filter_format DROP CONSTRAINT filter_format_name_key;
       public         vagrant    false    231    231            �           2606    33425    filter_format_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY filter_format
    ADD CONSTRAINT filter_format_pkey PRIMARY KEY (format);
 J   ALTER TABLE ONLY public.filter_format DROP CONSTRAINT filter_format_pkey;
       public         vagrant    false    231    231            �           2606    33411    filter_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY filter
    ADD CONSTRAINT filter_pkey PRIMARY KEY (format, name);
 <   ALTER TABLE ONLY public.filter DROP CONSTRAINT filter_pkey;
       public         vagrant    false    230    230    230            D           2606    33025 
   flood_pkey 
   CONSTRAINT     H   ALTER TABLE ONLY flood
    ADD CONSTRAINT flood_pkey PRIMARY KEY (fid);
 :   ALTER TABLE ONLY public.flood DROP CONSTRAINT flood_pkey;
       public         vagrant    false    200    200            �           2606    33398    history_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY history
    ADD CONSTRAINT history_pkey PRIMARY KEY (uid, nid);
 >   ALTER TABLE ONLY public.history DROP CONSTRAINT history_pkey;
       public         vagrant    false    229    229    229            �           2606    33735    image_effects_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY image_effects
    ADD CONSTRAINT image_effects_pkey PRIMARY KEY (ieid);
 J   ALTER TABLE ONLY public.image_effects DROP CONSTRAINT image_effects_pkey;
       public         vagrant    false    259    259            �           2606    33720    image_styles_name_key 
   CONSTRAINT     V   ALTER TABLE ONLY image_styles
    ADD CONSTRAINT image_styles_name_key UNIQUE (name);
 L   ALTER TABLE ONLY public.image_styles DROP CONSTRAINT image_styles_name_key;
       public         vagrant    false    257    257            �           2606    33718    image_styles_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY image_styles
    ADD CONSTRAINT image_styles_pkey PRIMARY KEY (isid);
 H   ALTER TABLE ONLY public.image_styles DROP CONSTRAINT image_styles_pkey;
       public         vagrant    false    257    257            �           2606    33749    menu_custom_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY menu_custom
    ADD CONSTRAINT menu_custom_pkey PRIMARY KEY (menu_name);
 F   ALTER TABLE ONLY public.menu_custom DROP CONSTRAINT menu_custom_pkey;
       public         vagrant    false    260    260            O           2606    33100    menu_links_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY menu_links
    ADD CONSTRAINT menu_links_pkey PRIMARY KEY (mlid);
 D   ALTER TABLE ONLY public.menu_links DROP CONSTRAINT menu_links_pkey;
       public         vagrant    false    203    203            H           2606    33052    menu_router_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY menu_router
    ADD CONSTRAINT menu_router_pkey PRIMARY KEY (path);
 F   ALTER TABLE ONLY public.menu_router DROP CONSTRAINT menu_router_pkey;
       public         vagrant    false    201    201            �           2606    33344    node_access_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY node_access
    ADD CONSTRAINT node_access_pkey PRIMARY KEY (nid, gid, realm);
 F   ALTER TABLE ONLY public.node_access DROP CONSTRAINT node_access_pkey;
       public         vagrant    false    224    224    224    224            �           2606    33601    node_comment_statistics_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY node_comment_statistics
    ADD CONSTRAINT node_comment_statistics_pkey PRIMARY KEY (nid);
 ^   ALTER TABLE ONLY public.node_comment_statistics DROP CONSTRAINT node_comment_statistics_pkey;
       public         vagrant    false    246    246            �           2606    33316 	   node_pkey 
   CONSTRAINT     F   ALTER TABLE ONLY node
    ADD CONSTRAINT node_pkey PRIMARY KEY (nid);
 8   ALTER TABLE ONLY public.node DROP CONSTRAINT node_pkey;
       public         vagrant    false    223    223            �           2606    33365    node_revision_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY node_revision
    ADD CONSTRAINT node_revision_pkey PRIMARY KEY (vid);
 J   ALTER TABLE ONLY public.node_revision DROP CONSTRAINT node_revision_pkey;
       public         vagrant    false    226    226            �           2606    33383    node_type_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY node_type
    ADD CONSTRAINT node_type_pkey PRIMARY KEY (type);
 B   ALTER TABLE ONLY public.node_type DROP CONSTRAINT node_type_pkey;
       public         vagrant    false    227    227            �           2606    33318    node_vid_key 
   CONSTRAINT     D   ALTER TABLE ONLY node
    ADD CONSTRAINT node_vid_key UNIQUE (vid);
 ;   ALTER TABLE ONLY public.node DROP CONSTRAINT node_vid_key;
       public         vagrant    false    223    223            T           2606    33119 
   queue_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY queue
    ADD CONSTRAINT queue_pkey PRIMARY KEY (item_id);
 :   ALTER TABLE ONLY public.queue DROP CONSTRAINT queue_pkey;
       public         vagrant    false    205    205            �           2606    33788    rdf_mapping_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY rdf_mapping
    ADD CONSTRAINT rdf_mapping_pkey PRIMARY KEY (type, bundle);
 F   ALTER TABLE ONLY public.rdf_mapping DROP CONSTRAINT rdf_mapping_pkey;
       public         vagrant    false    261    261    261            Y           2606    33139    registry_file_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY registry_file
    ADD CONSTRAINT registry_file_pkey PRIMARY KEY (filename);
 J   ALTER TABLE ONLY public.registry_file DROP CONSTRAINT registry_file_pkey;
       public         vagrant    false    207    207            W           2606    33133    registry_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY registry
    ADD CONSTRAINT registry_pkey PRIMARY KEY (name, type);
 @   ALTER TABLE ONLY public.registry DROP CONSTRAINT registry_pkey;
       public         vagrant    false    206    206    206            v           2606    33248    role_name_key 
   CONSTRAINT     F   ALTER TABLE ONLY role
    ADD CONSTRAINT role_name_key UNIQUE (name);
 <   ALTER TABLE ONLY public.role DROP CONSTRAINT role_name_key;
       public         vagrant    false    219    219            t           2606    33234    role_permission_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY role_permission
    ADD CONSTRAINT role_permission_pkey PRIMARY KEY (rid, permission);
 N   ALTER TABLE ONLY public.role_permission DROP CONSTRAINT role_permission_pkey;
       public         vagrant    false    217    217    217            y           2606    33246 	   role_pkey 
   CONSTRAINT     F   ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (rid);
 8   ALTER TABLE ONLY public.role DROP CONSTRAINT role_pkey;
       public         vagrant    false    219    219            �           2606    33800    search_dataset_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY search_dataset
    ADD CONSTRAINT search_dataset_pkey PRIMARY KEY (sid, type);
 L   ALTER TABLE ONLY public.search_dataset DROP CONSTRAINT search_dataset_pkey;
       public         vagrant    false    262    262    262            �           2606    33808    search_index_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY search_index
    ADD CONSTRAINT search_index_pkey PRIMARY KEY (word, sid, type);
 H   ALTER TABLE ONLY public.search_index DROP CONSTRAINT search_index_pkey;
       public         vagrant    false    263    263    263    263                       2606    33828    search_node_links_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY search_node_links
    ADD CONSTRAINT search_node_links_pkey PRIMARY KEY (sid, type, nid);
 R   ALTER TABLE ONLY public.search_node_links DROP CONSTRAINT search_node_links_pkey;
       public         vagrant    false    265    265    265    265                       2606    33815    search_total_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY search_total
    ADD CONSTRAINT search_total_pkey PRIMARY KEY (word);
 H   ALTER TABLE ONLY public.search_total DROP CONSTRAINT search_total_pkey;
       public         vagrant    false    264    264            \           2606    33149    semaphore_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY semaphore
    ADD CONSTRAINT semaphore_pkey PRIMARY KEY (name);
 B   ALTER TABLE ONLY public.semaphore DROP CONSTRAINT semaphore_pkey;
       public         vagrant    false    208    208            _           2606    33160    sequences_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY sequences
    ADD CONSTRAINT sequences_pkey PRIMARY KEY (value);
 B   ALTER TABLE ONLY public.sequences DROP CONSTRAINT sequences_pkey;
       public         vagrant    false    210    210            a           2606    33173    sessions_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (sid, ssid);
 @   ALTER TABLE ONLY public.sessions DROP CONSTRAINT sessions_pkey;
       public         vagrant    false    211    211    211                       2606    33836    shortcut_set_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY shortcut_set
    ADD CONSTRAINT shortcut_set_pkey PRIMARY KEY (set_name);
 H   ALTER TABLE ONLY public.shortcut_set DROP CONSTRAINT shortcut_set_pkey;
       public         vagrant    false    266    266                       2606    33844    shortcut_set_users_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY shortcut_set_users
    ADD CONSTRAINT shortcut_set_users_pkey PRIMARY KEY (uid);
 T   ALTER TABLE ONLY public.shortcut_set_users DROP CONSTRAINT shortcut_set_users_pkey;
       public         vagrant    false    267    267            f           2606    33192    system_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY system
    ADD CONSTRAINT system_pkey PRIMARY KEY (filename);
 <   ALTER TABLE ONLY public.system DROP CONSTRAINT system_pkey;
       public         vagrant    false    212    212            �           2606    33644    taxonomy_term_data_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY taxonomy_term_data
    ADD CONSTRAINT taxonomy_term_data_pkey PRIMARY KEY (tid);
 T   ALTER TABLE ONLY public.taxonomy_term_data DROP CONSTRAINT taxonomy_term_data_pkey;
       public         vagrant    false    250    250            �           2606    33656    taxonomy_term_hierarchy_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY taxonomy_term_hierarchy
    ADD CONSTRAINT taxonomy_term_hierarchy_pkey PRIMARY KEY (tid, parent);
 ^   ALTER TABLE ONLY public.taxonomy_term_hierarchy DROP CONSTRAINT taxonomy_term_hierarchy_pkey;
       public         vagrant    false    251    251    251            �           2606    33677 $   taxonomy_vocabulary_machine_name_key 
   CONSTRAINT     t   ALTER TABLE ONLY taxonomy_vocabulary
    ADD CONSTRAINT taxonomy_vocabulary_machine_name_key UNIQUE (machine_name);
 b   ALTER TABLE ONLY public.taxonomy_vocabulary DROP CONSTRAINT taxonomy_vocabulary_machine_name_key;
       public         vagrant    false    253    253            �           2606    33675    taxonomy_vocabulary_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY taxonomy_vocabulary
    ADD CONSTRAINT taxonomy_vocabulary_pkey PRIMARY KEY (vid);
 V   ALTER TABLE ONLY public.taxonomy_vocabulary DROP CONSTRAINT taxonomy_vocabulary_pkey;
       public         vagrant    false    253    253            k           2606    33209    url_alias_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY url_alias
    ADD CONSTRAINT url_alias_pkey PRIMARY KEY (pid);
 B   ALTER TABLE ONLY public.url_alias DROP CONSTRAINT url_alias_pkey;
       public         vagrant    false    214    214            ~           2606    33273    users_name_key 
   CONSTRAINT     H   ALTER TABLE ONLY users
    ADD CONSTRAINT users_name_key UNIQUE (name);
 >   ALTER TABLE ONLY public.users DROP CONSTRAINT users_name_key;
       public         vagrant    false    220    220            �           2606    33271 
   users_pkey 
   CONSTRAINT     H   ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (uid);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public         vagrant    false    220    220            �           2606    33286    users_roles_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY users_roles
    ADD CONSTRAINT users_roles_pkey PRIMARY KEY (uid, rid);
 F   ALTER TABLE ONLY public.users_roles DROP CONSTRAINT users_roles_pkey;
       public         vagrant    false    221    221    221                       2606    32836    variable_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY variable
    ADD CONSTRAINT variable_pkey PRIMARY KEY (name);
 @   ALTER TABLE ONLY public.variable DROP CONSTRAINT variable_pkey;
       public         vagrant    false    181    181            �           2606    33625    watchdog_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY watchdog
    ADD CONSTRAINT watchdog_pkey PRIMARY KEY (wid);
 @   ALTER TABLE ONLY public.watchdog DROP CONSTRAINT watchdog_pkey;
       public         vagrant    false    248    248            q           1259    33226    authmap_uid_module_idx    INDEX     J   CREATE INDEX authmap_uid_module_idx ON authmap USING btree (uid, module);
 *   DROP INDEX public.authmap_uid_module_idx;
       public         vagrant    false    216    216                       1259    32858    batch_token_idx    INDEX     ;   CREATE INDEX batch_token_idx ON batch USING btree (token);
 #   DROP INDEX public.batch_token_idx;
       public         vagrant    false    183            �           1259    33528    block_list_idx    INDEX     Z   CREATE INDEX block_list_idx ON block USING btree (theme, status, region, weight, module);
 "   DROP INDEX public.block_list_idx;
       public         vagrant    false    239    239    239    239    239            �           1259    33389    block_node_type_type_idx    INDEX     M   CREATE INDEX block_node_type_type_idx ON block_node_type USING btree (type);
 ,   DROP INDEX public.block_node_type_type_idx;
       public         vagrant    false    228            �           1259    33535    block_role_rid_idx    INDEX     A   CREATE INDEX block_role_rid_idx ON block_role USING btree (rid);
 &   DROP INDEX public.block_role_rid_idx;
       public         vagrant    false    240                       1259    32869    blocked_ips_blocked_ip_idx    INDEX     I   CREATE INDEX blocked_ips_blocked_ip_idx ON blocked_ips USING btree (ip);
 .   DROP INDEX public.blocked_ips_blocked_ip_idx;
       public         vagrant    false    185            �           1259    33563    cache_block_expire_idx    INDEX     I   CREATE INDEX cache_block_expire_idx ON cache_block USING btree (expire);
 *   DROP INDEX public.cache_block_expire_idx;
       public         vagrant    false    243                       1259    32895    cache_bootstrap_expire_idx    INDEX     Q   CREATE INDEX cache_bootstrap_expire_idx ON cache_bootstrap USING btree (expire);
 .   DROP INDEX public.cache_bootstrap_expire_idx;
       public         vagrant    false    187                       1259    32882    cache_expire_idx    INDEX     =   CREATE INDEX cache_expire_idx ON cache USING btree (expire);
 $   DROP INDEX public.cache_expire_idx;
       public         vagrant    false    186            �           1259    33498    cache_field_expire_idx    INDEX     I   CREATE INDEX cache_field_expire_idx ON cache_field USING btree (expire);
 *   DROP INDEX public.cache_field_expire_idx;
       public         vagrant    false    237            �           1259    33441    cache_filter_expire_idx    INDEX     K   CREATE INDEX cache_filter_expire_idx ON cache_filter USING btree (expire);
 +   DROP INDEX public.cache_filter_expire_idx;
       public         vagrant    false    232            !           1259    32908    cache_form_expire_idx    INDEX     G   CREATE INDEX cache_form_expire_idx ON cache_form USING btree (expire);
 )   DROP INDEX public.cache_form_expire_idx;
       public         vagrant    false    188            �           1259    33705    cache_image_expire_idx    INDEX     I   CREATE INDEX cache_image_expire_idx ON cache_image USING btree (expire);
 *   DROP INDEX public.cache_image_expire_idx;
       public         vagrant    false    255            '           1259    32934    cache_menu_expire_idx    INDEX     G   CREATE INDEX cache_menu_expire_idx ON cache_menu USING btree (expire);
 )   DROP INDEX public.cache_menu_expire_idx;
       public         vagrant    false    190            $           1259    32921    cache_page_expire_idx    INDEX     G   CREATE INDEX cache_page_expire_idx ON cache_page USING btree (expire);
 )   DROP INDEX public.cache_page_expire_idx;
       public         vagrant    false    189            *           1259    32947    cache_path_expire_idx    INDEX     G   CREATE INDEX cache_path_expire_idx ON cache_path USING btree (expire);
 )   DROP INDEX public.cache_path_expire_idx;
       public         vagrant    false    191            R           1259    34166    cache_update_expire_idx    INDEX     K   CREATE INDEX cache_update_expire_idx ON cache_update USING btree (expire);
 +   DROP INDEX public.cache_update_expire_idx;
       public         vagrant    false    276            �           1259    33589    comment_comment_created_idx    INDEX     K   CREATE INDEX comment_comment_created_idx ON comment USING btree (created);
 /   DROP INDEX public.comment_comment_created_idx;
       public         vagrant    false    245            �           1259    33588     comment_comment_nid_language_idx    INDEX     V   CREATE INDEX comment_comment_nid_language_idx ON comment USING btree (nid, language);
 4   DROP INDEX public.comment_comment_nid_language_idx;
       public         vagrant    false    245    245            �           1259    33586    comment_comment_num_new_idx    INDEX     e   CREATE INDEX comment_comment_num_new_idx ON comment USING btree (nid, status, created, cid, thread);
 /   DROP INDEX public.comment_comment_num_new_idx;
       public         vagrant    false    245    245    245    245    245            �           1259    33585    comment_comment_status_pid_idx    INDEX     R   CREATE INDEX comment_comment_status_pid_idx ON comment USING btree (pid, status);
 2   DROP INDEX public.comment_comment_status_pid_idx;
       public         vagrant    false    245    245            �           1259    33587    comment_comment_uid_idx    INDEX     C   CREATE INDEX comment_comment_uid_idx ON comment USING btree (uid);
 +   DROP INDEX public.comment_comment_uid_idx;
       public         vagrant    false    245            /           1259    32954    date_format_type_title_idx    INDEX     Q   CREATE INDEX date_format_type_title_idx ON date_format_type USING btree (title);
 .   DROP INDEX public.date_format_type_title_idx;
       public         vagrant    false    192            �           1259    33462    field_config_active_idx    INDEX     K   CREATE INDEX field_config_active_idx ON field_config USING btree (active);
 +   DROP INDEX public.field_config_active_idx;
       public         vagrant    false    234            �           1259    33464    field_config_deleted_idx    INDEX     M   CREATE INDEX field_config_deleted_idx ON field_config USING btree (deleted);
 ,   DROP INDEX public.field_config_deleted_idx;
       public         vagrant    false    234            �           1259    33461    field_config_field_name_idx    INDEX     S   CREATE INDEX field_config_field_name_idx ON field_config USING btree (field_name);
 /   DROP INDEX public.field_config_field_name_idx;
       public         vagrant    false    234            �           1259    33485 !   field_config_instance_deleted_idx    INDEX     _   CREATE INDEX field_config_instance_deleted_idx ON field_config_instance USING btree (deleted);
 5   DROP INDEX public.field_config_instance_deleted_idx;
       public         vagrant    false    236            �           1259    33484 +   field_config_instance_field_name_bundle_idx    INDEX     �   CREATE INDEX field_config_instance_field_name_bundle_idx ON field_config_instance USING btree (field_name, entity_type, bundle);
 ?   DROP INDEX public.field_config_instance_field_name_bundle_idx;
       public         vagrant    false    236    236    236            �           1259    33465    field_config_module_idx    INDEX     K   CREATE INDEX field_config_module_idx ON field_config USING btree (module);
 +   DROP INDEX public.field_config_module_idx;
       public         vagrant    false    234            �           1259    33463    field_config_storage_active_idx    INDEX     [   CREATE INDEX field_config_storage_active_idx ON field_config USING btree (storage_active);
 3   DROP INDEX public.field_config_storage_active_idx;
       public         vagrant    false    234            �           1259    33466    field_config_storage_module_idx    INDEX     [   CREATE INDEX field_config_storage_module_idx ON field_config USING btree (storage_module);
 3   DROP INDEX public.field_config_storage_module_idx;
       public         vagrant    false    234            �           1259    33468    field_config_storage_type_idx    INDEX     W   CREATE INDEX field_config_storage_type_idx ON field_config USING btree (storage_type);
 1   DROP INDEX public.field_config_storage_type_idx;
       public         vagrant    false    234            �           1259    33467    field_config_type_idx    INDEX     G   CREATE INDEX field_config_type_idx ON field_config USING btree (type);
 )   DROP INDEX public.field_config_type_idx;
       public         vagrant    false    234                       1259    33934    field_data_body_body_format_idx    INDEX     [   CREATE INDEX field_data_body_body_format_idx ON field_data_body USING btree (body_format);
 3   DROP INDEX public.field_data_body_body_format_idx;
       public         vagrant    false    270                       1259    33929    field_data_body_bundle_idx    INDEX     Q   CREATE INDEX field_data_body_bundle_idx ON field_data_body USING btree (bundle);
 .   DROP INDEX public.field_data_body_bundle_idx;
       public         vagrant    false    270                       1259    33930    field_data_body_deleted_idx    INDEX     S   CREATE INDEX field_data_body_deleted_idx ON field_data_body USING btree (deleted);
 /   DROP INDEX public.field_data_body_deleted_idx;
       public         vagrant    false    270                       1259    33931    field_data_body_entity_id_idx    INDEX     W   CREATE INDEX field_data_body_entity_id_idx ON field_data_body USING btree (entity_id);
 1   DROP INDEX public.field_data_body_entity_id_idx;
       public         vagrant    false    270                        1259    33928    field_data_body_entity_type_idx    INDEX     [   CREATE INDEX field_data_body_entity_type_idx ON field_data_body USING btree (entity_type);
 3   DROP INDEX public.field_data_body_entity_type_idx;
       public         vagrant    false    270            !           1259    33933    field_data_body_language_idx    INDEX     U   CREATE INDEX field_data_body_language_idx ON field_data_body USING btree (language);
 0   DROP INDEX public.field_data_body_language_idx;
       public         vagrant    false    270            $           1259    33932    field_data_body_revision_id_idx    INDEX     [   CREATE INDEX field_data_body_revision_id_idx ON field_data_body USING btree (revision_id);
 3   DROP INDEX public.field_data_body_revision_id_idx;
       public         vagrant    false    270            
           1259    33870 "   field_data_comment_body_bundle_idx    INDEX     a   CREATE INDEX field_data_comment_body_bundle_idx ON field_data_comment_body USING btree (bundle);
 6   DROP INDEX public.field_data_comment_body_bundle_idx;
       public         vagrant    false    268                       1259    33875 /   field_data_comment_body_comment_body_format_idx    INDEX     {   CREATE INDEX field_data_comment_body_comment_body_format_idx ON field_data_comment_body USING btree (comment_body_format);
 C   DROP INDEX public.field_data_comment_body_comment_body_format_idx;
       public         vagrant    false    268                       1259    33871 #   field_data_comment_body_deleted_idx    INDEX     c   CREATE INDEX field_data_comment_body_deleted_idx ON field_data_comment_body USING btree (deleted);
 7   DROP INDEX public.field_data_comment_body_deleted_idx;
       public         vagrant    false    268                       1259    33872 %   field_data_comment_body_entity_id_idx    INDEX     g   CREATE INDEX field_data_comment_body_entity_id_idx ON field_data_comment_body USING btree (entity_id);
 9   DROP INDEX public.field_data_comment_body_entity_id_idx;
       public         vagrant    false    268                       1259    33869 '   field_data_comment_body_entity_type_idx    INDEX     k   CREATE INDEX field_data_comment_body_entity_type_idx ON field_data_comment_body USING btree (entity_type);
 ;   DROP INDEX public.field_data_comment_body_entity_type_idx;
       public         vagrant    false    268                       1259    33874 $   field_data_comment_body_language_idx    INDEX     e   CREATE INDEX field_data_comment_body_language_idx ON field_data_comment_body USING btree (language);
 8   DROP INDEX public.field_data_comment_body_language_idx;
       public         vagrant    false    268                       1259    33873 '   field_data_comment_body_revision_id_idx    INDEX     k   CREATE INDEX field_data_comment_body_revision_id_idx ON field_data_comment_body USING btree (revision_id);
 ;   DROP INDEX public.field_data_comment_body_revision_id_idx;
       public         vagrant    false    268            @           1259    34061 !   field_data_field_image_bundle_idx    INDEX     _   CREATE INDEX field_data_field_image_bundle_idx ON field_data_field_image USING btree (bundle);
 5   DROP INDEX public.field_data_field_image_bundle_idx;
       public         vagrant    false    274            A           1259    34062 "   field_data_field_image_deleted_idx    INDEX     a   CREATE INDEX field_data_field_image_deleted_idx ON field_data_field_image USING btree (deleted);
 6   DROP INDEX public.field_data_field_image_deleted_idx;
       public         vagrant    false    274            B           1259    34063 $   field_data_field_image_entity_id_idx    INDEX     e   CREATE INDEX field_data_field_image_entity_id_idx ON field_data_field_image USING btree (entity_id);
 8   DROP INDEX public.field_data_field_image_entity_id_idx;
       public         vagrant    false    274            C           1259    34060 &   field_data_field_image_entity_type_idx    INDEX     i   CREATE INDEX field_data_field_image_entity_type_idx ON field_data_field_image USING btree (entity_type);
 :   DROP INDEX public.field_data_field_image_entity_type_idx;
       public         vagrant    false    274            D           1259    34066 *   field_data_field_image_field_image_fid_idx    INDEX     q   CREATE INDEX field_data_field_image_field_image_fid_idx ON field_data_field_image USING btree (field_image_fid);
 >   DROP INDEX public.field_data_field_image_field_image_fid_idx;
       public         vagrant    false    274            E           1259    34065 #   field_data_field_image_language_idx    INDEX     c   CREATE INDEX field_data_field_image_language_idx ON field_data_field_image USING btree (language);
 7   DROP INDEX public.field_data_field_image_language_idx;
       public         vagrant    false    274            H           1259    34064 &   field_data_field_image_revision_id_idx    INDEX     i   CREATE INDEX field_data_field_image_revision_id_idx ON field_data_field_image USING btree (revision_id);
 :   DROP INDEX public.field_data_field_image_revision_id_idx;
       public         vagrant    false    274            .           1259    34006     field_data_field_tags_bundle_idx    INDEX     ]   CREATE INDEX field_data_field_tags_bundle_idx ON field_data_field_tags USING btree (bundle);
 4   DROP INDEX public.field_data_field_tags_bundle_idx;
       public         vagrant    false    272            /           1259    34007 !   field_data_field_tags_deleted_idx    INDEX     _   CREATE INDEX field_data_field_tags_deleted_idx ON field_data_field_tags USING btree (deleted);
 5   DROP INDEX public.field_data_field_tags_deleted_idx;
       public         vagrant    false    272            0           1259    34008 #   field_data_field_tags_entity_id_idx    INDEX     c   CREATE INDEX field_data_field_tags_entity_id_idx ON field_data_field_tags USING btree (entity_id);
 7   DROP INDEX public.field_data_field_tags_entity_id_idx;
       public         vagrant    false    272            1           1259    34005 %   field_data_field_tags_entity_type_idx    INDEX     g   CREATE INDEX field_data_field_tags_entity_type_idx ON field_data_field_tags USING btree (entity_type);
 9   DROP INDEX public.field_data_field_tags_entity_type_idx;
       public         vagrant    false    272            2           1259    34011 (   field_data_field_tags_field_tags_tid_idx    INDEX     m   CREATE INDEX field_data_field_tags_field_tags_tid_idx ON field_data_field_tags USING btree (field_tags_tid);
 <   DROP INDEX public.field_data_field_tags_field_tags_tid_idx;
       public         vagrant    false    272            3           1259    34010 "   field_data_field_tags_language_idx    INDEX     a   CREATE INDEX field_data_field_tags_language_idx ON field_data_field_tags USING btree (language);
 6   DROP INDEX public.field_data_field_tags_language_idx;
       public         vagrant    false    272            6           1259    34009 %   field_data_field_tags_revision_id_idx    INDEX     g   CREATE INDEX field_data_field_tags_revision_id_idx ON field_data_field_tags USING btree (revision_id);
 9   DROP INDEX public.field_data_field_tags_revision_id_idx;
       public         vagrant    false    272            %           1259    33956 #   field_revision_body_body_format_idx    INDEX     c   CREATE INDEX field_revision_body_body_format_idx ON field_revision_body USING btree (body_format);
 7   DROP INDEX public.field_revision_body_body_format_idx;
       public         vagrant    false    271            &           1259    33951    field_revision_body_bundle_idx    INDEX     Y   CREATE INDEX field_revision_body_bundle_idx ON field_revision_body USING btree (bundle);
 2   DROP INDEX public.field_revision_body_bundle_idx;
       public         vagrant    false    271            '           1259    33952    field_revision_body_deleted_idx    INDEX     [   CREATE INDEX field_revision_body_deleted_idx ON field_revision_body USING btree (deleted);
 3   DROP INDEX public.field_revision_body_deleted_idx;
       public         vagrant    false    271            (           1259    33953 !   field_revision_body_entity_id_idx    INDEX     _   CREATE INDEX field_revision_body_entity_id_idx ON field_revision_body USING btree (entity_id);
 5   DROP INDEX public.field_revision_body_entity_id_idx;
       public         vagrant    false    271            )           1259    33950 #   field_revision_body_entity_type_idx    INDEX     c   CREATE INDEX field_revision_body_entity_type_idx ON field_revision_body USING btree (entity_type);
 7   DROP INDEX public.field_revision_body_entity_type_idx;
       public         vagrant    false    271            *           1259    33955     field_revision_body_language_idx    INDEX     ]   CREATE INDEX field_revision_body_language_idx ON field_revision_body USING btree (language);
 4   DROP INDEX public.field_revision_body_language_idx;
       public         vagrant    false    271            -           1259    33954 #   field_revision_body_revision_id_idx    INDEX     c   CREATE INDEX field_revision_body_revision_id_idx ON field_revision_body USING btree (revision_id);
 7   DROP INDEX public.field_revision_body_revision_id_idx;
       public         vagrant    false    271                       1259    33892 &   field_revision_comment_body_bundle_idx    INDEX     i   CREATE INDEX field_revision_comment_body_bundle_idx ON field_revision_comment_body USING btree (bundle);
 :   DROP INDEX public.field_revision_comment_body_bundle_idx;
       public         vagrant    false    269                       1259    33897 3   field_revision_comment_body_comment_body_format_idx    INDEX     �   CREATE INDEX field_revision_comment_body_comment_body_format_idx ON field_revision_comment_body USING btree (comment_body_format);
 G   DROP INDEX public.field_revision_comment_body_comment_body_format_idx;
       public         vagrant    false    269                       1259    33893 '   field_revision_comment_body_deleted_idx    INDEX     k   CREATE INDEX field_revision_comment_body_deleted_idx ON field_revision_comment_body USING btree (deleted);
 ;   DROP INDEX public.field_revision_comment_body_deleted_idx;
       public         vagrant    false    269                       1259    33894 )   field_revision_comment_body_entity_id_idx    INDEX     o   CREATE INDEX field_revision_comment_body_entity_id_idx ON field_revision_comment_body USING btree (entity_id);
 =   DROP INDEX public.field_revision_comment_body_entity_id_idx;
       public         vagrant    false    269                       1259    33891 +   field_revision_comment_body_entity_type_idx    INDEX     s   CREATE INDEX field_revision_comment_body_entity_type_idx ON field_revision_comment_body USING btree (entity_type);
 ?   DROP INDEX public.field_revision_comment_body_entity_type_idx;
       public         vagrant    false    269                       1259    33896 (   field_revision_comment_body_language_idx    INDEX     m   CREATE INDEX field_revision_comment_body_language_idx ON field_revision_comment_body USING btree (language);
 <   DROP INDEX public.field_revision_comment_body_language_idx;
       public         vagrant    false    269                       1259    33895 +   field_revision_comment_body_revision_id_idx    INDEX     s   CREATE INDEX field_revision_comment_body_revision_id_idx ON field_revision_comment_body USING btree (revision_id);
 ?   DROP INDEX public.field_revision_comment_body_revision_id_idx;
       public         vagrant    false    269            I           1259    34086 %   field_revision_field_image_bundle_idx    INDEX     g   CREATE INDEX field_revision_field_image_bundle_idx ON field_revision_field_image USING btree (bundle);
 9   DROP INDEX public.field_revision_field_image_bundle_idx;
       public         vagrant    false    275            J           1259    34087 &   field_revision_field_image_deleted_idx    INDEX     i   CREATE INDEX field_revision_field_image_deleted_idx ON field_revision_field_image USING btree (deleted);
 :   DROP INDEX public.field_revision_field_image_deleted_idx;
       public         vagrant    false    275            K           1259    34088 (   field_revision_field_image_entity_id_idx    INDEX     m   CREATE INDEX field_revision_field_image_entity_id_idx ON field_revision_field_image USING btree (entity_id);
 <   DROP INDEX public.field_revision_field_image_entity_id_idx;
       public         vagrant    false    275            L           1259    34085 *   field_revision_field_image_entity_type_idx    INDEX     q   CREATE INDEX field_revision_field_image_entity_type_idx ON field_revision_field_image USING btree (entity_type);
 >   DROP INDEX public.field_revision_field_image_entity_type_idx;
       public         vagrant    false    275            M           1259    34091 .   field_revision_field_image_field_image_fid_idx    INDEX     y   CREATE INDEX field_revision_field_image_field_image_fid_idx ON field_revision_field_image USING btree (field_image_fid);
 B   DROP INDEX public.field_revision_field_image_field_image_fid_idx;
       public         vagrant    false    275            N           1259    34090 '   field_revision_field_image_language_idx    INDEX     k   CREATE INDEX field_revision_field_image_language_idx ON field_revision_field_image USING btree (language);
 ;   DROP INDEX public.field_revision_field_image_language_idx;
       public         vagrant    false    275            Q           1259    34089 *   field_revision_field_image_revision_id_idx    INDEX     q   CREATE INDEX field_revision_field_image_revision_id_idx ON field_revision_field_image USING btree (revision_id);
 >   DROP INDEX public.field_revision_field_image_revision_id_idx;
       public         vagrant    false    275            7           1259    34026 $   field_revision_field_tags_bundle_idx    INDEX     e   CREATE INDEX field_revision_field_tags_bundle_idx ON field_revision_field_tags USING btree (bundle);
 8   DROP INDEX public.field_revision_field_tags_bundle_idx;
       public         vagrant    false    273            8           1259    34027 %   field_revision_field_tags_deleted_idx    INDEX     g   CREATE INDEX field_revision_field_tags_deleted_idx ON field_revision_field_tags USING btree (deleted);
 9   DROP INDEX public.field_revision_field_tags_deleted_idx;
       public         vagrant    false    273            9           1259    34028 '   field_revision_field_tags_entity_id_idx    INDEX     k   CREATE INDEX field_revision_field_tags_entity_id_idx ON field_revision_field_tags USING btree (entity_id);
 ;   DROP INDEX public.field_revision_field_tags_entity_id_idx;
       public         vagrant    false    273            :           1259    34025 )   field_revision_field_tags_entity_type_idx    INDEX     o   CREATE INDEX field_revision_field_tags_entity_type_idx ON field_revision_field_tags USING btree (entity_type);
 =   DROP INDEX public.field_revision_field_tags_entity_type_idx;
       public         vagrant    false    273            ;           1259    34031 ,   field_revision_field_tags_field_tags_tid_idx    INDEX     u   CREATE INDEX field_revision_field_tags_field_tags_tid_idx ON field_revision_field_tags USING btree (field_tags_tid);
 @   DROP INDEX public.field_revision_field_tags_field_tags_tid_idx;
       public         vagrant    false    273            <           1259    34030 &   field_revision_field_tags_language_idx    INDEX     i   CREATE INDEX field_revision_field_tags_language_idx ON field_revision_field_tags USING btree (language);
 :   DROP INDEX public.field_revision_field_tags_language_idx;
       public         vagrant    false    273            ?           1259    34029 )   field_revision_field_tags_revision_id_idx    INDEX     o   CREATE INDEX field_revision_field_tags_revision_id_idx ON field_revision_field_tags USING btree (revision_id);
 =   DROP INDEX public.field_revision_field_tags_revision_id_idx;
       public         vagrant    false    273            8           1259    32997    file_managed_status_idx    INDEX     K   CREATE INDEX file_managed_status_idx ON file_managed USING btree (status);
 +   DROP INDEX public.file_managed_status_idx;
       public         vagrant    false    197            9           1259    32998    file_managed_timestamp_idx    INDEX     S   CREATE INDEX file_managed_timestamp_idx ON file_managed USING btree ("timestamp");
 .   DROP INDEX public.file_managed_timestamp_idx;
       public         vagrant    false    197            :           1259    32996    file_managed_uid_idx    INDEX     E   CREATE INDEX file_managed_uid_idx ON file_managed USING btree (uid);
 (   DROP INDEX public.file_managed_uid_idx;
       public         vagrant    false    197            =           1259    33012    file_usage_fid_count_idx    INDEX     N   CREATE INDEX file_usage_fid_count_idx ON file_usage USING btree (fid, count);
 ,   DROP INDEX public.file_usage_fid_count_idx;
       public         vagrant    false    198    198            >           1259    33013    file_usage_fid_module_idx    INDEX     P   CREATE INDEX file_usage_fid_module_idx ON file_usage USING btree (fid, module);
 -   DROP INDEX public.file_usage_fid_module_idx;
       public         vagrant    false    198    198            A           1259    33011    file_usage_type_id_idx    INDEX     J   CREATE INDEX file_usage_type_id_idx ON file_usage USING btree (type, id);
 *   DROP INDEX public.file_usage_type_id_idx;
       public         vagrant    false    198    198            �           1259    33428    filter_format_status_weight_idx    INDEX     \   CREATE INDEX filter_format_status_weight_idx ON filter_format USING btree (status, weight);
 3   DROP INDEX public.filter_format_status_weight_idx;
       public         vagrant    false    231    231            �           1259    33412    filter_list_idx    INDEX     K   CREATE INDEX filter_list_idx ON filter USING btree (weight, module, name);
 #   DROP INDEX public.filter_list_idx;
       public         vagrant    false    230    230    230            B           1259    33026    flood_allow_idx    INDEX     T   CREATE INDEX flood_allow_idx ON flood USING btree (event, identifier, "timestamp");
 #   DROP INDEX public.flood_allow_idx;
       public         vagrant    false    200    200    200            E           1259    33027    flood_purge_idx    INDEX     @   CREATE INDEX flood_purge_idx ON flood USING btree (expiration);
 #   DROP INDEX public.flood_purge_idx;
       public         vagrant    false    200            �           1259    33399    history_nid_idx    INDEX     ;   CREATE INDEX history_nid_idx ON history USING btree (nid);
 #   DROP INDEX public.history_nid_idx;
       public         vagrant    false    229            �           1259    33736    image_effects_isid_idx    INDEX     I   CREATE INDEX image_effects_isid_idx ON image_effects USING btree (isid);
 *   DROP INDEX public.image_effects_isid_idx;
       public         vagrant    false    259            �           1259    33737    image_effects_weight_idx    INDEX     M   CREATE INDEX image_effects_weight_idx ON image_effects USING btree (weight);
 ,   DROP INDEX public.image_effects_weight_idx;
       public         vagrant    false    259            K           1259    33103    menu_links_menu_parents_idx    INDEX     t   CREATE INDEX menu_links_menu_parents_idx ON menu_links USING btree (menu_name, p1, p2, p3, p4, p5, p6, p7, p8, p9);
 /   DROP INDEX public.menu_links_menu_parents_idx;
       public         vagrant    false    203    203    203    203    203    203    203    203    203    203            L           1259    33102 %   menu_links_menu_plid_expand_child_idx    INDEX     x   CREATE INDEX menu_links_menu_plid_expand_child_idx ON menu_links USING btree (menu_name, plid, expanded, has_children);
 9   DROP INDEX public.menu_links_menu_plid_expand_child_idx;
       public         vagrant    false    203    203    203    203            M           1259    33101    menu_links_path_menu_idx    INDEX     p   CREATE INDEX menu_links_path_menu_idx ON menu_links USING btree (substr((link_path)::text, 1, 128), menu_name);
 ,   DROP INDEX public.menu_links_path_menu_idx;
       public         vagrant    false    203    203            P           1259    33104    menu_links_router_path_idx    INDEX     i   CREATE INDEX menu_links_router_path_idx ON menu_links USING btree (substr((router_path)::text, 1, 128));
 .   DROP INDEX public.menu_links_router_path_idx;
       public         vagrant    false    203    203            F           1259    33053    menu_router_fit_idx    INDEX     C   CREATE INDEX menu_router_fit_idx ON menu_router USING btree (fit);
 '   DROP INDEX public.menu_router_fit_idx;
       public         vagrant    false    201            I           1259    33054    menu_router_tab_parent_idx    INDEX     w   CREATE INDEX menu_router_tab_parent_idx ON menu_router USING btree (substr((tab_parent)::text, 1, 64), weight, title);
 .   DROP INDEX public.menu_router_tab_parent_idx;
       public         vagrant    false    201    201    201            J           1259    33055 %   menu_router_tab_root_weight_title_idx    INDEX     �   CREATE INDEX menu_router_tab_root_weight_title_idx ON menu_router USING btree (substr((tab_root)::text, 1, 64), weight, title);
 9   DROP INDEX public.menu_router_tab_root_weight_title_idx;
       public         vagrant    false    201    201    201            �           1259    33603 )   node_comment_statistics_comment_count_idx    INDEX     o   CREATE INDEX node_comment_statistics_comment_count_idx ON node_comment_statistics USING btree (comment_count);
 =   DROP INDEX public.node_comment_statistics_comment_count_idx;
       public         vagrant    false    246            �           1259    33604 ,   node_comment_statistics_last_comment_uid_idx    INDEX     u   CREATE INDEX node_comment_statistics_last_comment_uid_idx ON node_comment_statistics USING btree (last_comment_uid);
 @   DROP INDEX public.node_comment_statistics_last_comment_uid_idx;
       public         vagrant    false    246            �           1259    33602 2   node_comment_statistics_node_comment_timestamp_idx    INDEX     �   CREATE INDEX node_comment_statistics_node_comment_timestamp_idx ON node_comment_statistics USING btree (last_comment_timestamp);
 F   DROP INDEX public.node_comment_statistics_node_comment_timestamp_idx;
       public         vagrant    false    246            �           1259    33328    node_language_idx    INDEX     ?   CREATE INDEX node_language_idx ON node USING btree (language);
 %   DROP INDEX public.node_language_idx;
       public         vagrant    false    223            �           1259    33319    node_node_changed_idx    INDEX     B   CREATE INDEX node_node_changed_idx ON node USING btree (changed);
 )   DROP INDEX public.node_node_changed_idx;
       public         vagrant    false    223            �           1259    33320    node_node_created_idx    INDEX     B   CREATE INDEX node_node_created_idx ON node USING btree (created);
 )   DROP INDEX public.node_node_created_idx;
       public         vagrant    false    223            �           1259    33321    node_node_frontpage_idx    INDEX     ]   CREATE INDEX node_node_frontpage_idx ON node USING btree (promote, status, sticky, created);
 +   DROP INDEX public.node_node_frontpage_idx;
       public         vagrant    false    223    223    223    223            �           1259    33322    node_node_status_type_idx    INDEX     P   CREATE INDEX node_node_status_type_idx ON node USING btree (status, type, nid);
 -   DROP INDEX public.node_node_status_type_idx;
       public         vagrant    false    223    223    223            �           1259    33323    node_node_title_type_idx    INDEX     _   CREATE INDEX node_node_title_type_idx ON node USING btree (title, substr((type)::text, 1, 4));
 ,   DROP INDEX public.node_node_title_type_idx;
       public         vagrant    false    223    223            �           1259    33324    node_node_type_idx    INDEX     R   CREATE INDEX node_node_type_idx ON node USING btree (substr((type)::text, 1, 4));
 &   DROP INDEX public.node_node_type_idx;
       public         vagrant    false    223    223            �           1259    33366    node_revision_nid_idx    INDEX     G   CREATE INDEX node_revision_nid_idx ON node_revision USING btree (nid);
 )   DROP INDEX public.node_revision_nid_idx;
       public         vagrant    false    226            �           1259    33367    node_revision_uid_idx    INDEX     G   CREATE INDEX node_revision_uid_idx ON node_revision USING btree (uid);
 )   DROP INDEX public.node_revision_uid_idx;
       public         vagrant    false    226            �           1259    33326    node_tnid_idx    INDEX     7   CREATE INDEX node_tnid_idx ON node USING btree (tnid);
 !   DROP INDEX public.node_tnid_idx;
       public         vagrant    false    223            �           1259    33327    node_translate_idx    INDEX     A   CREATE INDEX node_translate_idx ON node USING btree (translate);
 &   DROP INDEX public.node_translate_idx;
       public         vagrant    false    223            �           1259    33325    node_uid_idx    INDEX     5   CREATE INDEX node_uid_idx ON node USING btree (uid);
     DROP INDEX public.node_uid_idx;
       public         vagrant    false    223            Q           1259    33121    queue_expire_idx    INDEX     =   CREATE INDEX queue_expire_idx ON queue USING btree (expire);
 $   DROP INDEX public.queue_expire_idx;
       public         vagrant    false    205            R           1259    33120    queue_name_created_idx    INDEX     J   CREATE INDEX queue_name_created_idx ON queue USING btree (name, created);
 *   DROP INDEX public.queue_name_created_idx;
       public         vagrant    false    205    205            U           1259    33134    registry_hook_idx    INDEX     O   CREATE INDEX registry_hook_idx ON registry USING btree (type, weight, module);
 %   DROP INDEX public.registry_hook_idx;
       public         vagrant    false    206    206    206            w           1259    33249    role_name_weight_idx    INDEX     F   CREATE INDEX role_name_weight_idx ON role USING btree (name, weight);
 (   DROP INDEX public.role_name_weight_idx;
       public         vagrant    false    219    219            r           1259    33235    role_permission_permission_idx    INDEX     Y   CREATE INDEX role_permission_permission_idx ON role_permission USING btree (permission);
 2   DROP INDEX public.role_permission_permission_idx;
       public         vagrant    false    217            �           1259    33809    search_index_sid_type_idx    INDEX     P   CREATE INDEX search_index_sid_type_idx ON search_index USING btree (sid, type);
 -   DROP INDEX public.search_index_sid_type_idx;
       public         vagrant    false    263    263                       1259    33829    search_node_links_nid_idx    INDEX     O   CREATE INDEX search_node_links_nid_idx ON search_node_links USING btree (nid);
 -   DROP INDEX public.search_node_links_nid_idx;
       public         vagrant    false    265            Z           1259    33151    semaphore_expire_idx    INDEX     E   CREATE INDEX semaphore_expire_idx ON semaphore USING btree (expire);
 (   DROP INDEX public.semaphore_expire_idx;
       public         vagrant    false    208            ]           1259    33150    semaphore_value_idx    INDEX     C   CREATE INDEX semaphore_value_idx ON semaphore USING btree (value);
 '   DROP INDEX public.semaphore_value_idx;
       public         vagrant    false    208            b           1259    33176    sessions_ssid_idx    INDEX     ?   CREATE INDEX sessions_ssid_idx ON sessions USING btree (ssid);
 %   DROP INDEX public.sessions_ssid_idx;
       public         vagrant    false    211            c           1259    33174    sessions_timestamp_idx    INDEX     K   CREATE INDEX sessions_timestamp_idx ON sessions USING btree ("timestamp");
 *   DROP INDEX public.sessions_timestamp_idx;
       public         vagrant    false    211            d           1259    33175    sessions_uid_idx    INDEX     =   CREATE INDEX sessions_uid_idx ON sessions USING btree (uid);
 $   DROP INDEX public.sessions_uid_idx;
       public         vagrant    false    211            	           1259    33845    shortcut_set_users_set_name_idx    INDEX     [   CREATE INDEX shortcut_set_users_set_name_idx ON shortcut_set_users USING btree (set_name);
 3   DROP INDEX public.shortcut_set_users_set_name_idx;
       public         vagrant    false    267            g           1259    33193    system_system_list_idx    INDEX     c   CREATE INDEX system_system_list_idx ON system USING btree (status, bootstrap, type, weight, name);
 *   DROP INDEX public.system_system_list_idx;
       public         vagrant    false    212    212    212    212    212            h           1259    33194    system_type_name_idx    INDEX     F   CREATE INDEX system_type_name_idx ON system USING btree (type, name);
 (   DROP INDEX public.system_type_name_idx;
       public         vagrant    false    212    212            �           1259    33689    taxonomy_index_nid_idx    INDEX     I   CREATE INDEX taxonomy_index_nid_idx ON taxonomy_index USING btree (nid);
 *   DROP INDEX public.taxonomy_index_nid_idx;
       public         vagrant    false    254            �           1259    33688    taxonomy_index_term_node_idx    INDEX     `   CREATE INDEX taxonomy_index_term_node_idx ON taxonomy_index USING btree (tid, sticky, created);
 0   DROP INDEX public.taxonomy_index_term_node_idx;
       public         vagrant    false    254    254    254            �           1259    33647    taxonomy_term_data_name_idx    INDEX     S   CREATE INDEX taxonomy_term_data_name_idx ON taxonomy_term_data USING btree (name);
 /   DROP INDEX public.taxonomy_term_data_name_idx;
       public         vagrant    false    250            �           1259    33645 $   taxonomy_term_data_taxonomy_tree_idx    INDEX     i   CREATE INDEX taxonomy_term_data_taxonomy_tree_idx ON taxonomy_term_data USING btree (vid, weight, name);
 8   DROP INDEX public.taxonomy_term_data_taxonomy_tree_idx;
       public         vagrant    false    250    250    250            �           1259    33646    taxonomy_term_data_vid_name_idx    INDEX     \   CREATE INDEX taxonomy_term_data_vid_name_idx ON taxonomy_term_data USING btree (vid, name);
 3   DROP INDEX public.taxonomy_term_data_vid_name_idx;
       public         vagrant    false    250    250            �           1259    33657 "   taxonomy_term_hierarchy_parent_idx    INDEX     a   CREATE INDEX taxonomy_term_hierarchy_parent_idx ON taxonomy_term_hierarchy USING btree (parent);
 6   DROP INDEX public.taxonomy_term_hierarchy_parent_idx;
       public         vagrant    false    251            �           1259    33678    taxonomy_vocabulary_list_idx    INDEX     ]   CREATE INDEX taxonomy_vocabulary_list_idx ON taxonomy_vocabulary USING btree (weight, name);
 0   DROP INDEX public.taxonomy_vocabulary_list_idx;
       public         vagrant    false    253    253            i           1259    33210     url_alias_alias_language_pid_idx    INDEX     _   CREATE INDEX url_alias_alias_language_pid_idx ON url_alias USING btree (alias, language, pid);
 4   DROP INDEX public.url_alias_alias_language_pid_idx;
       public         vagrant    false    214    214    214            l           1259    33211 !   url_alias_source_language_pid_idx    INDEX     a   CREATE INDEX url_alias_source_language_pid_idx ON url_alias USING btree (source, language, pid);
 5   DROP INDEX public.url_alias_source_language_pid_idx;
       public         vagrant    false    214    214    214            z           1259    33274    users_access_idx    INDEX     =   CREATE INDEX users_access_idx ON users USING btree (access);
 $   DROP INDEX public.users_access_idx;
       public         vagrant    false    220            {           1259    33275    users_created_idx    INDEX     ?   CREATE INDEX users_created_idx ON users USING btree (created);
 %   DROP INDEX public.users_created_idx;
       public         vagrant    false    220            |           1259    33276    users_mail_idx    INDEX     9   CREATE INDEX users_mail_idx ON users USING btree (mail);
 "   DROP INDEX public.users_mail_idx;
       public         vagrant    false    220                       1259    33277    users_picture_idx    INDEX     ?   CREATE INDEX users_picture_idx ON users USING btree (picture);
 %   DROP INDEX public.users_picture_idx;
       public         vagrant    false    220            �           1259    33287    users_roles_rid_idx    INDEX     C   CREATE INDEX users_roles_rid_idx ON users_roles USING btree (rid);
 '   DROP INDEX public.users_roles_rid_idx;
       public         vagrant    false    221            �           1259    33628    watchdog_severity_idx    INDEX     G   CREATE INDEX watchdog_severity_idx ON watchdog USING btree (severity);
 )   DROP INDEX public.watchdog_severity_idx;
       public         vagrant    false    248            �           1259    33626    watchdog_type_idx    INDEX     ?   CREATE INDEX watchdog_type_idx ON watchdog USING btree (type);
 %   DROP INDEX public.watchdog_type_idx;
       public         vagrant    false    248            �           1259    33627    watchdog_uid_idx    INDEX     =   CREATE INDEX watchdog_uid_idx ON watchdog USING btree (uid);
 $   DROP INDEX public.watchdog_uid_idx;
       public         vagrant    false    248            �   �   x���Kn� �9'�!��RԪ;K��Ib90���}��l���c��e�;�{sc\�U#b9��q��6�X�sI�N�������b����gA��������C�9
�'Rv�ݮ�˃d��0c{1<K� ԧ/'��8Ü������9i�h�`N�`�S,-�Ez�����
��j`�$>V�s�0�r�_ ��<���w����覒�+�q���4C�B��z�_I�e^7=�j%��P�J�!�VUi      �      x������ � �      �      x������ � �         _  x���ݎ� �����FԶ�w٤A=U��m|�b�,4����0Ԡ4��Sơ�R� �A-�F��*��$9(����,doɔ�b���̤rp� H�G�w�'4Tu���9�]%�J���%�[F���Z���F�_TW�@�MZVe�;��+X�/W���_�_/�岁���};3����ݛ!���و��_�I�gUa������9��H���ZWoXM5��p�=���i�R�7�.T��`;��>�;�k_cx�AoQ��V��3�E�B�ܖ�ƣ���6�P���Z�;Z�b��${�/C�F�]�,(ٰ����؆�����"d��0Yd^_�kD?I�<$�d#            x������ � �      �      x������ � �            x������ � �      �      x������ � �      �      x��}ٲ븑�s�c&�]�T���#ɮ�{������!6"��XIJ��cz�� ���}��������_�=6ݏn�����s����m;������g�v?�3���(���8�O�S�<�t��T�׹������N�t�.� ~�+O�8L�f�Z~����s�����ė�c+��s�������a�v��$�:����n����ݗXm��4��U�z����;\�2��J�K�3S�|�"~���L�g��f�t]:�c'i�o��E|o~�~h�h�w; ꏝE݈ۼ�>����g�t��x�~�o�ȯ��)�y��8������m��;k秦�+��qtZ;A%�7�����Ҩs͐��w$O����WO�<�]f�2�?��1�d��k�)\8�͑K�.T���;�ug���i;��1��K������d����7����i���܃FQ��N�����L�&4�Lu"M�&pw�����Q9�Լ���x��-N��3������9Z����c����=��K�!: W���I���
���'����] ����գ'��?fZ�G�v���mx�'zzx�_���3����Kаf���r4�;�k��R��.��4y�+B^���D����7�[��4�,~�A��%�/l{#�l�p��b����m�=El�M��B���M��Jt���fa4��4��"��� vw��v�O1��S����H�Z���s;ia�q�(�p�o���I�mK�/�/��_�����
x{{uǓ���gؒAZ�2?�f�U��1�g���&,`7l��l�7�= �LA;�V�=��_��;9����=~z�܉}v#�����"�̥N����Q�I��n����M/��ݫN�Uݞ���=)97��6ׁ>��y�Պ�yE�Y�yX=�f�e8�UX�[\���q��Gٻ�l����}���3M**���+�\�������E§XjvwB+�������[������T�c��/���s?��k���4�ێ7<!���u�Z��OE}���;p_��������т��u<�>��X+%�̻�/����A�|���[��$p�O/�z0偘�D��Kxz6�w����F��T���x�ZpZ���1o�8�Z:cyYK_���DflK�!�ob=��;���S��]��ʞ��4s߀ryj���=6e�Z��a�N�!��u*�9��K�bG��E�_��a���ʾk�}��Nq��^�	勝ib�T��F?��{��d���z]^�f�]$����z�꿉[��ǘɵ�3w��%�w����fc�~9��BJ羖��n�^2@]ʩʵ�[��CO����t�b-گ�$��A�&���b��Mo���%]�W�]�4�
��ezaJ�c��iQ�����zVZm-.��u��QQ��/]���,�z�����s�;��˽��!���N¾Y�
�ܧ����y��d}���m�����tx+y�tx^Vy2����o��2��*�瓳C{��'���ʫ}\�DZ�zȿ��PТR8{�e2a�Y^�g����u���q��ԛ�"��� �\�i8^��?l����a�{)3�'a+ULE�����oCW����<e��N����ϺM�  vTzn�	nX�ٕ�Z�'q���i[ԩ������v&�����Cޙu����%h�W����m��9�VT��r�ѳ���k��	���+ OG�8��i�h�$O??����\����3�f����e�BK����pzr������'M�ަ��nWr���stK�q�t��4T3U�"�'JW`n��Υ�����,m�F��{h��������>�ꈡ�.Wr��|������XK�V���@��ݳ���`-��:+X�V��nSD8�1��R�q���w�7��7��+��E'��ܢ��ԶMn��*.�heX� �5�J����=m��.]����!��yO��|���6���/.9t����>���v��g�Bk��w/�g���%� 绳4pi/޽�����z�4���x������Y��Թ��Mi�S��y�#�E� �V��g!E���Ȓ�^8��K���l� u�In߉�gWy4�6s����Q�/kj���t���y�j"�{�P��wO��i����a�FE,�B�n�G�J��]xڅ�]��v!�ٞv�i�v�i~�p|�]���BY��N|V�<��ӊ<��ӊ[����@�"k�J�O�}���y�Ӝ�iA���wQDO8�溺Q-tq�pN��Ծ���~�]'��J�N�_��}5�L�Qu��+����w�If��i�X����4��yѻ����O��ԿO��c��3�s����ߧ����Om���Om}�ƽh�]@�ǽ��\���vj�;ͩ����1E\�pޙ_�2�i��27��d�U��	t�}<�����Z�EQz���g����(�s��a5�/ec0�α2ra�l
��Y��bq�}P�>-���8-�O�<�X�iy����8��N9��N)�SV��
k��%��i��4�erZ&gL�]qѶ�,������h����q��M,�3Fs�>�b���`?���mR��[&v�:l�d�ٿa[�UN[�U>�V9�(��r�*��*gT�lN��l>òɴT��h����C-���F����i�c���|���'[�Y��H�G�YIz
�����P��wv��,ݔ��t{��@���~S���7��͵����Q^׏~r��K�B�p<�:$�Ә�`yw@F��$��d��5����/���kީ�����|�VGB'����%��8���P�X�O�0�=�^��Y�g�MZ�pq��Gug���G���ޞ���d�M?�M��[B���==�i��H��� �Vr-:<���j8��J�s��=��q������|Qn�|e�I:%��z'�;����^��}�{��8�ɐ�g�t�2���)�CԬ}���>bZ��Ny b�{��bЫ	K~�OQj�����f%nw'�w�����q��⍼n����֬�^b�Q�z�_�8��������y"�}�����)��}�����M�vڈ<N�~��hK^Vy� �5����A��/��#�R>�m/Ed�gUe�x�>H�i0ޙ[����ЊǏJ���!?!&d(Dp�NZ��e,b�l��OrӬ��=��ڍ����h}y����.��ݔpp�:�J�:]��H�t�S�p�򢚌=9�;2�S'�nɩ�fۛ�g�yo�7͂�|�f/����U�7П���I.v';�W�7{n3�~f�q�3�k=����hDӫ�)�X��B�M����?�A=���`]��y��O/��h�Q޻�3������T���e���	x�h����{������ �j~�H�^�5�}-
�+�#�i5zO�7�]6��+��w��Y�5N��D�&������G�K�-k�c�Z���g?� Z>��|�C��J�wb�9������S�O� ~7�Zh�gP����%Ĕ�S�6�d|b��up��z2�^���P�2�ƣ�C�5j�w��[��y�'|��T�O����n|��ib(�N�؝�f�O=�g������J�oz�YA5`�c��|>�"����ب����$��|�eY�tr�����]�<��M���r�\�"]��*�Q�7��y�eǔߒ�d^��cyJ>��|�.��A�^��;�-��9I�J�l9^��e���v<9����z%�QPҼj�ǻ�CxU�����D�kJ�U��;�f�d#|z=��.mm;�ԳǴ���<�M5=��/Ͽ��]C'WqǁVx�3���3�=����!Y����Ƶ�f�F�o>���}���_�Y���j9�����x;�pC7"���aOq�+
mI��AO���S����vW]����V���(�b�!ֆbp�W��j�)� �u��VgTi�������������F�MF���ν�W���o�s���'x(�4�|7;�)��m��Zǋ���^�3�	�vb�b��p�����yn����8<%�.����}&wux?ϛ���u �g���}�������(��1zw:K�Q������ldIv���țu�z$�����<`,�8�zT� N    <i��|9����+������O��nL=Mq��y��:I�A��/�9�6=B�o|��ɻ��]�;Z�"��]
��̸ZA�̿�;�]-ޓ�Zro|y6a��N�YH�n|����z�߂�	Aj���r"b!��v�5�������Po���53|ǎϥM����fU��M����_C[.�,g�*�9�_�"fV�|_����#C���Cz��i6�ӓ�ؚPٔ�5$��ן�ϡ2���2oƮ����b��¡Z��ɕHv�>��=�>+^��j�����q_�.��4mj���Ev��-z�nY��Ὓ���͓��d�&��2P�}'^�EzNЄ�Q�+Jsߝ5Eg����ǡ����7+���>|-�[90U7��� ��/�yq�2̈́�7�#������9)�%�ד��Ìf�n��p�f�e�Z��S_�,i[��)1�] L^i����S�GF����p��w!�w��yW}�{;���cδp���z��m��<��B+9��F�z/%�7Ⱦ���p-��̓O���*[7�e��{!��)L�wȝ޵�}j�,"�Я0O�{���.�%T%�T���������e��Wu�Pv�-�Z���;E�r�����(ҁ�F�趛T��/�Z�	����s�b z|���^�����L\,���Bujp��+#�:�[���v'�;������v�<ͥ4�[D�l������|'竝�9���Mx����N~w����AN����̓ߝ���w'�;&�s����������w'�;��!��d��Gp���+�����e���v�c����_y������Tڞ�)�-�[T�v���ן	��!(㮡Z���:e#�7�����\��s��;kM�O�����ДLOQ7�;�
�h��9��U�������:�lɅ�<ŭ^��+M?Mv�OG�9��~w������f����]����^e�Rmy��O��k�秄{uE>����+�:o�X6�zQ����M�.y�s��hwwU�qh�9'��W���n���ƻg�1�vX�;V�,G�M������ΕBS�D�0�=�9�l"��j�7���j'p|�	��F��نv�Ɠhu��$��.{YK�E��'�Y�g�iq{r� l+Ey�m����n��Еc�ө}-��}o�c�9�#��i�_��ffI�	~Yvh�ɵ��}Bi�N=<}}L����Ë{ɳ)�����{E�<RĹ5����h�|�ի�����)�y7�>�kpu��?�e*!Ћ��c�ٻ(�3� �f-��|��3u�=��7ҽu/�YGw�A#��B~�m(�����/Ҷ��0=}�;p\�����%'1#Rw���-�G�SvD�Yw՗�k���E��يɕ�<��d�4����[1��1�pޖ��`|�ߥG�ȜP�]��c�o(:s�w�v�����g�o�'8JO���{��@7}�ƣ���ĺ�����k��\�|�\֧�+y3�^_	�/Z�4��X,/�-�ҕ݇>�w�y�r�o�[���4;�	�2��}1h���0X�͵�<j�sb��$���G��em�]s�z�S�x��#�ZY����֥��l��Ȩ�)�Q/v6�yM��TķnӰ�=Ȏ�#�9����A���ky���u�������O�z��z�N>�p������dl�I�d~�m�3mQ�A����A���!��gM�'�>uC+{����]¦��QCM���[Z�4��Qzډ�ˍ�6'� |Q~}�<ټ�v���4w�Ap)�鱳�x�Ov��8�[�����S_�z������{���\P���\�^�+=󠧲��G�W���R�e7,v�%KN�ߥ���"�"�j���;��8��Y���j�f��9Gu�{���[�}4��;]3�k��A�=t�H����v�}+�c�L��!%h�Gܻ~3�'`�I�	�А?�BM���x�jj�g��i~h�P�wO�������Z�~� ld��3.�r�
�R|"W�"u��O�j7	�{��bw0�_��	�2-�\�/��n藛�?X�@��X�ި
���V���s9d=�����5h.����Xb��K}�/���/d�$k���\��N���	��9���?�UU�;�U��dE�[$d%O�Wfy �z�p�ȍk\���l��L�MMp��^)|���U��v;E�M�7����Qc3��ڠ�V�*)���kkDTW�ta�QM�_yU�����j����'p_+�r��g�3c&�+���X����VJ� �V�����ѫ��%�o(��'�;y쳔�&�����rT��ʨPf�B�����:ɞ< p���Wz��������D���W�K��*FG�b��±�t�,ɥpe;�v�u���O���+�_@��C��G�۝�j�iI���՟�o�� ^ž&�S�����u�M��	�H�mΪQ���!�'O�ԽL��%ϛ|���{:��zt��O���ǎ���lQ���#Z#��F|�8�#~�9�|�=Y����wKۛ�o��N�d�eV���E.w�6�����т�����w,��A6w�h��e�����>�Ըk������r�$�Ő�M��;}�|�����
z���7�.S�鉜x��w��dB�C7��͔&�4Ȝ��xn���.U�Ә�<�i��k&�����#�媿��:���AgO{2y�ե	�q��LAr7�/��W~\A�˟�Y���,�#����>^_��.0Y:6L"�uR"��k ��ęs)����J���{�j}������>CIٝ�}��;K�Ĺy��;�7n��l�-$_O$F���񠺪��<����X6�?seϺ Fi�L۽����g����~D�H�����L�`N��N��U����.|��ypZ,>&�Y�����|�#��nyK���ҕ��r�.�u�c��Q�j�=V߿��\H�9=�+��U�|]4���݊\N�3��g8�(c����b.�l�d�V�uR�L�O��Mg�+=��򈞣�m�(_�_��Lp}�����@O?=�@�a���jܳ�(��~�#5ɝ���)$����ȵN��/y�b��-�q���G����n��gIn�].�;���u�.�E^�m4z��W}��%dS`�B�K�����>n�ʶI���k:����P�[���-��ڂ�<�3�_�d��&IR�ǒ�,3B��DY��}E��;:]���+2�-T��Ysc�#d�Ɛ���Z��|�o��C|!1>��Q��E���F�\����e�S���T�%��j�ԍmt���C5ӫ������cԗ��<�iƵQ�^�+c�x��v���rTꋑX�A왂��>���>�E���0����D�����G�p�n�17����s�׼�s�g-l�l���}7����`���8�ϒ���l�pٖ���d��x40\��d�1z��1(��z��F�<�������Z�jǒ���0/$Yl��Kc�1�<�=rt�d+�!y宭x��	O��h#�b��N�G��@��u��xa��O|*���8|$�Ş�>>�~*�m�uԭT�����,::��Ws��>ruR�C��2��٠q�}3�߼bl������k]����7?d�0=�TvwR��b���/�;u�����~Ѫ�|�#Jr>���KZ�Ԃ���#����Xz6AJѕ,�V��s	�ĳ��a�]�C��$OWJɠ���k��k�Z�2"���:������;.��h����ы/e���5]G����ۃ�|�=)C���Sq�L�f���;��XA�����r��.�Z�4�4y��������~�������/���o�y�y��T"�.�n-��˅WO��;�h�FL ��(���!�JN/�\�r�F��!�2<�{�.ey,��F���>�������×�������x��I�?[��fM��3������ڵ�[z�7�g���\oxn���E\Gl	��J�U�Q_�D��V<˧ZMk��%�V��|<�����/^�m ���8��<�#��f~��x2��� �{�ͧ�1 Mw��ŧԥ;�v�Co������?U/;I>j9�v3� c�r�^���3!�wOm�����❎�w����^�~9;@�%���i���T��|uy�z�    �.�����P�~�7�h'�Ǆ~r����w�.���[�dH,+LH0ͫ����vWG�n�K��u
��~��wg�/�S>�֜���?���v�a��o�φ��_���+��	����1��pR�w�f\.H�!u��M%m녈�v�^+u��f�l������!y,�j��K��ݥ��\ e�e�tE�lIc�o�MV>�����ut�j�/w�9{8v�٬س�0E�y���c�<��:����]��y'z�k��U�T��NWY�G�;���4�δ@��ON���ON���ON��=��[W ��4�BݘP��x�,��H��͛~=ES�&����2J��^�*�R�[�x����>,uפ^��7�����}��Q/'*�'�d���5o =�����	O�KP��yV/p��$'^���Gds�ѝ+�q�NSo�s��=�C�2
��Ѣo����R��}��
�<=k�ZM;}��*���'CX�a!���C�{ӱ���&0z:�78��ы<1	xCB�L<�����t
,����y���o���e���_��5D��[�N5�b���,+���s]����3{q����w��o���I~��Y'3����y�WH��[�Y��XԾ(Mjl��+��m1seR8�-PJ����|��إ	\1D�J�wß��s��X�'���pDy��X�)m���?�����{�M��yެ#��Gr#�\v.�#Oi�]G}+�=Ǚ
��w�����^L��������xpBɣ'���ڭ�/�����^���o�R��;�Z�{��s����^�o��3��u��N?Y�O����iUN��9�w��_DM ��)��8�}��1-��{Be��r���V)�eH�ko��yoO����yq��6�9�8��}5��(��u�n��	���{K��z�(��t�N��t�N��t�NѝңϨ'�f�g+����}�hȠ<���)fo���[���u*~���o�H�[�%/O%�;�"sX���+��iGw*9F*S!���Y�"g�L���u�(��3��`xi.��l��j��ˁp#C�f�'����?(��{t��;H_�#/Sa）P���y)Qe��E��Ofr�p���rciۿ��<�/�9��
O�N��w'�!<���ӱ��ul����N�´��8�� naDy�C��0�,�I�@[���2 4M\6�	_]׽�M�ω��ͼ+s@$�ǻ��_D,.�	����4��0XwQ�Ae��7Sn��u�wǟF%o$���K_n�+}��=������l�����JA�er�O�V��S�3�z�Ep�TA��nf��f����h<�!�(<�Cj���ꐯ�:�H�dr�:g\W߭m��͊��Kw�H~��k���jZy�W�Lu�f��ۑ�^s����d���-e�)aC��c��䝸�>$��j��v��r�[y����,�<��%e���kvfT��z�Y��.Z'����ߜ֨*�H���L�:�)�'�M���=�tI�������l�n���T��qr��	C)/B�!�T�n�	`����p�t��r�ܸ�� �5�n�!Oy���+cS4*l�Z�6]zG���ݫ��ػwAN��	��%��Fe?�>�#��b8�>u�f���;���q���uQި:�5c�"w��}}��5���L���
R�����tFsY=Ȳ������N�iy����5��&ﳱF�Ʋ���e{m�8���[���ψ1p�yn�� ��u;�2�S<+�L,��ol`?e�jS�%����[�d�$O�;�}k��$��?Yv�R$s�-JѴ�bM�ҴC���a�L�W�Ψf��#�w�x�7yB:H�7�D���"��O��J,�f�Hl��s�H:���ix�1��d`q����v0^��_�;�����/w�.��7��Y|�ҳ*���ć�w��X[��).���6�wQ�ʍ��/��R1��m��|�T܃��)�/UѰ��$+f��)��e��'�k����Q}��o��1r<�����^n���u��lxG�-<_h���v�W�ܗ�Hq��Ѽ\7�o�٣���ձ
;L�I�iod��b&sF߱]	���6o6і}��	]����ᕓ�.���'.�z���
S+�X�H{8�n*���Wu%�y8�)Cak��DG��p�<]8���g��d���3w,7���ss6���n�?��f��'c�Y��h���ewӺ����r��������������{������P��b��5���JD�D�@E� K3EtݘH�ꝋ��e[���EF;1��R� W�R3�d�V�p�<?�5���)ޟ:����|I�J�T�i��GQr�S���܌���:U�$�T!�P��wF��-�v� ѵȑ#�H�s�2�2�%��5�`5��5v�I�4�����H�D�w���[ �==.lD8[��n/�U��O+�<��nb.�n�1�з$����4�X}[���=MiQ�}�6�}e�ṵ�Q:n�ႌx�/���e��B���OY*(M�v�;����%O�e7��0w%GҦ�>f��[Ȩ������~���?���?��?����_��������?���B=����4�K~��5Ko@U��.�	(�]�?>gԶA$#����0|B4�Y\~�����~�c\*V����ց����8�t�u�ҹ��]�\"!����66@t�s�����R4]Z͓�(�ER����i�P�������@.Ov�w�ݐ���+�MK��.�:���p���w�o����f�=	D�}\������!����u]�N������;�}՝��o�ӄ�W�i�e��A�~�!4�|�z�r�LBW	-e<c�<#�ct�3)�cܹ3�<��<dk��_�U<�C㟦)L> ,���_��?��y�ﻥ q���M�?�Ӡ�m��g-cO���!-e���V��o�X� =A���!n�g.���j���4�"��/r�Y���n*m�<���c}T�.����$x���=p]�ɷ�S��x��$����liӁ���cK5`zw�g���Z 7���t�E�����Ę�,����-�xm����)фH+bSmJ�'���C�~-��Cm�$�p�.���%��m:��
���$��r�+�._ĝ|�E��T�I�"�'3#t�g2�k�UC϶E�J��E(�k)q1V��|j+�kYɘ ��0�Q��H�l��\̂D���P\�p�s,�d}n
��.�?>���?^���}z�6G��*� :T�D�[�}s�U��z���Bf��A߼���I�9�1���s�91��qܸe�ʉ�?�v�[	zJ_Vk�nPc��%]�����ɗ�6�,��[St�j� �g�ؓ�[�"�Ƒb}���Yſ��a&`I����K�^͎�~�(9Z/W��o�����C���F��p�n�;ja4-I�dsM�ƛ��qk/��8'�k����)�����*(VCև?�n���t�2�t6ܪ�|z��2,����}�m������z2����9�vhc�lӖ'���ѡ44ϝD��k�Jj��w�4��4�M���'���-l���7i���sn����F�ȝܒ�ѻ���FU��9�>,�s��!�^ ��޴o-Y�E����o-�G��#�{�c'k���u�to�xH���r+'�y�vk�'|��^}����(��=��g��/�?&]P#����#��k�e}���	|}&G�1˾q�Fb1����M��Ք��t�˸�Pv�O!�_&-�.i�����T���i5� ����7�V���A+Ѭ�d��F�$��Q��<(-~�N\5�d> o�ĨiD܃�J�	ܓ���e��#d1н܎C�*�T>:]9�[EW\�;z���;��;��ZJ�Mp�Nѻ�m�6@��{���1)ߙ��5�X&�^j��%pߴ0bx';+	'6���q0�BO�
�xf��U� �/��̄iR}�.��l^��n�Sw����m��=�������#�o�0�(Z2��<[R�<@���N,6�ts�#���$L�X5�^E��oP��v0��#`�� *��KqV]���D��B��g�!�Ǭ����n� � <f��p    �����g)��¹����s�?�jp�8�l���My�����G�1w[Y�U�YK��7��0�B��:#�F<�j��ɵ��8��+� ���|�8��l�CYlL�����s���/g����`�ޙ�v�4��>%<ȌH��F�V--;Ѿ��2�R�c5\��JP�����ӭ��$���'�O?����K8�l;훘,n�E�v�������v1�KO��B:�O�c�x������"�m�䫴�M��$d]�g���GF��Y�XI4�m�e�}Li��	�� s2\Ǳ�9Ye��$`{�����5[���Z��0�*[n���*�6%O��(��Cp��K�m�M?�����Q�O�v&��l�®�6�[#�W5�LXF��n��y+�Z�j�qG��L��4�VD��&�[	�RJ8hč鱜�j�m�����X�OEZ��,b�#��b�4��(5�ֳ������*^ ���7�\+�P���;5�|j5�.��`k�9EP��󊨣�ԡ�#:_<'��5<��F�Ni�2F�u;��Qן(�����B���b����r$��ȃ���tu>e�K(@�r�(�g(�
���˔B;8+>Y7�~��1:�/���L	l�s�>%���F1Щ��&�/,��X��#gٲ�0#���Vrc 7Zut��~ޏ��Lτ8���������#�y?�]~1�*����E^
�O8�zgZ:<���5�����r�A7�<�	0��.��V���g��bå���O���2��1Gs
�T��A�D�uy~0�h�ǁJ5]��r�SpF�$�K5XSgsi>c$Bf�Ԁ-ca
����ל�����ﶿ�m�Q5XUg[&.�"����w�j*l����=:����v����<*��(���'��_0\����)�/ѳ��|r/�����
v�1#��?��"�T��%#"�֯�������T�A��(ި�-��uu�[#��|0�h?6�a�:_O���O�{l����K���)�y�5`���m��3��Ux!T.[��ɥ�LlR[/ �j��`�*�"�nc��k:�h��ߖ�e��|7KL��M�>J}0��8}�*�s'�Ws��� �g\�:.vm�+w�P���K��"&s�?�'s��,t�����Y%��������Av?�Dsp�b9����CfP�l���B+OO�X]�x����S�;9�I�˒`{��z�\�ɼ5��Ctp�u�A+�2�U�����e-��}>��}�N5�4���P�����^�P�2�Y�0%Ю��SV��κ�\��)���7��V����e}���ZN���'S1������_�Y��1��'��\�����ꧦ�h��U�~R)�a���gEg���b��G�R��b�Oztc�N��VQ��R�G�#����I���7?EO��/���}��9�2�_�aRm(���QO��[e�����G��I����1pR.zߍ�]�GU��/����vJ���|��7�-^/�ª^�G�%��H�J5�l���p�v��x�cw�G��#�D�&��lY��|fj���l'j��M��I���T�WQ���(���0��������L���t
����xёf�
�8� YF{f �f��/{E�������`WkeoG(r�4�)���H��S4�]:10g�_G�<����U俱�MW)g54Ql�}(�t��<��v�Y�|7�y�����2�s�`�Nl��r�@���xA����=��W?���8�|r�
8B�G kO0y��I�%t�翈z�fԻv�\|6���'��`�s������(���y_1������>�[[���l�Ң̲�e*N�u�(�\ɭ����L�yV��U�Jgb�V:�M����/��}�=���ykr��-���IXe�j��ϑ��G�#~��蚿���CU��܈슋|�U�CMݕ���Y9���/y��E���5���f��ۜ�1-x,5С����Ņd�TA��P���Y���_�=����U;{�Ņ���qG����ɷK1�o.E��Vϫ�\�C�(��Cٷ�:��I��ƽ6�H_�I���yPI0����Ȇݵܧ�%�����Ef�˗C��z���.	ù�#�&K�}<�{�g���HmEM�-�E"�?�
�f��I�Zcvo�ɽ5���)�%)';���Zex�� *�8�r����(��n�F��o\k�b��	��3�gj�J����S���_o@�"�ނ�嫋Jp���b8�Cb���K�EW� ��d�]�|Z�^3�%z,�͜(�Bh�D8o�#�]?��I����:�zʌ�ΕQ�D�����,V3�F��"�W^�݊��wѤ��7���L!a�O���1��p��]MJ'� hc�E�u��ӓ��|�a�u�(D�{'/S�f�W�����y;:��L%�ƴ�݋��r��%�+��F�>_��o�Un{�*��-��a�#g�5���o�]*Ӓ!u{���6���s��1��cցi:�Qe�걕����%[I���F�j�i�y@:��Ϫ�PR�8��OQ�k {^@.�a�-�_��jp���QN081�ơCЪ�W�gi��R��r�{�aU�y�-��\��q��W5�f4.�)�q���P{�ƅ!T6����PcY�T���?����s� og!]m��MIP�ˎE��S�BΞR�zJ���������3	��DL�?���#PV�j��QrT�}sz��y��1rR9��9��1�x�8k����"[�1*N�j('tFp���Lϭ蚋hyq�*j=J��+?������m?l�К�d�U�kVg4�BM+��}v�S�p���4�_� S^Mƫ+��i�v����Q�FLs�S Z��������W5X�A��0��z��o@��Z�VE�e���K���aM&�/�jq�����g-���#�Gulj �����3�57k�c?88�~�>��=���۸�=��~�;��ͪ�כH�SA���'����4Җ�zqM�҂h����Z������:�jp���$��"��t>�8��tY���U]��8{ߐ���R��HtB��`]}X�Zv��^o���]�N4�gL����p Z�`wpq{8�݅񘬑�h9]�_�������7r��vJ�h���g)��*��#��;��-X/2��+��J���2�U�dz]�?y{4��u����$�h��iQ����b�<-���<��(��fN�(ߧ���� �z"�7��FN	k*<���y�sz�kՀG{��.7�zwt�r9�QxU��чa��ɞ��qL���U��6p�{ؿxtz�l-F�����.YŊh�/�����Z���(�`ETp�Kvsm�����869�G4p��~�;�0U˧0�)��#��*���։��3�묓��j]�잧W�oh�=��iP�N����^��$�g�3#�3��aQ�L0P@�ݰ�D��.�v9k/
�j0�?�g�$wUtk�x�PJ=s �)Q�o;�X��h�鑤�>#�����]4�V��ew�U���}h�䙴�,n�pP�����Ħ��UEa�z�ԙ�{���匿Z��.3��O�	,�}������������[N��;�7F�TGd|{�e9Ŧ���)�A��}��y��������$������P<�xD3=��d��q+
���ԫ�z�Oo��@_�=N/*��\~i�� �̦���˟�x������?��_�x���_����5�N���bM�L�^�-��u&?ܕ&Iڊ�;�l1���Rச��P;��JE���q�쎗��!�vʄ�)��F3��<�K��|�nP3@�
�˭f7������T\��q��x\�n59ok�ݡ_R��̒ǣ��)Q���� �����*�3�C�7nR��I��^��w��4l�C
�TGJ��m�.����W�_V�0o+_�X��4�2]�[<7���\L�ې�(�G��o�u��J�R�1n�ɲ�v�&���!����GO8�w�M�������9Je���D8��ܖAB��k��D��u5银z��Z�o�l�X&2{�u�������3/{    Y����t��BzB��9>�ݐ��N:e=f�D2�n�s�3���2ӝܭ��H^�t��:��N
�Z�����ϡ8��Ԟ�H����LQOgr��}�cQ�KbǸsg8y��y��zA�2�﬇�?MS�"| ��x����������wy���4�Y����v�铭e�eì9�ZX�[OfN��k��6et4��fM�g@$SeG�I�>�U+��%� ��%[��ɶ΅��|��u�o�]�;�ޱ�2R)�x�S`�fjh��E�V�|����睘6C������ecae����ܧG�&�<����z�]�2�����r�_���$�t�+���^���+��L'�.�9��W����~��f���:'y&Û��p��Pud�nV$��V���1��{��`��,I����澣l;�-����)�̽$��-r��c�J�O@օw���w�S*!�n��ˮX��ܸ2]ϝ="�Fuqt�hI׾z�Ϡ.^J�U}��gTZE�x�(=�����G��ɉ��vɰ��j���)mWQok��ro<]ў����˯�#��5^R���A-���=�H����Shɯm��U�{��f����o.���/�.q��T	~��'u9#��J���6��L�6o6�uT�wY��f�Ky-#�Z����c�UkE%;M�=٦%se�Bq�Rt�8�g�c��26L6ܐ�I�7O������E�1��_�p��`��<�.�m����:��J�j�����$|�U�����{�[�	���mJ�09h}���7և�}��*i9Y%�:ġ�U�x�~���Fo��]�{J�7�a������l�
S�����jl_����KcG*"���a��o���^�qh9��O��΍
t<	ē��2i)tah����0@�6���a6��"���f����4h%���`曨c�8}#;�<�領$w�����&�߰�{H��nw?瓓��o�q�Ɂ���Ĵ<+�%��rYS)��Xup�J?ಜR�X�;��N�^ir�6u����G�T����{i�P���L��,�]0�9��O5�S�)�w���y���q:˅msP�/$�T � �MǙf�'mÈ�$�(����&��g?u���Fc���h�zj�z�;�ޏ���YX��x���kNLV񪚓�`zMՆ�5W]��p�O��I�,fܸ�����;��z1�w
�£v(���|��ȹ�o���ݔ'� �m��ps��B́��A9u~\Y�9�nt��\�h��:�C�����B�~Ö�2Ǫ_��>�.nq��*��rV_�7{|n���$���n�0W���3�ow�K���o��h��T�@��ޜ��d�|�(�R�w3g�qH}x�����W���������;�V6.��^�5��ޏ��k��v�pu9��q?ّ�0��_?�#������Ϡf��ܲ?�k+#�x��/�	c������Y�'���z����w���V��Aj�6�{$n�MwJ�*�Dμ3q�x%�J�pP��� r��t�)ч{�k��D�@9���U�����5'md��C�ݠ[�� w��.;XAZ���|ܦ�Pt	[c������<�-g����[���0�T�i��B� ��w�#W���9v����?����H�^<x	`�38��K� �K�7~H��~O�ʔ�9]O�H�_\0�e>��`��|�犋�0���'�h`����S�ZG�9˖9g9��=����"��z%>�v0�qH!����]y"�]�I���1RdِHڤs����P��.r���J�3���*�I���u�)��j?���)[.N4M�cϿ�2j��p��46���������9PA5���?~
���Dpq2gA������\�Rػ«/;���E��2��_��?Ǟ�dF�|X�B�"����tH���@Ox|��AZ[���[4�m�p�S\H��}����xa�P���.3k>~�\P^��=[��!�e�0�A�Fݞ�5��A�͖��lT��Ì�(l�]Te�$�}�-��c`��	��0��(��il���9�~:.��!��i>(l9_�LXR�. ����Ņ��d�̹��Wo+t=���ݖ��2`���5D�l7�σ4�N�꟪z��K�d\�;.l�IA(9������	���:_�p^�j250%���}�zu$�t�^�0�mGn���z�<�&��glﮄF����I���&�������\�h!�Re�\n)q>��F���`��U^�e9y����oT�gC�N7%P���Sf��h��Vy���������.-�E54��iJ�é�=�Q1�ښ�WB=K��z����etb�u��������6½ѕ#�'�ޖ�q�Qe}��H�˖���jh05X���������-��j���8���~@VY����e2����PJ����@5t��BR��
�QE`�C�L5���M�N���s��E|qU�� I�o����RM�練�d����T�5E+��_	W3�M��8W'2͞
]�w���U�s�v���g�}��|ڱ1����ϕŧ�I���y�g�
�?�g�%���c���^ѿ�@o��7B ve����^ݢ�'�=<i���|u��L�k�`����]�u�	zp5�7Ql�U(����7��ջ��M|�*��fr�{n��񄮜'��4^Їy�_	7�07 ~�z��g�n?����#T��m8X�sx��%0O�/��?��S����޵�B����Yl�ύ��Qeq���.%���ԫ�
{hB�^KfF��*kq�E%]v�_ѭe=ܹ)X9�L��B�`��q�G����Wұ��j�5m�E���}҅�E�ti�7��9R���HzBo2wK�6��u�L����!�;�#�̓��3���,��e�تL ��Z���|��6Ƅ�F 5�OKh�v�D	Aٱ����՞�+�q�{�L��\H��=�w�5��|�T���K�,k���j�!W��9�Ӕ!�d����'�amX'%^��F��] �`���}�vN�����YgK����B�ℓ�y�dn���8�v�N^��-,�����2��?�7�R_���+�8�0y��(�^"ԓW?w��3o3ٓ%^�~�ω��!��w����Q�])|�'+T�os/�]f$���^3��r,Ŝ(?�@"�7��f��(F�l��͓���"}��o>uX�O���;1W앶�V�ð�ݒ�������L��L1��p>�]M�E��0�f�O�wz��(8̿N#�΢�{��s!w��+D��LZ�X/�J��	�l����sÚ��:ɮ�"�j�r]�`����a�#�V�q�Z��V���4Ri�x��������x�]r��]�㮤���L����B��ā�'Yf��̒��'��[Z �|��՜�
qջ�soAٴ��?s���4VA��&��'%'r� ��rN�%ҳ}���/�sBh��u��*�k,������D[3j��I�_�?i��H���sڹ*�LgO�X�6yԋ�F��mg��$���U���9��x��������SS��m^��Jh�Ḓ��]�N�#�p%����R�˵��	�%��^�C�Uq~C/^E+i���`���5�[k�N�x'��!�E�m��7���v��7��<���r�i�&-v�:Cs^�ܾ` �/�o��u�vx9��5�^ջ�y �
m��ؿΔn��Z�,���|�K����,=��0���[i%}~b����4�Yt�����Y����l̷n��4�<%)NG=�wh��HĀg�N�a�x�de���L���dx� M�Bp��*mc�޸��Mn�8�P&��� �!m��)���.����,*x+�=�oH���O3�� X��	�v{X�Z,�M����j���+���1��l� �4l����nn݅��,�?��QZOFk��m�V��ǭ-�h�*��ɫ�5]\�c8GhN�IH�X�7�p��i��)�'�vn��Zʏ:y�K<�
�"#�v�0�[kէ�nw�o��;J�8�Z;��fN2_�lw�L�����C�E��-    h�x���͞����׺#F�lX�zt�r��(��.�</a7�o}4��F� 1$�9�8=&F�^m�xdRF�p�$xݹG�kl�+N���^*����k���մ�|ctٛ�#k����w�	��w���S5:m#����X�XFg�52�g�������F�ܓ���h�`��J>����i�a���ұѳVMt�����`���Qx����W����?����l�{ws�TO���N���v�26JطIaz$��Ho�(3����ȏ�I��o�*��u�ؒc�s�3��|�a*G�eJ�9ڝ��+�Fо%u`�=�ˌ�ĩ�ӴQKg_�v�C��":��j��ɜ�c9SJN64?�u>s��w��~��)�����ZwR��(��q(�D<a��k�dg'
ynE�7�z�Ro��E�˸��=c�����/�p���4�4���>����������������������$6��u��M��@2Ā��Gƚ�Bm�%lY캁Kh�t@�B|o�1&�W�>��Ͳ�r�BNSz���=�j���6�V'Ψ��:����馋�Z)6�����s%豆�V��L��-��_D��-=0��U�l�a?%�vU��·׈�@NAF�D���s��c��{��)�`@��qާ,ӾC�$���~��#o�7�%7o8G�8�������5ucm	P#�\�G����J�O�V�w��G����hR�M�����5ݑ��p�.HϜ��m9����к�����d���v1��t�2N���Q���x �ӻˑ��y�#���q��p�LfG��A����G7��w�MH��S��i�.�7i�'��MX�a�� <�2�~���A��t�Mɘ:�4��rj��Kvdf�^����f���e/�y�B���&�(�|t�ݐ��vBח'�d��g��PZޮdL$�[b��o�X��pŝ&�������~�!����G�G�7g�z:���xF(K�a�&p�;w������l��A5��zh��4�)�@��7�v0m��{?����}�gL��Ϻ�7����CQ���d�4���HǗ���ܦ�6/<���.�H�T�"�_2z����:�{y�-p����{o>�0�D�Y�����J���7SCKu/J�2�{�[��j3܍��wH�ݛ����RV�#2�Ϙ���s�ћ��$�s�k^Rl��d�<��gڪ�`��d��/�2�n-��
8����w9Ӊ��w��q��z;9�_������%O�I���69ܫ�T��*.]��˴�l�&��a#Xg�o�`��q�Q�����V��PN�^|�9�ϱn%��'�»���޻�)��p�j�_W�wun\���?t�˺V����k��i��I��K� �*��C_�J�����tR�X�#97T-��P��z>��*3e�L��x��=��z��h�����xI��j�v�G��IF�-���B�H~mC��������0���}[p�%wv���U�J�^�(8��1��Vjϗ��U��rƃ�����X-	�V��1����;��=٦%#��Bq�Rt�8�g�c��26L6ܐ���_�Z��狮c�ѿ����j=yn]��m9��u�ەH��J7б�I��9�j}-EQ�5ج�}���x���l�՗�ޣ����o�!���U�tr�ʰ��^/��@�%^L�P_�`t�v�#d^/��9����3p7�Y�Y��%f�\�W�\}R1m�Y"�|#�f�ӏC��G�G�wn��P�� ���IK�Ck��Nl��w?@XѬ�6�V��A+�x�'3�D����Eއxb:(&�]"'����:��q9��������n�۸@\��;��C1��J}	��_�l�T
::Vܭ��<��Ѹ���S�W���M�$�h��-����F�5�'�;�ks}�h���c���Ct������1��H��B��9��~*�Q�?N3��aLd�_��_�ƣo"G�Z��9��K�V���Ǡ�r�ح5�`ZE�%�z�
Nb��iZ4���Ȝ#@���'C��Dw	�2� �������
�2��z���5=�!��p��6�c��4(:j�Ō_���!�2*��NA\�>�E8��ȹb��{S>�(�A(�n� �Q*5����ype��t%�52��t�}:!��C���*[�zh[ޟ�Tv0�z���m˞�����ס���}����;�<G��4E�.��k��ѥUKˎ_�`�L�_p\ ��JG�P�;�J2�w3g�qH}x�����W-Զ7Xx���C��V6.��k����ޏ����v�pu9��q����0��ǀ'5���KC����e/�VFчF�_d�Ƭ/����Y�'���z����w���V��Aj�6�~$n��+M�*�\ϼ3qU�%�J�pP�Ӌ"r��tc*ч{�k=�D�@�&���U�����5'md>�C�ݠ��� w���;XAZ���6����K���k���x�0G5A�9m9�|���ߚ��U����P�e�������~��������ŗ�FZ���K {����%_� � ^J��C^��{�V���<�d����cX��X
��x˧x���
7�yFU[~Y+�c���B�!��|�y���x�?��zO��ރ)҄I�e�ٹN�xȉM��A�
���{�\���`���i�䵠Ϡof~��}Yf��(�'ÍF_�8~�VW
<?jԯ�@U��_X��)����ɴ�>^4�v�r5Ja	/��&�o��f�`�k~���{�Q9�a��8�����!�l�������>����(5�wa�?�jᦢ"������:!��I��ȡ@է]fb|0�("��<髴:�C���`��z����?jT�+�٨���Q8�8�����I�l��[Ja������Ca��Q:��� �����q^!�N�Aaˑx�g�v-�;/.4e��ȴ�Ix���ӓ;��m�-f�^C��vj�<Hs>�$x�ި�����^�����[n�FJN����72���܀����q�=�����1���(����S�E#a^È���9k;r�T,��sf54ѝ?�`{w%4ڵ��M�C�����V>���.e@�*�@��J��p�4� tPGx�n��������=��p�)�r���^\�Ӻݯ�;H������%-�E54��iJ�é�<�Q1�Z��WB=K������etb�u��������6½ѕ #��ޖ�q�Qe}��H�˖���jh05X���������]��j����5rc�:l�_�7���g:쫡�[�B���e�B3��T�!�D9O���c?K�IV�*2kc�d�9N�ln�{DPe���+�����H��9[�PY���)���Á�hO����(EЯ����8�iM��Y�fς
�}8���;��*ڹr�{��3-�Ro>�
�	�B����Sп$���<���yE� ��lI;�y��|w�W��;�u��*�]Y�c>[�؋	o�D����m�7��;��Drwׂ�e"\�&D�n� �|,�,:cS��w���;������{e<�+�	��?��a^ �W�&���~�����pL��p�~� ���`�O̓�K��b���%�wm7�x���d [�s�rw��CY������A	�d� ���� ג�4����Z\=ZI'_n�Wt�Ywn�B VE:�ᷰP��i@�u��Ѿ���t�����ZdM�g�2x�t�`Q&]ڠ�M?����=��Л��Ӽ�f ��!�Fdg����U;��e���"9��B������
,L��9�acLxlP��d��f��I��QwD�K�tF�~/�G]G���xg����4�h&�����w�S=3���=�U��7Ln`�En���{}F��&���=�ug�bJp��I4@�] �o���L����,�����2�?�6�R>#�B�ơ��K�F�����4�޽�Z��μ�䕖�����U)~C�: )�E��%�r�J��?1X�~6�ݵ`�=,����L�c��D���}Ἡl4�~F1�e��    m�l\O�@�3�Y�k���3�Ą�WZ�[QXh��tKk�����6�|��b1�i���>�`M�����7�kq��F<�DY���Y w��+D���,�X/�J��Y�l���s��^"�G�:^�QmSn�@�_��1��d?/6�W���
���&C*�/C�U�ޡ��p2������.ˬӕ�����V7�=Au��8�Y��R�?q�rKDQC���5^!z�pN�!h!�R���gnr��c�&�*�1�̣���D���_�)�Dz���K�%rCM_����Seqf�u�Vu�n����C浪-酟4�c�~��9�\{�VK����T,Q�<�E^#Of���g����Td��荜Q����^FGQ��ͩ�c;Z��H%4�p\Iz�.`'�a��Xɜ ��Z}Ƅ

�t/�!؊�8������l�I�xbj�f�׭�m'}�3f��
�"T�:E�dd�^V�by��dp��4R�;�U�W8�c��K���`�E��^N�vͻWu(��E@ �B[#*���[峖����@��sb	��͝����vk!��Ϗ@��ظ ��8��P72;KS;ٓ���-������ �騇�mC����;�s����)����/��_N�Z�m��ּ�!�ʤ�8$6�M><��_�e����Eo���)���i&;K4#�n�[q$�l�"���e�����ۀ�p�Ϙ_~j_ Z��Y�SS7���PL���O�(�����m�V9��ǭ>�h�ت����5�\�c8GhN?EH�X�7�p��i��)��v�ʯ�5��j��s�p+2�h/㻵V}��vp���x �I��T�Ck �X k�d �v��X�O��?D^��߂�g9�Y��
m|~�;�a�̆��G�)������v���GC�j�	Cr�É�Iat��6�Gf�TwN�Aѝ��������@��.8��9�YMk�7F����@�V�n�0p���~��Q7U��sHº�}����et�^#�P{&@����=O�^kt�=��~��N���^��������M�VXIAX =�aE�D��������;ŀ>?�|��ζ�_-+�WA��=��3?w8n(:,�����:�tg^�XN�㎅qJ�<4�n�hBX�k����>����97��R=dؼe�W���j�B��!�D���ѻ�@���r(-��3�v�5�n�����U`S}S�(�.<m!�����6��\~i�� ξ����_�x���_�����?m~���#��̑<��2v�Щ՚��uQR���69MJi�x�C�2�P~H�W���^�����v��v��=$�=/�?���4�����QߞTq5{23+��f�eV+���{��=$��迊^��d���ma�9�o8�V�xU�	���yi1�u"������6�Q�P�joK�QO�w����	)#�@�'},g�;[�+�Ov��-�e�ڰ�|�(TT���2�vː)#�GĽ���o\�}xw8{Ch�7����K�vwW�V-�Q��>�7�:��k��n�6=�|��$�^2�}�όhe�n�բ ?`�Y�w,!p�����0���������-`�zXޅ�0\]�� u�,��N�$���F<�z0偘�D��Kxz6�q]��Od�Y�t�Tp����u(Q֜��0�y��YO;�sYw(�J�k.�(�����ؿ��zdǍ���v��Z�}P��f�P.O�w(�Y?�Ǧ�%q��;�ԕ3�:ͳ�"��:��Fgo1������u"�B��%m����n����'���sς�O���{vf��i�����bo��{���ҭ��݄�̵�U�3�xT!S���#*���_����6n�6:g
��v�
���~Y`��������w"'{>z~m��ٴ���m��{�	��ZG��ߣ�!�+� Mٞv_����ڽ�V���y��e| n��ڍCG����4�~��ѷ�s����x#I�+���Ah��Ip������:&Atdl�|?C�(Fg�I�e�6{�Z�V�=e���w������}�{1x￠��3�$-�~qavH톻�1��~����og͏K�o|���a>��v!p��M�MeoJ.w]L�M�{N��[X�q�J�T�[�o�8�P��땤ƣ������6��>�ַ����kc�`{�-'J�C]����C��BL�(��%q����ܱ��a��䈝��R����ҿ�;�DP�,� L�c�s��zi1�X�3?�|Y�1��~>��:����@��MWe�� ��Dro���|�	��F��R-�Z(�y*��>��z����0��E����ҭ�������MOhe�"�������:r�
b�D�;�Ԙ�Q(����8�v�M�b��,,=9�#�t쬆ʲ���Fgw%��u��~+�3�A��1I\��cL�{y���g�l�����L�H	�PD�`��)�ө�v�Zux>����w��σ=�f�~L�R9*��d�B㙴��L>��J�dIj:�7�rvs[��g��Z����C�}J���[���'XI�9�a���jP�ngC:g�w-�ۀ���!Y]��H�	o���0���rd�a[��Q^ث�BZt	gQ��w�os�������}z�w�IPW�CK�����V*�u{�35���N��}J�ѯ���\ӤN*$ ��T������G��f_�#Zx]�."Q?T���w'��{vİ;=*:�M��bܦt��FI��g�xX�A���}h��"ɼ��@n��ĭ����D��	R�����B��<�pO<{�O۔�=��s��P��ӕ�k|ܙ�h-H��F����%9��X�˜�#p=�*;\�]>e�)�T,�pzЁ��ڹ�������sb�/7=����71�u7湃���Ϗ���T�#a�H�	�C������)�+~;X��tݷ�aT>���{�y����6 �Ӎ���R���k�F�׻��}®�A�tM��"kT%vD�:��eσ��;U�^zL|+��`l��1Oh0��|G��}/��V"�R�f�����t(;�+y�2vj�u��P�s&��I�Pʕa��Ԍ?e��I�ezVv�Ҟ�$�O'U���Z�\��:�Ñ�,~��met};q�Ѱ�'\v��:�_{��L�|��׵C=M�G79f���K�?�����o�?������e�������-�f����}C������)]�ذ)/��u�zILbX2O����r\��*r��N��ڜN^��f�$M:o�����tm��t�HXtj=�f�I��$�B4y.oxڑ,��w�cB�R!iJ�k"w�؟	����怓K����m�eWx�Q����1�������N���l���T��Q�BK�G��өf �N:!R�q]�8����I�*C� ������t�F�Rj�ez@��\�<+� ��Yϳʄ��$~o�KS��U%��n�;0���a�����9��}��e2�&9��,����=Z�M_6���D
T�,�p#|�'�d�k�������[���;�9|�i���1�;-feʑ�K�,Jl��lE�2G6xVL���7y��r\�%c�=;�e�g�dk�mr��H�r�3���k���Y{��9y��7��F÷��Rþ���ܙ�#pÕ/�s/Wl�hWT�H�>G�˩=l)��{�N(�]k��/Fϒ�@�4q�'�,������D$�g�<c��7n>�M%+��k�a>���%�p;�S�uR�9�����h[�}���8YeXVi=:wp�#Y'^L�`� Ag~+�_��Ρ����L�9��� �{ݑ����ԧ���jP�y��40�f�X4��X��7.,��l�	[������S�J�ܘ6ո_#�-'��Kz��}���p�Ț�#���Z�/�h�� �����0��"���f�ʲ�R�����MB�~ ��tPL��DNla!�$a�d��G7�*�q���{~ee����L�O�������-T��M�M��t���'�X-�<�\_�������f !  �G7P��p@xN�F�c[�w�W�a;:�	[,fPQ�]	][Q�˭�GQ�t��zC+r����L��IDAiA��ڔ5�xU����=R˗Z_�zɯ�נb��+���H\�Vj��lp���U��� �I���R�7�m����.2cJ� �̄�8���{�i����2��JКZf�=~R��s�4%�X::+?��{NGZ����%W"��~�}�ܓ�*����`�OB�^���0�r-���N��ܺJ���Rެ8��ܳG��&��÷�n�M�����<t�%�kZm<��F�7�/zm�/^(��$x�J�Ur�������Q�Q؞W���gH�@g�	n+��\���JW.$�����'|E�^i9'|������V�co�C�H8:��	�>>jԗ`���4Uz�X=�)�$��>�����Q"�'��)���e��f�.�H�>W}s0Z�..4��#�\n^��'�"cK}$t[Ʒ��ES��hg�}(��?#^����s�����ug��$=N*��)���Y�4�$!�d�x|F&j��'-�IGZ����Wm-֔�FR���q���I�V>����WPeO-V~K�_��C+I�8^7tvs	d�j߸������n:B�7���Vh=K)�:K�"�oA�r�#����B�E��zE꾗�*gx�A��p��P��i~J=�풩 ߴ�cݞ��^�J�}-��C�%�2�ak�F,e��
�F>IO�<l��>t,�.`s���I9²�+��ܮ;��K)�E���Eݒ?��Q�F��g��{�#qK);�zx�&���샞��`E��	�դ��K	�4	%96 S���8�T�C����ӡ�>6w�B%I�����|�!�����?x�n�d�-^�N�o��zo�E߰��a�X��]�h(({>rA�b���)�[Q}
D;Hn�G{�1��������8��ҋ�[�Q�=*����b���U�2�[,�W$g\"ҝ�����u��؛W�CQC�����ݪ(X�&��4I��D��猹�aU�
���~@�{v����6��5�+�#�Q��Hp.Q����h
�k�ƞ�|CY�:��&m�'�[�ӈN7��QZ�o�VՆ����[&��:�;�5�T�4d��̓�kJ��blj<��P���x���� �`��r�y�b��o�Ӝe��gU�l'��U���f
f������Ą��/=��䩀<}o�<rz�+��1:ғh�}�*h�k��f=�K��#��|���2uI�QʼeW�K%wY�f>u�y�G�;gxS������zG�yd6��۾�Ȑ�6��}j��+q��/�Jϥ�#����A�F_r�i�����x���_N7���Ҭ�l�qVw��;)�� WO�R�7l۱������E��`�r��Rj�@~?ԗ�mȭ-�mS�yJ��k��zh�}���\�����z_�
�s��guG�u��:�_���F��I�3𸝽i�8�i�t��J���L�(�7�K��_ޗ��,����2ټ�Pޢ����Y�vw�A��SI͝J����H����Hig_�����}-|��9!$�~�w8�;�����lȬN�s2U�B�?vE6Y}�Zc&-�*��x&�9?��JG���櫨�o���VT@Z�,r[;!%��~Ib}P������g��5�/��$����<�7{������L<&\�䫄z-V=���
K���s�(�L���������=���P���W'*݃��YV�xV"�/�����}V"���g%���g%��<+$�JĽ+c���W*�Nd?k7�m�d�%۟��gU�[������_����*�:            x������ � �      �      x��]��8��]�0I��w����������`���eKYi��Г�-^�����������?n~����W��CH�a�a�F1��i2R��w��U����Z��4�����V�]m̤oF����k^���[Э�Ө��e��Z����(��ם{�6|ՠlC�8~��Nۿ�������k�9�~洐�L��i{c);�z&]�R�F�Y
ۢ�������G7C]n^�-����n��0]��E)�\�����W7�+c��=
Y�^gm>RھuO�)�N	[��B[��XZ)sr�jG+�&qj�I�v�z�m��͐��Mi�x9%��w�]��8窻�T֛}v�ۙg�!\���r�^�����������?����_��l6�#�R�P�V|�v�>��6��X[zK���/lj.H��XF���q��:�^<S6� m����^��2�qOn�M����ڱGG��O�-/`ٻ>H}�#��F��m[�Zf� \���&#�۾e�bAH���(�}����툵�v�❓���8xs��[�cK�8v>9�r���&qFD�{NӦ��I�?�gi�&|����u�����;���?9��O�s���|k�N1|3 �>���Ε��WB����ڳf�>�5���Q�Rt_����3��:� ��J���r��*���Jzk����A��5�1����r�"O����L}��i/*c���e@�RC�%@~�N��yA���Z]����o7#N
A-�xN�w�S�f�2d$2D�Pkȣ8�T�4S`�$�W�����u<:q@�pX���ǒ=pB��%����mh7�{��:.�U���k~W������6�6�#��g�l���ܽ�U��q�]�}F�75A��Ai@���� ϣ�5`���{n���S��A���h^τ�����:�JE��".,s�zk����@�-���5�s�D��zʻ+���M����3���J��үV/�M@okI�fقʲsV�9��ĝ=w���K�6�&τ��'���h�2:�fB�I�6��`���^^i�ԓ��e"��3��g��ϑx�a�?*��I�|�\A�sZ���{t��G,�`�b��W�E�{z
��/�:�����lG-�j��K�c(�Y��pmk-�����Ay>��0���������ފ�%�1���X�J�z��+���h6�����[_���i�
{����Fʬs�-�z��B1t`������1j�o�U9�W�����}��}Ek	w�|�k���|�l����t�NE��$}\�Hwo��m�q���ܘ��kz�3���*���}�������O�/�Rg��܌^�\l�b���˺���ǻ�f��Muf�����=;�Z�,�~Ì��{�%�Z�x����=I����X�g��C����7:' I=�B��� N�o豕�7zR�G�-ej����׽��7�� ���6d��Z5��a�}��5w��j�{Rߤ�U��M�>\\�gQ�pN�ɮ������� �r�WֲEy�H�P�j_<�|tIv/A\@��~�{;�%1��kO�Ls�v�f��b�p�Zң�&���߲�'����v�А���;�a��]���;�s_J�����p]<;WjY�1T�A�d
{������r%A�PG�?��֚�p����}��5-����?�}|���� q����
�|W=1��������	AfB��%���=1ɛ<;�Q���Y+���8LZ�DGRy1Ǎ�(�b�ø�g;��()Fu2Z)-ul]"E�W|�@>P'�[�nq�ɘܻ��!��Y�A��O�ާ�~Ǿ&q�����C�Rj6��f��Lk�(���v�vB�����d)�"MmO��li�!���W��3�/�f_����2�)w��b���P�u}%T�9Ӈn�1�9����\[\p蹲"X@�Y0&5��Zi]cjd�Uڍ̅-�B�J��kA�ޜAE54�ھ'FB�Œ��f쿠��$�����)<峸P{Z	"	��X���9-�.�y��n���x�L��)@���gM(�of��O��2��(j��Qh�_;ړ�:���z����^t�50_�7])28�L���y�Y�%�opT�;h�\�8r�>�7�`)J�-t��#�Z�q#��씣ְ�,l�7�B�f[Ǉ3Y
<M#�Zq�2^ O�TQS(�lA5��*�4W�"<F7�X�x���X�o\	n�?��Ƭ3�<���C�c���Vj��wL�Z+z�=��P�޻�Q�f���Ʃ��׭��Э�sfn��M`-]j��\�kYpt�p	P�D���������J;
����X&�f5�X&}�c���c[S�ΐ�B�'�]��L�K}��Hjc{��
ߥ��T���d�R/�8So=d���ژ�wC�Rz����N�)�I�����E��GRVԘ*�L=0E?u1U�YĿDn�7i��А��NOp��F0h�F��:ǃ�7x	���W�fx͐h�Hk2X#����_�?~�����E̐d�O?=-�@�B�6�[<�aU^
V�R@ q� јi��-Qa=Ũ��#8��ڢ�W�^3y͕>� F�g�]�=�Qb�x�uE����'�Ŵ{Q2�!{�~F����}Tg���泾Y���Ԅ �."�ey�Upg�ڲ�vP%|fY4R����॥��B�W�:�������bxH3�JYEc����J���u�� �ƀ�t��� �Z�2��o��98�뒸��w� ����} A������y;��迅�G�5���L���>&S*͌� ���X��
j1灼�5�lm��^T��'kLT82e��g�ի����F�߾UV=ҍ�ֲ�O�8[��h��saku@��)"'P��_IVFbVТL�^�6��Wp��ǘ��'�;hٮ��-r%&��9��U�;�S[�y;�>�T�?f}�!�V������}���]b�1�nX�!���NI���"#x�U�d�B5�P�����k<��ߝz!�%k���o<��#;abHSQ���^�y66��S�c�f܋�rM�ǒ�}�����q���1@h�N�Y4C��4Kp���
�N:�WE�^4(��8��E���:U�UV�O������7+�����Y�����u�vf�8�֫��6��@��59rtaY����(��Ὓ�i��y��o�Ȣ�1��L�����֛�Q|Hq^��x���
b}%k����م�F8H-�6��S���c'�7s�|?_U�m��Us��5��v!�m7t-��1o���d]�U7��XAU�lS���ҷ���4Tf�y��E?H݃��g�#.������ r�\(K�/��}�ws�m0�)ցt�N8��}��p2��o �a�0�]?� �l��~�o��v�z-UX5T"y��P�g�:GI�ʙ�}�-���W���D�����Y�>C��ӏx��d!E}rC��`<A(��9ЎY�����zx�y_A�2N��{#;�q0���v�c}~"�{��q��^p�KX�z�<��9GO��[$h�����y�.���;�� 3�L��gC=YA�)��5_�.�!x��$6')�i��%�|W~^^�v~f+|_-yS�<z�0;ٔθ���w��9�8����y';jz{ܩ�}��$�t�CD�]�f�z���߲�~&����H��XJE%�(Ϡ��f�O�
_�
ux�HZ	�A�:���������Y�6���\;3u�����Go_�v��O?d�i��k��f�6G�����{��U�����0�Y�,�>��u��7o�k��ݣsyv�ʹ��s�;��ˢ�o���dĸ�f�p�^l�t%{��F�/�Y{��B|G��87t�7�5��j�6�ak��t����.���8��w�	�2j��׆��>vv�0{1�p����S�����mA���������.��g�v%�D��&��J{|����-k�����]�$�}y��QZdN�^��	^`��g`,�be8��V��v�D�xz$��>����P��%��Ȅ�}�������EwQ��=�a�+2��u/�A����T� �  �/O;�p�!ľb&�/k��i;���n�J��Ԝ�SsQot'H �.[�������ޘگ���t!����ʹ�d]�"w3�-+��$�ą+�,��q:A�����t����|Gf�J[՘`T�Sm��"wQ��� �m��gh���^���:1�O%U�ܛ�ӌsJ��ϓp�j���[	2(\'1�� ��`�8���د��ǲ���^@2���k��i\�f�]<�q�>����|�&�������QIo*D����BԜҽ�zw���S�GΧ�r�h��O_?�z'�x���C|�Z޶|~�	���#��x���(ZJO�Q���'Bё���erJ�����h�����2O���3#����/���pO���H���/�ʘ�����J�#㠝N>�2��'�nz�_I���xžr-���	�=៶Gcd�zy���;�^r���s�rs�����Ҭłg�kʋw6���J,e�,<B����S_�/���AKo��FA^�N�><y��q���=c�df�g�!F���\����|<���=���f&]���o�mb�TYmo�]F���Ѓs-����� k��'B�����8d�Q�7�D�u#��&�zkfDC�o��9+�����g �m�Ɨw@o��rM���Rz�졥�}"�*ڡ��ͪ������f"3(�&��c�6�P%ξk����%:�;�!�*zc�c:����EU�"��nA���o��]�
[D�*�F�s����v��%�x[[�'[�T�)�a%�|�k��X�k`���P�����D��\K�	v���bX�W��ֺ��E �[�:��Ι�-�;�)�����s6�����0}0$����4+�K�C���DV�[�_	�{����x�L��O�wr�<J�h�O?W�j��=7�^k�y��>��^Hg7����3Hm�����}6<����^��UGPdO,���w��+'l˵
�
f�h D݌6yL�ڌ-�؀���;�p��&�=)Q����o6�ت������:N(?�~ ��r/9a\���-����6.x��\�l2��%��;�"9p^�K�7^�۷We=����=���?ݡ��<'=����͝z|�ڽ�f!���0�S�8�Cjyr�Nf<�궮�VH�h|�t}U)�d��/�󳏕uu�Xa��[��.+��Z){(c�S���Ā�eYUX��c�q&����xˤG�G���1ڗ��9�VB�b��v+�2��HF��ʨ�3+�VhQ������)d�|獿AL.��C�~;�}��k�,U]#k7��z�}�r��X<�L�7Z�Kח��#\��I�s|�^���:d$?�\��=�r�S�W��g��#E"���Z��ŵs���K�W�w�<���f�=�/6"ɳ��ϛ#����<���HrU�t�Ϟ"�[��9��hd�m0�.��]1�Q�����Ac�7�"4(�_X��v��8ջ��	��-2ݯ1��)[{�5�i��A���H�������y�қ��nFN��B��EzQ�,K��N��̯b+=�	�t�m~}6����?����8(��s��M�i��#"��u���\O��6��1{�c����'.�@e:^6��(��x 7T܏���'�BK�i�?���'����'�R9�{�I�'0�����^�\��z���A��~��yL��ȸ�#�Sz��:ĺ�W*㋝b<O]�2>U��չ��H��v����D��I��V�Y~s�VdHs$//K��'��{�۳mQ�7�ޒ��N�m	�� V�f�q@{��B����v��R"�.wst��g|��2���BE�?�=~g��{���3$Y<��Y�O�Gǅ�{���OrG��Y����a�Iu���~%9c�י��,��le��B���;Ǘ�n2�'�h%΢a�?W��(�Z%b�ӌ�O&�e2
d�3�m��o7�7�!��<8�UAN�>��^�=�]2ɛʰ���y�v'�@��a�N�AZ�=�&�5�nuO��g��oeJ��8ʴ�q�#���oE��J=�j��]���OW*�^��ZF��:�����/�yNC���'�U��+-������eW���-ks�kc.�B�*v+��+�hG9M<����t�A�n��3J��j�مӢ](��?l����'8�/+V�iuM��n��w�H*-��j��y���cl�Cx ,�`~��!���p[�sz�!�������[���D�
ɿ=�5eW���>,�n�p�,�5��Xr/������T��[ �-���-�^���-��V���.���_���"`�o��[:c���'��>�E��bo�ȧ�MY�����]��׺���oD�8	��-F�w�U�z/��q��j�\[4��zQI߲����) ���4�V�3��?��ŰT��D�Z
��m�m�V`�I��R�-�]Le<Jv���j���2,��dNa�W��N�6_��.�Mx�F�V�|�T���������a��q+��*h\K^j&�2X��^d&5�����������H������b_{�*H��fI,HB��qS��������K"h�̻Uh�̯�*��������*�((g5���@(�8Gq�ZGy˫���33k?z��|e3z�`=*v��%��p�ij3/�\��o�;智n��J���ݝe���+/�꾒{�`��M|b���JUe��[��/03;ٹ	ٺhhule�Z�q��m3�6�wB��u5�M[��P�+f�!��֦��rXٜ�V������u����nc%�rm`�θ����f����Ͻ��F�_��0��<^ނ��bo�^�A�������5�q�t�A0V��VݡK�\npo��H>��H1z�g�n�Q�xكV�	w	C̉�>�Z��P�&~���%v�uU�=rO�{}Os��}}X�5�j���jW7�'�/��.�䑣�)�xz��7'�4�|�[�[�<޻1E�l�z�'���}��~���x�=wx&���Odm�����mo�����]��U��t�ڎ��(�&i�>��ؕ���}��%~G����<�*X�<?H���g��0��ۂx.�e�.�'&������c�|�X�s�ZoV��ie��ˮ��ku�l��ܩ붎��޽��sZ1�ְ@[0�/��o˨�2ڢ3����s���e-��Ϟ�g��H6���Ôi�ok���ї� �?���ɂ�ۢ�-@�ߗ� �w���g3�{�����C�wR.~eE��<�8�Y
�u�vh�'%�E��I�7�~�u̡ 3a���w*ސ�ܾ*d����ؚ>\���/�}؃�5i��i���^�U`N9�9��rnf�?'�nӍiOW�3�t#=���g��$�*���d�5f�{�h��S��g1VP�Y�ǟ�wL������wL���f����o������n��2�62`�/�)���ݚ]g�~��OJ[�f�@���ɄP}.��]�|w��ewo��6�G2\��<p�X�f)�C�[�$S#oNǸY����ϭ�ɃƷ��k����k���:h��J,ru����R_���X��k��z`M�z�skL��1�["���%=��t:l>*��> @�O�iy����7�t���N�r�A�k��Z��;���o���Q:P�[����\p��y^���[��:�z�yt��ԾS)��?��v�&T�#�7W�����QZP%O������Q����c�^�����Q:O�+������x��k·7]�<�6�PKzj��(�����cLrM�U����?��}��Ӻu�g��5�N��=��t�F���K^W��5��X����]�4�����9JkPK�`�3���ľ��=��t�j����/V��[���ͷ�:1�6.�[�>�Fs�����{��S�V~Ӟ��t���9���?��v���|o�}sx���a�G�1�\>�uw�:��tKn롺���x����Z�12��(��}��}+r�=o���f��ws�f�s�Q�Q���-]>����L�߆o��pɔ�����/�����6�5      �      x������ � �      �      x������ � �      �      x������ � �            x������ � �      �      x��뒜8��{��g@�,1AS0Ǳv{��>��PJ��H��VU)&v�n#!t����L}�9������������2~���6%���?��t��
�
�A�ߑ��q�{�Hє�jZ����fl��j���%��0��l�zjR�O�l7�n$x}��O
%xO�Ls����`H��[6s5MM0�si<�<���߿
O�����YD߷�S[��	-�[ui斑JxϽϫ=*����b�����5]��������!�hԓP���̭����Ah�������
����Cӑ��&�-�G�on]'�l�.��Y���6��f#�Z��c-[����;
��Ͻ�Yk�Doy+=��L³�Q�2���=S[gr%?�wxR]RY�����6��(no�J�M������v�U�̹y���=��|p�V1���q=ˤм&�H�5lfvTBͫ�fk��g��^��K񥬋z.�*������7*�����O�����˿�?#H����|)V!]����^��� �"���s%i��Q�XT�����ag��K&��⟗BE�o�حc�+>~���K��Ӯ�^/eS��E�qUi�n��+�ZRV�z�NeQ����#U5��T�%ǡ^�)����^��m���UJ%���{�u-Q	O,}N�=���i:\8���)Vj��u����+˥0>�M�Nl1m��V1yY+�P�.7*�fuY	�7��Bi�.�2��Z
*�b��?m��K�4�w�A������,�0�d�LK{V�h��m=A_���"����K�I�-��-ʪ5��_�իh-��Օ2OL�"�F�w���*�"���	�[����'��aW1���d�	��':��Cj1�HI�cޥTK�D��$�N$�Zȑ���u�K���ɳ(_�F[☘������5D�iL7���e�0�t��x��B0'BVz�-'��U�̥l�f���a��81"*��C^�u���V�,ը��J��L<��ˏ�*�L]�R�g�;�yFQ.�?5���W95��=86D��O6P�&?im�?	��G��5|��\��Z��k���af�p+���>�ȣ����vdz��SL�=�)�\�A��lG�X�!����ڕ�6Ű+!���Ė�JLZR�[sy���h��'�J������`z�gK�]#�q�Z[���j!6iRV���&A�j�^���ZyEP��h���ګ�ǖ�XI���32�cZ���`�2�gZ��] 7����1�*��	k�-\�����1���ݶ�#��e�ޘ��Δ����JA�F�--�GmK��>��Tҡ�K��d�y$��gn������I�J����mZ�3�()�Z��M���W���ۗ�Z��Q�����I�lu�/C���/���=ɗ^T�����u��!��B��!�Z��`7W�>����P���>��dY��	{�9����u�Y�23>ũmM��´���B4G�����Ir�r���j!m�,�t�2q���4�:}8�X��X�5fF{,Fk�g2���h��h�U�X�k:%n{�T��~�5�.8�S��9�W��1\�;n���Ա�x�ĴM�1ӻ�]�Y����f:�X�+�:55��g<�Kb*���&��ј�4c3�݆�>�;L���c�MJ��8�a��ƫ����3�.�m�d��پuW1�kή�A6�;�g��rs~�����?Ʒ�j���Le�s�e+�zCNV6E9u�:��o�z���2O�~B-�z�̱.m?wL5��UQ�m�G�V�k9x'+��t[ס�u��Э��Z��YA��aVa�m��.�h5
Y'�B˫`��[R+q$�5����|f@��g��uM;��BOU���B���E�� $J9APN�i¿�	�i߲�t�x�c��Nx3�a���	u���6������azo|�!��� [}P}�	h$?u5|I�e+띙�^���@ꉎ�d�5ϲ�e��|V��=��q�$tSgvƶӱ͸mz��eJ�ɓĒ�e�N~�]9}U�æ)�>O���=�������,Qz�s�)~&���F<�$�[�>�|�PJ�t�P�u�����9��3���M�����������f�睢�Q��{D&��6FrI�|�zG�ØGmV��?~�0��v��i��l/��U�op�p@]5LT��N<���ü��_祲���h'��z�uy��j�h�y �����&L�7α���K��Wb  `�R-��g����� ���J������b~�X���C�U�n �b���9a��kN���͉��S����>�0�`o a��_]�h�fȄb;6!�}�����s�l��r~}ܙ�x��H�&�RV�����(�0�z�u�c����;BV�d{�>>f�#���sp�O��;:>墨����J�z�d���0�.S@���7-(�����~�������F�E��_��eR��!{) <R�ŉ�=�Z�j���Y9~�:}7�=i_�~�/�KS�mW��U�μQ̻�����|E}۷�C9�z8�U�x�l'Pg��r�Nױ�_�R��.�Ʋ�����#p��B�J�'��5s���h�U���Ѫ�Io��s�k�.,�	����6~��Kl!n�Xd)\�0OV����C���s@�?�(c5ʠ��-pe����O���j��ӄe�̽�dTcG��Z�DJ�!�eg�W�&-@V��7ᴪ� ����4�\�zjoG��q��s��'��=�L���p£�JH[E�H��omީ$*u^�6,9��O G�H���ڤ��y0>��$��E�zXd��L�bJF����&��,�v1"�)$b��ZK����OS�����N�c��]{>!��w-!�E�"6��_3�ǈ����R�_T��cY�}�*�*�.��ʼס���Q�T�̘�Qd��ɌX�� C&�SbB�c�E�����z��1����D[>dhNZ��M��L|*I����W��]��ENg�!�����~SJ���7���\ϙ��r�wO��UFgM8k�չϛ�o�^��9�D�Q�� �[�rD���7�;��TN��N}�f���ib2KbR[mFyq5k�5��w�5��
��ܾ�.���15�հ� G�$9���!�B[Et�DK�ˋ>5�g�K�ذ�rV����xM��[�(:�ٹ�`���N5aޛ�27�Ϸ7fI���33�}����RM�O����ʮL�)sbN����C�y�q���5�!Km5uLߓ��|���Hvu�^6�$!KDǽ^����ܐ*�a�Le��Ҧ2c��t�k���Bj��Ώ�l�l�f����dRË��d���6�Z�$K5J��1(�k(O����1h.�$Q<X�]ؕ�$Pw�ى���D�E��:�
����x�*I0$�F{&^&�P�9�G�.�R�D�o3ů��)5K���r��t^f��%�i�[�cZ�ȋ�AD2��OPsx6���ɑ]�g*�>�U������ŜkB/%�\� ��&.A�2���PM�~C�K�T����e�[�t��{�[rY�7]�����7ͪ3�7$O�~��}�Y�ej�q�{�{�L+�y�[7�e���Q��a����i���哉+Q�o����WyV��Dk���aɳ�ߤS���3I�I�8I�Sk�2���Xƛ���Mg�Q�x��7�:�i���̕�Ě\�u�'H��#Ht�(e�=C �%�\J�auzF)��:>�^i>�Ze1��J$������Y��mɌ�f��^�����L��2��w�����Uǥ3}Ƴj���o��(I&��\jkk�+�E���]���9v%^�J���ٞY.�\f�4Y��,�����RI2�n��]vk������1����>~|-_���_�~^Fzs`�R.�] �}����a��\IZ��j�SȺ8Z����k��S]u�u�t�b�z)����-Z����H;u��_�Ԓ��ԣv*�U�����/�8��E�hm3�sDs�n�֒.#�^X*w	��0�9^���*ni��T�����ē{u��3O�J�۬�`����oiM�Km��h�,�Q�VO�{i�7)	��HH�BI_^����1�,��~-���θ�Ly��mp�O���q�9(    �_8;T<�	�\B*�S�GHzK&��%�sL���M�F�֖�ZI���U+�3��\�Š�s���ѿ�����������ߟ�>�WÛl,�#㮉1y^ў��co�٬kh)B@%��#�	��L�8���O\7Ag��gT���[��&��U�'&9�W
#�����r�s�1���vM<�+խ���I�_���:����Pݑ��G������7;L�4;U+�9U��K�dM�����-���6w��/�~)^>~�߾��S�r��+j$@O��_�bSH�[4���^�a���c'WUWL��:s��axE�2��8�-�����-G���P�M?�K��W�P����zos-���� j�v�3�K�;+�6J�{���s�+oi�<+���j���)?���ٯ2�r�i�7e�V����>r.�1���9Nw�񔟣]H܊�W��Yȅ#]6�ޜ0�
�Շ�
����3�`YKo�6C�]c�O���Ż���)���`�y����I���m�5��0S���E��J��L���8J��[aĚ���B����uS��8�15m8A�:-��/������#̎���0#̖�~��9��O G�H��Th�8�����,�a������t���^l���_4�E&a���4��}�Sf�8�˄���	1�����y����rAv[�i\�i7��^`M�̘3~gf�A59�&դwT�=��\|+o��a��چ�2:k�Y3�N������d���J9�]���ĝgt��L���3ƭ�"y�%�U���(��!ּ'+d�~rf�v�L����]�aoA�(IrD��\O��������s�}jڧD�W��t�ӞƆ��F�6 ���lO���d�>��c;��D��̍�bb>���Lf�̌i�pw|e�����)�q_W�5�I?eN�s�����-'ɐX�g!�J0E�յϑ�!�l
1�KDǽ�S&��8�3�e*�*3F�H�&�x/�v��^�?����,�hZ�el��Sd�F��3<ez�)��|=��ݑ$����2��8;1���+��V\GWA��9oa�m��Jx��L&�Lx��sf�&]֥����f�_qSj�:_���	��̂1�K�����Ǵ��u��d�˟���l6���#�t�T�}����#r�rӸ0zܺ�$?�.Y�� ��'.A�2����8t�o�t�C���>=��q˙.cx�b/yK�"�B��k�����Yu&�����O{��]cej�s�{�{�L+�y�[7�e&�{(Z&��yZ&-�b$W�|_�M���g�I?�$G3g���H�v}�5Ң���M�Ě\�u�	r?�v���*I�j�GP�i{��t�[ed؍U5�C(M��'�"˟��G���g��D�dlj�����f�o.�[�t�C�>����{0�<+�7s�>�R�M}�g�|>ެ�g�h��d���q�d�c�X5��t�$��I���I�G��^�n����?����$jˬq��r��|9�4������;��L����!�n�?R	ϳ,�z����F�>�c����a*��~[5��|U���%|��Y�˗ћ8��[a��w��əv܌���/�ֆz2�>��`]����d���<zL��i��|���l�|NM1�ލ:�j
z��Zxt���}X��3��$������'*�����è�Jtޟ��J��!lG��Q����ta�Vm'�����0�ڣ��6��Ŝo����ֆ�L��C���p�J^��K���6�cԋU�R���#2�Q��sF̤�tS����}S�]��#�L�֪$�/����=ֻ��G���w�@D�sH��{Ň����m��>3�����5�������H��d~N����ճZz	��GXsN�}ֿG�)�q=����*ݗ9:�GClM~>�6�Dr�+ګ�o��
W���\]��9�25��o����/�%�Zs�k.�����yy�x�q��Y7U&�'"���L���}�S��b�G�)8�����k��I�����z1׆�	~�k�Ǟt�wA
͉uM���U����'��*o}��ϦD��ɜ�ω��C0~�F�/2A��]���/�I�#����U�8&͈Gu�;��YOd֋�z�u}^��� ,Z���< T����@1<Z���x���^L��f!k�/{�^�'�^a��{f@��,�/
���{�ؿ#���(�� [��T�*}�U�&H�!��5�/j�.�dǊS3�O��L*E�!��:�ݫ)��B��x�>��v�4nF�JxB�y�ç�~z�P[V���f����bWOn�o� 9j�Ͱ[N�Ubd�a`X��2��#p�,U2?��%���Ec՜vՖ��c�i�S[��(q}��ت��ϼ���;�;�	D́���*��}�f�I�u|��U欌kFn²۳4,�
�5�'ږ�b��7,y�R�����}O��g���n��w��7L���Ǟ^˄�n�s���\ʙ%ɤH��T�[V`i���ֵϠ,�N/��'�BB&ƺ'������Ҟ�,�Y.�\Z,�ҙ��J��ͦ2��܆�t��6��v#�O���OF���8���ܗ�KY����|)���s���ѿ�����������ߟ�>��|��?~�������a��"�}fi���ѽd�����-E�`9Bې@�����J�뾋�|:sV�G������U���w��qi��,�ˊ��7�<Lc5�{�o��7���v��O��"FV?�u������6k�����?Ʒ�/����F��2���/�+�F������1�s%i��Y�������{��l���;���_�w�s�m{>���x�����vR�� �PT�T��$}.�����-R�3�v��`~�NS[�}�ߖ��aCu�6��ǯq�z�?z:�S;M]}��~������+p]�S���M��T��8�]_���ɥi����u�(�R�LZ�a��u��\��M!�Vm\?c����3,S�.S���\�h�=�)#g3���H�mL�ՑM�ٔ�M�i�RC�ӡ���7̟J_�=�j)�S� O�O�?�n�OG��*V��<܁2�V�*�Js������U��j|�%�M�e��I`����k4Sa�BSh��
˕
MG:��8J��� Ś���B����uS�����q4m8A��<�	2d������U$�D0;���Ì0[*���9��O G�H�~Mk�ߓ�ól��:`��/�a��{�V:1J6CA�>=�i�W��1;ѵ�bZWj��n��W
��V�2�}��H�U��w[�Kg�S%YB��/i�s�W�E��2yft%�̘�����ƌX�� C&�SK"����������4���c'娋:j^d�N0�M�\��4>��{�\���	�m1�d;d<�|>c�oJ�2��$jXp[K��aք�fX��ɀ*{n�T.��ʜP��Jv��*�H��/y$�</X����RBܩ��L��<MLf�H�V�Q^\͚j�"�b�{�B��'g"�N����j�[�#J�����ha��u~��S�>%2�b��;Qd{V��:_@�55�o��ҙ��}g�� �{9�3sc����cƜ`(3㽝pw|e�����)�q_W�5�I?eN����v����u�����؝�����0��W�g��J/�B��},�O�]�c�T��,m*3F�H�&�x/�v����I͜�K2ڇ�n�⑳T�$K5J��1(�k(O����1h.�$Q<X�]ؕ�$Pw�ى��R�E��:�
����x�n+<U�k�g2�e���3{4�.5�@��6S����R����/�O�M�e�_r��=���h�D$C\�5�g��m�a�Ԧҟ}�0zܺ�$?�.Y�ԀX�`&A�2O:|���o�t�C���>=��q˙.cx�b/yK�"�B��k���롍_��L�ɓ����������r�s��-�2�H�Eo� ���n�ҥ}����\>������u�g�JO�>K���&���͜I�M��+����+�$z��dgΒ}k�Eg9��=���X�+�n8A�g�n��]%�#X���:m���s�����r����dSd������ �  ��ٝȘ,�M�b1wӀ����E�\�6�l:�!V�Y�����6ϊF�͜�ϴhS_�7��7+��1Zv�>�>�q�<��X%VMm?]-��z�$�c��Q}���ۥ�2��ϳ4r8���2k�b��z7_N8�n�i����7<����}H�[��T��,K��2����ش;�v����V@Mg*_�,/}	_@�l+��e������GX%�0{r�7���E�K����L��C�)XE��_�v=�F>.��iv=��2��9w?[+߂SS��w��N������t�vVe�L,/�c/>-7;�	�Jx6�ħ�0�;������t�Ңm��q!"t=]����C�I%;�z� ̷���<�v�o1���!찵!�)��n�$\���r{�e�M��bU��6}���{T;��{�3�� �Ե{8'�{����oj��z����Z�d�����C3��z�>C�Ⱥ�����v�^�x���u{b|��w�g��@�3����#��4�8	��L��C�)�z;�zVK/a���b�)�����h�"e>��w�\��2G��h�����7�B��ɑ�h��G���*\��/st_ ���ʾ���C�D� k���j>ƿ���Yg�U��e�T�����Û2g�_��O咋�3p}h��:0sp����'a:�����\'����K{���M(4'�5���We�0�{����?�Mk's�>'�F������_vѧ���&�p�2��W-�4#�f=�Y/���y����h��s� Py3 �7��h5����ڊ{1������{՞{�5/�!ڳ��(�K��b��lw|��r6�ly| �#R���=\V)� e�<��쾨�,�e+bL�|>��3��Ю�tw��d�����*�Ҹ=u*M�	5�����MDBmY�G�������]=�i��7��7�n9�W��x��a5��<Ώ���T��|�z4�0�O�uTs�8T[f�A����Oel��Ӣl���c��w?�z����P&1�2����:�I��'���ٷV��2��	�jl��8�<+t��h[�u��4���J��{�3x�=�r��rӻ�>�=���0g�{z-n̻���ҧr)gR�$�"eԮgR}oY���5���[�>���;�l
��	�랬������rH{&�\f��ri��Jg~Tg+e�7�N��&sfҕ���ۍ<?��>�n�~�T X��r_�/e]�����K��_����?k�+      �      x������ � �      �      x������ � �      &      x����8��w?�Bޤy�ٙN�,
�F_���8Aٔd�IZEI.OMWeZ7��>#N�������~�~�������_������?�����/߾��)��U����:�l��7n��;K��s�Cd�'o}�{��i��i�W���y�7�ӝ¾�>��p�y�-F���yzN��]�ҧ{s�i�wym�Щp�`?�s�sK�p�鼗�}����#=�@|���7�ۄ��J��o|��9��w'ߛ�S�>���h��8^K��c\�ֽ��+�k�Zb�yLh��C��:
�v�]
m��?o	������;�g3�hn�'}z��N�;y�=�a�=�y�~�c-�'���c��[�7a<��]�N��[���gv�=�C��9����Nσ�d�\U�+_�������������-�>hr�q̖���ܕ���ر�g�;����y�7�����Φ�,.�箵�9��V��:p��Ӷ�'�c>�m;��)�������_R#w�����5M�]&��>u�N;��w.���*�	
��_���7�ن�z7�Wk3}�.�9�����x*pM���;����
��v|j�h��;O]����\a<g7��_a�±|��~�.����_�c��=x��Tt����w�ߤ[����p$?Q�F����ƥ���Xp"����lv�2Xf)�ev��5a�̪x�-zsG,��̅�+|~2%,�o����z~��������z+4\������ezr�gƱ	�#ܷ�[��sK�L/�����P.���ykB/C�I�Eo�^��^}8��1fX�X9�-1���eq&��|��rs�0f¾��)�-�l�
zY��Ћ^��+�G襩�^�r���[z͞���ע7wD/� �fCL�~����^F��+<d:<l�y���:�����u�!��*�������h%z�ҋ(�^4ޚ�k6�xz-zsG��jz�
�uE��Y��z�����ſ���+�-D-�dߙ*�WO�ڕ��^0����LQ.����k�2E�ɲEo�e��Y�����=`�����+���2�S��sJ�S0�d{�+X�c��i?,;�%֭D��J��Q.����ք^�����kћ;�WWM/[L1���`�#��r����vv�V���#��\$f�_<u�ą[ӋJ���t<�S�*{��L�hgV���b������M|��I}�Wzs7�3��愣�d�ɳN��$G!-敖Y���Mc�qJ�s�#�9���/�v>�y{[��f��)� ����$`�4p�7wĲ� �Pï�y�X`�i�М�?	VZ�qJV��'�#2�\8����m:�٪�)9�YF/��,['`��&;`6�,�H?�e&>	E,�J�������f��b�� ��T���x��
N10��E��1��z�4�3v�|�^C1��vq̟w��N���
Lv��l+0Mc�qN�s�Qs�1��0��P���̲�)g�l�E+�=y1�����s���F�ƞ��a��30�1�30��LӘ�z�J��h�XU.�=K�B�sH�h�=`�y�����w�֛��8�M|�%c{M�V�Y��8.�\:��8��5��=�qn���s��#r��]�9��C1Vh�9dg��#�)Xe���G�L��|oS�a�s�`ޜ�8_��:�W�XO�KG����O_��tD���X_M1�ꉂh�D2��ET3<�Բ�V�#��"R��N�}VP��.��9(�W���R�yʥ�]��y:"��A)��X~�(��4f�RmC�h�Q$����i����7��3��*[�H.�k�ٜs������tv} �I} ݴ>�z�s�\}e �c�w��s�
N���b��&3nВ/�3E֪٨�U���XkFt�/�5��:��tq� �];HoR;H7����A9W_5����⬴�sxV�tC��(;���枆��9�����T'�ȗ�q���M�u�	tq>���'Л����Q��b����e���ou�b��d��6�w*dN���+u�Iݳ5:�uk$z��k���:['�@g�Gܣ���U�D1}P����s��R�,JEoZ�KAoa����OK��5��x����,��$�o�����9��2��Y��8�E�Az�#q�Y��,�.:֪�Bݚ��&���D4���1P��u6*bJK増�cm���C��stv��$�@2�@4�@?�CЁ_&�<g��)��u����E��۰17�IT|lϙ��!P��ku<+���!��9:;�@o�C��C��C��!Ͽ������K���T����<D9����*��H��*f�I�v�zi�RN �PvN m�����[tМ z '��R�G�����s&���X�:֕��&R/��3d�M|���B���\�b��PqN e��&9��� ;fN U�Hƥ�?ݗy¤���{�/��e��5kES֣�X�P;�Nj��S��*�(vT�k�,������Ƞ���� �Y T� �E'9B�z�¤h�9d^*��Q��I��8�B-�*���e1���"�Ko�6����S�Ɵ�5���Ɵ��j��Z�c�}�tE�6A����؆3�W��{�f�ʗu�оv���k����:
~*V�S���6Q��!�tP?U+�e�瑕i'Y@�)F�|�r��\=׾p*�B Y�6��b�V�)d�:�Z3`έ��b�?ek�i�?R�O��S���j�^�Y�cV���u-<`��ȇ�Q@�n�EwXS�2���<�)��g����kSl���̥X��?ݳ%Ŏ��j��Z㏌"x��Wx�|3�,$��~º�X}���b� -��a�g*I�5�V�Ŏ��_G�OŚ��{��B��^�H�:�f��5�:�G�����m������?�Q/�ɠ#Tw�uId��et־VX_����{�[���X�O�*}�D�O�T��AU�T����I�hɤ��Y�V�,G$�j���V��Lr��>V�5`�b��R��hg��"�G��:�|*��S�.�6���!u�tP]>U��ԛ@^*�q���䰾����IET%S�ny��d�t��t��Ǆ[��#n=��K���W�*}���W����!U��*}U��׈*JE�Q�T�>{=ְ��EEɚ�au��߁�l��`�����䭽(���Q�b���V�MT��*}uP��z@�o��!)щY�Zl{a�sX\��������%8�����ξ�g/��zW*���:��4��K�\;�ϢB�#j��A5��;��ZlzR�>�`�a�K��p�1���U��c�ЎW�ē�XT%C5�Q옞0��J_��U�J_m��WMU�6�l��D���szM�ŭ�����ж�*BFc��|��
���� ��E��w1�Z
��4�2',���������[G�����*[��6�ꫦZ��,[��XV��7P��w��r��f��a�y$��Q���Rs_<��������K��%,��[�g�Q-�u��X����j�j��oI�Eo�^�:|o� e��[�_�K�b�B��}cZ4��r�T�`�*�������"��]yÎJ�u���Xy����j��B�4�ڳ�^�ta�HTщu�]Tk�X'QG��E���j��L��&�^�T�a������u���X��q�e[��ӫ>���#��k�b��/QWT�}/=E"���'ξ�9��Q�!��e^�(�i�wFF�$����:~U��W�~���_5��ݢ7wD�z%��v��T��m�kR#�K, j%x��5+o��U��#RD;Y�|�}Yn�l]�*���l]��Dׯ���[�lћ;bY���OI�,po�B�jT�@E}��9'�� �P)[��UD3��r��Ї�sYn�L�2�w�uy���Uor��~-('G�T��أ?�q���"�m@�zݿ�j���%^6�'V�fX?D���.�&N`��';�
0��T��$���=�SM���oey����0�j��fȑ-���mѓ��[}F��Y�6Z(���E;�J �  VqP�bm^�O5>W���ۋ�d��p�7�U���=eg�We �x����]5�Wm���#��W��������Y_��8��E�,r��#4"T��T�?�
����=R���_��zi6�U�����t���f��_�l��oū:�^ի�l�A�Ƌ4fX	�0���A��%}�]̭��!��:I������~R��ū:^���o�*O�?�j�����ȶ��V������U����+S�+�B��Z��*�-hD�D-QH'�YxǤ�[J��.�<�a�:��]���'�z�eܢ\^���k���#۪�[Q�N�߂r����Q��QN�_�1��@���\���9MR1խŔ�w˔�#���Ye�L��Wy���U3x�V�/G�����U�ڿ���^]���S}LV�`���Y�9���'ɺ����̓
��$k��.S�^W1v�C�����t���fЫ��_�l��oE�:}zի�;hRm��_c���O�C)!/,2/e�V����j>�}0��c�R9ѼV
y�WeZ�[��S�Ϯ����*}9��F����-xU��yed堂�!!㛠�B����A'�CR�����`y�ϭcyC1������xk�L��^y���U3��V�/G�U巢W�&��j���mT���
�-�.�\�^yx�K�e�#�FV��b5���:p�
	Y;��j�x$k�'D��z⓷w�enr+9�]~�h�M����È��[����3NnnUN�c�f<���.M�8����q%0�������袪���ƚV�1����.��2S𥾆��[w�z�S���|���BR�����߱���v�=��eh�/>��Kv���8;��7ZQ��-"���mܡ5;��-�Y�vv�:�6f�ZN�.��6�8�Ӣnjl�R�F��7���[Z�!�b��9@˲�'o?ꐽ7�i<Nܼ�ƍVw�h�c�m+iMܺ�IK���Ndf�7�򤀸�+�$�^���x�(���
GY'�����"<zC�������Fe'n^t�F+���E��1ⶍ��&n]ԧ%qk�?���5�7��6.|ì������3�*0ǭ�j'*ݣB������Tk�H��d7#�^���u��=������BO��M������ܤ��c��k;�Mg�n�쫕�~�oߗn;}�F���NZY����m]TYOj�z�JjkY_U��&��~�wb��X_�l}C�e8�x�����I��8^v��2�F��|_����G�pL���˱�k<��]��葁�t�p_�o��'5��а_��p.jH�uq%\�$���֢�����C������ߑC�<���)$�Q<S��~lA�H{�{Az��(�T��5��i�XVG⚭�L��:�aAl��C%-�*��:M��+ҷ'�ci��<�l���?~���&��y��w�t��9�����^kw>��|���d�:mg=��׀r�J6��bL��Fuk�h�qn�+8���eEV��}�'���h<��<vI���Z�Ϋ�v�M�ޢB��n[�mJ��|ۂҵ�2�CV)��(��p��s�*82�Dւn�c%K����qcű.�I�X�Im����>�Se�ZTϫSw�MTߢ��To[o��T�ۂ�u�2��ޑE��Ί�y#
��7-���j0]��f�H��`�4�ԅ�ސ败���>�˲��(���w�M�>Jfߜ�m����tM������c�Y��5_�y�XY[�Xm�h�oJb';��EqUFs�]��F�-ɫ~Q� �.S��Q:O�w�M�>�^oN鶊�m(]��kO�z՞T�"�r\�����l�t��/+����Z`M��[2K��R�l�4���!��T/���Q=O�w�MT?��oN��:�m�^��kO�z-�C�3b.Vu�W��s����Xǃ(��x�y6.j���]g뼴���ޖT�u6���2�^o�4zw�T�ۣh��m��ۆ�uz����W�I�JkK��Tla?���"��jψrC��DE�:\�C�fx�J���ۭ�r�j�]{���=�^��xX_��ލ�����F+nV'��0�^��ȅ�}O��}��w�������3�q�vS���y�
�z�m�C�\k)Gg{�G���RFAu!���VvYz|��:K��y�rM��ې2��E�Κnp݀��Թ_ԯ�������Ϸ����_�|��t]��������������o����sz�{��r��f-�N�������#���v��|>w�|Vn> ��G_��W�2��c.�Ni>�o���x�A�j����@ ��d�(K��>8@^�/{�V���9���駄�$am���`{���������!���Sn����}�qr�pO_�v�����y��w� ���m,��[O�	~i�ɝ��n��Ӎ/���=˯Y%�3�nno��x��h��3^�0�R��%�ʫ3�f�7���)�yK��i�%�5xn�OT<"9W��UX�zD���u��49�5��i��쩞�.���g��\�M�v�����8�?f�O�v����W2���W?�#u�=�~ʯg}2�T�$�$�j�'׶Ȉ`���q.���m��{���k����p�~�����ɚ.��Ř0�!���xQ��-!4��e4z��6xAϜu�����]���_�ʖ~�Z#����Ϟ{k�9Y�|���>��	����6{}�|�����˦�:���<�'�'&�O��S�
=<L\��Xn��汕���A�����G˷y�Rb~&���vP�x�=��3<5G�8>�d���|Lޜ�b���sO`R��g;/}u�����x����{Yy/+�e彬������^V������K�|�,�^��EV�6Y�%+XA�e-�w�E�*o�O$���z��wG��{�����&��Ž9w Ыn���~��
{��<���i�_�S봻aݖ�[��Jl�[cJ/Ͼ��`�~]-��� Wz3+�u���� [�^��0x�RP���@����I!��q0��b�{\��a�J.��yQ��J^~�"���G\�r�~�RH�<GC�is�'W�l�+��x|��_����b�'            x������ � �      �      x������ � �      �   -   x����K���\��)�����ʐ�8#���3Lr��qqq lB�      �     x�m�Kn�0D��)x "��u�d��&���F� �ܿ�`S���<q8H�-L1b���?_��_P�S؝Z¸�&R+0���5��͌��u?N7�[^&䎷	����S���H�#Y���V%�H�b���bX��4ӟ%�
[��%V�Q�7�A�)��4>���)|�:���SG�
cG���"�P�w���"����3'������>^�;��Q�F�eSPņ��s!6T�~{RI?�j7f_�5O��k��#      �   N  x��U�Κ@���҆�p���	Av�&"�������xIڤ1D��g�\��I��;Sl�rc��'ǟ��ص�w�#�4Y�N$T�H��f��RJ�ɒ����()�ڣD�RE��?O)�*U7Ql����g�ؚ�����Y"9d�P����"("C����r R�HR�X�?�y@� �b����!ɨ�ٳ�����ҽ.�Q�sNGJD���\��bT��I��z>3d	�5i��[�!� w�3�s��'\���zrE������\t��*T]c-/��j�9�k̠��ʔ�`���aZ��>���n��oCU�d��P�݌�G4��9�t����rsL������\t��[ۃ�W��˻��I�|��Txj�u@�� �+�_\=�OtuC��l
�����}W���k6�X?�i_��5�ϛw��xΏ��	��#C_ɽ��C�^�����0[O�t�gn�)K�-� DR�Mc�]�n�9��+v�~�Wo�Q{\
j�uz���z|�?f{�l4�׍�,7\QU�L6����nj�s���s���;�����_��Gq�j��p����{��ا��>��ߜ���X,~+�      �   !  x��X�n�0=�S��H� �%90��hsh����4�YR'=��,|3�fh���~{yi_��o���%.��5������xe*�MG0��L������;_kmdh���9߂��
z�;�`}�[`�-��Q����A֝ �I�$˕�;H�~�4J�g�K���⽧Նeў�Q�I|C	P�P�dmܧ��y�:s:=�����#m�`���"���<�em|c(Ѷ����K�[���w%�Rt>�
�����&���X��xcS_x�Ie�>��F�l#&s'4�|�����Z�aj`s
���#r�:��6�*�zh�:���<%1�i�He�Ag:�ҤR�6�";b5�X��`{t';\�r���'�����Z
�������Y��Rݠ����y̐���1�R�n���Q���)�>�Li��gJ��#"zD��J��R��t�x-N*�Z�Yg-��&�p7�xD�#>�5���
�)֬���_���y��Ah��c��Ah{5��>���>���5�u��N���y|��~�ĵ�0 ��/��</q����r�(��U�<�8ì����'�g�#�T�퓍�'v�_\G� H;��)���#����� ��?�"ƌ<�1��w��	7o�ȍP����!&�]3>�2��ҹ��s-UC1�S߅���5�C��5�;י�oT������
V����uZ=��s�/!���w�ȭ�{�r�{Y�1��l��������떚�"��H�Vڊs\�HL�
w���33�g�y� H4S<�6�v��x=,eNl��$;<P�N
˩7����^J��7��h���#X���~�,�QR��@���h��<��2l%��AkOO�I1zD�5���PЗD7I�]Y�<�^0����Pb�ݓ^�1ݻA4z����K��L�l��Ɵ�d�\~@��u�^�EIގ(�`M�)�e��qH}�Oգ�2�Q[�mEy8j)ӃL��<��>fw>�
2�����rd��-F��7�(Æ�5������}��9�V�.yؿ`�7
?��?v{��             x������ � �            x������ � �      $      x������ � �      "      x������ � �      !      x������ � �            x������ � �      %      x������ � �      #      x������ � �      �      x������ � �      �      x������ � �      �   Q  x��T[n�0�6wIe{�n�K$�V#т(H9~׼��@���+B�x�a��@]f�ϴu�V�sٺf��]S
���tA�I9A�2�1AKcұ'���=Z��!q��5�0��Q�&�umU}%'{��{�Qڪi�m�F()�>n�lV;���1��E��(���'b';rd/
���~�	��2�i	��b@d�G� ���8���\�IQ�?3��y�sv��Yދ��f�̵���r��7	�{�$�V#O7x�������̗}>�]1��̣|r���#��Z�r?}
��n��o��W6��ͮ,�-�+ZC&սP�0~���,n0_�?K��-��o��*�      �   F   x�+�I�̋/I�(� 1�LC4�J��)I-JM��(���t��<B|}�J�*Jsr��@BƐ+F��� ���      �      x������ � �      �      x������ � �            x������ � �            x������ � �           x�}Q;v�@��)����� R%]a�aW�dx�}$�'������xMZ^�.�ۉ`K�e�����B<B'l�X!'>+$6�z8JMFpM�j���� �����'��Iq�Ü'8L�R��c&m���9�V�%�iv�7=b_'��FWC=���T��d���\|W�f���Bk��dd� *�(���� 2�z�����=���/ߤ!ރ8y���a�'���?���^�8�����������}�p��6m�4_dY��      �      x��=�n�8����Ka����%`�@M��L]�F�z�e��b�)�;c;U����sx��JE��X�%����s�q�����qծ���o��V_��nכ��:���㏶����zO��˟����~V�J�������e<�<���UY��
no��Þ���ܽ;��u\ǯ�a�9=ǻ�)U�K����8<�� |Y1�����x�?n�?���s����îJxX�k������h^�|zX���7�S�4�@>��|���#�N3|T�'��i�\���[�������r�QS��/I�]�w���oZ����]5�@H[�Z�%�T�-��W��N�nLBԴ���/��'���6�ӆx�Y3�����[�d���������H���8�y�9=Bl�=��}��Ò���SsH��[N���R=����Χ/c��������
���Yի���(��u�taog߽;=>�.�n�_��ᡉ.��:�7=�%���jkau;�����_S�H�z4��Z}���ս�O��[�</�[o��e?~uo�{?=Y���S���q��_�����p���C��X�k�	��4����7�`,P���(����*�{�*%������Ἵe��n��|5���z�2���a\�v���ic�GM�K�H5��i����v�D;@�Ym��7m-Dy5u��ڱm�S({
a-
Jێ�WmG���_��5����1b)�c-�k%;�d}tP��:�%��dO�Ɉ=oSx.�q<7�Jsd
����Pѻ4�eMg�w��vݫ]L2s����k�UU���u˞1��ئaL��>�=���[���?o��А��]p�?_�����&��y'���^W����-�p���k�f+��K�gG����ݿ_������VtC�9�#�o�K$JR�@�j�,��R�.sg��J�K�D����y=cOm�I�eP3QH"�������n?��p��>0Vt�1�q��h4��ߵ-��{��i8Rj`���F� O�=�o��{���Z=�"���۔�W���%����-�N�Dn�l).@Ǝ}np�9Q� ����R�����x��&AD�VðR'���]Q�"�ԏ�y8n�[�>��EQWAFM*�? ��a\�A#y�H8���q��)��B�_��R(�ņb��������r�e���`?�.\X�o3���B��%�uv;M�ӣ-c�e�0��r�8^.�!˱�5g1���%��'H�
�[�+�I&��H��pO
dD)�?�9i�Ԕq�Q5�������X��K,9�Z1�|QќF�?�.����nk���ּt1�P���l�9Z������$b(ak�v=�6�ȩ����O,�����ƀ���`�tc�5�!ڦ�m�M���0^����UK���N]-M��)�m|a�`6��B��XRb����4'f�O�a�a��f;��6Y�����/Z󢿬���t^��U�F�=Ɛ�M���.@3�,N	�.��jIǆ���e�Ņ5}yl.z�{b�7���fwz>��s*}P�fek,��k]��Bn�o;\�-�r��1�&Ċ�&*��ȯNYW����]���\P'g^�~.[/���=��.����!��5�#��ڼ���9���6g4YuZ���?ܢ�c���ݰ�uhѷ���g0�ڌt����8n�Bgf��Z�h�rED�,��q����u���t�}w8}���&/�kwG����{��P.���ao%�^��jtG�����ܙ�>��F�mm���뱊���3��BiJ�'5{I�e�0/�y<<ݢ��/���zs�w�9�nN���/��s:M(����[>E�F���V\�jV=��χ���}���(�W�v|�!_+yc���~ZI�5D\/�u�Q}��)k����<"���������u
}Mu )��� B�Q�?�t� ��r:E��_�?�t�P��:��?/�:��r=�Y�t�_2��	�6A����2u1���f��^�ѻǏ9=&�1��unN���9�&H;uI;|x��1��]�.]�?:ӌ��9�&(z�5CK��-�F�]��u.C7�?����Z�K����Ǐ9=&HV璬�0Z�P����u�pu.���K�ל~t�s��u��t<=�,SszOХΥK��z��1����%��p��9ix�ݣ!�v݊t
s�Ώ�4,̲
��=���k��>�9����,�Y�������Ż�$��p��潱��j�?����n��ח*��V4�"�[q$F!hsu�&�a�ja�v�D�][�FXu�q/��	��V����2��k�y)W
�WB����(,���^��?��K]c87��tH:��Ԭ���v� D� ��� ����Ү�z��1+�/��p�|�9�Z�ź��(Xt�4�5�2^������~8_��O7�+��{�i�n�Զ2��z�|����x�|>\������׏?/n���p�0��L��A�Vh�A���iH��<EF2��Q�@!���(�Wup��ݜO�xŻ󂊨Z(�,�7{f#\�8��,U���V�Ru���}���B�FbL�{�_��i���x��Oee�N�T�e����;�ZG Q�a;\��(5��qm�P���w
��:��``�{^S�M�K�VzZ�Y�>)FĹ�(���K�i4p�1�xmX��(.�C\҃�,Ȫv�#�7�o,i#Z�#�^;��kc�U������Y�#�{�Z����0��DIC��F�
�9rW�s�x����#M!��hc锯�&���(����0�����Z�M|��6��(h�h�ӽR�&��ֲ8��fC����%t��]��7!!���OV��M��򾠑������t�}�n�ܭ���n3���Pyn�=��T�`�W�����_���dvLO-���(�X�;Z���ٙ�>.�(��j� �CE�s)$��+�͓�4a�t��:�D-V/ja#B�"��c���<�#�x�BG�_�5��e�\='P�ǅS�`U z�B)��5MI�ax��� 5��@;h�3^��� �>�@>�5^Q�I�u/�q�ܖA	a�b��m����{;M�1	�xe�9>	�2�������F�D�fl+%J;���q��M�L�9��0��pzx`�t���7
%�t����n��炒��{�p�7|27Ȅ��WW0��D�v�#�i�b֨���h���\¿���w\;жZ���<��6jJ
�����lK�K��B�j	
ōpt��fʁ���W`�,��oY%��� NQG�z��}�~4�?�OI��DJ�C��RZ۰�a�� zޘB���O5�{Z��h�y��z^��Q ��诓�ϻ��1�~��/��rK���9�2�A�B,v
�r4 ��8��KUr�\�]��e�5Fy=�������s�� ?�t�&�H�E��e>�!�W�7��/���Z�:�o���L�4��`����Yr����c�m1V��.X�v�
#���4�r��E�X��I���������a��	�$�:�2j�(�\Uz~a���?�_5�<�3��2�/�C�e�D������2���7�?_.7O�w��5�xw�6n�[+eB���0�|6���*�B6F��Ha�&B���.{�N�+DM��LF��Хq-�т��%��Mt�ކ��a���;t���q���_S��`�2*p�ZO��G/R��x�V7�)u�ǚ�B�"�Vd@����山U܈k
��d���(�DL��pP���ꏢ��ڽ6�&�oo�S�v����h�݀K���Մʍ��FAD�\��_�0R��	2�a8><��^K:PK��by#�Jx��l�$5�����Ƿk���$�?=���+��6U�C�i�舎�!�ڻ\�}c�	H�2mX��at��?�Y;H\yAH��}�_Ǜ��]�jt�
�f���֪Ò�� �+y�U�|����OY��Rh�2��qµX�lej��Z4+�����[e���RQCq�b�SɇL���nY�e%T��~��a��w\N!��e:jRz|2az�\�s�[������e�H��@�	�T�j<2��{jc�    �E��M�iƹ�BQ�+�S��E�EG��b鼴Pf������O�%ŚF��y�0g�wB�£�M�w�\,���Lպ�X�2{�&.��&����(��qm�DoV�&�#���w.�?ƽp�Azf:�� IkKrs�9k�m��.r�VPNXo�O�R#:�ݮZ'����?2
w8D̚~���d���-����[�N�q�<b<[ץ�6'tU�2z<�oe�y��mv�_��]�#�Z�ȍ�����$Z��$��u�M1M����σ傜n��x���N�'R� �Ao
����)��`D��uha<UŪ/<�Aٕߤ���(�\����p	����S��x��^���.���$�A P"0���=�KX�ҩ��Ҷ;A�Dȶ�q�F5y9D�Z�D��a�8�횷�z�vK���ČDb1U�EL �ތl�pU4�!��wF��rv�܄L��t�m���8��*��4H���(������p6���j"{��=Q��������(�"ӵ�#1�
Y��d���O�j-�9A�D�������σ%4d���z�^&{G� 6�ߎ��kE�5u��7ҡ�{aԐ8�B�B��^��X>�G/�Ugo�s�Һ����<���Ѵ�֛9\ħZu�2��H�Ѣ� kA̔�����KzX"�Գ6ę��c��؆_��=���i����������uRn80�M 5�̂��dLOw�7���d<��
G
�r�X������z�G�lFY�8���[��u�������pt
؍�n����SO�a�gLO9�bI��*��+6�".��U�T2�y���nn�@����a?�ײE^�U���G�Y��]��k��#~���o�u5S�I� ~�Gu�Z �h";N��}�)�M�j�խx�8%����OW
5��6pxJ��]����;�b�q3��"�`���<�h�zl��r��H�����m&V�.��{h��"���"�#��LM�O���zJE܀ٺ�!����Dȼ�lN��b�P������M���d���e�("a�S}��w
��ы�q$M�w�'�h���٫5dQ���$���$�T����Ah"�k��g���5dQ��:o��//�DNK@$���'��z_��UL���Ld�oW�H)��n��tQ5�D[���l}}.�Hۨ���B��*�������|�<4CP��N����S�F����"�u��4u�UhI�����eH�i��tK���Q4�<�k)�&�1<��B�"�?�Q�E��������Թ����p��q��+.c0��"����<��7��w�Z�^�&���5WTbߥ�Mb��C���{�_����8!f�����n��Z
B�k�>�G��@�0�f��$�������5��ѿ��2
���_�l���K�k�. ���i�YeDz2@��נ�U�r��.`�P�^����p=��n׶�x�Mƶ�R�8�H�c){}F�J_Wԅ*���KyY8z�6��>�c)������W4����ޢӪ��"$.�H̫TN� ��|A��Zu6��@���� &��}�&�	�C�����'0Y8u�� Jsq*ëz*-��{�)ޙ!m�S:s����9�f��J�%���P5e[}3U=�!�U�!�h�I��d�y�Aa�˶�X�A�M ��t���nc ҩ���l��{Ѫ�Ƃ���zU�����ԗ���T�sq��T��Ӓ��E �2��\ൌ����T؊��T�r�O��x��	&��	7Ǿg,��UƖ��`�V�A;��,��-��xv�S>�W,o�>_�f��lI��A�gN5{����͙~��LxИ:N��7/f�L5���3LG�֯����M�H㘘�����r��.�ʲ�U�>��>���	�x�e�A{:)>P�'�r�1��?C�]��*�1��Wt���f��T���Ȕ�M��V� �rb��z9�4/���^4�2q� �љ�Ͳ'8����b4�,na�g�D��5�5��b�̠(���ϰ�e��inb~Qs�>.�U�7��q4}>���'��Q��~�r��6�:��Z�i�2U���2�����1pr#�O\�"D��n-'1��u�U���	
���܎�s����6��1ʰ;�(�0`څ* J�E��4��/O�!�O1�\����ԖS���0+��4-"<�*m-��S�jU ��nQ䑸�V�����N�Z�7�`��jW���MRvs\��g��g4i\xo�"t�f��`8I�ݏ�4�3s>��w�hv���b<6�|���b6W)�KF�Ln5�]��ݸYnbǟȌ#mx��V�V�:�~ZN��V��p֩>������Zj��fH��k4�y;[�a7�Ef`��I��(�����`��Ԭ��OH�泞�d��9��&,AL�O� ���?�i�]�mlb9��ܧ����@�L����v�%)�w�/��e!Q�
h3@���5�]�x0ѫ�:��ppqה�������6<�>h�H�z��iQ�m��?� 4۪h:�����$����ء�t�L��/:@�X׋g�� �ND��&��:|b٧�	�khtd]�vy#N���&��t�|>���g�Izw�*;�G٧}��?��:�)�tzZ������pY���3#�#�0$���&��GyB�YP�Q��=_cֻ9p��ٿ��|X�;X��g�� c�8E���x��y��!1:LN�<����}«(_��|x�g�,�ӗ�u7V����y*�U�k�4\?{��1��Tz��=j��ݹ��?�Ôf�wOڶV�YrIR�pω�0�ݳ a�2u1�bGź��쿲J��`L�0�D��r���y���hIѰG,Ah8�H�'P@�h_��ƘYIB���[���"�dd���A����q܎�5�D�k~=�%�����mw+�鏋���T!"`�i��y��d��&�����\VQ���Go�����K�ϊ��f��䭸�k)z�O�j�nНgn{s�e�e)ݩ5G�� 7��j�y>�BzΧ��\�el��r�C����w)��I$�A��$��n-P�ڈ��7���rfp,��_?��aY��"�I�#!b�Tf��
H����#�.��E��d>��Fat~Vs�og�h�5��u}��U/#�Rǖ� a�xˣ�A���^ɹ��p�o�x���nS�8b�����j'a�*Au�!;^����>��	8���Ul(�I����|N��i	)�  đ��F`(r�<��/���f���b��4]�LY�����ɘ�Ig��J�%&gtM5s�w2��x�srdE5�������f�L�h4�=�;bH#%��e� k��j���d�o�R���_��G;�jV[k ���<B����n@
�#��� �oQ	Z�UH0�)�JG5�Y��v�r����K��Y�x�O���`��������Z����ău��B��}��{��IY7��/x+�����X�����Jc[���oQ�CӋS�݈y`b����9i�ΒPr�RQ���Q��[hX��#����I���9T$��(`H�Һʽ�'p����9=�	�i�W�˥�wr��ӄ�j�����u�S��O��������#$�E�.���H�y�SB��)�����L���w��&�DZ��zgz�]Έ���MN�*t�P�){��-H�Z(,��}[�)̟0J�~3�B��_>
��ā�Eb�:Z�hu��N��	����M�)}�e�0Y�,�1y���ʳU��B�J
�L{���8V�
�2K=���L���	6Zh1N��ΉI�'ÖG���9�D?��G���/�w��!�_�m�^|��.9۬�4P����Vu�f7[k�����	.B��>�sQ�{Vts��'Q��#�J�)���vX�ʪ�Y����~�NN�C��3<��"N��i�^,��b�1!�P5�����D�b�5h51b��^b�C~�$p���I\Z@�ۼL�Ș�� f  �X�TP�4�M7� �)�HW�>L�mdQ>A�,ȃIFH�́�|��31�~���Xjap��[���[7�iZ���FXv�,�U�M�[^G_�&��2c��?���֟���X�~OV�:�~4�~ݜ����E���Ŀ&����xN��I��4�훻q��g��ˋ�֝H3��>�%�<�i"�`�i:�)#R��H��̆y�h$�af�(�eX�,^�D�/��ɏp뻽��UH�U��W���>���"���7�NF��A �+h�QV�\��]pV3�ōw	s|�T㹫��2"]^m��`���t�Y҇�	��΀7�"g��k��6�6t����r�/^�,����UI�AH���-�6����a`��N�D���C��}�\В>�L�;���ɑ���r�c0�gZN�oT�T�@��yTv��W�`�૊ WP��z�9)����0 8�̀z������y�,A^�3�)��d��̍�*����A&X��fp9��e۰��~.�#{��~��eI5 ު0UѾ�er�s�G/\��-LDU��ż�=��o^��<FUt/z��=��o[��պЫ�`&x���'lI��o?����Å��      �      x��}m��8����_!0�{�tڶ���\ ������ ɜ������nml�+��d��/�HJ$EJ�,��n!H��+Y,�UO��$H�7��$W���W��H��bC��E�\�4��ӡ����n:����̧�c?�f��?��F�=^�|��c~��N<;�gp�?�ʿ]�c�����Uvuu���������\m�p�&������$}m�
�M��I�d���	��D���ȟA˦é?��ӟ��5�����L���xF�����jJF������>�Ҍl�F�u����6���E���Z�?��$L���e}~��C�W�2�fd�yٷ�?��d��WIt��]]�Dæ���N$�6�Rj�FX��4����_Nx8v~�U�_ge"�?Jl������4}�u�>nW��f~���'�`��R�E+?|�������-��gR���dї2w���N4�̏�Cz�h�>a�~��βƊY�Yo�ru5�e�� �FaX&;k^V��$h�B�){ �~]��U��&�ʶ�`������m��A�fQ�&*���E��B�SZH� ���=w��1��	�-�c���@ܬ�{}V�4���o�x�6�8��K|�E�r۪�#�B�u��&��M���:�u����v��ɜ ���_��^j��l�4,�Y���&���םt�rӊ�[N���p�_�`��ރ�&}�/L�G:��Dit��웡3�hMnvI|��ve���,�_�]Q-��oņJ��5\z��t�l�19[��mH��{Xፏ�J���������&�B�͟ѻ"H������o�P�d��TLp��H<���x��&�g�2���$;�P&޶��f�ƶ��~x�2�E��/R��c�"�u�u!B�	�o5�݋I6�:�~vf�����7�xFi���
��ީ�T��D����6 �[Gٶ���j-7Y�+Ȳ�îZ�U�u���Z���A�┲ �����!�ЀZ���8j[�d�֋{�-Vq��d�[Y!���`M�����#�����Z\��Љ�%���gЏ9��A�pI�x�mL˟�ҝu{�T�"�[�Q�HE���ߔi��mK�}�ś��}��������	գ��.W�MT���8+:�sk6���}	��DP����X [�cXo#��}=�4�Q'/�����zX����.N��[2��+�pVP��mP��<6P��m��T4��Q�����?�/~k�DR��.O A�w��^Ṑ�#*H)�$6�Q���vݟz�V�ms��w��7A���,����k�qe� ��	��]l�����7����Y*�/�G78o�B��^��i�Z�_���Ǡ\�{M�`ÿ�'���T������ɠbç&�� xl��c,���}ןk{� ��|hJ;��=I3���vT`��N�B�6�����.	�ʜ�n��g����1�J>b]9�8U�ۑ 	(�6^<�Sf��
=���׽�e]�Z����p�G�&T�FɇO-.��׼�Z�Uvu=u\j���t���m$��g���L�MaJ������9��wӦUZ��o�L:��B�#*jg�k�,�pI�a(�bia2�kn2��lf23PDq�f3~U�)tk�B���l�,M؅��4����T�D��W����_�RB�^Quj��.a �9N��PY3kN��ay�)�`�aq�0�W(0(�F~��eu�_����B�^�l;'I'bݙ8�m�M�Js~9�y�;�c0�J>�UYZ{r�\���Fe�Ձ9����h���w�f�c�f��tP�SD���
���e�^����K4�[~�ۿ������$�ӑY�C@>�%�ݑx�r�V�\>�����K� �,�-��}(��k���������n��)����96�hZ�ą4g`b�6p]%=%�+nP&s����M5�9s���޴�����0�4�D�Z���kDec�YS1�2�I�Db�T�}��OVo7�e���	҆o��I3��%éç]7X����?*��6*�vn6���$S|C9���tX�o�ѷKUr:�q��w������!~#{p�&ePglE��"�ŕL�{���s���ڏB�n��v���K��ߗ��e�Q)(�?�Ɇ�)#��y��f��{|	�5�}a�ᮍ2������_C%�wG<�@[/�s����D{B>ZH��������'��&��s����^�ѭ����l�7S�[ߑ��P�i	�)����L	b�zl�$��{�Q��V@9^���*8Er�}�Yb���~�G�y��a�Shmӌj�g$��E�Ɋ~#�^�bH�.�����N� D�Ie�-�W��S�=�GgŮ_7���m2)��[�5��B!9S6M�/&ټ��<�`�j!���-�5�}x�?u{ZN
q�,�e�^s����)C�65�M�(g|���xfp�UW��os9EQ��W�{2�T��.�g���oDK*.�|���|�����\]O$^�{��k����Gп5(݂�̎?.83ʨ��7<�A�Q�0za��<Ɵ���מ�b��9R_��P��ȋ��I8��|6��|D%�W5���ܨ����cF�� ��d �Iƫ��U��"�I���M_PX8:��"݇�������W�֛�!�h�R7*�:�����]������%5A	�b?�6��W�Y�5�L��{��깨�0��$��Ά���.�����lH4�m���A�&�_��vOM�Ѭ"��v�W.�т�{!��m���'��֚�2����y��c��rN�:��$ʾ�e�����Y\oB��7u,kcw����#aX�>�%�����c`L�W�w��!ȼ����ܶ������?�k�ǳ�V���	d,��5����e��U��u�(���ICA!�~��]F����FE��U�&.{745&fG�{5k�Ȱ�I�f�]K�q&�<��x7��O�q�h��}���g�u�l���a��L�5�M��3�@�r�k[:��89��[D�&Dh�מ� �h��m�Q
����F��u|��kM��8ib|DP:P>rq��e҄�;�Ҟ�M)g��5�0�Cz]
��~C��G۾�2p�mϱ�Z4K�^G�\�X��߶o�bq�~c�u�Q�����z�m�?m{����Ľ�6o��f��o�.o1��m�� 9EF��:/�->[w�%����f�϶���å�ی��:	W��ih2�o�e-�܅�Z�gk���8ɖz|��^�;�Қg_\�Y��G۾�y�.��E�$C"�f _/�����O�^��m�q����e�[y��������u��˓拤�z-�
�[3+�����R=L�U�Ԙ�n��/�r�5G����g�6�ۦ1,�n�;�^T:��|F�Zw#��=�s) b�D��(���t�E[�@�F!���`���x,âꊁ�bK�7K�^��0܍=�5���&]fؑ�zE�t��R����ZS��<��O���w�aJær�)_����rWrL��爃��HZ�@���y>(s�����v�O%�-�^�Jٹu꒧�8�LW���93�gT����*M>r�J:����d1�o<�\WĝbB��a}.�I!�B���D���Tn�{�BP�rT�g���Te{��Ct\��_����Hr)9	���G�ڼ�S-�����T���_�u	���W�ز[���hs�8p���r�<��k�e�B�=m���v,G����yᓯQ���.kTB����qrl�.� `[�(�0������:�Ԩ�q�]a��c>�V�W#m�QT��6��7���t|O28�%#n$��L��o^���0,�0�Ӡ�6Og} xdIB�PMX��/� ������3�$D��MoX֔�,fk:��˩q�V:����:��JN	��5GB�B"�Ib��G�3����	ϝ�#-M|X��3�,��PJ7�8S���L�8�C���E����y�`{������"n��-XG~�%t���b�qͰE�u�"Y%�Tj�,�x�����Tr���f̩�!�GE��)    K�22'�r�TJ��M���"M$���E��[^��]��?�Eiil�%Fb��n���A���w�1�����l��&�/��
8E�屘^�#�h-崿��d���:�s�R�OY�6,���A�`�;�����QcAu���0�^�D���ӠB�]̿شړٷ:����KF.�qْ&;���%�r��:�K���,c�!� ��nQ�K����`8���:��q�Ͱ��;��Ϲ���0+���`X��e������Wޒ�>N���T��:��5] �&����c3����"���C��H�*�2/;E�e�򹦴~@�����6��S��~��;�O+j��3_�����O�K!�K L��m�]����|h�pi��P�R^�4� �����u
ɋQ����Ǫ�k�<nA�V�ױ;�[���1�cYӁ|쫷{H��������Ż�:H���I&��,%�����2�Ydd�;H�T�;"��M�c��j���a+��hv j�ݸ�k�5f�Z��	����u�+?�e�`�, �l���_e��R�SZ�R��-��������y��$3ޣt������_�'�W���"i�7����Qq�.Pa�j=�j�sƪ��t��w�!�V���[j��t�a�J�i �-C˰a�u1�vENy��M�li�t�5zԙ<k��V�$�cfVd�/�/%�����B�%��ũ���3@r,��c?��:��q���T����R&�Q)�KmTQZ�&H�h)�_�KK���eΟ�#͗$VQ����������.����It����d������hք"{�)٦Q})R����X3}����1���4��J���,-g/3�|�P��RY����k��DYl�4Zb"�:���WJ�e6�,�D�}�{�N�����[̷�O�;k�)UR�-	�es\���.
U���	���:=+.,5$������"�m5aI�Da��׉��+Q!��L�b�U_+���K�GV2�4Y��6#�^������:xs���[���HHرO(̠%`�����g*�������=�B!=����ZL���-Uh�RӮ�ÅX�l�)�z2�۞TW�vt��S�B�T4���݇�L�ǡ�+�fK��-Gȗ��A����mG�u-�)aOê)3�b?���}�������ܴ4ɏ�Fąᓒht[W�.��6?��t־��!���Ϸ��}��N�r����*p��p��랪�ҷ5�Щ̩ȃ�Nl�ڛ;K߯,�z�~�ѺBw5Y�˾���s��
Y��N�씮�{�_�:��k"�.Hp�<���^���i����%(#o�o�ɢ(":**E�J�j�p;�b�ye+w�X��m���!7 ���&H��`�9��gL�M�ofe�\ӳ-�ey�_���sZ�-�f������r���#Xx�%}l���ze�Uf�����><v�1�cE��5����y��n���>�.4�����~k[K{Z��^/�x{Z*�V,D+�"o�����/-��������t���JNEl�gSXO��x�����~�T̢�����Nh�v�����}��G�Uo_T��T����qo�:�27������p(~ A�CD�{B���j�5��f��Ũ+,�T��?�)-�3�l	�	�cZ��a�.�G!J�T�@��fN]aF`���0 ���W�W�g9�
�B�塪��ݢۆ-���&��fm�~P�̟�@$~ގqe��$�UOǪ��Kp�6=&.��2Ι���i}a������U��7����ՠ�j	�*��Wb�E2��>v��9׎r�O�����ϕ�V�OX)y��_�2��'�C}�9�Pak��J~�䇛��<�oVM�S��3l!��o���H�/����8��W{D�j��2��g�a�{��֙q�]5Ю�s5��É����(��	��PzkUA���[�3�c>n���9�T���4�C�u}�>�#=�6�kj�-�b��:Kx�{�'񐟑L��;����UyHW�9�o�KW��f��
��%Ǖ��t�`x�v���x���6�h�?��r�[�Q����(O��]�"�N��<�<|��+��9���q'�h�+��s��9"*�_[���ƙ�+���1���h{N(�<��rkO�T�ҡ��:���V�稜^�� o[goY�
e�d��tf�߳�i��X?z+��1��$�,�Ί��k#�G��)]U<���-[���9[���@�q�UbG��}T>;��������sc�9�C���9�	`�3\#�+'ʕ�������!i�(]�?��Zܿp]���孥��ڵ��N,��U�܉S���d�վ��L.*ӷ���SpG�3��~�ue�H��9���(�Tݥ�I�]\Vߥ���m�~����U�Ӥ_,�t�VI�~�wY�6�ߥ���3b�)��es�7�9�b���m~�\�~f{�:gKT6�A�g^OS�(�!rN����wͥ��keG7m��o(�t�18?��lYH��^���p�4GyX̌�rر��yt7���4`�;�9�Հ>>�/��&����L�D�N#�jn��j�%�����>k�.�\ZU|eJ��bF!��C���Ƴ$yP�[E?�;' ��L���j����N��z������2�|>�����Y��C���`@2�p}g��o��YU+��'3�ʟ���-U���L����!ka�qTYҤClG��o��_C��QW�	��R�Ċ�լ�
�7Z3M^b���2/,R�23�Rs�p�B��[.�Lx/͘�U�֨R'I�2��FV��O1�`������c���2�W�	�;eM�z����^_n�/�S���0�i0�bo&�g� W]8Yܱ"��eL��N���4�
���+�܉�$�uEF�)�0� YRB�� ���2�-n��/ƥ߮`=���{�;�\_T��g�y� �a�d��׌BE���۩ P��x&���"�} ���l8����IGh�g�ܲg�;��0����`:�`��i?s�A�	��g��q�zb��U�kW�kC���
G�Dy�d%񉺆����*s��5��q��^5E����f��(_#mOm÷1����3W\����U[��=T���¹��ۃ�=X؃�G_��|I ��h�M�8�q2%��M��FO�U�k6�{����d���ٮ������B~�C̀��?��a����c�<IB��� �=���n04욅�5v{��䦝��!V���nr���u����?�m�R��,Kh���&�c��~�_J��?����"��ǋw*qx�����"w�h�<���쀍�HyK��^F�t/q#.%������>�^{�U�D�&��uђÃ�E�A�����%��V��Jʋj(��$[���0�&$e۴Z�%��[�Ym!�y�jE
���'��x����P+w5KLrho*�gi�x�̃�<�n�)���Fi��+��j�X�@#E�DJ�e�Y�z�+8���! �R0(Js���uϠ��j���z5���6�)=�%��Y-������L��݀�s�<���6!�`�3��f�r��*�z50��g�nf�A����r4������A�#/^n҅[A�*8WK=�SC<�J�G�D\�H[�ֶ�>U�hc��)f��q��y�r�ɭ�t��k�l� 9u�#f�8ňŪ��b6�}���\7�[7̦4�n�Li�m��P_u�=d{a�� ucY���D�W�~��^q;���傀�����'0��׌Ad4�0�����QXXf�3jns�G��( ��}Z녣���Q\Z��Ƙg� 	4�t1���Ulg�C�<`7����}� 24I��(웷e䓉8��	m]~�_ҧ}�l0-�o f�>��k�jVA����뫽[�L��-�w=7$�G�zDI��{D�Y!J�K�iЭs�/�R��v�"P���.�:�{�l���]C�^Ƌ��R�	������/XGP(Ts'|������C���pV����w@"�KQxc�5���sU�m��6�$��tAN�&W�    5���x����Ez��d�͐���:���C�%�/^y@���Gi�އ@��Gi��U����>Jf'��Ě��VY��C�g��У�M���{�&��z����on��r��!.8�8��h���+L	m4�����k�(ů���R�������',C�8%�>�K4�Or��i�r?�`��,����L�|ݰ�{Y�~�w�⭼�Z��7��x��/��&�/H���p �xF`}�_��y��ӡa��7�zT?�}X�LMz�5�ѧ��s�W=<�-��2)y8o�,�w�O�ŵ��_�\%�Q�L%"
�\�A��	13L���&�6�eZ�D�{��2#>���{�m��Y�YL��w�8!:���x�A��2V"ꄑP۹Ǽdq����j]���K.5z"��;V͠Ř�a!5�&�qJ�E�^V�_HI�E+��=*��� KV�6�����/d�x�:��o�u������9�T���
��O�+$I�D�Dhn7k��`M��ax��o�D�>?��RI�����T�ac�a6'��F���t!��)�é���)�x}�+��;�VQ��r��-w;+$��X�֠��7�C�Ж���i�*80�L�_%�o5��E8��*�|�Vk��<"ˊ��]�1qT���x׵Y~�f�H�B�e�a���1��RX��,S�7�{�65l�D]>����x�m�Ue��T���}�����G:���1
�\�7�Ly�*ah�.�) .t�n�4��U�.c�6�h5�Q*$�)�i�fj|�C ��(	����2�pP^���~sG�2�A�a�PT��װ)8D��!��fQ�"-	�nV���:#_���t��b���FeX��t��
���l�bpHst�>�x˴@Dƒo�&���0���{���0+-��Y���k���zTs����^�o� ���'�5+J����+��ոDi�>71��R�+�eX�����k���T4]2�Hy=��u�����ےG.&z��7��q��%r�ʊ���(h�v`���<�\��d�ے�3���^~�ߵpxB��
e��������mC�s�,����G�
K�u�exUt0����mb6w�d2�xK;��D���i�L$�ٷ�����AU&�(t��*��Z�\��.N3��������Vқ(��aɖiS�)Yb�Zl|��OQ�]��	WLf�ʁ�����A��M: �D]�h��g`�c�u�H�Q�7�Rty��P��O���e�=U�߮ӘO="<��_A���n�1/�8Ձ���;�<��4�ߘ��O�-�κ]����@�R�UE���H���.9��)�'�p.#���e=M#�[�ym���`O	n���`Q�m��Ț��Ϳ�7��7����rSDQ���7C����?�D�U �n@��s��0���r���+l�d,MV-1�"B)o��'~Ѓ���Qm���q�ތ$Bj�v��}�F�~����^M�*ꦽ��$()��5V)\���Ӎ�V�_�Z�Fsi|��W�)���2���QrTj3w��[e��k����B���ԃ��yF�T&z�T�'�)�J���a�>��A�`��k�j}/	F#ye3�p�mQ��By/r2��[�TFg	���A4S��c>�o)�s	����\u�IڼV{'sTq9|~b�-�7VY�����ߦ�}ӽ�m��*���M܈�h"e�>Y&հv7h ���?:R@ 2�4j"cmђ}r?k�=,�_N��uD�
ْ���Le��J�$����Y;�h,��a�Z�����y�.��:L#����w��-��,X	��E[��T����r�D���C��;��	�Pb�^^"q-x����(O<ʚA���	�H]SY��"�&uB4Zˑ�D	.^�U��ƻ��N��'�^��!�31�O�=�;IiV)Β]h4l�K6U�]���F��;V2OL7.�=m�S����5����`~�3ʾ�|3���g����3��nS4t�B�9Q1�ĈG�b�5�-�T�LY�,��h���"�ﲳG�5d���<����u�Y�����0�><[�!��~vl;�6�G�\�5B|`��Iޒ��U���Ţ����چ�v����s�)�/_*Q�˓�W��g3��L��s�W
Nɳ��4P2~��9�WdZ��Rߤdr0�%2y(�RF��6C�f,G���.c��{��E�Ɍ�����ﲼ�]�>L�,0�}u�<,�����rsZ�s^ZƜZ��ϙ��̑h������^_>\_>4{C^�唧-� ���nq� _��?3��i�A���9U���,l�l��?�x����nor��2��x�t�W��nֲ40Ϥ�߇Y��X���`x�EV�r�#���5s���dvk�6XE�R��<4B��X�h��a�\
W��R�{S�YU���
[t��l��r�u�+��h	�d9y��@�K���?�h�,;uf4gP�n�B��K�eJW�F�e'�9�9�� ��@u�*G� =mi�<:"y�W){м��̯���I��&	H+���v����V�w<#+���@���2��y����.�ؐU�ε�����v*pq�"�˘֓	�*`�X���t
vZE����a6]���w3��p���=S�a��)�b��\H�s�Y�j\��X�w������P�Ϲ��B�T�>YI|��a/=|��� ӱ����L8KkYozA�����ۀzPo:�����Ok���
���LE	㇜ו�b�
�d���x3���Q�ĢW�g�vמ7E�1�Z��M*��^��Ӱ�����"�W�+��&$%�)E��r��<��k58��߱a�`3K��,Kᬨѫ#�#���>E������~���.H��8	톨"�XO�`DS�r{R��/�13�2��ް��T��q����k��F�S���Q��0J�޸B����كX�[7)��؞�+v��lԯdU��͟�ktXB�̲mQw�-�t��;
�s,�[��{D�j�+���a��Z�t�K��{$�!q�ꥊ�ۣp�	�{���ˑ��2i��𬏨��fٲ�X]��"QJ��O<}��̱��Q�x�j�5�����Ŕ�l:��:ft�=�j/�>�y�+��6��"#@Xe����T�;����{���z�ݺ!@�tC�@�d�+��U2�B����Pw0�5����q�2�4z��d<�K����a�_���h0a^hX���d���r��bMKD��� ��}Z����x\Z��˘�8y6�i2���ULN�C�c@˚�<����Z8I��G!x��|2gQ�����K���O�B�ϰ����F��j����L��S��;7\�ǧz|J��{|�Y�S���i��s�O�g)�]K<��ν��d����9�I$�+����������z�pH5�)����E�k��*���L�ƫ����>���~y��D�(Q���B�Un��s��*+ 0�02���M����X��)�J��vKwH��a�R�	α�C�킅J��H����9��Z�Db�1L��('g���W��_:��$�d�Q��^m�6�E��3}��wk�L�ȱ��'�ek��kS�t�4�.K].9��6	]]�%b�ſ�Q���:,�s���=�g%���fY�f�[f1��U�*�B��<w�y<�� ��~l���!�I�mעF{Ւw��ʣ\y�s	��](Ҭ�Y�,)��ZZ��-G�%9ʰ>��a�C�&93^��`��2e�����O�V�3G�2�/d����<]��U�)N���� YG$���9&F\K�VԒ���*�t���RDu^��插��!����ck�]�����Z^��4b��zRAj�n0'� �s����b#л}�ś����+���l2<��O�k���s�X�_���#>-�"��Z(�4r���1�n�7%���9&y�7��M�W4�,|Bj۞�w��J^^��$��?��ď`���'N���eq';��!�M��R�w�(�|C%�BX�N�����_hb�V_�/� �  e~r_K�������/���*��>��wn�a�t��ڻ�^�{k�/������&n]�`?(�E�+�.�Đ��r��������ݏz:�C"�c0=��يHW�@����ua��w��-=�e�^��K�b���i�:�~6�D[d�*��Ճϭ�IÁ�
����yJ��u5Q���2jv{M��8��
:��|s�y��7}�����P)�>���}e�ϋ ӱϋ��E8K����_t<w�{��{��(��˓��4�+�S�
�E*�S���|�oj��_ߗ2�`�������LN��sOMݗ295���9ї2�K���LzH�!����˂C�?�r��'��TL�ϫ�Ԁ
�7��]@
}m�˅.�g�������kc��1����$?����> '�z��<������?��O�(j�#@�8E^� �K�$j�����/2M�R֚��!���f�!1�c�^�2Q���b�/Q�y��C�$�MIF�U{_r�V4�&ck�٪!�S���3��d��8��ߝ(�8K���V-�U��5��H���6�{�^����)5^�����X�\��kkU�}<u��-O�ڬ�jN���}�5ؑd�,k�]�ܻ�<K��c+��츏4�y���)ƼhY���h�:�`�3��z�ܪ�s���ʄ�efpL�ӻZ�6M�7��gH5��cZ}2\�,�ߔ�Z��A�1�M+L����D�� /3�>)qA�x!�E����UEDN���%��y1x�	 y��]O���3b�䠛5� a�@��9�l�lt��ް_���L���O;i|ä'�C˹Lҋ,ew������3�y4m���P	�A��r��$g{)ԯ�vEMPu�m�XU�;Y����T�`��\B�J��`�6)�OQ�o��_�R!(Ӏ�C4�Z�����EN���>:*.fp���<�M%�
lX���WO��s_�T�k9����ru܊:��9�W���?��ց�n.��V��R���٪��5�u+)����5
���%5{�D�~@PE!u�AQ�����x>�P�1�.@ʷ��L�Y{�^�G��B5� ��ɋ����GU�(aO�V	�w�$H�7� {p��0q�A� �lT9�)1q��-hx�`����&a�`	�G)XGA� �=��Y-�tO����Z�6+��~6���cNP,g������D0/��n&�D����PV��Dג6�J\�D�U�N��@;�W���>h8�e-����G��C�T|z\lj�H�䩒x)�'�8�?R�� �7?�����˴��jK�H�b�5��I��v52Lc�_�_ ���n�m_������Ҩtb|�_��$�Y��GZ���1�Ne�?����՝���=��:�i����hnc�������>��W~5Ѫ��=1m�d�O�Uh�_��֌}prK�^� ��Q�lu�76^��gH��o7��JNCȮ-��z?z@�
HSr��(�'�Q�/i3�v�[��k/����,IP��O�q#l�"��.�Q=K?�ї'A�<H.���D[��Fzwggt|��fl�d��lW���@��sM��(��2��UO[V�^��7����{���x��n��;�]�	�dd���7B����|��,3tSt�s����ڇZ8̪��
��(J�-W��6^6*
�|Y%qj�Ͼv7vX�K�F�|n��_�sۅy��d|<�z�֮����GՏ`3�i��j�èо8��v@�(�Z�ӞK؈Cw��q�r��uJWF�@ٚ�n���`o<�`�SM�t-�򤰍�N�������� \O5-(�?���5F�S�
�=#�z��������lP�<8!�Zl	G>����8f��FҤ���[C+�uP��y�]��Uf�Z�.W�/�`���@\V��;�X_"����o-�&�׺�#>�%66GJ���Rt)뀳�w�or��0��g���3�o���p]�jD�X�/ԩ6.��W'�I��O���e���Ed�3�#�������2~�-9ƀߐ��w�ʡvt�g��ؼF��H�b�|ۖb�ϣ/'������Wo�R3/'��Pr��(h��q��-؞Xl�6ח&f���b�g:8s�Ƭt֬�7/3�1���țEO���0f���jF��X�C�=��:�YՇ�S,�%*)Z�_P T��i��iQ����T=��x�کa�<=�yq�^u/iF�꺝?Q����0���7��L�)��υS�m$��	>~<�.&  ZDې|���0�I��>�r�1E�%��g��f���t?c>"?{��KS�?��IHz��FQnB��k�0{��h�1���?���,���9���q�s*#AJ���LS�Ox�o9��<O9y����d�ĸ� ����x�߭z�����xa^OÇ�2��"՝~�X����-��k��ǧ��q��������N�.�_4���0�h��&J�����*1S�fЁ��ݔ-0��p�"��}���;,���!�F�)�L^c�&8��9�u�z)�Qu���!C�b���P��A K]��3nSf5u�24�Q�a�Ø���7w1�5�nq���5��Av�4��"��!k�y�(���tS�pX�0.eRv���Z\�nr]�	��:|�t岋M��c��x^�S=��_�p83�7�G�k��u8����l�����O�~���d����ZW`��Y�_�S��	�4��|���y�W���@��P)�EN�x��_�|^u��e���QH�v�zs?}��{��wb�T�C�^C̩��w�N%��d�6uV�.� �3�^�C\�&U�ƸuWu��ձ�p��̘�[��{�rSǭ����s����G��.��:N6��=�3w-���;vkR ��Ɩx�����W��w�������s�8�~f.g�r�b��dki=W�E�O;����u?�c���y�_$�l�|G���m�׹��}�q}Մ�_����m��ʏ3oxx9�ӉNb����������)�`.��J�Z��|\��Bnu�M9�q��&�=y���S�p����B�P�u��q2����N~����ڑՊ,uW1�Y�Eh�Y�c�Y2D��h���qRD�~jb�|}��h�x��K������*�n=�5J1"�s�c�=D��\[�=T����q��T��VS!�L\����r]�ވ��f�H�'[?���:�D�ԛ�2�j=
���Ϸ��[�F�#ϻ#yZf`�G`?���w���ʸy�w|��5����K�pr���<4�]�ã����n�O����2����u�����P;��#��E�Vc�N.�&\p2^����Z� ,J���*�7����j�[K���'�ȧ�x��i�l�t�J�T,MQgp����=[��&�����lH�s����V>�\}�4k��������9�O<Y; <���O����7Z�      �      x������ � �      �      x�3�4�L���4�\1z\\\ "=
            x������ � �      �      x������ � �      �   �   x�uN1�0��W�֥�WH��!����&U��=iU����;�Fӑ��-Ʃu�L��;!'�L�h�6W�4���>�I�ŕ�c{�a��n|D�fg�T��VzJX�M���&�����bQ~E;Њɱ{�w
��Fp��c f��01���}�ѳ��D�},��/3_k      �      x������ � �           x��V�n�0}n>f�D�0���8�5�a��>$-�R�m����FB^ħ�yz�1|����p4P��/L��4x��������Ŭ�ZAl�H��#R{ �!y#�Ȉ�8�Y�f9 �g�E�hG�9��(N�#�N� @�{t�ט��������o���]��ެ�!v��jã�\��\�}����Ą����37v3�0Fxy.�(��E�"9��6U3�aߡ�sU�=�T���|>�"�켲��a���ۢ�2w�D#O������u�tXj2��f;Eb_,+�w�X�j-�o�����7�M�|���O��i�Z-�I���LҨ$��|�G
N:cQ�h��^Yݮ��T�C:������ؤ�mBgaS��v���]#���X�Y��9��~�z�����J���ҡ4B�T"N�΢�^s0l	n����7�����G"��Φ\.�&BM���]M�\|�k���6����~i=�����Z(?����k̾��k̾��k���Ɯ��?.��b      �   �  x��\[s�*~������}u|�Im��XΜ�S�j
K�f��Pϯ��"ٖ��Y|�n�Z���@�0� ~�S$�]Ɋ�b�M�ĥ���|_I�ߙ����eb���	�ޡ��%"43��8J�v��`!I�O��xS#�G��E�R9�ЇJb�C9�#]*�g�)A[���~Hj�����V~)�D=X�l/u���^hc�����t�)\)�	�%d:�֌�'����5��կ�H�0u��W��c2��aU2޶�H xXM��c!�)�_a 'pL9��MJ�R+{vR��Zb�6(�ғ<�V�pE��m�����k�xF$�	��BU�����)�r	ʃ�"�$X0^"����/�1z^�ԥfH�8��ʚ�V?e���Q�E�k4��z�}������5�)Jҙ�j�@`x�� o#���D�=��LY�I-��oA+��k,9�oJu�4��Ȃ�Wm�"�xӇ�z%K`����7N�_�?V�:��Z��UI��()4E����Y���51S�v����E"_`�(3��W�M����N�-h��DH��{N?�u�g`�Oi�G�w���l�k,�k*p��j���\6�5�<8�K"D;좰�!�F�9�/V�m���F���5�2��ࣀ!I�*^*��#��z�L�e�-��S�QB���9Z�mC����4��+��z�T\<�WV*�kFq�O�n�n5V����	�}��H���T����i�9VN��FH��y��hEf9xl�gy���B�6 ��~�M�z�zF�A�U�I%$��-�C5����c���ق7�t@"��<�c��+���mi2Lm�P�}x��������""�� �A���˚�!�� �9X"'�y�A �Ga1�8� �a5	'�/GbJ�ת��W�N����j"�n������D���y��B���r$�ԣ�#����!��Tzz����݋�G�k%�L3��3��|��8�a�ܖ�f�?(#�5Pl��.Z荀p��&X)���(�>���䋬g�'pf0� &"rf�� K��1�Ϭ�t֔N e{�ms�\�,��H��&���2T�'V��	z�S��,�\ Bq�)�󏚒�HC&dB){�$��F>�9��x���My�'%��XL���9Eu<�����8�0t��H5�cg\��SV���'	)��aFv��>e�v�yYK��V	jھ��v�L�g7��ή�b�`����A���3&���!3�A��Qj:�Ĩ>�]-1.��q�ج�E��������,��	��-fC�L�N����K���)/��9W?���X�$Ǩ�����L�����d��~���W�^���1VL��$lpY3��1���x��<Ơ󮮊��k@��ك�Jz���>���2nՓ���6�u@�b:J���stea�l��n����Aq����A�b�0��}r�xpsw���72��:{��i���U����3���H��k��k�:��>W�.��K	�+I��t��֙/	l��<��/�&�v�����{�������j��Co_hK���msZ��kX`�^��=�Si�o;�'��s>�<2T,AD�v�2��*@�u��F�����F*E�ŸA+����j��"������eMY´󈫽t����c\��e�@_���bBfX����g��j���`�D�����{m��1|n���#�c�Z�=����Z���;���=g���Z`g4܀�{��oc�y�$�u�0]�.���vE�xj�:�*0�}�O�q�c�a�>1��ګI��GcM�)ӽTLm�X�Y���=
����(���+i�뗙��;���1P����;�61�^�<Lb�Co|�0�I���}2A���yP!u���2x^f�D�o�p���P�~�����Xٝ����N��u�K[J�����~Y�����iqfQ�%E��T�S�[�����x�U?��z�Yu�M�uc��ڌ&�w�3�;]f>�Eu�xp����q�zA2���>�-��F��M"��g���o�9�L#1����sIpbU6�C��NBn}1$*e9�l$�Y׎`�նꙹ�Nj������9?��-Vo�@�P�8����w�T4��f���������Dn�{x��C;�G�X?�Q�^Q��;iwh⚢g*�k��?�=���	ׄ�Ne.���g�j@:�A�:vs�~��y�������;��
��Q�%�-����n+��l�)	?�Xu,Y�n���K�$��NKZ�뚳��k�0��z�:��7o�vO$�"`9ة�on�0A�ݱ9p�
���
6=�j��y*5'6�Ύ*Inp���ϒ-g{�l�a�/�L�`+�\����n��#suR&ro����
��I�lH�8_"5�_�
��I�㹬�;���2^	�~����!������A�b%�����)Lo*9�����nǟ��;_e
bh7��p�6��}�a�
9�=;l`�(l���t3v�l��g��M6*�_�w�@ڿ��ޜM �5� �f`E�~>��ޚ���D믵�gD?X��E���8��}z�b�X�*y���uS���j4�#�#�g!��4�d�<Č��~yx|�������y#%���~�~��2�B8�|��h��iZ2�Z�:�x�/�Rz'�P��FTs5@�l��<B&5#O�ⅻ^����w;�x\['~��6z!I�j�iAR�NQ ��K�g���D���E(<ˑ�n�����?�U���#�99@�1{P��G""v�)䶾�J*��L�T�����A\K\5P�F_@�,@�Ā��r��TCeU����=��;{�\F��H_D�Z���?�j߸�N9��K�.%
�ͷ��b�DuH�8��ة�	��h��k㚉n�<gR��~�}����N���l������W������,Q��6�=8Zm3����������t���TQ֎"/Yt�=������gg���M=�����)֨�}�m���� z��r�����hz����~�U��9����3��`����Q�T)kJvί���zD�Fg�,c����o����a��L�6�&I�U�����S�s�P�"���8��9)��d�;�
��//�,��L7���C�y㔶}�%,�ޝ�/*�f��;��$&`J�͙j���8ԾƦ�&�A����A���@�MƿԔ�"	���	�����˗/��G�k      �      x�}�ir#G�F���R��]�L��Qb7�NKs�y�D�$��$,����-�|z�o�������u=ݿ�,������ן��[����*�H�NF{mcl'i�Ѵ��C�_�r.cV_�/:�OO��$���g����w�k��w�SK�%y�r{���a��z�IKN���ʇ��d����ۺm �J�>Ζbi���h�^�����BO9g������H�1l>��'\��t3l���}�j�aUv��F f��wmZ�Dm��sw�� �����o_�\�)�)�-ġg�w�2@��D��r+��XI��ނ�ͭX4ͨ�}v�u�����'�q��JK��U�z֥)M��I���]�le���Em�����e��^~>����(~�]Sj9�ة�]G 8��Q{ɭu�s'i%�!I�P7����ʷ�a�j|j��V��5d���qLw�e����a���(�����!}|�,L�e�e�������_.��z�[���5��&E_f��(���������Kqɑ �GZ!��Y��t����U��/��/=�]����k��'��1�~'�����҈1e�W*^>߄���>H�S��`'J��]yKIM�z�#���Tǽ��՚�O����m�$��,o.:�"��(�&A�A����.fhi�P�K.�0�G��喑���z��/����q���j���)��B��w��*�+�Y�wJ�J�(��=޳��)2�d.P�4�D�j�%�Oej�%t�[�HH9R��dג���q�:ML#�t��x�z�����|���
��B��ѭ�78ˇ?����3�VK+ڃ_5�n�>�����%' I���Œ8�V�F�t��^�Kc��xb����
�l�lY��U�j��y��z؁���.��p]紷�5�ª�ŨRu�]�n`E˚-�I�"A�cm������6y�{�:CX�[�*۴H��逨[s������)� �<�����M~h�ܦI(��}���7����Fjޥ�)3�x�Rf�(+�]N�_��L�څ�u�����I�6�+�͔��\��@��Eڎ��G|�����ƥt�`�� S�)A��u0� _�	L�ݭb �y@��m�s��L@]huB9×Hg*���ɝv�bi��փ��8ӊ+��h��]��&w_���h������=P�ZAU�8�`� � >��9^�^W������/+P�ҁ�R�^�/�e �͊��������������=�IZR����P0V�ݖ�{�͂�v>ŰzLj��Qh_�K�5(�* ��!T���8;%;��(x޹\����O��y_�����-B2v�E���"k�D`��B�M� |+��eБ2��[N���u}���F��9��$���S@K;���K���-6��#jLTT�Ӄ���}_T�>�:@9���,̙�اzͭ F�0zjg t�-��yg᳋\�ޖ�~�a��!��{�[ ��	Sг@��g[���i����M������Q�ib�����Dh�FH�&����*[��(&�-jj�F�SyvGi�/ah܀N� �jTK��EdJ���Z[����r:�D�_^��qж _���i�B�ރa�D�n�ĩ�ˠ7�9+h�h�@<��z}}y�b�F?�����H�B45		;�u��v�\ɚ'|F�����@Y�b���Y�����Ei�E�O����A����թ:�g�Hz>����Y��?���9Y��_4��T4 2��kG���٧�%\E~�@]$(�iWEI��EoE|,���(b	e6�^J�o������D=�`���G�H5"L+�7M�Oe�����t��I���\���C�X[�G�A�5b$�F��	)������ڗ�뒧_�CU|]��&������)8a��AU���a��QcS��iF\��_�k��6.Lv�	1Q�K5���n�ps�`(�2.��E������bT��?sN����4�f��k7�m`��j��0]-��P�e.�{�_��^��L�_�Q�$D��tW��=�� 2@�C	-��������R�8�M����F�g[^�Ë�XGݛ2����yo���NAOk>\^�S�-)Q����&K���j���B�͸)����f�Ͱc:��xy�R����Ӆe� �C�6�O�^�9�0�b�s�9ԉ��tJ��'�>�H��*��ƛ �jy������h1�� GHe�m�^�Q��C�sy�QP�t�V��瞐`��h�njd��/�I:2$��9���cU��"\�dQ�p�)�6N���4굤J�M�'������#?���KmҜx~,\3+�DF:��#N���n��qq��O��*ף��B�z��`�q.��Q8]@Nʓ��e�3�;�Α)��OK>��7�r�4-gJ�%$��HV��kKP+&af*��^F�6��o�ص`�S���J_^�ق92�Q@B��G�9�Mi�-���6hDzw�l��x�4��q]^^��H��zN��s'����$��5ƀX"��'�b�����|==<��_ׁ�1�RV��'�P��UԿ�! 0D���m���>��@t�Tb<=�~��]#dM3�=�$,n�U�i�G:�I��?b�bG��6\��7�~��u�<�!�]��6�@�j��j�Z7������ 6(�9�Ɵ����u_�b���;��u=4�"�m8�d~T���'��W�&g�s=��/ �!�w���F�ܦc	��!�(!�������n��	t�۹���:�L�%������b�����M��r�jC����ڀ�Nv��+�vP���L������!�Q���=��!�ɑ���kbr��A���z���O�f=��$T�Do}��w@ΕA���3���>K:����l`��Q\_�820⾼3@'n� q�����ԓb�a2=&w��fHG��&s,�������F�w����tjx�E ����Bbj��'M@��HӦ�He�T�����rFt�"�VL�9��]{y}���e���{g
���������t�%�0�hchʔ��ahĿ��z�>\�@�aR�dK��B,+�f�O@�Φ�FY��C�l���J�g:C��{|)���Q�j��e#��'��F�!6M��J���E�z o�2O�%z���AD������Ch�f���j��B��AA��Md�{T��� ���������]�g����q�}R�җ�7��]V����j`�k�O'�zx�F8�E��xA����&�"���2��G��t%m�����(�^.�yy�w�;�7�3�_]B�Yk ph�Rl�� �qB
t��(��� ��!7,��|F��łw�x3��F�Y���,`{�Cq�h�z�6oׇǇ������E3^��0[�����������Pn�7l��(��Io�z�W�	��;���V��;V����E��u�?Rj�5v����>6��92>��a��.��9�	K����q�@���/ا�?�緻���#aJc!��Hw�V��"zA]���ڠ�(t��Ic�?�x�Do/ߞ�؍���R�h�bϩ;b�@ �؎��XCz7	.���+ߞ�D#m��=��6ķgY㦼��w[h&�u��8iEK�<�}]�����\�=w�w�Y ���FR��{�!`�Wki����h�HWQ]�H�����q���w�^~��r}y����/�����7Ј-���}SU�c�"�V�R�1z���ȊOĶ���{���6q���vK*���I� \)jsM�ѐ�@rT�)��z�&�Y��������T��	2�����E�:�ɀ
=Q�4g����_~�Gp�p�(���6Z +�a`q�93=����Hz ��+E0<D7���������_$߂�0I0� Ld��?:3&�C�{5Z	NI�#>��u�q���wQ�7�*��v4`�-�ހ��$�7��h4#�aN-������h��c���Ն�6�8Q��Qj�dS rA}��z�� �ړ�b���/�/���2&a��h+L�
Wጻ�� �!Ӧ�4:��c�v�q|�4-��� �  �s���[u΃�16Em�ǅGm�����FBuX��@!)����O�?�*|}ZGZ�; G'&l#����P�`�:�Qjb:Ҵ�i�g��<��ޟ�������!FK#H��R���tlƮ6g�dơ	�!~n|�c���"���ݱ�q����s�e�C2o�vIhTH��'P;��+�ڣ��o{��I�|9^�O���a�
���ᦽ�M��U���n�~-��A�yNϱ\{{���Xÿ+#�JX�gR����$�s�+"��aH��{P�`h&��W���}���>P��cc�10~��ӥ�&�!�X�Fin
��!�C��']�����}��`Pl�i`2�=������ :Q���;��^��H4���r\受痧?����	h@�<�щ��F���;�H84n[�	&�}&Q8���n7���M�vr�9b���6�Vf7��T3���������c�r��z�z{�s���&Ƽ�1�t>	O^@c0󎴤�9c�8@��%Ew!����c7ezק���(g�j�rgQ��o��8*̢�	�/�S,XG{��G����=:^lFT�t1�sv^*�
g� ]�`b�r�ٹ��Z������C���ut�g�
&��ks�D*ѳ���P1r]�JNFa� ��5�O����4�0Ǘ{7T|D�S�Da܊�����9�Mz�L���qu��2�1���]Ǵ�n@{�C���6Lwf�"�����r��f��0U�8�����̽�s��Ǫ�P\��M%ͼ}2��I:;u�����>���l��ԗ��{�^�������<�&=-������� �Ǘ�`V���ʨ "oaHA�e�Q}����+E/�BC�&oxރ	zĬb�oyTB�o��f!@�OI���髾]����ʬ�4M�P�R�1X[x&� G���5d����v4X0������ ��3�#�8_�<nn�p`|sS�y�, 4c�f��nD$J0���	�ş���~���4:ޟ      �   E   x�3�L��ϫ��/-V(-N-�4�2�L,-�H�+�LN,IM�rs&��f�e�%��qq��qqq �w�      �   W  x��UY�� �Ƨ���}��� �J��=��E�=��Ӡ]���1��Sot� �0%��'�$|�x:Ϩs�&1l��	%��{�x1�0��Ӑ��?�.�f/�f/�����i��ж1<�.�o�s���&�A�lP�I�eͼ��|=������!���7_R�`�5��(F`iH�-@�bڭ���:��l�R�4W�E|�ek��l|�L�YL��<�E�a�ֵ�9�.�}~}�l�������=� 3��?���E����|�&5�w5&��'w`�W\�E�W\E�!�Q�>�yǃ�����⍍!¶\�Qx�d��G.{C}=\Z�K��u�h%X�[�j�Lv��w	!�F�K㺙"��2��������&DR��{ܕHr���_��a���4Ď'Aµ����p���n��P���|�Ľ�+�ݑ�p�'D.\��~�"PT�z��;%��z�����ҁ)U.5-9�,���1n�հ��El�Vg���?�Yv�	�W��ub܌�̤K%��Zu����ֵ���4���6lAf�7WN��O��ŉS��~�
��2R�����!sh�����E�/�Cj��N���j            x������ � �            x������ � �            x������ � �            x������ � �      �      x������ � �      �      x������ � �      �   x   x�%Ʊ
�0����0�wI�k��u�)���(Ep��"y|E���GH��m��s����Z�!���W�i>�x<�R�}��,�ZU���	�<1A9W&F��X9�����oR��]a�+w��1���          $   x�+��/*I.-�-N-�5�tIMK,�)����� �p�            x������ � �      �      x��]�r㶲�=y�;��]N�K���,9�|*����n ��ٖf*�Db#�����ؼ�۷?��z�o���\���~ЯQ��������O��4N�t'E�7��]�mM�'I�Wy5���H�;5���d���E_L$E%"�U_��JU�Fܗ�D�D}+qߏy�)����+Y��w�+E��[����Jd���A��3���l�/[���R�,ӏ��I�(����u.��zߧ�O�E_/�6��)���dM�˶39cL�21�/䳋�}��U�`Ƴ�o1aW�F!{�۲gj�SݦyZ�W��T����Cɢo笿N�_E����y����,���k�\���_��ϕ3�Jȷ�șN:^:�1����r�]�\�5�b��R#��__I���;��X�^�p�
#�?��l��*����[k�����[M4:p�f�W�Q>��1o�/]��A�i?�}�6͜��3ѯG�Tr�c=��?^hsh��'�����w���'�(��������s+�@�oU�yގ��{�=G ��Rp��>�?u�3/�H�H$�^����>#�KĨ�sC�Rļ=����s�v�S�y����x8��~�?���k�l�S��I/a+��ɫ`	�K���]���D8�I���5��Cb9�
9��x�k��0E0�n�T/�p􄸤��#A���[�pI�+O`��-=�%��}k�	�9`ڨ88��plZ���
�zh������� ��vHk�ˀRp�I�RJ~�AJzs�x*_��|d���������C>�72&ս��@��T��@{mvg5�a�4vi���z)��ͥ_�t��G���(�Y�vw�P�GOuΧ������x7ց���M�q�I��\0%H6*9y
��>|���=A1����C|+�&�>�Л"D.B���}��;�w�F}�|>t�����A%�����|��zn{XI�}���C��.��?v�������rY,!"�!�$�y��wCg�RJ� $R�%�E��$� �Ci<���S� Zhraڷ]����~�
z��▐�DI�(%�(`�Ԗ�L�e��R��Y�V%�4���ha�<��
��Hr���׶X�,_�V"�C);�&82�.�{R��WO7P�1 ��.�c0%��!\��Q��&�Y������|Y��['����-���u�L�g�%n|(A��28��g�9J�Y��-ے[^�w���!��Eg���Q��-���e��7���	���}���H�B�
�}j��}0|O���X9k��w$� �B�N��oK|І������Kez�5[5�/�Z����r9�ν�GJW��5+�jK����c�t+�2���.&#q�#��ybg礔ye�()u銕Cm��j���|�
�/�x��-y�/����-Cz�0Zy�j�_��u����(��
��D�����wS��A�;2��9��y����7�XH�s蚹=K0�F�.1:�~�������<}�9hIX{3�1X��-�c��bzג�UTvz��������D	Q��7�B+"�X1��l\�0�KXv���x���9y@:iǰV����Z�3�m!c��X�����ZG֬�}�7��TT��ݙ�K�xC+��1uT�q]�S����R���P3&UxݝY�k}a�4!'R	z�D>Z���
����Ӥ
��a�-l�����_����_�cx�l���(+��p����ԠA�'A�i�a� 5��)%E�ܜ[h1�í$����{���T��zd�n�S�����#h&:z"8�`�p��N/2u����A$�F�bK�1[B� B��?F߰`j�*�Ըa���Hh�Ȕ+�:ᾧGW3�����d1d��:��$ɉ!=�1�KI�d��^,s8-7���6����������bE]X��`"�D��='U���4�������J86p���t����
��f5I�eŐQ˂�|9�}��r;�V�2��	�����`3r��t�O\�BN�iR����@�<Ԧ'J˯�����,��E;�/p1�;9 q������ݳ�k�ƴ�}�:Ay� )eRGy誴���4i9�FSs��"��6�B����&�9�K���PH!�E�	)>�p��vzȀ��Z���\�TFy?��I3�:���%�ʌ�HޒDKJ�٢��hS�c@{�ܡ�@[�\��v�����}	�򑄱{޷���#��13R�ْ�D[-���H�"I��3�7IM2f�}�tb9�g�4>��s�`ў̰��{�E�HW�~��ۗ��}mM{���7���_�z���;q{���Kt��[���u.Z����G��E��+����C����|z~zjO�S����5أ�(�dR,��V��uB�(u��:0%f�#r��32��P�ݜq1�-�T�g�\�X)ץ�
�~�0aV��o��F��f�*E��:^)���;�=���Z���J�ٔhMI��\[�xLk�%��|�p
Kq�_��[R��zy�Ȩ�Y���!�6�VI��P��?eK��`��h�X{��S�]K�B�}� ��륺^�V�^c�[�0��@��^u^�F�dH9<�".�ri;�71f@ƶ�]��~�?�<��}�
V�9���f�,M��g���I���ǧ��+����%6������/���*����r'��������b��J��ᝃ+HF�ߴ�7�Ǵ�������zJ.��/�B73���*�����;�����pGѻ$��&g����\�B��=�a▤X��n���������Qp	#(ҞII:�t���������͖���HE�ʐ�q�#!ާ����S���o�m���YG�QpdOw���Q/6W*SFO[�8r{¿���SL˸?��2T�Ł3�zD���%�,e"�V�UVݽ�𞶋�c	��v���~�{��?:��3�q��3Vh�X[��Z*���r�G֙�����hg�q�i���8�]/�8��3���Ug�-n���G^N�A��|�LS͊?�j
������2X`Lu������.`du�i�wpZ�>�6j������v���������c�l<cGDVN�Xl�5�����-������=����_���(���Ͷ��7S%b(QC��N"Lz�7QȰ�� �Ä&��{�U�u���y�;�oK�Ɗړ�}��;�u}����rG�	���|�1��0�2��de0ЭBh#_K2��&��_v�v�
N��	�r'�t:�����������V�a��/�=T�Cg׀_+�,�no�s�mV�Ba��El���#B�ۤ_m#�3��ʽ3mǀy��p~>�~���=�~��u�f���_w��E�a�(�!�w%�1�ٔ��g���d�8N*E���@t�b �o`#O��?�̲ѓ��i��M���]#���"+TP��g����sC	ǹn�(�^OG�2ЧvƟc��d}.��2��s*|Ԡ�kg�N'<���z�a~p���=��\=P75l-Wo���?��v?�������<o���������y��5u{��@��B���5�����?.>�)�'9;�����������'��n�x_�9c�|nwJ��y�Q�uS���Ӧ^ږ���L%��;��k;wOG��Mk�se��u�eJ�3��,+`�f�e�W��N���(K���h��\�;��6��G$<�H�'F�?ș�P����yҀ���g�?�T�^�|��9�D��u�p�h�9�m	�p��"�ԧ�!�F_�ơɊV������J`�C]��,���s�jL��t� ���z�P��dKֻA�_�)χ���;??�ۇ�xj�מޞ{Bs)�ڌ�k��+E�]	vHG�+1�z1F�B���Eh��m�o��	�{ީ�D��Ymw�;<�~ͶA��~�8�����/?��M]p��(��A���Ԕ9ts,�9gI�[�4�Q;��AxC�g;�(j�r� �f�^s~��!�+#�5K������}�|/0'��f�g�RΠ������������0+�)��

be5��    �-��e�w�L��y���,�f�s\�R1�G�Mt�Z�r��֖��*V.��6�)�6��lY^�2���P��JBŽ�
k%S�'{h�gX� ˜�J��Oc�'3��\e����5Y��e�ύ{�`�p�d���O���AF͵����1��u���ڜ�_w�bBe<��Ó͌B��S;��N6%���.H�6��s򬅎[�BN�A�w��>��s��=mAwxLE{J��m']I4˺���6��%����Q�X���6с�_�y	��qk�%��5a(�@�q -�j�����ڋ�ߘ�:sHa"}��b���V��X���z��ߵ����I��݌��l�����!?tcz�_�ӹ~?�/z���+��ҙ��g�@�i?�.��B�!|��~gt�,��`{炈ܽ��CLk�}�e����.�LA��ƹ��6�~H�_'/�E��Ku�I�C�C�%ڶC�&���3���^��Q�6���v��)*J�l%K��o��^~}��W��:Ș�%ᣦ�{:�f^ϛf����O�,��?��zإk�(�&��&O�(K�,�96Kn��ʟ��LV�1˦��r�K��?��
^K�An��%j%�p�����jV�}e?��m��e
0�|1O1ϣ��Xe)���O�uo'Ґ�L���$��+!�첁S�ge�ផ#/+�yq%eqPR��w������g����V��+WpH˵9������vv5�Y�֍������m��/�s	�&V�\�f�\�z[B��^l´i�� �*�����90Zr����A�o���>��޽{�}���rx����ǃ���8A��׈T�t�\+R;7�bߘ9�t���3&10&v�r�mt�G�h`�{���|>t��9�T�=<=d��_��g���*��VNI�V�� gHZ�%�o��L}�6��\	��2�*�-�ݸ�e��`4�rl��9�J
���K<�[A�U�Ϸ-Xh���z��'��?�@	k_�䕠ѫ���'ʎ���a��ek��Km ~2�B��fB¡K:L-l�gF�ȳ"�%I[͞�����N�u�g���@Xx�Y�̊`�ʝ0�����Vl]nf �	��a�Ò���o�$=�R�ez��V��&Zw�,l��D[A�"XV.��^� ��mB�9F#.GZ5�!�ֽ,|O�d+�yGK��;�(P���	�Q{h�Obfx"%⥲�R�>C�{�����bm�n)��YIT[�1����X����R�^����Oc�i��do�y#DI�KW��j{pV�=8ux?��3T@M����E��ŭ����F��{Q�҆�d�c��G!*ĉ.c�+�X�$ʗ{�Y��y��%�2�\J&+��F�iy�$�SE0'�/t��B}��U8�%�?Q��X�y�(����]K�WQ�u�][CL<��A�"[)��c�k�"�X�9�`c�n��]�xc��l�M8�O�-k�����~�-T��~�XkȚ��O���T��A��=���Wߘ:ׅ�OFC���qJ.J�����!���
���Ye�0i�*�Tq�Tրˡ&m�,��,��{mڎ�!�ۖf/�#�ȰVe���^����#��Ǧ�?:�B���=�u�:�<X��YvҾ��D��N��}tFܯk��|:���J�E�B�[��ݷz����V\��)�aj���q�`����mˤ�1��ҙ�IZj]�������>�mG���������5t<�#g����ͨ"}�����fc�I"����X�D�ں[,Tha��ѡ%E�q�5�&���3�*ɀ3atpT�u��y���@K��`hc����D�U���6�뻈�oo�2�_��a*%�q�s3��yf,N����;c���~?�� \�W}eHƖ��T�1DH�Gr�~�6+�L�	ብ$�\�ۡ�9. ���IHF�7(��O��̊� au��D݂$ ,,��r`�J�SB/�oxcH���uw2xN��^-T	{N斠8��'Pˈ���Zr~}12�VY��!���A�5+��Z5�d�<�$J^!�n)�ZbY�0����Y�Vb��'��KH�{a|��J�[fY�B��#���k��i
��`'pSh�
����mʜ�N����7�*�� �b�.��&hW�f52V�̯�x�����:X/���P�dy�1�YIZ�z�	[IU��d�t��P���M�)�+F���8��I�J�fK�wRD����0�p��P�jxg�=�{�T��O4�yL�f<2r�J+��P�6��#u�b��{	S�LϘ���_@>
��ߡ�r��{t�Rk�p��B���[�TdXK��P�	mw@�B�j�W��Q��-)�
ĳ���2�o~�A�0�k辿#]^mv��P����'����Sݺ�/Ni�[��,�~��+~�UiB�:�͆Ҩ]��i���π
�+��A̜�c^|���Y1�7	�C�|��h|�����&�&�[����Ԟ�9k:o)?�/�|i��G�W�w7�]:_i�q��B�`�)�p,o�Ί=�F�ʃ:Ԗ,Ä��Iϝ�X�aR:9����'�5���~7.V�wg��_��S_��W+L��tTT���%S9�T�	8	�k�׃�|�������i��J���0��?�����
��d
H�`��.���D��jQ*Hb�,�a�9t���?C���1H1�w��R���Z�d�J�"��� � ����J�>��0`�@[��Z�s��_l�|S�ߦ������߶>?v/���nC�Zg�^��t^~�j���� /�����u7������)�a��,a�����r{:Oj͕+�C3����W����M.J8���7#���MM�{��x����7��G]X���X)@������3�Ka�_0�����9 �dV�ymO���3�*�*ZeDb��l{�cb�넧���x�yw�wt��|)�d�,Iν��?�. ��ǳ�ǝ���v�<�?�/j�Q�Gv�Ka݀�͌�0�󬚹ǐ����n����<ʦ�U���-�c��`gv�/���m/�k�MGk��:��p� NI�d�r*���(����<u5�J�c������E����aG�MdGK�S�b�,I�����ػ�6`�U��s<_~�/:�"�v=�����́|��hRD/H��/�@3W�j��������~��>|>!oet�ҍzz�H]��w�9���PC�^_�'.��E�I�Q�
�O�����򢗱��J�G��L��1q�����c�j��DځA�$my�*;��$�I��l���/���_���}�Y5-t�R����
�N����Ah=L2_ <��v��~�j�j�������Z����ovK�牭B��pU�fg��l�ʾ�
���p7R��G���p]��R�{6��<(�'���1L�td�ۜ�'�C.���K� �g@����r`J��ҝ�)}a��p H�f�H�ϑwh19�AϦ���>}�ߺ�܂C:k���C~u@FO�ݜ�_w��R�K����3"���Jiu���W0E�b��&^�6F�Y�Hm�2��I��X�(ي��NJ��	����7U�E� ��f���:Ӗ̕_�^ki��T۳�H��_��iY��UX2��Rs�,LF�B\޸%�%����FJ�ju]?�o��u�C�V*�I�5�Y]nYπ�գ]���d�'8s`���SM0	!o����lg�
�l�0x|���_H��/�.롣x _�lf/����;Ǻ��� ��BGI�-���sW_^��Y}j~�A#���$k*?��t�Ԇ�<P�Շ�mm�'���tr�T��s�ޮ6s����UT�)�Q!�=NC�aG��Ȭc ތ~g]1��&k�S�g(9_�WK��S7X�]��}��?n�� �?9����pi�Ry�x���Ҟ2T�Ǡ|���4x%��e+�:��b�3�c��,��c3�Mh�m� �J�@\C�xlĬ�?�⺣��ب�<�0��C�H��5N2א��;�{��������%j��v!Q�s���X��Dͳa���o8m� �  ����?_m��7�H�ϵ�<�jv����P���P��� tُ�x�?�N�S{1�ϵ.��4ߔ/���0T�����[F����K-2SQS�`��i�xg�L���_�^��2`�����aiBj8��i�nn�G����ؾ�o���������f<�+�N�+���qVS���n���H�T�l#��-ϙ�K���[�U�q��������bY�BY�<W�=�s0=W)�?�𯑮�?\�ų(a��+�r�RA�.�".)"�+���G����oȖ���*J�c�{�Ž;�ߖru��tj�v=�b_�AL_Y��P��3\��ѵ�-�*�0L��2	iM���{"��Gi�dYV$�a30�x{d��`��"]�2r����F��,��έqm�h6���҃y����/�x�Z��ڢ<������کإu�\Q���R-*t�u��5��6��6	p��$8��u"N}mD|��V������p���D��*�p�Y���Vw(R�`�ʍ�RX�!�f�@���A���J0s߬��e�r��{M,��#�]{8?�?ԧ�������9tsL��(�*�3� � ]lqD�d�Y��}���~eŻ7��ζ�q�l}�}y|�����|YLP�|�i{jsJ����V(�����;�^�lXٗ��
��8�eq^��m9�  0P��1\�$7�*J�����F�6�,����0�l�,d��dy"��`�-�x�0�C��FS6�\H��D�����I�_�7��ed�"�s�/��Nޖ0�qw�Y�2W��er���ꆁ�P1�H�7� _K{,����ǐE�s���o����f�V��x<����5�"����w
%"���/������*,�%damI2کb�n�4r:ǖA���£w��/�j��l@J��<x\e�Շe��f����o�߲uG�0k�;6��o�O�������ݿ��@ 
~��p0�(K�շ�:�(�,Dr����A�1���d:�G���B��N�kX2�2�����l�����Ы���>�O�0��Qv.���,4��S��ȍ Ag8H��+��z�.Z'�m(�_�8�`�2p���G�2ϸ�V\�h��"��7/�+���/���H�Ï��p���y��3V�5ox���s`)���Ġ�}k�Z�9�N�EFF��:iA`j���|�fQ��
�^,����>�x��
clB��*�È�"aO�6����Z!W
%�4�u�m�ӄ�v���N���ߵ���4F�/y��S.�0�|I~�,�+BQzF�&(�uzu-{��!�Q����P����{�����;���0qS��޻��� N�:��c������߾|�h�ꤚK�\䟦���j�� N�R�,-��3�!O�?��מ����S'�ǟ��&�gɲf�&�{�{�{�,R�x��Pr,  �2|���Un`�P0����>4��� (�$dU6�2�>��SB�GΌ�
�	��`=:Zcr�����|��=��)w�2�ց��A�;�woNA~q���#	}����+�T%M�6}۽���m��rW����Mۓ��=Կ]�P�u�7�$��&�SJO9�xS����hB-OL�Y�|;�l ���n�,}�b�wl�L��A��CL\��?6�l@���aF�����?�+��u�I!m�[G�S�Y_J�3mt)ԉ_,w��8�dI��{�q�ߚ��������'MG!���yL��H9XZ+�QJZ��m�,Z�1������KV��������c�����g'�����R�+�;�\n��85�Kr��2�x{��=�������|e�k.]!5O����0���rt�ׂ�pl�S�������͎P�^_�ڢl�UL����҄H�$�_v��Xy��ǂ��R�&�w���NW}�;���粐s.�fh���r�u�
ɞ;��s['�!Q�w���5�<�j_����t~��>~>����
��b�������z�Oi�{��ξ���`�`���
��>0gs���*�&g��G���.:�rd��M�D����l{�vF�FVZ�{����`t���䀫+��"����nR;��Ue͓%����H+�3�R���8������<�ӝ3�r�{��5鱩�6�*�zg\��;��S�}-����RcJ�ܻ��Op�*���$0�Sʴ2V
(�����I6��v�TI;5�	������
���ں�����]Fރ5���ʕH��� �$ƙ�Jf�6���xe�V��u�}]�$��h�]���x�v��x��@����@�(���o�/�V
�k�!>���sn!�b��:�\Dc����	�J�����z�C���,V|�s�:s���\�.9��x���
�/g/�Q4'��x3�������Ԕ�v��2�.�/�P�6f�Y��ԩ��z�
�:8�H>Ǜ�𳸵8�_Ҟ����GT���W!�b8�������i$/����P�SP�֗��� �d���RJ����a��4�����Ӟ�o���
el��8y����?������fI��w�t5����NS5s{E*P п	�]?�Pm����򢂖���	�����B�+=�i�YɩUvZ��^�b(���z��J��[YR�9�N�F��,|�\"��:��}�p�y��w��j��Y{���g�.�:>��X�Ț��OW�䯝Y��I7��}cJ
V�$G�z�]���s@�Mh�9����+��WV�2V4X�+Q��,ML.�y�
A�����R?d�Ox9�IG.�����!������U����t���L��w�u:1Ov-q��l��k���齶<� |@´����� ��ǚ��:h�W�/�G�d�*� �����g���3"WN	찴���!��o�wH�"%>�w���=W�u��X���,��:�C����j�cD̏#��/�'Eq��C�d˻���ং#�(������w�Q�X�8[;�@�si�@�1�+���蒍P���v�7�%K�3hĥ��ہ�L$vh=%��d	� �E��7�_�g����>aO��7����:x�ݜ�7�Ce�w{��� ��5,�y��1��@���mq6�,�*���{���Z�E
��s���)��<�TG1�0�1�`�{��,�9�!$��ȫh�� ��1'�lf�;�8ګ�+��
�=�W#���z^:)�y�ZZ=�Q�Ro+ �YnA����}к��-mY��0���62`e,ͬ�麂!m��ml�9��DJ�T�nBK��h�ÖQ�������m1��-f�t�� �L.�M^`�K�$��~)����V���-n9�sg#2 ��uI�]h���!��a�W��G���,(Y`�JS��R!%U���!���{ZK|?j���I���d�	� `��V@�{-蜙ֲ�G�������T�            x������ � �            x������ � �            x������ � �         X   x��A
� ��y�ؿ��^�	���B���e�a8�8�=�3n��XL��dSreG��Ҥ�-9$;J_U��EM�#�u�j��A
w!��+      �      x������ � �      �   �   x�}M;�@����xq�D���bXN���P����j��M��@/%����t7[ٮ��f3L�j�˾������e~�vwɪ�v�kO�!�r���t���(_$�HzT� �p�e��c�R��Z� `�*���
Sy��� x�	�Y�0|1���Ct0����<Q      �      x�3�4����� k       �   S  x��Uے�8}^���n���R�H��1$�L�>-�H�ڛ<�U�V_��wsں�lc����@0B���Il�,�O�:O��>�����f���B U�d ��F��p�NZ"RԪ
Z²,)	�j%I	cA�R���tp�e^���.��[����:k3���!�q���l^��3ٓ]�ŌzY�o&�W|TK��h�`^H��0*P-(I̤a^�J	�$2�����A'{�h�D+{62�(C��	nսǳ鮺�כ)u�#J.h��֩HOQC2�O�uz^�0O����2�:��6�<�W��(�̿�o77���p����6��l9���3�e�¶:��i�N�����G�ٶ��r4��]z�Mm��O�]Sc�a���܇��}�´Rhy�]*eW�V�΃���>�{&�·hw~�x��q�+��ս��$D�����X�TO��)�`�'o��U���:�m�a���ω8/%���(����DY!��T�c<��q����9OGli�d���Z��E���,�p<WP�Q�y��Z�+��KJ7�a�?��4�of���ř�����/;1L>�B&�y&jNY�íO�s���_���9��|X���?�fOM\9l?_�9Nu�n�z��DJk3�����L�~-G�?`�4��~�D9}� TJ�[��\�kiD�Ғ�ꇼ�%ぇ,�[e�rƷ|�):̱�n�1�YG��9�v�AW0WY���^�Ndd]�(���V�SAQx��2�\���ͺ*W�Hm��,5Y*=)U��	}�y}�ŧj��,�	'>�QO�!��]Sz�<������:��Kx�y��|��_��O��/�с�      
   k  x��͎�0��������*������^6J$��}��I��v/kG��(!�I~���gLhF��Ǽ�Svw��3�ms���:�����;P^s�����L�1&ACBIh@2��1i�@ Ck��uYvX�������K���Xwx`�������0~��=v�	-��'}�M����?�'z?�Oz���,h�wΌV��PeY��$�3NA��pL_��k4ܿߔ@�.d��UĈ�o�I���C��b����T�(�>�ƠUD	�ӂQ<b@�o�IO(o!�J��Z�;-CNI�ĕ!*s�6�+3�924�ZPT8FAE�ؑ�w���`J��Jq%bfH*'@&�V^�h����7�TN���d�P��� e ��O�3��8):�� �Ghĵ��@%��Y$#����w��� 
�;6v�b&�]'�%�:v�\qԀ��#ʻBN�N�>2r�\n��\Ɉ��*���	
���M���	q=��¨�t���������f�h�L����#%BV=��r�9�ⶻ���𰫵~~Y�"�k�]��[3>���"ҵMvA&�!k��q>}p4� ��P��T x�������򦁊�RW�<PӁ'H x�vmv�_ȈZ�᰿v3#H�d�u��ۤ � �m�c.M��(�Z@+�W���5C�ޡrNTN<��ï�n0u�Xō�MBI��y�`�LcDT�0�a:�Њ�~`a*�lS�:{�F�51�J�a�b��2�`�';����]-�����f.-���hv�͔}3�liMo����]_��[��`,�?��`�r��9<i+�f��+>�s�ó��Y^{ q_���"���E��?;l�%     