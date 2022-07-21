--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 14.3

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


--
-- Roles
--
-- CREATE ROLE tiesu;
ALTER ROLE tiesu WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS;

--
-- Name: tiesutst; Type: SCHEMA; Schema: -; Owner: tiesu
--

CREATE SCHEMA tiesutst;
ALTER SCHEMA tiesutst OWNER TO tiesu;


SET default_tablespace = '';

SET default_table_access_method = heap;


--
-- Name: PALVELUPAIKAT; Type: TABLE; Schema: tiesutst; Owner: tiesu
--

CREATE TABLE tiesutst."palvelupaikat" (
    "nimi" character varying(1000),
    "lyhenne" character varying(100),
    "rataosa" character varying(1000),
    "tyyppi" character varying(1000),
    "henkiloliikenne" character varying(50),
    "tavaraliikenne" character varying(50),
    "kaukoohjaus" character varying(50),
    "liikennepaikan_ohitus" character varying(100),
    "lahto_maara" character varying(100),
    "veturin_huoltoon_sta" character varying(100),
    "manuaalivaihdetyo_tarvitaan" character varying(100),
    "rajoitevaihtokulkutienmuodost" character varying(100),
    "ratatyon_turvaus" character varying(100),
    "urakoitsija_finrail" character varying(50),
    "urakoitsija_vr" character varying(50),
    "urakoitsija_joku_muu" character varying(2000),
    "huomautus" character varying(2000),
    "lisamiehityksen_tilaus" character varying(2000),
    "created" timestamp without time zone,
    "last_modified_date" timestamp without time zone,
    "last_modified_by" character varying(500),
    "username" character varying(500),
    "form_version" character varying(50),
    "document_id" character varying(100),
    "deleted" character varying(50),
    "app" character varying(500),
    "form" character varying(500)
);


ALTER TABLE tiesutst."palvelupaikat" OWNER TO tiesu;

--
-- Name: RATASUUNNITELMA; Type: TABLE; Schema: tiesutst; Owner: tiesu
--

CREATE TABLE tiesutst."ratasuunnitelma" (
    "tunnus" numeric(38,0) NOT NULL,
    "suunnitelman_nimi" character varying(1000) NOT NULL,
    "suunnitelman_kuvaus" character varying(2000),
    "yva_hanke" numeric(38,10),
    "asianumero" character varying(60) NOT NULL,
    "ely_keskus" character varying(50),
    "status_id" numeric(38,0),
    "hyvaksytty_esitys_laadittu" timestamp without time zone,
    "hyvaksytty_esitys_saapunut" timestamp without time zone,
    "aloituskuulutus" timestamp without time zone,
    "kokonaiskustannukset" double precision,
    "valtio" double precision,
    "kunta" double precision,
    "muut" double precision,
    "indeksivuosiluku" numeric(38,0),
    "maarakennusindeksi" numeric(38,19),
    "lakkaaminen" numeric(38,10),
    "kiireellinen_kasittely" numeric(38,10),
    "muistutusten_lukumaara" numeric(38,0),
    "kohde_id1" numeric(38,0),
    "kohde_id2" numeric(38,0),
    "selitys" character varying(1000),
    "hyvaksytty_paatos_annettu" timestamp without time zone,
    "jatkopaatos_1_annettu" timestamp without time zone,
    "jatkopaatos_2_annettu" timestamp without time zone,
    "palautettu_elylle" timestamp without time zone,
    "lvm_laadittu" timestamp without time zone,
    "lvm_hyvaksymispaatos" timestamp without time zone,
    "lvm_jatkopaatos" timestamp without time zone,
    "old_osapaatos_annettu" character varying(500),
    "valitusten_maara" numeric(38,0),
    "hao_valipaatoksen_paivamaara" character varying(500),
    "hao_kumottu" numeric(38,10),
    "hao_pvm" timestamp without time zone,
    "hao_sisalto" character varying(1000),
    "kho_valipaatoksen_paivamaara" character varying(1000),
    "kho_kumottu" numeric(38,10),
    "kho_pvm" timestamp without time zone,
    "kho_sisalto" character varying(1000),
    "old_lainvoimaisuus" character varying(200),
    "lainvoimaisuus_paattyy" timestamp without time zone,
    "rauennut" character varying(1000),
    "suunnitelma_laadittu" character varying(1000),
    "kasittelija" character varying(100),
    "riviluotupvm" timestamp without time zone,
    "rivimuokattupvm" timestamp without time zone,
    "rivimuokkaajatunnus" character varying(150),
    "document_id" character varying(255),
    "hao_valipaatos_sisalto" character varying(1000),
    "kho_valipaatos_sisalto" character varying(1000),
    "kayttoonottoluovutus_osa" timestamp without time zone,
    "kayttoonottoluovutus_koko" timestamp without time zone,
    "sahko" double precision,
    "viestinta" double precision,
    "vesi" double precision,
    "lainvoimaisuus" timestamp without time zone,
    "osapaatos_annettu" timestamp without time zone,
    "sistiesuunnittelua" numeric(38,10),
    "ratatoimitustehty" timestamp without time zone
);


ALTER TABLE tiesutst."ratasuunnitelma" OWNER TO tiesu;

--
-- Name: RATASUUNNITELMA_15102020; Type: TABLE; Schema: tiesutst; Owner: tiesu
--

CREATE TABLE tiesutst."ratasuunnitelma_15102020" (
    "tunnus" numeric(38,0) NOT NULL,
    "suunnitelman_nimi" character varying(1000) NOT NULL,
    "suunnitelman_kuvaus" character varying(2000),
    "yva_hanke" numeric(38,10),
    "asianumero" character varying(60) NOT NULL,
    "ely_keskus" character varying(50),
    "status_id" numeric(38,0),
    "hyvaksytty_esitys_laadittu" timestamp without time zone,
    "hyvaksytty_esitys_saapunut" timestamp without time zone,
    "aloituskuulutus" timestamp without time zone,
    "kokonaiskustannukset" double precision,
    "valtio" double precision,
    "kunta" double precision,
    "muut" double precision,
    "indeksivuosiluku" numeric(38,0),
    "maarakennusindeksi" numeric(38,19),
    "lakkaaminen" numeric(38,10),
    "kiireellinen_kasittely" numeric(38,10),
    "muistutusten_lukumaara" numeric(38,0),
    "kohde_id1" numeric(38,0),
    "kohde_id2" numeric(38,0),
    "selitys" character varying(1000),
    "hyvaksytty_paatos_annettu" timestamp without time zone,
    "jatkopaatos_1_annettu" timestamp without time zone,
    "jatkopaatos_2_annettu" timestamp without time zone,
    "palautettu_elylle" timestamp without time zone,
    "lvm_laadittu" timestamp without time zone,
    "lvm_hyvaksymispaatos" timestamp without time zone,
    "lvm_jatkopaatos" timestamp without time zone,
    "osapaatos_annettu" character varying(500),
    "valitusten_maara" numeric(38,0),
    "hao_valipaatoksen_paivamaara" character varying(500),
    "hao_kumottu" numeric(38,10),
    "hao_pvm" timestamp without time zone,
    "hao_sisalto" character varying(1000),
    "kho_valipaatoksen_paivamaara" character varying(1000),
    "kho_kumottu" numeric(38,10),
    "kho_pvm" timestamp without time zone,
    "kho_sisalto" character varying(1000),
    "lainvoimaisuus" character varying(200),
    "lainvoimaisuus_paattyy" timestamp without time zone,
    "rauennut" character varying(1000),
    "suunnitelma_laadittu" character varying(1000),
    "kasittelija" character varying(100),
    "riviluotupvm" timestamp without time zone,
    "rivimuokattupvm" timestamp without time zone,
    "rivimuokkaajatunnus" character varying(150),
    "document_id" character varying(255),
    "hao_valipaatos_sisalto" character varying(1000),
    "kho_valipaatos_sisalto" character varying(1000),
    "kayttoonottoluovutus_osa" timestamp without time zone,
    "kayttoonottoluovutus_koko" timestamp without time zone,
    "sahko" double precision,
    "viestinta" double precision,
    "vesi" double precision
);


ALTER TABLE tiesutst."ratasuunnitelma_15102020" OWNER TO tiesu;

--
-- Name: RAUTATIEN_YLEISSUUNNITELMA; Type: TABLE; Schema: tiesutst; Owner: tiesu
--

