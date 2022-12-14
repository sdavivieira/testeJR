PGDMP     4    )                z            Entrega    13.8    13.8     ?           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ?           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ?           1262    16422    Entrega    DATABASE     i   CREATE DATABASE "Entrega" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE "Entrega";
                postgres    false            ?            1259    16438    item    TABLE     ?   CREATE TABLE public.item (
    id_item character varying NOT NULL,
    quantidade double precision,
    valor double precision,
    pedido_id integer
);
    DROP TABLE public.item;
       public         heap    postgres    false            ?            1259    16428    pedido    TABLE       CREATE TABLE public.pedido (
    id_pedido integer NOT NULL,
    datahora time without time zone,
    notafiscal character varying(20),
    valorfrete double precision,
    desconto double precision,
    valortotal double precision,
    trans_id integer
);
    DROP TABLE public.pedido;
       public         heap    postgres    false            ?            1259    16459    produto    TABLE     ?   CREATE TABLE public.produto (
    id_produto character varying NOT NULL,
    nome character varying(20),
    descricao character varying(100),
    item_id character varying(20)
);
    DROP TABLE public.produto;
       public         heap    postgres    false            ?            1259    16423    transportadora    TABLE     f   CREATE TABLE public.transportadora (
    id_trans integer NOT NULL,
    nome character varying(20)
);
 "   DROP TABLE public.transportadora;
       public         heap    postgres    false            ?          0    16438    item 
   TABLE DATA           E   COPY public.item (id_item, quantidade, valor, pedido_id) FROM stdin;
    public          postgres    false    202          ?          0    16428    pedido 
   TABLE DATA           m   COPY public.pedido (id_pedido, datahora, notafiscal, valorfrete, desconto, valortotal, trans_id) FROM stdin;
    public          postgres    false    201   2       ?          0    16459    produto 
   TABLE DATA           G   COPY public.produto (id_produto, nome, descricao, item_id) FROM stdin;
    public          postgres    false    203   O       ?          0    16423    transportadora 
   TABLE DATA           8   COPY public.transportadora (id_trans, nome) FROM stdin;
    public          postgres    false    200   l       3           2606    16445    item item_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.item
    ADD CONSTRAINT item_pkey PRIMARY KEY (id_item);
 8   ALTER TABLE ONLY public.item DROP CONSTRAINT item_pkey;
       public            postgres    false    202            1           2606    16432    pedido pedido_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_pkey PRIMARY KEY (id_pedido);
 <   ALTER TABLE ONLY public.pedido DROP CONSTRAINT pedido_pkey;
       public            postgres    false    201            5           2606    16466    produto produto_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.produto
    ADD CONSTRAINT produto_pkey PRIMARY KEY (id_produto);
 >   ALTER TABLE ONLY public.produto DROP CONSTRAINT produto_pkey;
       public            postgres    false    203            /           2606    16427 "   transportadora transportadora_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.transportadora
    ADD CONSTRAINT transportadora_pkey PRIMARY KEY (id_trans);
 L   ALTER TABLE ONLY public.transportadora DROP CONSTRAINT transportadora_pkey;
       public            postgres    false    200            7           2606    16446    item item_pedido_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.item
    ADD CONSTRAINT item_pedido_id_fkey FOREIGN KEY (pedido_id) REFERENCES public.pedido(id_pedido);
 B   ALTER TABLE ONLY public.item DROP CONSTRAINT item_pedido_id_fkey;
       public          postgres    false    2865    202    201            6           2606    16433    pedido pedido_trans_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_trans_id_fkey FOREIGN KEY (trans_id) REFERENCES public.transportadora(id_trans);
 E   ALTER TABLE ONLY public.pedido DROP CONSTRAINT pedido_trans_id_fkey;
       public          postgres    false    2863    201    200            8           2606    16467    produto produto_item_id_fkey    FK CONSTRAINT        ALTER TABLE ONLY public.produto
    ADD CONSTRAINT produto_item_id_fkey FOREIGN KEY (item_id) REFERENCES public.item(id_item);
 F   ALTER TABLE ONLY public.produto DROP CONSTRAINT produto_item_id_fkey;
       public          postgres    false    202    2867    203            ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?     