CREATE TABLE tiesutst."rautatien_yleissuunnitelma" (
    "tunnus" numeric(38,0) NOT NULL,
    "suunnitelman_nimi" character varying(1000) NOT NULL,
    "suunnitelman_kuvaus" character varying(2000),
    "yva_hanke" numeric(38,10),
    "asianumero" character varying(60) NOT NULL,
    "ely_keskus" character varying(50),
    "status_id" numeric(38,0),
    "hyvaksytty_esitys_laadittu" timestamp without time zone,
    "hyvaksytty_esitys_saapunut" timestamp without time zone,
    "aloituskuulutus" timestamp without time zone,
    "kokonaiskustannukset" double precision,
    "valtio" double precision,
    "kunta" double precision,
    "muut" double precision,
    "indeksivuosiluku" numeric(38,0),
    "maarakennusindeksi" numeric(38,19),
    "lakkaaminen" numeric(38,10),
    "kiireellinen_kasittely" numeric(38,10),
    "muistutusten_lukumaara" numeric(38,0),
    "kohde_id1" numeric(38,0),
    "kohde_id2" numeric(38,0),
    "kohde_id3" numeric(38,0),
    "selitys" character varying(1000),
    "hyvaksytty_paatos_annettu" timestamp without time zone,
    "jatkopaatos_1_annettu" timestamp without time zone,
    "jatkopaatos_2_annettu" timestamp without time zone,
    "palautettu_elylle" timestamp without time zone,
    "lvm_laadittu" timestamp without time zone,
    "lvm_hyvaksymispaatos" timestamp without time zone,
    "lvm_jatkopaatos" timestamp without time zone,
    "old_osapaatos_annettu" character varying(500),
    "valitusten_maara" numeric(38,0),
    "hao_valipaatoksen_paivamaara" character varying(500),
    "hao_kumottu" numeric(38,10),
    "hao_pvm" timestamp without time zone,
    "hao_sisalto" character varying(1000),
    "kho_valipaatoksen_paivamaara" character varying(1000),
    "kho_kumottu" numeric(38,10),
    "kho_pvm" timestamp without time zone,
    "kho_sisalto" character varying(1000),
    "old_lainvoimaisuus" character varying(200),
    "lainvoimaisuus_paattyy" timestamp without time zone,
    "rauennut" character varying(1000),
    "suunnitelma_laadittu" character varying(1000),
    "projektipaallikko" character varying(100),
    "riviluotupvm" timestamp without time zone,
    "rivimuokattupvm" timestamp without time zone,
    "rivimuokkaajatunnus" character varying(150),
    "document_id" character varying(255),
    "hao_valipaatos_sisalto" character varying(1000),
    "kho_valipaatos_sisalto" character varying(1000),
    "sahko" double precision,
    "viestinta" double precision,
    "vesi" double precision,
    "lainvoimaisuus" timestamp without time zone,
    "osapaatos_annettu" timestamp without time zone
);


ALTER TABLE tiesutst."rautatien_yleissuunnitelma" OWNER TO tiesu;

--
-- Name: RAUTATIEN_YLEISSUUNN_15102020; Type: TABLE; Schema: tiesutst; Owner: tiesu
--

CREATE TABLE tiesutst."rautatien_yleissuunn_15102020" (
    "tunnus" numeric(38,0) NOT NULL,
    "suunnitelman_nimi" character varying(1000) NOT NULL,
    "suunnitelman_kuvaus" character varying(2000),
    "yva_hanke" numeric(38,10),
    "asianumero" character varying(60) NOT NULL,
    "ely_keskus" character varying(50),
    "status_id" numeric(38,0),
    "hyvaksytty_esitys_laadittu" timestamp without time zone,
    "hyvaksytty_esitys_saapunut" timestamp without time zone,
    "aloituskuulutus" timestamp without time zone,
    "kokonaiskustannukset" double precision,
    "valtio" double precision,
    "kunta" double precision,
    "muut" double precision,
    "indeksivuosiluku" numeric(38,0),
    "maarakennusindeksi" numeric(38,19),
    "lakkaaminen" numeric(38,10),
    "kiireellinen_kasittely" numeric(38,10),
    "muistutusten_lukumaara" numeric(38,0),
    "kohde_id1" numeric(38,0),
    "kohde_id2" numeric(38,0),
    "kohde_id3" numeric(38,0),
    "selitys" character varying(1000),
    "hyvaksytty_paatos_annettu" timestamp without time zone,
    "jatkopaatos_1_annettu" timestamp without time zone,
    "jatkopaatos_2_annettu" timestamp without time zone,
    "palautettu_elylle" timestamp without time zone,
    "lvm_laadittu" timestamp without time zone,
    "lvm_hyvaksymispaatos" timestamp without time zone,
    "lvm_jatkopaatos" timestamp without time zone,
    "osapaatos_annettu" character varying(500),
    "valitusten_maara" numeric(38,0),
    "hao_valipaatoksen_paivamaara" character varying(500),
    "hao_kumottu" numeric(38,10),
    "hao_pvm" timestamp without time zone,
    "hao_sisalto" character varying(1000),
    "kho_valipaatoksen_paivamaara" character varying(1000),
    "kho_kumottu" numeric(38,10),
    "kho_pvm" timestamp without time zone,
    "kho_sisalto" character varying(1000),
    "lainvoimaisuus" character varying(200),
    "lainvoimaisuus_paattyy" timestamp without time zone,
    "rauennut" character varying(1000),
    "suunnitelma_laadittu" character varying(1000),
    "projektipaallikko" character varying(100),
    "riviluotupvm" timestamp without time zone,
    "rivimuokattupvm" timestamp without time zone,
    "rivimuokkaajatunnus" character varying(150),
    "document_id" character varying(255),
    "hao_valipaatos_sisalto" character varying(1000),
    "kho_valipaatos_sisalto" character varying(1000),
    "sahko" double precision,
    "viestinta" double precision,
    "vesi" double precision
);


ALTER TABLE tiesutst."rautatien_yleissuunn_15102020" OWNER TO tiesu;

--
-- Name: RS_KOHDE; Type: TABLE; Schema: tiesutst; Owner: tiesu
--

CREATE TABLE tiesutst."rs_kohde" (
    "kohde_id" numeric(38,0) NOT NULL,
    "kohde_selite" character varying(100),
    "readonly" numeric(38,10)
);


ALTER TABLE tiesutst."rs_kohde" OWNER TO tiesu;

--
-- Name: RS_STATUS; Type: TABLE; Schema: tiesutst; Owner: tiesu
--

CREATE TABLE tiesutst."rs_status" (
    "status_id" numeric(38,0) NOT NULL,
    "selite" character varying(300),
    "readonly" numeric(38,10)
);


ALTER TABLE tiesutst."rs_status" OWNER TO tiesu;

--
-- Name: RT_HISTORIA; Type: TABLE; Schema: tiesutst; Owner: tiesu
--

CREATE TABLE tiesutst."rt_historia" (
    "rivi_id" numeric(38,10) NOT NULL,
    "tunnus" numeric(38,0),
    "suunnitelman_nimi" character varying(1000),
    "suunnitelman_kuvaus" character varying(2000),
    "yva_hanke" numeric(38,10),
    "asianumero" character varying(60),
    "ely_keskus" character varying(50),
    "status_id" numeric(38,0),
    "hyvaksytty_esitys_laadittu" timestamp without time zone,
    "hyvaksytty_esitys_saapunut" timestamp without time zone,
    "aloituskuulutus" timestamp without time zone,
    "kokonaiskustannukset" double precision,
    "valtio" double precision,
    "kunta" double precision,
    "muut" double precision,
    "indeksivuosiluku" numeric(38,0),
    "maarakennusindeksi" numeric(38,19),
    "lakkaaminen" numeric(38,10),
    "kiireellinen_kasittely" numeric(38,10),
    "muistutusten_lukumaara" numeric(38,0),
    "kohde_id1" numeric(38,0),
    "kohde_id2" numeric(38,0),
    "selitys" character varying(1000),
    "hyvaksytty_paatos_annettu" timestamp without time zone,
    "jatkopaatos_1_annettu" timestamp without time zone,
    "jatkopaatos_2_annettu" timestamp without time zone,
    "palautettu_elylle" timestamp without time zone,
    "lvm_laadittu" timestamp without time zone,
    "lvm_hyvaksymispaatos" timestamp without time zone,
    "lvm_jatkopaatos" timestamp without time zone,
    "old_osapaatos_annettu" character varying(500),
    "valitusten_maara" numeric(38,0),
    "hao_valipaatoksen_paivamaara" character varying(500),
    "hao_kumottu" numeric(38,10),
    "hao_pvm" timestamp without time zone,
    "hao_sisalto" character varying(1000),
    "kho_valipaatoksen_paivamaara" character varying(1000),
    "kho_kumottu" numeric(38,10),
    "kho_pvm" timestamp without time zone,
    "kho_sisalto" character varying(1000),
    "old_lainvoimaisuus" character varying(200),
    "lainvoimaisuus_paattyy" timestamp without time zone,
    "rauennut" character varying(1000),
    "suunnitelma_laadittu" character varying(1000),
    "kasittelija" character varying(100),
    "historiatyyppi" character varying(6) NOT NULL,
    "rivitunnus" numeric(38,10),
    "rivitila" character varying(15),
    "riviluotupvm" timestamp without time zone,
    "rivimuokattupvm" timestamp without time zone,
    "rivimuokkaajatunnus" character varying(150),
    "document_id" character varying(255),
    "hao_valipaatos_sisalto" character varying(1000),
    "kho_valipaatos_sisalto" character varying(1000),
    "kayttoonottoluovutus_osa" timestamp without time zone,
    "kayttoonottoluovutus_koko" timestamp without time zone,
    "sahko" double precision,
    "viestinta" double precision,
    "vesi" double precision,
    "lainvoimaisuus" timestamp without time zone,
    "osapaatos_annettu" timestamp without time zone,
    "sistiesuunnittelua" numeric(38,10),
    "ratatoimitustehty" timestamp without time zone
);


ALTER TABLE tiesutst."rt_historia" OWNER TO tiesu;

--
-- Name: RT_HISTORIA_15102020; Type: TABLE; Schema: tiesutst; Owner: tiesu
--

CREATE TABLE tiesutst."rt_historia_15102020" (
    "rivi_id" numeric(38,10) NOT NULL,
    "tunnus" numeric(38,0),
    "suunnitelman_nimi" character varying(1000),
    "suunnitelman_kuvaus" character varying(2000),
    "yva_hanke" numeric(38,10),
    "asianumero" character varying(60),
    "ely_keskus" character varying(50),
    "status_id" numeric(38,0),
    "hyvaksytty_esitys_laadittu" timestamp without time zone,
    "hyvaksytty_esitys_saapunut" timestamp without time zone,
    "aloituskuulutus" timestamp without time zone,
    "kokonaiskustannukset" double precision,
    "valtio" double precision,
    "kunta" double precision,
    "muut" double precision,
    "indeksivuosiluku" numeric(38,0),
    "maarakennusindeksi" numeric(38,19),
    "lakkaaminen" numeric(38,10),
    "kiireellinen_kasittely" numeric(38,10),
    "muistutusten_lukumaara" numeric(38,0),
    "kohde_id1" numeric(38,0),
    "kohde_id2" numeric(38,0),
    "selitys" character varying(1000),
    "hyvaksytty_paatos_annettu" timestamp without time zone,
    "jatkopaatos_1_annettu" timestamp without time zone,
    "jatkopaatos_2_annettu" timestamp without time zone,
    "palautettu_elylle" timestamp without time zone,
    "lvm_laadittu" timestamp without time zone,
    "lvm_hyvaksymispaatos" timestamp without time zone,
    "lvm_jatkopaatos" timestamp without time zone,
    "osapaatos_annettu" character varying(500),
    "valitusten_maara" numeric(38,0),
    "hao_valipaatoksen_paivamaara" character varying(500),
    "hao_kumottu" numeric(38,10),
    "hao_pvm" timestamp without time zone,
    "hao_sisalto" character varying(1000),
    "kho_valipaatoksen_paivamaara" character varying(1000),
    "kho_kumottu" numeric(38,10),
    "kho_pvm" timestamp without time zone,
    "kho_sisalto" character varying(1000),
    "lainvoimaisuus" character varying(200),
    "lainvoimaisuus_paattyy" timestamp without time zone,
    "rauennut" character varying(1000),
    "suunnitelma_laadittu" character varying(1000),
    "kasittelija" character varying(100),
    "historiatyyppi" character varying(6) NOT NULL,
    "rivitunnus" numeric(38,10),
    "rivitila" character varying(15),
    "riviluotupvm" timestamp without time zone,
    "rivimuokattupvm" timestamp without time zone,
    "rivimuokkaajatunnus" character varying(150),
    "document_id" character varying(255),
    "hao_valipaatos_sisalto" character varying(1000),
    "kho_valipaatos_sisalto" character varying(1000),
    "kayttoonottoluovutus_osa" timestamp without time zone,
    "kayttoonottoluovutus_koko" timestamp without time zone,
    "sahko" double precision,
    "viestinta" double precision,
    "vesi" double precision
);


ALTER TABLE tiesutst."rt_historia_15102020" OWNER TO tiesu;

--
-- Name: RT_KASITE_ARVO; Type: TABLE; Schema: tiesutst; Owner: tiesu
--

CREATE TABLE tiesutst."rt_kasite_arvo" (
    "kasite_wid" numeric(38,0) NOT NULL,
    "kasite" character varying(100),
    "arvo" character varying(200)
);


ALTER TABLE tiesutst."rt_kasite_arvo" OWNER TO tiesu;

--
-- Name: rt_yleis_kasite_arvo; Type: TABLE; Schema: tiesutst; Owner: tiesu
--

CREATE TABLE tiesutst."rt_yleis_kasite_arvo" (
    "kasite_wid" numeric(38,0) NOT NULL,
    "kasite" character varying(100),
    "arvo" character varying(200)
);


ALTER TABLE tiesutst."rt_yleis_kasite_arvo" OWNER TO tiesu;

--
-- Name: RYS_HISTORIA; Type: TABLE; Schema: tiesutst; Owner: tiesu
--

CREATE TABLE tiesutst."rys_historia" (
    "rivi_id" numeric(38,10) NOT NULL,
    "tunnus" numeric(38,0),
    "suunnitelman_nimi" character varying(1000),
    "suunnitelman_kuvaus" character varying(2000),
    "yva_hanke" numeric(38,10),
    "asianumero" character varying(60),
    "ely_keskus" character varying(50),
    "status_id" numeric(38,0),
    "hyvaksytty_esitys_laadittu" timestamp without time zone,
    "hyvaksytty_esitys_saapunut" timestamp without time zone,
    "aloituskuulutus" timestamp without time zone,
    "kokonaiskustannukset" double precision,
    "valtio" double precision,
    "kunta" double precision,
    "muut" double precision,
    "indeksivuosiluku" numeric(38,0),
    "maarakennusindeksi" numeric(38,19),
    "lakkaaminen" numeric(38,10),
    "kiireellinen_kasittely" numeric(38,10),
    "muistutusten_lukumaara" numeric(38,0),
    "kohde_id1" numeric(38,0),
    "kohde_id2" numeric(38,0),
    "kohde_id3" numeric(38,0),
    "selitys" character varying(1000),
    "hyvaksytty_paatos_annettu" timestamp without time zone,
    "jatkopaatos_1_annettu" timestamp without time zone,
    "jatkopaatos_2_annettu" timestamp without time zone,
    "palautettu_elylle" timestamp without time zone,
    "lvm_laadittu" timestamp without time zone,
    "lvm_hyvaksymispaatos" timestamp without time zone,
    "lvm_jatkopaatos" timestamp without time zone,
    "old_osapaatos_annettu" character varying(500),
    "valitusten_maara" numeric(38,0),
    "hao_valipaatoksen_paivamaara" character varying(500),
    "hao_kumottu" numeric(38,10),
    "hao_pvm" timestamp without time zone,
    "hao_sisalto" character varying(1000),
    "kho_valipaatoksen_paivamaara" character varying(1000),
    "kho_kumottu" numeric(38,10),
    "kho_pvm" timestamp without time zone,
    "kho_sisalto" character varying(1000),
    "old_lainvoimaisuus" character varying(200),
    "lainvoimaisuus_paattyy" timestamp without time zone,
    "rauennut" character varying(1000),
    "suunnitelma_laadittu" character varying(1000),
    "projektipaallikko" character varying(100),
    "historiatyyppi" character varying(6) NOT NULL,
    "rivitunnus" numeric(38,10),
    "rivitila" character varying(15),
    "riviluotupvm" timestamp without time zone,
    "rivimuokattupvm" timestamp without time zone,
    "rivimuokkaajatunnus" character varying(150),
    "document_id" character varying(255),
    "hao_valipaatos_sisalto" character varying(1000),
    "kho_valipaatos_sisalto" character varying(1000),
    "sahko" double precision,
    "viestinta" double precision,
    "vesi" double precision,
    "lainvoimaisuus" timestamp without time zone,
    "osapaatos_annettu" timestamp without time zone
);


ALTER TABLE tiesutst."rys_historia" OWNER TO tiesu;

--
-- Name: RYS_HISTORIA_15102020; Type: TABLE; Schema: tiesutst; Owner: tiesu
--

CREATE TABLE tiesutst."rys_historia_15102020" (
    "rivi_id" numeric(38,10) NOT NULL,
    "tunnus" numeric(38,0),
    "suunnitelman_nimi" character varying(1000),
    "suunnitelman_kuvaus" character varying(2000),
    "yva_hanke" numeric(38,10),
    "asianumero" character varying(60),
    "ely_keskus" character varying(50),
    "status_id" numeric(38,0),
    "hyvaksytty_esitys_laadittu" timestamp without time zone,
    "hyvaksytty_esitys_saapunut" timestamp without time zone,
    "aloituskuulutus" timestamp without time zone,
    "kokonaiskustannukset" double precision,
    "valtio" double precision,
    "kunta" double precision,
    "muut" double precision,
    "indeksivuosiluku" numeric(38,0),
    "maarakennusindeksi" numeric(38,19),
    "lakkaaminen" numeric(38,10),
    "kiireellinen_kasittely" numeric(38,10),
    "muistutusten_lukumaara" numeric(38,0),
    "kohde_id1" numeric(38,0),
    "kohde_id2" numeric(38,0),
    "kohde_id3" numeric(38,0),
    "selitys" character varying(1000),
    "hyvaksytty_paatos_annettu" timestamp without time zone,
    "jatkopaatos_1_annettu" timestamp without time zone,
    "jatkopaatos_2_annettu" timestamp without time zone,
    "palautettu_elylle" timestamp without time zone,
    "lvm_laadittu" timestamp without time zone,
    "lvm_hyvaksymispaatos" timestamp without time zone,
    "lvm_jatkopaatos" timestamp without time zone,
    "osapaatos_annettu" character varying(500),
    "valitusten_maara" numeric(38,0),
    "hao_valipaatoksen_paivamaara" character varying(500),
    "hao_kumottu" numeric(38,10),
    "hao_pvm" timestamp without time zone,
    "hao_sisalto" character varying(1000),
    "kho_valipaatoksen_paivamaara" character varying(1000),
    "kho_kumottu" numeric(38,10),
    "kho_pvm" timestamp without time zone,
    "kho_sisalto" character varying(1000),
    "lainvoimaisuus" character varying(200),
    "lainvoimaisuus_paattyy" timestamp without time zone,
    "rauennut" character varying(1000),
    "suunnitelma_laadittu" character varying(1000),
    "projektipaallikko" character varying(100),
    "historiatyyppi" character varying(6) NOT NULL,
    "rivitunnus" numeric(38,10),
    "rivitila" character varying(15),
    "riviluotupvm" timestamp without time zone,
    "rivimuokattupvm" timestamp without time zone,
    "rivimuokkaajatunnus" character varying(150),
    "document_id" character varying(255),
    "hao_valipaatos_sisalto" character varying(1000),
    "kho_valipaatos_sisalto" character varying(1000),
    "sahko" double precision,
    "viestinta" double precision,
    "vesi" double precision
);


ALTER TABLE tiesutst."rys_historia_15102020" OWNER TO tiesu;

--
-- Name: RYS_KOHDE; Type: TABLE; Schema: tiesutst; Owner: tiesu
--

CREATE TABLE tiesutst."rys_kohde" (
    "kohde_id" numeric(38,0) NOT NULL,
    "kohde_selite" character varying(100),
    "readonly" numeric(38,10)
);


ALTER TABLE tiesutst."rys_kohde" OWNER TO tiesu;

--
-- Name: RYS_STATUS; Type: TABLE; Schema: tiesutst; Owner: tiesu
--

CREATE TABLE tiesutst."rys_status" (
    "status_id" numeric(38,0) NOT NULL,
    "selite" character varying(300),
    "readonly" numeric(38,10)
);


ALTER TABLE tiesutst."rys_status" OWNER TO tiesu;

--
-- Name: TIESUUNNITELMA; Type: TABLE; Schema: tiesutst; Owner: tiesu
--

CREATE TABLE tiesutst."tiesuunnitelma" (
    "ts_wid" numeric(38,0) NOT NULL,
    "tiesuunnitelma_nro" numeric(38,0),
    "tiesuunnitelma_nimi" character varying(1000) NOT NULL,
    "kasittelija" character varying(500),
    "tiesuunnitelman_kuvaus" character varying(1000),
    "diaari" character varying(250) NOT NULL,
    "ely_keskus" character varying(10),
    "status_id" numeric(38,0),
    "hyvaksytty_esitys_laadittu" timestamp without time zone,
    "hyvaksytty_esitys_saapunut" timestamp without time zone,
    "kokonaiskustannukset" double precision,
    "valtio" double precision,
    "valtio_osuus" double precision,
    "kunta" double precision,
    "kunta_osuus" double precision,
    "muut" double precision,
    "muut_osuus" double precision,
    "indeksivuosiluku" numeric(38,0),
    "maarakennusindeksi" numeric(38,19),
    "maantien_lakkaaminen" numeric(38,10),
    "kiireellinen_kasittely" numeric(38,10),
    "muistutusten_lukumaara" numeric(38,0),
    "ts_kohde_id" numeric(38,0),
    "ts_kohde_id2" numeric(38,0),
    "selitys" character varying(1000),
    "hyvaksytty_paatos_annettu" timestamp without time zone,
    "kasittely_vrk" numeric(38,0),
    "lvm_laadittu" timestamp without time zone,
    "lvm_hyvaksymispaatos" timestamp without time zone,
    "jatkopaatos" timestamp without time zone,
    "old_osapaatos_annettu" timestamp without time zone,
    "valitusten_maara" numeric(38,0),
    "hao_valipaatoksen_paivamaara" character varying(500),
    "hao_kumottu" numeric(38,10),
    "hao_paatoksen_paivamaara" timestamp without time zone,
    "hao_paatoksen_sisalto" character varying(1000),
    "kho_valipaatoksen_paivamaara" character varying(1000),
    "kho_kumottu" numeric(38,10),
    "kho_paatoksen_paivamaara" timestamp without time zone,
    "kho_paatoksen_sisalto" character varying(1000),
    "old_lainvoimaisuus" character varying(1000),
    "lainvoimaisuuden_paattyminen" timestamp without time zone,
    "old_liikenteeseenluovutus_osa" character varying(1000),
    "old_liikenteeseenluovutus_koko" character varying(1000),
    "yva_hanke" numeric(38,10),
    "aloituskuulutus" timestamp without time zone,
    "sahko" double precision,
    "viestinta" double precision,
    "vesi" double precision,
    "jatkopaatos_1_annettu" timestamp without time zone,
    "jatkopaatos_2_annettu" timestamp without time zone,
    "palautettu_elylle" timestamp without time zone,
    "riviluotupvm" timestamp without time zone,
    "rivimuokattupvm" timestamp without time zone,
    "rivimuokkaajatunnus" character varying(150),
    "document_id" character varying(255),
    "rauennut" timestamp without time zone,
    "hao_valipaatos_sisalto" character varying(1000),
    "kho_valipaatos_sisalto" character varying(1000),
    "lainvoimaisuus" timestamp without time zone,
    "osapaatos_annettu" timestamp without time zone,
    "liikenteeseenluovutus_osa" timestamp without time zone,
    "liikenteeseenluovutus_koko" timestamp without time zone,
    "sisratasuunnittelua" numeric(38,10),
    "maantietoimitustehty" timestamp without time zone
);


ALTER TABLE tiesutst."tiesuunnitelma" OWNER TO tiesu;

--
-- Name: TIESUUNNITELMAHISTORIA; Type: TABLE; Schema: tiesutst; Owner: tiesu
--

CREATE TABLE tiesutst."tiesuunnitelmahistoria" (
    "rivi_id" numeric(38,10) NOT NULL,
    "tunnus" numeric(38,0),
    "suunnitelman_nimi" character varying(1000),
    "kasittelija" character varying(500),
    "suunnitelman_kuvaus" character varying(1000),
    "asianumero" character varying(250),
    "ely_keskus" character varying(10),
    "status_id" numeric(38,0),
    "hyvaksytty_esitys_laadittu" timestamp without time zone,
    "hyvaksytty_esitys_saapunut" timestamp without time zone,
    "kokonaiskustannukset" double precision,
    "valtio" double precision,
    "valtio_osuus" double precision,
    "kunta" double precision,
    "kunta_osuus" double precision,
    "muut" double precision,
    "muut_osuus" double precision,
    "indeksivuosiluku" numeric(38,0),
    "maarakennusindeksi" numeric(38,19),
    "maantien_lakkaaminen" numeric(38,10),
    "kiireellinen_kasittely" numeric(38,10),
    "muistutusten_lukumaara" numeric(38,0),
    "kohde_id" numeric(38,0),
    "kohde_id2" numeric(38,0),
    "selitys" character varying(1000),
    "hyvaksytty_paatos_annettu" timestamp without time zone,
    "kasittely_vrk" numeric(38,0),
    "lvm_laadittu" timestamp without time zone,
    "lvm_hyvaksymispaatos" timestamp without time zone,
    "lvm_jatkopaatos" timestamp without time zone,
    "old_osapaatos_annettu" timestamp without time zone,
    "valitusten_maara" numeric(38,0),
    "hao_valipaatoksen_paivamaara" character varying(500),
    "hao_kumottu" numeric(38,10),
    "hao_pvm" timestamp without time zone,
    "hao_sisalto" character varying(1000),
    "kho_valipaatoksen_paivamaara" character varying(1000),
    "kho_kumottu" numeric(38,10),
    "kho_pvm" timestamp without time zone,
    "kho_sisalto" character varying(1000),
    "old_lainvoimaisuus" character varying(1000),
    "lainvoimaisuus_paattyy" timestamp without time zone,
    "old_liikenteeseenluovutus_osa" character varying(1000),
    "old_liikenteeseenluovutus_koko" character varying(1000),
    "yva_hanke" numeric(38,10),
    "aloituskuulutus" timestamp without time zone,
    "sahko" double precision,
    "viestinta" double precision,
    "vesi" double precision,
    "jatkopaatos_1_annettu" timestamp without time zone,
    "jatkopaatos_2_annettu" timestamp without time zone,
    "palautettu_elylle" timestamp without time zone,
    "historiatyyppi" character varying(6) NOT NULL,
    "rivitunnus" numeric(38,10),
    "rivitila" character varying(15),
    "riviluotupvm" timestamp without time zone,
    "rivimuokattupvm" timestamp without time zone,
    "rivimuokkaajatunnus" character varying(150),
    "document_id" character varying(255),
    "rauennut" timestamp without time zone,
    "hao_valipaatos_sisalto" character varying(1000),
    "kho_valipaatos_sisalto" character varying(1000),
    "lainvoimaisuus" timestamp without time zone,
    "osapaatos_annettu" timestamp without time zone,
    "liikenteeseenluovutus_osa" timestamp without time zone,
    "liikenteeseenluovutus_koko" timestamp without time zone,
    "sisratasuunnittelua" numeric(38,10),
    "maantietoimitustehty" timestamp without time zone
);


ALTER TABLE tiesutst."tiesuunnitelmahistoria" OWNER TO tiesu;

--
-- Name: TIESUUNNITELMAHIST_15102020; Type: TABLE; Schema: tiesutst; Owner: tiesu
--

CREATE TABLE tiesutst."tiesuunnitelmahist_15102020" (
    "rivi_id" numeric(38,10) NOT NULL,
    "tunnus" numeric(38,0),
    "suunnitelman_nimi" character varying(1000),
    "kasittelija" character varying(500),
    "suunnitelman_kuvaus" character varying(1000),
    "asianumero" character varying(250),
    "ely_keskus" character varying(10),
    "status_id" numeric(38,0),
    "hyvaksytty_esitys_laadittu" timestamp without time zone,
    "hyvaksytty_esitys_saapunut" timestamp without time zone,
    "kokonaiskustannukset" double precision,
    "valtio" double precision,
    "valtio_osuus" double precision,
    "kunta" double precision,
    "kunta_osuus" double precision,
    "muut" double precision,
    "muut_osuus" double precision,
    "indeksivuosiluku" numeric(38,0),
    "maarakennusindeksi" numeric(38,19),
    "maantien_lakkaaminen" numeric(38,10),
    "kiireellinen_kasittely" numeric(38,10),
    "muistutusten_lukumaara" numeric(38,0),
    "kohde_id" numeric(38,0),
    "kohde_id2" numeric(38,0),
    "selitys" character varying(1000),
    "hyvaksytty_paatos_annettu" timestamp without time zone,
    "kasittely_vrk" numeric(38,0),
    "lvm_laadittu" timestamp without time zone,
    "lvm_hyvaksymispaatos" timestamp without time zone,
    "lvm_jatkopaatos" timestamp without time zone,
    "osapaatos_annettu" timestamp without time zone,
    "valitusten_maara" numeric(38,0),
    "hao_valipaatoksen_paivamaara" character varying(500),
    "hao_kumottu" numeric(38,10),
    "hao_pvm" timestamp without time zone,
    "hao_sisalto" character varying(1000),
    "kho_valipaatoksen_paivamaara" character varying(1000),
    "kho_kumottu" numeric(38,10),
    "kho_pvm" timestamp without time zone,
    "kho_sisalto" character varying(1000),
    "lainvoimaisuus" character varying(1000),
    "lainvoimaisuus_paattyy" timestamp without time zone,
    "liikenteeseenluovutus_osa" character varying(1000),
    "liikenteeseenluovutus_koko" character varying(1000),
    "yva_hanke" numeric(38,10),
    "aloituskuulutus" timestamp without time zone,
    "sahko" double precision,
    "viestinta" double precision,
    "vesi" double precision,
    "jatkopaatos_1_annettu" timestamp without time zone,
    "jatkopaatos_2_annettu" timestamp without time zone,
    "palautettu_elylle" timestamp without time zone,
    "historiatyyppi" character varying(6) NOT NULL,
    "rivitunnus" numeric(38,10),
    "rivitila" character varying(15),
    "riviluotupvm" timestamp without time zone,
    "rivimuokattupvm" timestamp without time zone,
    "rivimuokkaajatunnus" character varying(150),
    "document_id" character varying(255),
    "rauennut" timestamp without time zone,
    "hao_valipaatos_sisalto" character varying(1000),
    "kho_valipaatos_sisalto" character varying(1000)
);


ALTER TABLE tiesutst."tiesuunnitelmahist_15102020" OWNER TO tiesu;

--
-- Name: TIESUUNNITELMA_15102020; Type: TABLE; Schema: tiesutst; Owner: tiesu
--

CREATE TABLE tiesutst."tiesuunnitelma_15102020" (
    "ts_wid" numeric(38,0) NOT NULL,
    "tiesuunnitelma_nro" numeric(38,0),
    "tiesuunnitelma_nimi" character varying(1000) NOT NULL,
    "kasittelija" character varying(500),
    "tiesuunnitelman_kuvaus" character varying(1000),
    "diaari" character varying(250) NOT NULL,
    "ely_keskus" character varying(10),
    "status_id" numeric(38,0),
    "hyvaksytty_esitys_laadittu" timestamp without time zone,
    "hyvaksytty_esitys_saapunut" timestamp without time zone,
    "kokonaiskustannukset" double precision,
    "valtio" double precision,
    "valtio_osuus" double precision,
    "kunta" double precision,
    "kunta_osuus" double precision,
    "muut" double precision,
    "muut_osuus" double precision,
    "indeksivuosiluku" numeric(38,0),
    "maarakennusindeksi" numeric(38,19),
    "maantien_lakkaaminen" numeric(38,10),
    "kiireellinen_kasittely" numeric(38,10),
    "muistutusten_lukumaara" numeric(38,0),
    "ts_kohde_id" numeric(38,0),
    "ts_kohde_id2" numeric(38,0),
    "selitys" character varying(1000),
    "hyvaksytty_paatos_annettu" timestamp without time zone,
    "kasittely_vrk" numeric(38,0),
    "lvm_laadittu" timestamp without time zone,
    "lvm_hyvaksymispaatos" timestamp without time zone,
    "jatkopaatos" timestamp without time zone,
    "osapaatos_annettu" timestamp without time zone,
    "valitusten_maara" numeric(38,0),
    "hao_valipaatoksen_paivamaara" character varying(500),
    "hao_kumottu" numeric(38,10),
    "hao_paatoksen_paivamaara" timestamp without time zone,
    "hao_paatoksen_sisalto" character varying(1000),
    "kho_valipaatoksen_paivamaara" character varying(1000),
    "kho_kumottu" numeric(38,10),
    "kho_paatoksen_paivamaara" timestamp without time zone,
    "kho_paatoksen_sisalto" character varying(1000),
    "lainvoimaisuus" character varying(1000),
    "lainvoimaisuuden_paattyminen" timestamp without time zone,
    "liikenteeseenluovutus_osa" character varying(1000),
    "liikenteeseenluovutus_koko" character varying(1000),
    "yva_hanke" numeric(38,10),
    "aloituskuulutus" timestamp without time zone,
    "sahko" double precision,
    "viestinta" double precision,
    "vesi" double precision,
    "jatkopaatos_1_annettu" timestamp without time zone,
    "jatkopaatos_2_annettu" timestamp without time zone,
    "palautettu_elylle" timestamp without time zone,
    "riviluotupvm" timestamp without time zone,
    "rivimuokattupvm" timestamp without time zone,
    "rivimuokkaajatunnus" character varying(150),
    "document_id" character varying(255),
    "rauennut" timestamp without time zone,
    "hao_valipaatos_sisalto" character varying(1000),
    "kho_valipaatos_sisalto" character varying(1000)
);


ALTER TABLE tiesutst."tiesuunnitelma_15102020" OWNER TO tiesu;

--
-- Name: TIESUUNNITELMA_KASITE_ARVO; Type: TABLE; Schema: tiesutst; Owner: tiesu
--

CREATE TABLE tiesutst."tiesuunnitelma_kasite_arvo" (
    "kasite_wid" numeric(38,0) NOT NULL,
    "kasite" character varying(100),
    "arvo" character varying(200)
);


ALTER TABLE tiesutst."tiesuunnitelma_kasite_arvo" OWNER TO tiesu;

--
-- Name: TS_KOHDE; Type: TABLE; Schema: tiesutst; Owner: tiesu
--

CREATE TABLE tiesutst."ts_kohde" (
    "kohde_id" numeric(38,0) NOT NULL,
    "kohde_selite" character varying(100)
);


ALTER TABLE tiesutst."ts_kohde" OWNER TO tiesu;

--
-- Name: TS_STATUS; Type: TABLE; Schema: tiesutst; Owner: tiesu
--

CREATE TABLE tiesutst."ts_status" (
    "status_id" numeric(38,0) NOT NULL,
    "status_selite" character varying(100),
    "readonly" numeric(38,10)
);


ALTER TABLE tiesutst."ts_status" OWNER TO tiesu;

--
-- Name: YLEISSUUNITELMA; Type: TABLE; Schema: tiesutst; Owner: tiesu
--

CREATE TABLE tiesutst."yleissuunitelma" (
    "ys_wid" numeric(38,0) NOT NULL,
    "yleissuunitelman_nro" numeric(38,0),
    "yleissuunnitelman_nimi" character varying(1000) NOT NULL,
    "kasittelija" character varying(100),
    "suunnitelmalaji" character varying(500),
    "yleissuunitelman_kuvaus" character varying(2000),
    "diaari" character varying(60) NOT NULL,
    "ely_keskus" character varying(50),
    "y_status_id" numeric(38,0),
    "hyvaksytty_esitys_laadittu" timestamp without time zone,
    "hyvaksytty_esitys_saapunut" timestamp without time zone,
    "muistutukset" numeric(38,0),
    "hyvaksytty_paatos_annettu" timestamp without time zone,
    "valitusten_maara" numeric(38,0),
    "selitys" character varying(1000),
    "kasittely_vrk" numeric(38,0),
    "old_osapaatos_annettu" character varying(500),
    "hao_pvm" timestamp without time zone,
    "hao_sisalto" character varying(1000),
    "kho_pvm" timestamp without time zone,
    "kho_sisalto" character varying(1000),
    "old_lainvoimaisuus" character varying(200),
    "lainvoimasuus_paattyy" timestamp without time zone,
    "raennut" character varying(1000),
    "tiesuunnitelma_laadittu" character varying(1000),
    "jatkopaatos" timestamp without time zone,
    "yva_hanke" numeric(38,10),
    "kokonaiskustannukset" double precision,
    "aloituskuulutus" timestamp without time zone,
    "valtio" double precision,
    "kunta" double precision,
    "muut" double precision,
    "sahko" double precision,
    "viestinta" double precision,
    "vesi" double precision,
    "indeksivuosiluku" numeric(38,0),
    "maarakennusindeksi" numeric(38,19),
    "maantien_lakkaaminen" numeric(38,10),
    "kiireellinen_kasittely" numeric(38,10),
    "muistutusten_lukumaara" numeric(38,0),
    "kohde_id" numeric(38,0),
    "kohde_id2" numeric(38,0),
    "jatkopaatos_1_annettu" timestamp without time zone,
    "jatkopaatos_2_annettu" timestamp without time zone,
    "palautettu_elylle" timestamp without time zone,
    "lvm_laadittu" timestamp without time zone,
    "lvm_hyvaksymispaatos" timestamp without time zone,
    "hao_valipaatoksen_paivamaara" character varying(500),
    "hao_kumottu" numeric(38,10),
    "kho_valipaatoksen_paivamaara" character varying(1000),
    "kho_kumottu" numeric(38,10),
    "riviluotupvm" timestamp without time zone,
    "rivimuokattupvm" timestamp without time zone,
    "rivimuokkaajatunnus" character varying(150),
    "document_id" character varying(255),
    "rauennut" timestamp without time zone,
    "hao_valipaatos_sisalto" character varying(1000),
    "kho_valipaatos_sisalto" character varying(1000),
    "lainvoimaisuus" timestamp without time zone,
    "osapaatos_annettu" timestamp without time zone
);


ALTER TABLE tiesutst."yleissuunitelma" OWNER TO tiesu;

--
-- Name: YLEISSUUNITELMA_15102020; Type: TABLE; Schema: tiesutst; Owner: tiesu
--

CREATE TABLE tiesutst."yleissuunitelma_15102020" (
    "ys_wid" numeric(38,0) NOT NULL,
    "yleissuunitelman_nro" numeric(38,0),
    "yleissuunnitelman_nimi" character varying(1000) NOT NULL,
    "kasittelija" character varying(100),
    "suunnitelmalaji" character varying(500),
    "yleissuunitelman_kuvaus" character varying(2000),
    "diaari" character varying(60) NOT NULL,
    "ely_keskus" character varying(50),
    "y_status_id" numeric(38,0),
    "hyvaksytty_esitys_laadittu" timestamp without time zone,
    "hyvaksytty_esitys_saapunut" timestamp without time zone,
    "muistutukset" numeric(38,0),
    "hyvaksytty_paatos_annettu" timestamp without time zone,
    "valitusten_maara" numeric(38,0),
    "selitys" character varying(1000),
    "kasittely_vrk" numeric(38,0),
    "osapaatos_annettu" character varying(500),
    "hao_pvm" timestamp without time zone,
    "hao_sisalto" character varying(1000),
    "kho_pvm" timestamp without time zone,
    "kho_sisalto" character varying(1000),
    "lainvoimaisuus" character varying(200),
    "lainvoimasuus_paattyy" timestamp without time zone,
    "raennut" character varying(1000),
    "tiesuunnitelma_laadittu" character varying(1000),
    "jatkopaatos" timestamp without time zone,
    "yva_hanke" numeric(38,10),
    "kokonaiskustannukset" double precision,
    "aloituskuulutus" timestamp without time zone,
    "valtio" double precision,
    "kunta" double precision,
    "muut" double precision,
    "sahko" double precision,
    "viestinta" double precision,
    "vesi" double precision,
    "indeksivuosiluku" numeric(38,0),
    "maarakennusindeksi" numeric(38,19),
    "maantien_lakkaaminen" numeric(38,10),
    "kiireellinen_kasittely" numeric(38,10),
    "muistutusten_lukumaara" numeric(38,0),
    "kohde_id" numeric(38,0),
    "kohde_id2" numeric(38,0),
    "jatkopaatos_1_annettu" timestamp without time zone,
    "jatkopaatos_2_annettu" timestamp without time zone,
    "palautettu_elylle" timestamp without time zone,
    "lvm_laadittu" timestamp without time zone,
    "lvm_hyvaksymispaatos" timestamp without time zone,
    "hao_valipaatoksen_paivamaara" character varying(500),
    "hao_kumottu" numeric(38,10),
    "kho_valipaatoksen_paivamaara" character varying(1000),
    "kho_kumottu" numeric(38,10),
    "riviluotupvm" timestamp without time zone,
    "rivimuokattupvm" timestamp without time zone,
    "rivimuokkaajatunnus" character varying(150),
    "document_id" character varying(255),
    "rauennut" timestamp without time zone,
    "hao_valipaatos_sisalto" character varying(1000),
    "kho_valipaatos_sisalto" character varying(1000)
);


ALTER TABLE tiesutst."yleissuunitelma_15102020" OWNER TO tiesu;

--
-- Name: YLEISSUUNNITELMAHISTORIA; Type: TABLE; Schema: tiesutst; Owner: tiesu
--

CREATE TABLE tiesutst."yleissuunnitelmahistoria" (
    "rivi_id" numeric(38,10) NOT NULL,
    "tunnus" numeric(38,0),
    "suunnitelman_nimi" character varying(1000),
    "kasittelija" character varying(100),
    "suunnitelmalaji" character varying(500),
    "suunnitelman_kuvaus" character varying(2000),
    "asianumero" character varying(60),
    "ely_keskus" character varying(50),
    "status_id" numeric(38,0),
    "hyvaksytty_esitys_laadittu" timestamp without time zone,
    "hyvaksytty_esitys_saapunut" timestamp without time zone,
    "muistutukset" numeric(38,0),
    "hyvaksytty_paatos_annettu" timestamp without time zone,
    "valitusten_maara" numeric(38,0),
    "selitys" character varying(1000),
    "kasittely_vrk" numeric(38,0),
    "old_osapaatos_annettu" character varying(500),
    "hao_pvm" timestamp without time zone,
    "hao_sisalto" character varying(1000),
    "kho_pvm" timestamp without time zone,
    "kho_sisalto" character varying(1000),
    "old_lainvoimaisuus" character varying(200),
    "lainvoimaisuus_paattyy" timestamp without time zone,
    "raennut" character varying(1000),
    "suunnitelma_laadittu" character varying(1000),
    "lvm_jatkopaatos" timestamp without time zone,
    "yva_hanke" numeric(38,10),
    "aloituskuulutus" timestamp without time zone,
    "kokonaiskustannukset" double precision,
    "valtio" double precision,
    "kunta" double precision,
    "muut" double precision,
    "sahko" double precision,
    "viestinta" double precision,
    "vesi" double precision,
    "indeksivuosiluku" numeric(38,0),
    "maarakennusindeksi" numeric(38,19),
    "maantien_lakkaaminen" numeric(38,10),
    "kiireellinen_kasittely" numeric(38,10),
    "muistutusten_lukumaara" numeric(38,0),
    "kohde_id" numeric(38,0),
    "kohde_id2" numeric(38,0),
    "jatkopaatos_1_annettu" timestamp without time zone,
    "jatkopaatos_2_annettu" timestamp without time zone,
    "palautettu_elylle" timestamp without time zone,
    "lvm_laadittu" timestamp without time zone,
    "lvm_hyvaksymispaatos" timestamp without time zone,
    "hao_valipaatoksen_paivamaara" character varying(500),
    "hao_kumottu" numeric(38,10),
    "kho_valipaatoksen_paivamaara" character varying(1000),
    "kho_kumottu" numeric(38,10),
    "historiatyyppi" character varying(6) NOT NULL,
    "rivitunnus" numeric(38,10),
    "rivitila" character varying(15),
    "riviluotupvm" timestamp without time zone,
    "rivimuokattupvm" timestamp without time zone,
    "rivimuokkaajatunnus" character varying(150),
    "document_id" character varying(255),
    "rauennut" timestamp without time zone,
    "hao_valipaatos_sisalto" character varying(1000),
    "kho_valipaatos_sisalto" character varying(1000),
    "lainvoimaisuus" timestamp without time zone,
    "osapaatos_annettu" timestamp without time zone
);


ALTER TABLE tiesutst."yleissuunnitelmahistoria" OWNER TO tiesu;

--
-- Name: YLEISSUUNNITELMAHIST_15102020; Type: TABLE; Schema: tiesutst; Owner: tiesu
--

CREATE TABLE tiesutst."yleissuunnitelmahist_15102020" (
    "rivi_id" numeric(38,10) NOT NULL,
    "tunnus" numeric(38,0),
    "suunnitelman_nimi" character varying(1000),
    "kasittelija" character varying(100),
    "suunnitelmalaji" character varying(500),
    "suunnitelman_kuvaus" character varying(2000),
    "asianumero" character varying(60),
    "ely_keskus" character varying(50),
    "status_id" numeric(38,0),
    "hyvaksytty_esitys_laadittu" timestamp without time zone,
    "hyvaksytty_esitys_saapunut" timestamp without time zone,
    "muistutukset" numeric(38,0),
    "hyvaksytty_paatos_annettu" timestamp without time zone,
    "valitusten_maara" numeric(38,0),
    "selitys" character varying(1000),
    "kasittely_vrk" numeric(38,0),
    "osapaatos_annettu" character varying(500),
    "hao_pvm" timestamp without time zone,
    "hao_sisalto" character varying(1000),
    "kho_pvm" timestamp without time zone,
    "kho_sisalto" character varying(1000),
    "lainvoimaisuus" character varying(200),
    "lainvoimaisuus_paattyy" timestamp without time zone,
    "raennut" character varying(1000),
    "suunnitelma_laadittu" character varying(1000),
    "lvm_jatkopaatos" timestamp without time zone,
    "yva_hanke" numeric(38,10),
    "aloituskuulutus" timestamp without time zone,
    "kokonaiskustannukset" double precision,
    "valtio" double precision,
    "kunta" double precision,
    "muut" double precision,
    "sahko" double precision,
    "viestinta" double precision,
    "vesi" double precision,
    "indeksivuosiluku" numeric(38,0),
    "maarakennusindeksi" numeric(38,19),
    "maantien_lakkaaminen" numeric(38,10),
    "kiireellinen_kasittely" numeric(38,10),
    "muistutusten_lukumaara" numeric(38,0),
    "kohde_id" numeric(38,0),
    "kohde_id2" numeric(38,0),
    "jatkopaatos_1_annettu" timestamp without time zone,
    "jatkopaatos_2_annettu" timestamp without time zone,
    "palautettu_elylle" timestamp without time zone,
    "lvm_laadittu" timestamp without time zone,
    "lvm_hyvaksymispaatos" timestamp without time zone,
    "hao_valipaatoksen_paivamaara" character varying(500),
    "hao_kumottu" numeric(38,10),
    "kho_valipaatoksen_paivamaara" character varying(1000),
    "kho_kumottu" numeric(38,10),
    "historiatyyppi" character varying(6) NOT NULL,
    "rivitunnus" numeric(38,10),
    "rivitila" character varying(15),
    "riviluotupvm" timestamp without time zone,
    "rivimuokattupvm" timestamp without time zone,
    "rivimuokkaajatunnus" character varying(150),
    "document_id" character varying(255),
    "rauennut" timestamp without time zone,
    "hao_valipaatos_sisalto" character varying(1000),
    "kho_valipaatos_sisalto" character varying(1000)
);


ALTER TABLE tiesutst."yleissuunnitelmahist_15102020" OWNER TO tiesu;

--
-- Name: YLEISSUUNNITELMA_KASITE_ARVO; Type: TABLE; Schema: tiesutst; Owner: tiesu
--

CREATE TABLE tiesutst."yleissuunnitelma_kasite_arvo" (
    "kasite_wid" numeric(38,0) NOT NULL,
    "kasite" character varying(100),
    "arvo" character varying(200)
);


ALTER TABLE tiesutst."yleissuunnitelma_kasite_arvo" OWNER TO tiesu;

--
-- Name: YS_KOHDE; Type: TABLE; Schema: tiesutst; Owner: tiesu
--

CREATE TABLE tiesutst."ys_kohde" (
    "kohde_id" numeric(38,0) NOT NULL,
    "kohde_selite" character varying(100)
);


ALTER TABLE tiesutst."ys_kohde" OWNER TO tiesu;

--
-- Name: YS_STATUS; Type: TABLE; Schema: tiesutst; Owner: tiesu
--

CREATE TABLE tiesutst."ys_status" (
    "status_id" numeric(38,0) NOT NULL,
    "selite" character varying(300),
    "readonly" numeric(38,10)
);


ALTER TABLE tiesutst."ys_status" OWNER TO tiesu;

--
-- Name: RATASUUNNITELMA RATASUUNNITELMA_pkey; Type: CONSTRAINT; Schema: tiesutst; Owner: tiesu
--

ALTER TABLE ONLY tiesutst."ratasuunnitelma"
    ADD CONSTRAINT "RATASUUNNITELMA_pkey" PRIMARY KEY ("tunnus");


--
-- Name: RAUTATIEN_YLEISSUUNNITELMA RAUTATIEN_YLEISSUUNNITELMA_pkey; Type: CONSTRAINT; Schema: tiesutst; Owner: tiesu
--

ALTER TABLE ONLY tiesutst."rautatien_yleissuunnitelma"
    ADD CONSTRAINT "RAUTATIEN_YLEISSUUNNITELMA_pkey" PRIMARY KEY ("tunnus");


--
-- Name: RS_KOHDE RS_KOHDE_pkey; Type: CONSTRAINT; Schema: tiesutst; Owner: tiesu
--

ALTER TABLE ONLY tiesutst."rs_kohde"
    ADD CONSTRAINT "RS_KOHDE_pkey" PRIMARY KEY ("kohde_id");


--
-- Name: RS_STATUS RS_STATUS_pkey; Type: CONSTRAINT; Schema: tiesutst; Owner: tiesu
--

ALTER TABLE ONLY tiesutst."rs_status"
    ADD CONSTRAINT "RS_STATUS_pkey" PRIMARY KEY ("status_id");


--
-- Name: RT_HISTORIA RT_HISTORIA_pkey; Type: CONSTRAINT; Schema: tiesutst; Owner: tiesu
--

ALTER TABLE ONLY tiesutst."rt_historia"
    ADD CONSTRAINT "RT_HISTORIA_pkey" PRIMARY KEY ("rivi_id");


--
-- Name: RT_KASITE_ARVO RT_KASITE_ARVO_pkey; Type: CONSTRAINT; Schema: tiesutst; Owner: tiesu
--

ALTER TABLE ONLY tiesutst."rt_kasite_arvo"
    ADD CONSTRAINT "RT_KASITE_ARVO_pkey" PRIMARY KEY ("kasite_wid");


--
-- Name: rt_yleis_kasite_arvo rt_yleis_kasite_arvo_pkey; Type: CONSTRAINT; Schema: tiesutst; Owner: tiesu
--

ALTER TABLE ONLY tiesutst."rt_yleis_kasite_arvo"
    ADD CONSTRAINT "rt_yleis_kasite_arvo_pkey" PRIMARY KEY ("kasite_wid");


--
-- Name: RYS_HISTORIA RYS_HISTORIA_pkey; Type: CONSTRAINT; Schema: tiesutst; Owner: tiesu
--

ALTER TABLE ONLY tiesutst."rys_historia"
    ADD CONSTRAINT "RYS_HISTORIA_pkey" PRIMARY KEY ("rivi_id");


--
-- Name: RYS_KOHDE RYS_KOHDE_pkey; Type: CONSTRAINT; Schema: tiesutst; Owner: tiesu
--

ALTER TABLE ONLY tiesutst."rys_kohde"
    ADD CONSTRAINT "RYS_KOHDE_pkey" PRIMARY KEY ("kohde_id");


--
-- Name: RYS_STATUS RYS_STATUS_pkey; Type: CONSTRAINT; Schema: tiesutst; Owner: tiesu
--

ALTER TABLE ONLY tiesutst."rys_status"
    ADD CONSTRAINT "RYS_STATUS_pkey" PRIMARY KEY ("status_id");


--
-- Name: TIESUUNNITELMAHISTORIA TIESUUNNITELMAHISTORIA_pkey; Type: CONSTRAINT; Schema: tiesutst; Owner: tiesu
--

ALTER TABLE ONLY tiesutst."tiesuunnitelmahistoria"
    ADD CONSTRAINT "TIESUUNNITELMAHISTORIA_pkey" PRIMARY KEY ("rivi_id");


--
-- Name: TIESUUNNITELMA_KASITE_ARVO TIESUUNNITELMA_KASITE_ARVO_pkey; Type: CONSTRAINT; Schema: tiesutst; Owner: tiesu
--

ALTER TABLE ONLY tiesutst."tiesuunnitelma_kasite_arvo"
    ADD CONSTRAINT "TIESUUNNITELMA_KASITE_ARVO_pkey" PRIMARY KEY ("kasite_wid");


--
-- Name: TIESUUNNITELMA TIESUUNNITELMA_pkey; Type: CONSTRAINT; Schema: tiesutst; Owner: tiesu
--

ALTER TABLE ONLY tiesutst."tiesuunnitelma"
    ADD CONSTRAINT "TIESUUNNITELMA_pkey" PRIMARY KEY ("ts_wid");


--
-- Name: TS_KOHDE TS_KOHDE_pkey; Type: CONSTRAINT; Schema: tiesutst; Owner: tiesu
--

ALTER TABLE ONLY tiesutst."ts_kohde"
    ADD CONSTRAINT "TS_KOHDE_pkey" PRIMARY KEY ("kohde_id");


--
-- Name: TS_STATUS TS_STATUS_pkey; Type: CONSTRAINT; Schema: tiesutst; Owner: tiesu
--

ALTER TABLE ONLY tiesutst."ts_status"
    ADD CONSTRAINT "TS_STATUS_pkey" PRIMARY KEY ("status_id");


--
-- Name: YLEISSUUNITELMA YLEISSUUNITELMA_pkey; Type: CONSTRAINT; Schema: tiesutst; Owner: tiesu
--

ALTER TABLE ONLY tiesutst."yleissuunitelma"
    ADD CONSTRAINT "YLEISSUUNITELMA_pkey" PRIMARY KEY ("ys_wid");


--
-- Name: YLEISSUUNNITELMAHISTORIA YLEISSUUNNITELMAHISTORIA_pkey; Type: CONSTRAINT; Schema: tiesutst; Owner: tiesu
--

ALTER TABLE ONLY tiesutst."yleissuunnitelmahistoria"
    ADD CONSTRAINT "YLEISSUUNNITELMAHISTORIA_pkey" PRIMARY KEY ("rivi_id");


--
-- Name: YLEISSUUNNITELMA_KASITE_ARVO YLEISSUUNNITELMA_KASITE_ARVO_pkey; Type: CONSTRAINT; Schema: tiesutst; Owner: tiesu
--

ALTER TABLE ONLY tiesutst."yleissuunnitelma_kasite_arvo"
    ADD CONSTRAINT "YLEISSUUNNITELMA_KASITE_ARVO_pkey" PRIMARY KEY ("kasite_wid");


--
-- Name: YS_KOHDE YS_KOHDE_pkey; Type: CONSTRAINT; Schema: tiesutst; Owner: tiesu
--

ALTER TABLE ONLY tiesutst."ys_kohde"
    ADD CONSTRAINT "YS_KOHDE_pkey" PRIMARY KEY ("kohde_id");


--
-- Name: YS_STATUS YS_STATUS_pkey; Type: CONSTRAINT; Schema: tiesutst; Owner: tiesu
--

ALTER TABLE ONLY tiesutst."ys_status"
    ADD CONSTRAINT "YS_STATUS_pkey" PRIMARY KEY ("status_id");


--
-- PostgreSQL database dump complete
--



CREATE SEQUENCE tiesutst."tiesuunnitelma_seq" START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
CREATE SEQUENCE tiesutst."yleissuunitelma_seq" START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
CREATE SEQUENCE tiesutst."rautatien_yleissuunnitelma_seq" START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
CREATE SEQUENCE tiesutst."ratasuunnitelma_seq" START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
CREATE SEQUENCE tiesutst."tiesuunnitelma_hist_seq" START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
CREATE SEQUENCE tiesutst."yleissuunnitelma_hist_seq" START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
CREATE SEQUENCE tiesutst."rys_hist_seq" START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
CREATE SEQUENCE tiesutst."rt_hist_seq" START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
