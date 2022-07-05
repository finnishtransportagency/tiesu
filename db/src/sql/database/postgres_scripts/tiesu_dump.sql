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

CREATE TABLE tiesutst."PALVELUPAIKAT" (
    "NIMI" character varying(1000),
    "LYHENNE" character varying(100),
    "RATAOSA" character varying(1000),
    "TYYPPI" character varying(1000),
    "HENKILOLIIKENNE" character varying(50),
    "TAVARALIIKENNE" character varying(50),
    "KAUKOOHJAUS" character varying(50),
    "LIIKENNEPAIKAN_OHITUS" character varying(100),
    "LAHTO_MAARA" character varying(100),
    "VETURIN_HUOLTOON_STA" character varying(100),
    "MANUAALIVAIHDETYO_TARVITAAN" character varying(100),
    "RAJOITEVAIHTOKULKUTIENMUODOST" character varying(100),
    "RATATYON_TURVAUS" character varying(100),
    "URAKOITSIJA_FINRAIL" character varying(50),
    "URAKOITSIJA_VR" character varying(50),
    "URAKOITSIJA_JOKU_MUU" character varying(2000),
    "HUOMAUTUS" character varying(2000),
    "LISAMIEHITYKSEN_TILAUS" character varying(2000),
    "CREATED" timestamp without time zone,
    "LAST_MODIFIED_DATE" timestamp without time zone,
    "LAST_MODIFIED_BY" character varying(500),
    "USERNAME" character varying(500),
    "FORM_VERSION" character varying(50),
    "DOCUMENT_ID" character varying(100),
    "DELETED" character varying(50),
    "APP" character varying(500),
    "FORM" character varying(500)
);


ALTER TABLE tiesutst."PALVELUPAIKAT" OWNER TO tiesu;

--
-- Name: RATASUUNNITELMA; Type: TABLE; Schema: tiesutst; Owner: tiesu
--

CREATE TABLE tiesutst."RATASUUNNITELMA" (
    "TUNNUS" numeric(38,0) NOT NULL,
    "SUUNNITELMAN_NIMI" character varying(1000) NOT NULL,
    "SUUNNITELMAN_KUVAUS" character varying(2000),
    "YVA_HANKE" numeric(38,10),
    "ASIANUMERO" character varying(60) NOT NULL,
    "ELY_KESKUS" character varying(50),
    "STATUS_ID" numeric(38,0),
    "HYVAKSYTTY_ESITYS_LAADITTU" timestamp without time zone,
    "HYVAKSYTTY_ESITYS_SAAPUNUT" timestamp without time zone,
    "ALOITUSKUULUTUS" timestamp without time zone,
    "KOKONAISKUSTANNUKSET" double precision,
    "VALTIO" double precision,
    "KUNTA" double precision,
    "MUUT" double precision,
    "INDEKSIVUOSILUKU" numeric(38,0),
    "MAARAKENNUSINDEKSI" numeric(38,19),
    "LAKKAAMINEN" numeric(38,10),
    "KIIREELLINEN_KASITTELY" numeric(38,10),
    "MUISTUTUSTEN_LUKUMAARA" numeric(38,0),
    "KOHDE_ID1" numeric(38,0),
    "KOHDE_ID2" numeric(38,0),
    "SELITYS" character varying(1000),
    "HYVAKSYTTY_PAATOS_ANNETTU" timestamp without time zone,
    "JATKOPAATOS_1_ANNETTU" timestamp without time zone,
    "JATKOPAATOS_2_ANNETTU" timestamp without time zone,
    "PALAUTETTU_ELYLLE" timestamp without time zone,
    "LVM_LAADITTU" timestamp without time zone,
    "LVM_HYVAKSYMISPAATOS" timestamp without time zone,
    "LVM_JATKOPAATOS" timestamp without time zone,
    "OLD_OSAPAATOS_ANNETTU" character varying(500),
    "VALITUSTEN_MAARA" numeric(38,0),
    "HAO_VALIPAATOKSEN_PAIVAMAARA" character varying(500),
    "HAO_KUMOTTU" numeric(38,10),
    "HAO_PVM" timestamp without time zone,
    "HAO_SISALTO" character varying(1000),
    "KHO_VALIPAATOKSEN_PAIVAMAARA" character varying(1000),
    "KHO_KUMOTTU" numeric(38,10),
    "KHO_PVM" timestamp without time zone,
    "KHO_SISALTO" character varying(1000),
    "OLD_LAINVOIMAISUUS" character varying(200),
    "LAINVOIMAISUUS_PAATTYY" timestamp without time zone,
    "RAUENNUT" character varying(1000),
    "SUUNNITELMA_LAADITTU" character varying(1000),
    "KASITTELIJA" character varying(100),
    "RIVILUOTUPVM" timestamp without time zone,
    "RIVIMUOKATTUPVM" timestamp without time zone,
    "RIVIMUOKKAAJATUNNUS" character varying(150),
    "DOCUMENT_ID" character varying(255),
    "HAO_VALIPAATOS_SISALTO" character varying(1000),
    "KHO_VALIPAATOS_SISALTO" character varying(1000),
    "KAYTTOONOTTOLUOVUTUS_OSA" timestamp without time zone,
    "KAYTTOONOTTOLUOVUTUS_KOKO" timestamp without time zone,
    "SAHKO" double precision,
    "VIESTINTA" double precision,
    "VESI" double precision,
    "LAINVOIMAISUUS" timestamp without time zone,
    "OSAPAATOS_ANNETTU" timestamp without time zone,
    "SISTIESUUNNITTELUA" numeric(38,10),
    "RATATOIMITUSTEHTY" timestamp without time zone
);


ALTER TABLE tiesutst."RATASUUNNITELMA" OWNER TO tiesu;

--
-- Name: RATASUUNNITELMA_15102020; Type: TABLE; Schema: tiesutst; Owner: tiesu
--

CREATE TABLE tiesutst."RATASUUNNITELMA_15102020" (
    "TUNNUS" numeric(38,0) NOT NULL,
    "SUUNNITELMAN_NIMI" character varying(1000) NOT NULL,
    "SUUNNITELMAN_KUVAUS" character varying(2000),
    "YVA_HANKE" numeric(38,10),
    "ASIANUMERO" character varying(60) NOT NULL,
    "ELY_KESKUS" character varying(50),
    "STATUS_ID" numeric(38,0),
    "HYVAKSYTTY_ESITYS_LAADITTU" timestamp without time zone,
    "HYVAKSYTTY_ESITYS_SAAPUNUT" timestamp without time zone,
    "ALOITUSKUULUTUS" timestamp without time zone,
    "KOKONAISKUSTANNUKSET" double precision,
    "VALTIO" double precision,
    "KUNTA" double precision,
    "MUUT" double precision,
    "INDEKSIVUOSILUKU" numeric(38,0),
    "MAARAKENNUSINDEKSI" numeric(38,19),
    "LAKKAAMINEN" numeric(38,10),
    "KIIREELLINEN_KASITTELY" numeric(38,10),
    "MUISTUTUSTEN_LUKUMAARA" numeric(38,0),
    "KOHDE_ID1" numeric(38,0),
    "KOHDE_ID2" numeric(38,0),
    "SELITYS" character varying(1000),
    "HYVAKSYTTY_PAATOS_ANNETTU" timestamp without time zone,
    "JATKOPAATOS_1_ANNETTU" timestamp without time zone,
    "JATKOPAATOS_2_ANNETTU" timestamp without time zone,
    "PALAUTETTU_ELYLLE" timestamp without time zone,
    "LVM_LAADITTU" timestamp without time zone,
    "LVM_HYVAKSYMISPAATOS" timestamp without time zone,
    "LVM_JATKOPAATOS" timestamp without time zone,
    "OSAPAATOS_ANNETTU" character varying(500),
    "VALITUSTEN_MAARA" numeric(38,0),
    "HAO_VALIPAATOKSEN_PAIVAMAARA" character varying(500),
    "HAO_KUMOTTU" numeric(38,10),
    "HAO_PVM" timestamp without time zone,
    "HAO_SISALTO" character varying(1000),
    "KHO_VALIPAATOKSEN_PAIVAMAARA" character varying(1000),
    "KHO_KUMOTTU" numeric(38,10),
    "KHO_PVM" timestamp without time zone,
    "KHO_SISALTO" character varying(1000),
    "LAINVOIMAISUUS" character varying(200),
    "LAINVOIMAISUUS_PAATTYY" timestamp without time zone,
    "RAUENNUT" character varying(1000),
    "SUUNNITELMA_LAADITTU" character varying(1000),
    "KASITTELIJA" character varying(100),
    "RIVILUOTUPVM" timestamp without time zone,
    "RIVIMUOKATTUPVM" timestamp without time zone,
    "RIVIMUOKKAAJATUNNUS" character varying(150),
    "DOCUMENT_ID" character varying(255),
    "HAO_VALIPAATOS_SISALTO" character varying(1000),
    "KHO_VALIPAATOS_SISALTO" character varying(1000),
    "KAYTTOONOTTOLUOVUTUS_OSA" timestamp without time zone,
    "KAYTTOONOTTOLUOVUTUS_KOKO" timestamp without time zone,
    "SAHKO" double precision,
    "VIESTINTA" double precision,
    "VESI" double precision
);


ALTER TABLE tiesutst."RATASUUNNITELMA_15102020" OWNER TO tiesu;

--
-- Name: RAUTATIEN_YLEISSUUNNITELMA; Type: TABLE; Schema: tiesutst; Owner: tiesu
--

CREATE TABLE tiesutst."RAUTATIEN_YLEISSUUNNITELMA" (
    "TUNNUS" numeric(38,0) NOT NULL,
    "SUUNNITELMAN_NIMI" character varying(1000) NOT NULL,
    "SUUNNITELMAN_KUVAUS" character varying(2000),
    "YVA_HANKE" numeric(38,10),
    "ASIANUMERO" character varying(60) NOT NULL,
    "ELY_KESKUS" character varying(50),
    "STATUS_ID" numeric(38,0),
    "HYVAKSYTTY_ESITYS_LAADITTU" timestamp without time zone,
    "HYVAKSYTTY_ESITYS_SAAPUNUT" timestamp without time zone,
    "ALOITUSKUULUTUS" timestamp without time zone,
    "KOKONAISKUSTANNUKSET" double precision,
    "VALTIO" double precision,
    "KUNTA" double precision,
    "MUUT" double precision,
    "INDEKSIVUOSILUKU" numeric(38,0),
    "MAARAKENNUSINDEKSI" numeric(38,19),
    "LAKKAAMINEN" numeric(38,10),
    "KIIREELLINEN_KASITTELY" numeric(38,10),
    "MUISTUTUSTEN_LUKUMAARA" numeric(38,0),
    "KOHDE_ID1" numeric(38,0),
    "KOHDE_ID2" numeric(38,0),
    "KOHDE_ID3" numeric(38,0),
    "SELITYS" character varying(1000),
    "HYVAKSYTTY_PAATOS_ANNETTU" timestamp without time zone,
    "JATKOPAATOS_1_ANNETTU" timestamp without time zone,
    "JATKOPAATOS_2_ANNETTU" timestamp without time zone,
    "PALAUTETTU_ELYLLE" timestamp without time zone,
    "LVM_LAADITTU" timestamp without time zone,
    "LVM_HYVAKSYMISPAATOS" timestamp without time zone,
    "LVM_JATKOPAATOS" timestamp without time zone,
    "OLD_OSAPAATOS_ANNETTU" character varying(500),
    "VALITUSTEN_MAARA" numeric(38,0),
    "HAO_VALIPAATOKSEN_PAIVAMAARA" character varying(500),
    "HAO_KUMOTTU" numeric(38,10),
    "HAO_PVM" timestamp without time zone,
    "HAO_SISALTO" character varying(1000),
    "KHO_VALIPAATOKSEN_PAIVAMAARA" character varying(1000),
    "KHO_KUMOTTU" numeric(38,10),
    "KHO_PVM" timestamp without time zone,
    "KHO_SISALTO" character varying(1000),
    "OLD_LAINVOIMAISUUS" character varying(200),
    "LAINVOIMAISUUS_PAATTYY" timestamp without time zone,
    "RAUENNUT" character varying(1000),
    "SUUNNITELMA_LAADITTU" character varying(1000),
    "PROJEKTIPAALLIKKO" character varying(100),
    "RIVILUOTUPVM" timestamp without time zone,
    "RIVIMUOKATTUPVM" timestamp without time zone,
    "RIVIMUOKKAAJATUNNUS" character varying(150),
    "DOCUMENT_ID" character varying(255),
    "HAO_VALIPAATOS_SISALTO" character varying(1000),
    "KHO_VALIPAATOS_SISALTO" character varying(1000),
    "SAHKO" double precision,
    "VIESTINTA" double precision,
    "VESI" double precision,
    "LAINVOIMAISUUS" timestamp without time zone,
    "OSAPAATOS_ANNETTU" timestamp without time zone
);


ALTER TABLE tiesutst."RAUTATIEN_YLEISSUUNNITELMA" OWNER TO tiesu;

--
-- Name: RAUTATIEN_YLEISSUUNN_15102020; Type: TABLE; Schema: tiesutst; Owner: tiesu
--

CREATE TABLE tiesutst."RAUTATIEN_YLEISSUUNN_15102020" (
    "TUNNUS" numeric(38,0) NOT NULL,
    "SUUNNITELMAN_NIMI" character varying(1000) NOT NULL,
    "SUUNNITELMAN_KUVAUS" character varying(2000),
    "YVA_HANKE" numeric(38,10),
    "ASIANUMERO" character varying(60) NOT NULL,
    "ELY_KESKUS" character varying(50),
    "STATUS_ID" numeric(38,0),
    "HYVAKSYTTY_ESITYS_LAADITTU" timestamp without time zone,
    "HYVAKSYTTY_ESITYS_SAAPUNUT" timestamp without time zone,
    "ALOITUSKUULUTUS" timestamp without time zone,
    "KOKONAISKUSTANNUKSET" double precision,
    "VALTIO" double precision,
    "KUNTA" double precision,
    "MUUT" double precision,
    "INDEKSIVUOSILUKU" numeric(38,0),
    "MAARAKENNUSINDEKSI" numeric(38,19),
    "LAKKAAMINEN" numeric(38,10),
    "KIIREELLINEN_KASITTELY" numeric(38,10),
    "MUISTUTUSTEN_LUKUMAARA" numeric(38,0),
    "KOHDE_ID1" numeric(38,0),
    "KOHDE_ID2" numeric(38,0),
    "KOHDE_ID3" numeric(38,0),
    "SELITYS" character varying(1000),
    "HYVAKSYTTY_PAATOS_ANNETTU" timestamp without time zone,
    "JATKOPAATOS_1_ANNETTU" timestamp without time zone,
    "JATKOPAATOS_2_ANNETTU" timestamp without time zone,
    "PALAUTETTU_ELYLLE" timestamp without time zone,
    "LVM_LAADITTU" timestamp without time zone,
    "LVM_HYVAKSYMISPAATOS" timestamp without time zone,
    "LVM_JATKOPAATOS" timestamp without time zone,
    "OSAPAATOS_ANNETTU" character varying(500),
    "VALITUSTEN_MAARA" numeric(38,0),
    "HAO_VALIPAATOKSEN_PAIVAMAARA" character varying(500),
    "HAO_KUMOTTU" numeric(38,10),
    "HAO_PVM" timestamp without time zone,
    "HAO_SISALTO" character varying(1000),
    "KHO_VALIPAATOKSEN_PAIVAMAARA" character varying(1000),
    "KHO_KUMOTTU" numeric(38,10),
    "KHO_PVM" timestamp without time zone,
    "KHO_SISALTO" character varying(1000),
    "LAINVOIMAISUUS" character varying(200),
    "LAINVOIMAISUUS_PAATTYY" timestamp without time zone,
    "RAUENNUT" character varying(1000),
    "SUUNNITELMA_LAADITTU" character varying(1000),
    "PROJEKTIPAALLIKKO" character varying(100),
    "RIVILUOTUPVM" timestamp without time zone,
    "RIVIMUOKATTUPVM" timestamp without time zone,
    "RIVIMUOKKAAJATUNNUS" character varying(150),
    "DOCUMENT_ID" character varying(255),
    "HAO_VALIPAATOS_SISALTO" character varying(1000),
    "KHO_VALIPAATOS_SISALTO" character varying(1000),
    "SAHKO" double precision,
    "VIESTINTA" double precision,
    "VESI" double precision
);


ALTER TABLE tiesutst."RAUTATIEN_YLEISSUUNN_15102020" OWNER TO tiesu;

--
-- Name: RS_KOHDE; Type: TABLE; Schema: tiesutst; Owner: tiesu
--

CREATE TABLE tiesutst."RS_KOHDE" (
    "KOHDE_ID" numeric(38,0) NOT NULL,
    "KOHDE_SELITE" character varying(100),
    "READONLY" numeric(38,10)
);


ALTER TABLE tiesutst."RS_KOHDE" OWNER TO tiesu;

--
-- Name: RS_STATUS; Type: TABLE; Schema: tiesutst; Owner: tiesu
--

CREATE TABLE tiesutst."RS_STATUS" (
    "STATUS_ID" numeric(38,0) NOT NULL,
    "SELITE" character varying(300),
    "READONLY" numeric(38,10)
);


ALTER TABLE tiesutst."RS_STATUS" OWNER TO tiesu;

--
-- Name: RT_HISTORIA; Type: TABLE; Schema: tiesutst; Owner: tiesu
--

CREATE TABLE tiesutst."RT_HISTORIA" (
    "RIVI_ID" numeric(38,10) NOT NULL,
    "TUNNUS" numeric(38,0),
    "SUUNNITELMAN_NIMI" character varying(1000),
    "SUUNNITELMAN_KUVAUS" character varying(2000),
    "YVA_HANKE" numeric(38,10),
    "ASIANUMERO" character varying(60),
    "ELY_KESKUS" character varying(50),
    "STATUS_ID" numeric(38,0),
    "HYVAKSYTTY_ESITYS_LAADITTU" timestamp without time zone,
    "HYVAKSYTTY_ESITYS_SAAPUNUT" timestamp without time zone,
    "ALOITUSKUULUTUS" timestamp without time zone,
    "KOKONAISKUSTANNUKSET" double precision,
    "VALTIO" double precision,
    "KUNTA" double precision,
    "MUUT" double precision,
    "INDEKSIVUOSILUKU" numeric(38,0),
    "MAARAKENNUSINDEKSI" numeric(38,19),
    "LAKKAAMINEN" numeric(38,10),
    "KIIREELLINEN_KASITTELY" numeric(38,10),
    "MUISTUTUSTEN_LUKUMAARA" numeric(38,0),
    "KOHDE_ID1" numeric(38,0),
    "KOHDE_ID2" numeric(38,0),
    "SELITYS" character varying(1000),
    "HYVAKSYTTY_PAATOS_ANNETTU" timestamp without time zone,
    "JATKOPAATOS_1_ANNETTU" timestamp without time zone,
    "JATKOPAATOS_2_ANNETTU" timestamp without time zone,
    "PALAUTETTU_ELYLLE" timestamp without time zone,
    "LVM_LAADITTU" timestamp without time zone,
    "LVM_HYVAKSYMISPAATOS" timestamp without time zone,
    "LVM_JATKOPAATOS" timestamp without time zone,
    "OLD_OSAPAATOS_ANNETTU" character varying(500),
    "VALITUSTEN_MAARA" numeric(38,0),
    "HAO_VALIPAATOKSEN_PAIVAMAARA" character varying(500),
    "HAO_KUMOTTU" numeric(38,10),
    "HAO_PVM" timestamp without time zone,
    "HAO_SISALTO" character varying(1000),
    "KHO_VALIPAATOKSEN_PAIVAMAARA" character varying(1000),
    "KHO_KUMOTTU" numeric(38,10),
    "KHO_PVM" timestamp without time zone,
    "KHO_SISALTO" character varying(1000),
    "OLD_LAINVOIMAISUUS" character varying(200),
    "LAINVOIMAISUUS_PAATTYY" timestamp without time zone,
    "RAUENNUT" character varying(1000),
    "SUUNNITELMA_LAADITTU" character varying(1000),
    "KASITTELIJA" character varying(100),
    "HISTORIATYYPPI" character varying(6) NOT NULL,
    "RIVITUNNUS" numeric(38,10),
    "RIVITILA" character varying(15),
    "RIVILUOTUPVM" timestamp without time zone,
    "RIVIMUOKATTUPVM" timestamp without time zone,
    "RIVIMUOKKAAJATUNNUS" character varying(150),
    "DOCUMENT_ID" character varying(255),
    "HAO_VALIPAATOS_SISALTO" character varying(1000),
    "KHO_VALIPAATOS_SISALTO" character varying(1000),
    "KAYTTOONOTTOLUOVUTUS_OSA" timestamp without time zone,
    "KAYTTOONOTTOLUOVUTUS_KOKO" timestamp without time zone,
    "SAHKO" double precision,
    "VIESTINTA" double precision,
    "VESI" double precision,
    "LAINVOIMAISUUS" timestamp without time zone,
    "OSAPAATOS_ANNETTU" timestamp without time zone,
    "SISTIESUUNNITTELUA" numeric(38,10),
    "RATATOIMITUSTEHTY" timestamp without time zone
);


ALTER TABLE tiesutst."RT_HISTORIA" OWNER TO tiesu;

--
-- Name: RT_HISTORIA_15102020; Type: TABLE; Schema: tiesutst; Owner: tiesu
--

CREATE TABLE tiesutst."RT_HISTORIA_15102020" (
    "RIVI_ID" numeric(38,10) NOT NULL,
    "TUNNUS" numeric(38,0),
    "SUUNNITELMAN_NIMI" character varying(1000),
    "SUUNNITELMAN_KUVAUS" character varying(2000),
    "YVA_HANKE" numeric(38,10),
    "ASIANUMERO" character varying(60),
    "ELY_KESKUS" character varying(50),
    "STATUS_ID" numeric(38,0),
    "HYVAKSYTTY_ESITYS_LAADITTU" timestamp without time zone,
    "HYVAKSYTTY_ESITYS_SAAPUNUT" timestamp without time zone,
    "ALOITUSKUULUTUS" timestamp without time zone,
    "KOKONAISKUSTANNUKSET" double precision,
    "VALTIO" double precision,
    "KUNTA" double precision,
    "MUUT" double precision,
    "INDEKSIVUOSILUKU" numeric(38,0),
    "MAARAKENNUSINDEKSI" numeric(38,19),
    "LAKKAAMINEN" numeric(38,10),
    "KIIREELLINEN_KASITTELY" numeric(38,10),
    "MUISTUTUSTEN_LUKUMAARA" numeric(38,0),
    "KOHDE_ID1" numeric(38,0),
    "KOHDE_ID2" numeric(38,0),
    "SELITYS" character varying(1000),
    "HYVAKSYTTY_PAATOS_ANNETTU" timestamp without time zone,
    "JATKOPAATOS_1_ANNETTU" timestamp without time zone,
    "JATKOPAATOS_2_ANNETTU" timestamp without time zone,
    "PALAUTETTU_ELYLLE" timestamp without time zone,
    "LVM_LAADITTU" timestamp without time zone,
    "LVM_HYVAKSYMISPAATOS" timestamp without time zone,
    "LVM_JATKOPAATOS" timestamp without time zone,
    "OSAPAATOS_ANNETTU" character varying(500),
    "VALITUSTEN_MAARA" numeric(38,0),
    "HAO_VALIPAATOKSEN_PAIVAMAARA" character varying(500),
    "HAO_KUMOTTU" numeric(38,10),
    "HAO_PVM" timestamp without time zone,
    "HAO_SISALTO" character varying(1000),
    "KHO_VALIPAATOKSEN_PAIVAMAARA" character varying(1000),
    "KHO_KUMOTTU" numeric(38,10),
    "KHO_PVM" timestamp without time zone,
    "KHO_SISALTO" character varying(1000),
    "LAINVOIMAISUUS" character varying(200),
    "LAINVOIMAISUUS_PAATTYY" timestamp without time zone,
    "RAUENNUT" character varying(1000),
    "SUUNNITELMA_LAADITTU" character varying(1000),
    "KASITTELIJA" character varying(100),
    "HISTORIATYYPPI" character varying(6) NOT NULL,
    "RIVITUNNUS" numeric(38,10),
    "RIVITILA" character varying(15),
    "RIVILUOTUPVM" timestamp without time zone,
    "RIVIMUOKATTUPVM" timestamp without time zone,
    "RIVIMUOKKAAJATUNNUS" character varying(150),
    "DOCUMENT_ID" character varying(255),
    "HAO_VALIPAATOS_SISALTO" character varying(1000),
    "KHO_VALIPAATOS_SISALTO" character varying(1000),
    "KAYTTOONOTTOLUOVUTUS_OSA" timestamp without time zone,
    "KAYTTOONOTTOLUOVUTUS_KOKO" timestamp without time zone,
    "SAHKO" double precision,
    "VIESTINTA" double precision,
    "VESI" double precision
);


ALTER TABLE tiesutst."RT_HISTORIA_15102020" OWNER TO tiesu;

--
-- Name: RT_KASITE_ARVO; Type: TABLE; Schema: tiesutst; Owner: tiesu
--

CREATE TABLE tiesutst."RT_KASITE_ARVO" (
    "KASITE_WID" numeric(38,0) NOT NULL,
    "KASITE" character varying(100),
    "ARVO" character varying(200)
);


ALTER TABLE tiesutst."RT_KASITE_ARVO" OWNER TO tiesu;

--
-- Name: RT_YLEIS_KASITE_ARVO; Type: TABLE; Schema: tiesutst; Owner: tiesu
--

CREATE TABLE tiesutst."RT_YLEIS_KASITE_ARVO" (
    "KASITE_WID" numeric(38,0) NOT NULL,
    "KASITE" character varying(100),
    "ARVO" character varying(200)
);


ALTER TABLE tiesutst."RT_YLEIS_KASITE_ARVO" OWNER TO tiesu;

--
-- Name: RYS_HISTORIA; Type: TABLE; Schema: tiesutst; Owner: tiesu
--

CREATE TABLE tiesutst."RYS_HISTORIA" (
    "RIVI_ID" numeric(38,10) NOT NULL,
    "TUNNUS" numeric(38,0),
    "SUUNNITELMAN_NIMI" character varying(1000),
    "SUUNNITELMAN_KUVAUS" character varying(2000),
    "YVA_HANKE" numeric(38,10),
    "ASIANUMERO" character varying(60),
    "ELY_KESKUS" character varying(50),
    "STATUS_ID" numeric(38,0),
    "HYVAKSYTTY_ESITYS_LAADITTU" timestamp without time zone,
    "HYVAKSYTTY_ESITYS_SAAPUNUT" timestamp without time zone,
    "ALOITUSKUULUTUS" timestamp without time zone,
    "KOKONAISKUSTANNUKSET" double precision,
    "VALTIO" double precision,
    "KUNTA" double precision,
    "MUUT" double precision,
    "INDEKSIVUOSILUKU" numeric(38,0),
    "MAARAKENNUSINDEKSI" numeric(38,19),
    "LAKKAAMINEN" numeric(38,10),
    "KIIREELLINEN_KASITTELY" numeric(38,10),
    "MUISTUTUSTEN_LUKUMAARA" numeric(38,0),
    "KOHDE_ID1" numeric(38,0),
    "KOHDE_ID2" numeric(38,0),
    "KOHDE_ID3" numeric(38,0),
    "SELITYS" character varying(1000),
    "HYVAKSYTTY_PAATOS_ANNETTU" timestamp without time zone,
    "JATKOPAATOS_1_ANNETTU" timestamp without time zone,
    "JATKOPAATOS_2_ANNETTU" timestamp without time zone,
    "PALAUTETTU_ELYLLE" timestamp without time zone,
    "LVM_LAADITTU" timestamp without time zone,
    "LVM_HYVAKSYMISPAATOS" timestamp without time zone,
    "LVM_JATKOPAATOS" timestamp without time zone,
    "OLD_OSAPAATOS_ANNETTU" character varying(500),
    "VALITUSTEN_MAARA" numeric(38,0),
    "HAO_VALIPAATOKSEN_PAIVAMAARA" character varying(500),
    "HAO_KUMOTTU" numeric(38,10),
    "HAO_PVM" timestamp without time zone,
    "HAO_SISALTO" character varying(1000),
    "KHO_VALIPAATOKSEN_PAIVAMAARA" character varying(1000),
    "KHO_KUMOTTU" numeric(38,10),
    "KHO_PVM" timestamp without time zone,
    "KHO_SISALTO" character varying(1000),
    "OLD_LAINVOIMAISUUS" character varying(200),
    "LAINVOIMAISUUS_PAATTYY" timestamp without time zone,
    "RAUENNUT" character varying(1000),
    "SUUNNITELMA_LAADITTU" character varying(1000),
    "PROJEKTIPAALLIKKO" character varying(100),
    "HISTORIATYYPPI" character varying(6) NOT NULL,
    "RIVITUNNUS" numeric(38,10),
    "RIVITILA" character varying(15),
    "RIVILUOTUPVM" timestamp without time zone,
    "RIVIMUOKATTUPVM" timestamp without time zone,
    "RIVIMUOKKAAJATUNNUS" character varying(150),
    "DOCUMENT_ID" character varying(255),
    "HAO_VALIPAATOS_SISALTO" character varying(1000),
    "KHO_VALIPAATOS_SISALTO" character varying(1000),
    "SAHKO" double precision,
    "VIESTINTA" double precision,
    "VESI" double precision,
    "LAINVOIMAISUUS" timestamp without time zone,
    "OSAPAATOS_ANNETTU" timestamp without time zone
);


ALTER TABLE tiesutst."RYS_HISTORIA" OWNER TO tiesu;

--
-- Name: RYS_HISTORIA_15102020; Type: TABLE; Schema: tiesutst; Owner: tiesu
--

CREATE TABLE tiesutst."RYS_HISTORIA_15102020" (
    "RIVI_ID" numeric(38,10) NOT NULL,
    "TUNNUS" numeric(38,0),
    "SUUNNITELMAN_NIMI" character varying(1000),
    "SUUNNITELMAN_KUVAUS" character varying(2000),
    "YVA_HANKE" numeric(38,10),
    "ASIANUMERO" character varying(60),
    "ELY_KESKUS" character varying(50),
    "STATUS_ID" numeric(38,0),
    "HYVAKSYTTY_ESITYS_LAADITTU" timestamp without time zone,
    "HYVAKSYTTY_ESITYS_SAAPUNUT" timestamp without time zone,
    "ALOITUSKUULUTUS" timestamp without time zone,
    "KOKONAISKUSTANNUKSET" double precision,
    "VALTIO" double precision,
    "KUNTA" double precision,
    "MUUT" double precision,
    "INDEKSIVUOSILUKU" numeric(38,0),
    "MAARAKENNUSINDEKSI" numeric(38,19),
    "LAKKAAMINEN" numeric(38,10),
    "KIIREELLINEN_KASITTELY" numeric(38,10),
    "MUISTUTUSTEN_LUKUMAARA" numeric(38,0),
    "KOHDE_ID1" numeric(38,0),
    "KOHDE_ID2" numeric(38,0),
    "KOHDE_ID3" numeric(38,0),
    "SELITYS" character varying(1000),
    "HYVAKSYTTY_PAATOS_ANNETTU" timestamp without time zone,
    "JATKOPAATOS_1_ANNETTU" timestamp without time zone,
    "JATKOPAATOS_2_ANNETTU" timestamp without time zone,
    "PALAUTETTU_ELYLLE" timestamp without time zone,
    "LVM_LAADITTU" timestamp without time zone,
    "LVM_HYVAKSYMISPAATOS" timestamp without time zone,
    "LVM_JATKOPAATOS" timestamp without time zone,
    "OSAPAATOS_ANNETTU" character varying(500),
    "VALITUSTEN_MAARA" numeric(38,0),
    "HAO_VALIPAATOKSEN_PAIVAMAARA" character varying(500),
    "HAO_KUMOTTU" numeric(38,10),
    "HAO_PVM" timestamp without time zone,
    "HAO_SISALTO" character varying(1000),
    "KHO_VALIPAATOKSEN_PAIVAMAARA" character varying(1000),
    "KHO_KUMOTTU" numeric(38,10),
    "KHO_PVM" timestamp without time zone,
    "KHO_SISALTO" character varying(1000),
    "LAINVOIMAISUUS" character varying(200),
    "LAINVOIMAISUUS_PAATTYY" timestamp without time zone,
    "RAUENNUT" character varying(1000),
    "SUUNNITELMA_LAADITTU" character varying(1000),
    "PROJEKTIPAALLIKKO" character varying(100),
    "HISTORIATYYPPI" character varying(6) NOT NULL,
    "RIVITUNNUS" numeric(38,10),
    "RIVITILA" character varying(15),
    "RIVILUOTUPVM" timestamp without time zone,
    "RIVIMUOKATTUPVM" timestamp without time zone,
    "RIVIMUOKKAAJATUNNUS" character varying(150),
    "DOCUMENT_ID" character varying(255),
    "HAO_VALIPAATOS_SISALTO" character varying(1000),
    "KHO_VALIPAATOS_SISALTO" character varying(1000),
    "SAHKO" double precision,
    "VIESTINTA" double precision,
    "VESI" double precision
);


ALTER TABLE tiesutst."RYS_HISTORIA_15102020" OWNER TO tiesu;

--
-- Name: RYS_KOHDE; Type: TABLE; Schema: tiesutst; Owner: tiesu
--

CREATE TABLE tiesutst."RYS_KOHDE" (
    "KOHDE_ID" numeric(38,0) NOT NULL,
    "KOHDE_SELITE" character varying(100),
    "READONLY" numeric(38,10)
);


ALTER TABLE tiesutst."RYS_KOHDE" OWNER TO tiesu;

--
-- Name: RYS_STATUS; Type: TABLE; Schema: tiesutst; Owner: tiesu
--

CREATE TABLE tiesutst."RYS_STATUS" (
    "STATUS_ID" numeric(38,0) NOT NULL,
    "SELITE" character varying(300),
    "READONLY" numeric(38,10)
);


ALTER TABLE tiesutst."RYS_STATUS" OWNER TO tiesu;

--
-- Name: TIESUUNNITELMA; Type: TABLE; Schema: tiesutst; Owner: tiesu
--

CREATE TABLE tiesutst."TIESUUNNITELMA" (
    "TS_WID" numeric(38,0) NOT NULL,
    "TIESUUNNITELMA_NRO" numeric(38,0),
    "TIESUUNNITELMA_NIMI" character varying(1000) NOT NULL,
    "KASITTELIJA" character varying(500),
    "TIESUUNNITELMAN_KUVAUS" character varying(1000),
    "DIAARI" character varying(250) NOT NULL,
    "ELY_KESKUS" character varying(10),
    "STATUS_ID" numeric(38,0),
    "HYVAKSYTTY_ESITYS_LAADITTU" timestamp without time zone,
    "HYVAKSYTTY_ESITYS_SAAPUNUT" timestamp without time zone,
    "KOKONAISKUSTANNUKSET" double precision,
    "VALTIO" double precision,
    "VALTIO_OSUUS" double precision,
    "KUNTA" double precision,
    "KUNTA_OSUUS" double precision,
    "MUUT" double precision,
    "MUUT_OSUUS" double precision,
    "INDEKSIVUOSILUKU" numeric(38,0),
    "MAARAKENNUSINDEKSI" numeric(38,19),
    "MAANTIEN_LAKKAAMINEN" numeric(38,10),
    "KIIREELLINEN_KASITTELY" numeric(38,10),
    "MUISTUTUSTEN_LUKUMAARA" numeric(38,0),
    "TS_KOHDE_ID" numeric(38,0),
    "TS_KOHDE_ID2" numeric(38,0),
    "SELITYS" character varying(1000),
    "HYVAKSYTTY_PAATOS_ANNETTU" timestamp without time zone,
    "KASITTELY_VRK" numeric(38,0),
    "LVM_LAADITTU" timestamp without time zone,
    "LVM_HYVAKSYMISPAATOS" timestamp without time zone,
    "JATKOPAATOS" timestamp without time zone,
    "OLD_OSAPAATOS_ANNETTU" timestamp without time zone,
    "VALITUSTEN_MAARA" numeric(38,0),
    "HAO_VALIPAATOKSEN_PAIVAMAARA" character varying(500),
    "HAO_KUMOTTU" numeric(38,10),
    "HAO_PAATOKSEN_PAIVAMAARA" timestamp without time zone,
    "HAO_PAATOKSEN_SISALTO" character varying(1000),
    "KHO_VALIPAATOKSEN_PAIVAMAARA" character varying(1000),
    "KHO_KUMOTTU" numeric(38,10),
    "KHO_PAATOKSEN_PAIVAMAARA" timestamp without time zone,
    "KHO_PAATOKSEN_SISALTO" character varying(1000),
    "OLD_LAINVOIMAISUUS" character varying(1000),
    "LAINVOIMAISUUDEN_PAATTYMINEN" timestamp without time zone,
    "OLD_LIIKENTEESEENLUOVUTUS_OSA" character varying(1000),
    "OLD_LIIKENTEESEENLUOVUTUS_KOKO" character varying(1000),
    "YVA_HANKE" numeric(38,10),
    "ALOITUSKUULUTUS" timestamp without time zone,
    "SAHKO" double precision,
    "VIESTINTA" double precision,
    "VESI" double precision,
    "JATKOPAATOS_1_ANNETTU" timestamp without time zone,
    "JATKOPAATOS_2_ANNETTU" timestamp without time zone,
    "PALAUTETTU_ELYLLE" timestamp without time zone,
    "RIVILUOTUPVM" timestamp without time zone,
    "RIVIMUOKATTUPVM" timestamp without time zone,
    "RIVIMUOKKAAJATUNNUS" character varying(150),
    "DOCUMENT_ID" character varying(255),
    "RAUENNUT" timestamp without time zone,
    "HAO_VALIPAATOS_SISALTO" character varying(1000),
    "KHO_VALIPAATOS_SISALTO" character varying(1000),
    "LAINVOIMAISUUS" timestamp without time zone,
    "OSAPAATOS_ANNETTU" timestamp without time zone,
    "LIIKENTEESEENLUOVUTUS_OSA" timestamp without time zone,
    "LIIKENTEESEENLUOVUTUS_KOKO" timestamp without time zone,
    "SISRATASUUNNITTELUA" numeric(38,10),
    "MAANTIETOIMITUSTEHTY" timestamp without time zone
);


ALTER TABLE tiesutst."TIESUUNNITELMA" OWNER TO tiesu;

--
-- Name: TIESUUNNITELMAHISTORIA; Type: TABLE; Schema: tiesutst; Owner: tiesu
--

CREATE TABLE tiesutst."TIESUUNNITELMAHISTORIA" (
    "RIVI_ID" numeric(38,10) NOT NULL,
    "TUNNUS" numeric(38,0),
    "SUUNNITELMAN_NIMI" character varying(1000),
    "KASITTELIJA" character varying(500),
    "SUUNNITELMAN_KUVAUS" character varying(1000),
    "ASIANUMERO" character varying(250),
    "ELY_KESKUS" character varying(10),
    "STATUS_ID" numeric(38,0),
    "HYVAKSYTTY_ESITYS_LAADITTU" timestamp without time zone,
    "HYVAKSYTTY_ESITYS_SAAPUNUT" timestamp without time zone,
    "KOKONAISKUSTANNUKSET" double precision,
    "VALTIO" double precision,
    "VALTIO_OSUUS" double precision,
    "KUNTA" double precision,
    "KUNTA_OSUUS" double precision,
    "MUUT" double precision,
    "MUUT_OSUUS" double precision,
    "INDEKSIVUOSILUKU" numeric(38,0),
    "MAARAKENNUSINDEKSI" numeric(38,19),
    "MAANTIEN_LAKKAAMINEN" numeric(38,10),
    "KIIREELLINEN_KASITTELY" numeric(38,10),
    "MUISTUTUSTEN_LUKUMAARA" numeric(38,0),
    "KOHDE_ID" numeric(38,0),
    "KOHDE_ID2" numeric(38,0),
    "SELITYS" character varying(1000),
    "HYVAKSYTTY_PAATOS_ANNETTU" timestamp without time zone,
    "KASITTELY_VRK" numeric(38,0),
    "LVM_LAADITTU" timestamp without time zone,
    "LVM_HYVAKSYMISPAATOS" timestamp without time zone,
    "LVM_JATKOPAATOS" timestamp without time zone,
    "OLD_OSAPAATOS_ANNETTU" timestamp without time zone,
    "VALITUSTEN_MAARA" numeric(38,0),
    "HAO_VALIPAATOKSEN_PAIVAMAARA" character varying(500),
    "HAO_KUMOTTU" numeric(38,10),
    "HAO_PVM" timestamp without time zone,
    "HAO_SISALTO" character varying(1000),
    "KHO_VALIPAATOKSEN_PAIVAMAARA" character varying(1000),
    "KHO_KUMOTTU" numeric(38,10),
    "KHO_PVM" timestamp without time zone,
    "KHO_SISALTO" character varying(1000),
    "OLD_LAINVOIMAISUUS" character varying(1000),
    "LAINVOIMAISUUS_PAATTYY" timestamp without time zone,
    "OLD_LIIKENTEESEENLUOVUTUS_OSA" character varying(1000),
    "OLD_LIIKENTEESEENLUOVUTUS_KOKO" character varying(1000),
    "YVA_HANKE" numeric(38,10),
    "ALOITUSKUULUTUS" timestamp without time zone,
    "SAHKO" double precision,
    "VIESTINTA" double precision,
    "VESI" double precision,
    "JATKOPAATOS_1_ANNETTU" timestamp without time zone,
    "JATKOPAATOS_2_ANNETTU" timestamp without time zone,
    "PALAUTETTU_ELYLLE" timestamp without time zone,
    "HISTORIATYYPPI" character varying(6) NOT NULL,
    "RIVITUNNUS" numeric(38,10),
    "RIVITILA" character varying(15),
    "RIVILUOTUPVM" timestamp without time zone,
    "RIVIMUOKATTUPVM" timestamp without time zone,
    "RIVIMUOKKAAJATUNNUS" character varying(150),
    "DOCUMENT_ID" character varying(255),
    "RAUENNUT" timestamp without time zone,
    "HAO_VALIPAATOS_SISALTO" character varying(1000),
    "KHO_VALIPAATOS_SISALTO" character varying(1000),
    "LAINVOIMAISUUS" timestamp without time zone,
    "OSAPAATOS_ANNETTU" timestamp without time zone,
    "LIIKENTEESEENLUOVUTUS_OSA" timestamp without time zone,
    "LIIKENTEESEENLUOVUTUS_KOKO" timestamp without time zone,
    "SISRATASUUNNITTELUA" numeric(38,10),
    "MAANTIETOIMITUSTEHTY" timestamp without time zone
);


ALTER TABLE tiesutst."TIESUUNNITELMAHISTORIA" OWNER TO tiesu;

--
-- Name: TIESUUNNITELMAHIST_15102020; Type: TABLE; Schema: tiesutst; Owner: tiesu
--

CREATE TABLE tiesutst."TIESUUNNITELMAHIST_15102020" (
    "RIVI_ID" numeric(38,10) NOT NULL,
    "TUNNUS" numeric(38,0),
    "SUUNNITELMAN_NIMI" character varying(1000),
    "KASITTELIJA" character varying(500),
    "SUUNNITELMAN_KUVAUS" character varying(1000),
    "ASIANUMERO" character varying(250),
    "ELY_KESKUS" character varying(10),
    "STATUS_ID" numeric(38,0),
    "HYVAKSYTTY_ESITYS_LAADITTU" timestamp without time zone,
    "HYVAKSYTTY_ESITYS_SAAPUNUT" timestamp without time zone,
    "KOKONAISKUSTANNUKSET" double precision,
    "VALTIO" double precision,
    "VALTIO_OSUUS" double precision,
    "KUNTA" double precision,
    "KUNTA_OSUUS" double precision,
    "MUUT" double precision,
    "MUUT_OSUUS" double precision,
    "INDEKSIVUOSILUKU" numeric(38,0),
    "MAARAKENNUSINDEKSI" numeric(38,19),
    "MAANTIEN_LAKKAAMINEN" numeric(38,10),
    "KIIREELLINEN_KASITTELY" numeric(38,10),
    "MUISTUTUSTEN_LUKUMAARA" numeric(38,0),
    "KOHDE_ID" numeric(38,0),
    "KOHDE_ID2" numeric(38,0),
    "SELITYS" character varying(1000),
    "HYVAKSYTTY_PAATOS_ANNETTU" timestamp without time zone,
    "KASITTELY_VRK" numeric(38,0),
    "LVM_LAADITTU" timestamp without time zone,
    "LVM_HYVAKSYMISPAATOS" timestamp without time zone,
    "LVM_JATKOPAATOS" timestamp without time zone,
    "OSAPAATOS_ANNETTU" timestamp without time zone,
    "VALITUSTEN_MAARA" numeric(38,0),
    "HAO_VALIPAATOKSEN_PAIVAMAARA" character varying(500),
    "HAO_KUMOTTU" numeric(38,10),
    "HAO_PVM" timestamp without time zone,
    "HAO_SISALTO" character varying(1000),
    "KHO_VALIPAATOKSEN_PAIVAMAARA" character varying(1000),
    "KHO_KUMOTTU" numeric(38,10),
    "KHO_PVM" timestamp without time zone,
    "KHO_SISALTO" character varying(1000),
    "LAINVOIMAISUUS" character varying(1000),
    "LAINVOIMAISUUS_PAATTYY" timestamp without time zone,
    "LIIKENTEESEENLUOVUTUS_OSA" character varying(1000),
    "LIIKENTEESEENLUOVUTUS_KOKO" character varying(1000),
    "YVA_HANKE" numeric(38,10),
    "ALOITUSKUULUTUS" timestamp without time zone,
    "SAHKO" double precision,
    "VIESTINTA" double precision,
    "VESI" double precision,
    "JATKOPAATOS_1_ANNETTU" timestamp without time zone,
    "JATKOPAATOS_2_ANNETTU" timestamp without time zone,
    "PALAUTETTU_ELYLLE" timestamp without time zone,
    "HISTORIATYYPPI" character varying(6) NOT NULL,
    "RIVITUNNUS" numeric(38,10),
    "RIVITILA" character varying(15),
    "RIVILUOTUPVM" timestamp without time zone,
    "RIVIMUOKATTUPVM" timestamp without time zone,
    "RIVIMUOKKAAJATUNNUS" character varying(150),
    "DOCUMENT_ID" character varying(255),
    "RAUENNUT" timestamp without time zone,
    "HAO_VALIPAATOS_SISALTO" character varying(1000),
    "KHO_VALIPAATOS_SISALTO" character varying(1000)
);


ALTER TABLE tiesutst."TIESUUNNITELMAHIST_15102020" OWNER TO tiesu;

--
-- Name: TIESUUNNITELMA_15102020; Type: TABLE; Schema: tiesutst; Owner: tiesu
--

CREATE TABLE tiesutst."TIESUUNNITELMA_15102020" (
    "TS_WID" numeric(38,0) NOT NULL,
    "TIESUUNNITELMA_NRO" numeric(38,0),
    "TIESUUNNITELMA_NIMI" character varying(1000) NOT NULL,
    "KASITTELIJA" character varying(500),
    "TIESUUNNITELMAN_KUVAUS" character varying(1000),
    "DIAARI" character varying(250) NOT NULL,
    "ELY_KESKUS" character varying(10),
    "STATUS_ID" numeric(38,0),
    "HYVAKSYTTY_ESITYS_LAADITTU" timestamp without time zone,
    "HYVAKSYTTY_ESITYS_SAAPUNUT" timestamp without time zone,
    "KOKONAISKUSTANNUKSET" double precision,
    "VALTIO" double precision,
    "VALTIO_OSUUS" double precision,
    "KUNTA" double precision,
    "KUNTA_OSUUS" double precision,
    "MUUT" double precision,
    "MUUT_OSUUS" double precision,
    "INDEKSIVUOSILUKU" numeric(38,0),
    "MAARAKENNUSINDEKSI" numeric(38,19),
    "MAANTIEN_LAKKAAMINEN" numeric(38,10),
    "KIIREELLINEN_KASITTELY" numeric(38,10),
    "MUISTUTUSTEN_LUKUMAARA" numeric(38,0),
    "TS_KOHDE_ID" numeric(38,0),
    "TS_KOHDE_ID2" numeric(38,0),
    "SELITYS" character varying(1000),
    "HYVAKSYTTY_PAATOS_ANNETTU" timestamp without time zone,
    "KASITTELY_VRK" numeric(38,0),
    "LVM_LAADITTU" timestamp without time zone,
    "LVM_HYVAKSYMISPAATOS" timestamp without time zone,
    "JATKOPAATOS" timestamp without time zone,
    "OSAPAATOS_ANNETTU" timestamp without time zone,
    "VALITUSTEN_MAARA" numeric(38,0),
    "HAO_VALIPAATOKSEN_PAIVAMAARA" character varying(500),
    "HAO_KUMOTTU" numeric(38,10),
    "HAO_PAATOKSEN_PAIVAMAARA" timestamp without time zone,
    "HAO_PAATOKSEN_SISALTO" character varying(1000),
    "KHO_VALIPAATOKSEN_PAIVAMAARA" character varying(1000),
    "KHO_KUMOTTU" numeric(38,10),
    "KHO_PAATOKSEN_PAIVAMAARA" timestamp without time zone,
    "KHO_PAATOKSEN_SISALTO" character varying(1000),
    "LAINVOIMAISUUS" character varying(1000),
    "LAINVOIMAISUUDEN_PAATTYMINEN" timestamp without time zone,
    "LIIKENTEESEENLUOVUTUS_OSA" character varying(1000),
    "LIIKENTEESEENLUOVUTUS_KOKO" character varying(1000),
    "YVA_HANKE" numeric(38,10),
    "ALOITUSKUULUTUS" timestamp without time zone,
    "SAHKO" double precision,
    "VIESTINTA" double precision,
    "VESI" double precision,
    "JATKOPAATOS_1_ANNETTU" timestamp without time zone,
    "JATKOPAATOS_2_ANNETTU" timestamp without time zone,
    "PALAUTETTU_ELYLLE" timestamp without time zone,
    "RIVILUOTUPVM" timestamp without time zone,
    "RIVIMUOKATTUPVM" timestamp without time zone,
    "RIVIMUOKKAAJATUNNUS" character varying(150),
    "DOCUMENT_ID" character varying(255),
    "RAUENNUT" timestamp without time zone,
    "HAO_VALIPAATOS_SISALTO" character varying(1000),
    "KHO_VALIPAATOS_SISALTO" character varying(1000)
);


ALTER TABLE tiesutst."TIESUUNNITELMA_15102020" OWNER TO tiesu;

--
-- Name: TIESUUNNITELMA_KASITE_ARVO; Type: TABLE; Schema: tiesutst; Owner: tiesu
--

CREATE TABLE tiesutst."TIESUUNNITELMA_KASITE_ARVO" (
    "KASITE_WID" numeric(38,0) NOT NULL,
    "KASITE" character varying(100),
    "ARVO" character varying(200)
);


ALTER TABLE tiesutst."TIESUUNNITELMA_KASITE_ARVO" OWNER TO tiesu;

--
-- Name: TS_KOHDE; Type: TABLE; Schema: tiesutst; Owner: tiesu
--

CREATE TABLE tiesutst."TS_KOHDE" (
    "KOHDE_ID" numeric(38,0) NOT NULL,
    "KOHDE_SELITE" character varying(100)
);


ALTER TABLE tiesutst."TS_KOHDE" OWNER TO tiesu;

--
-- Name: TS_STATUS; Type: TABLE; Schema: tiesutst; Owner: tiesu
--

CREATE TABLE tiesutst."TS_STATUS" (
    "STATUS_ID" numeric(38,0) NOT NULL,
    "STATUS_SELITE" character varying(100),
    "READONLY" numeric(38,10)
);


ALTER TABLE tiesutst."TS_STATUS" OWNER TO tiesu;

--
-- Name: YLEISSUUNITELMA; Type: TABLE; Schema: tiesutst; Owner: tiesu
--

CREATE TABLE tiesutst."YLEISSUUNITELMA" (
    "YS_WID" numeric(38,0) NOT NULL,
    "YLEISSUUNITELMAN_NRO" numeric(38,0),
    "YLEISSUUNNITELMAN_NIMI" character varying(1000) NOT NULL,
    "KASITTELIJA" character varying(100),
    "SUUNNITELMALAJI" character varying(500),
    "YLEISSUUNITELMAN_KUVAUS" character varying(2000),
    "DIAARI" character varying(60) NOT NULL,
    "ELY_KESKUS" character varying(50),
    "Y_STATUS_ID" numeric(38,0),
    "HYVAKSYTTY_ESITYS_LAADITTU" timestamp without time zone,
    "HYVAKSYTTY_ESITYS_SAAPUNUT" timestamp without time zone,
    "MUISTUTUKSET" numeric(38,0),
    "HYVAKSYTTY_PAATOS_ANNETTU" timestamp without time zone,
    "VALITUSTEN_MAARA" numeric(38,0),
    "SELITYS" character varying(1000),
    "KASITTELY_VRK" numeric(38,0),
    "OLD_OSAPAATOS_ANNETTU" character varying(500),
    "HAO_PVM" timestamp without time zone,
    "HAO_SISALTO" character varying(1000),
    "KHO_PVM" timestamp without time zone,
    "KHO_SISALTO" character varying(1000),
    "OLD_LAINVOIMAISUUS" character varying(200),
    "LAINVOIMASUUS_PAATTYY" timestamp without time zone,
    "RAENNUT" character varying(1000),
    "TIESUUNNITELMA_LAADITTU" character varying(1000),
    "JATKOPAATOS" timestamp without time zone,
    "YVA_HANKE" numeric(38,10),
    "KOKONAISKUSTANNUKSET" double precision,
    "ALOITUSKUULUTUS" timestamp without time zone,
    "VALTIO" double precision,
    "KUNTA" double precision,
    "MUUT" double precision,
    "SAHKO" double precision,
    "VIESTINTA" double precision,
    "VESI" double precision,
    "INDEKSIVUOSILUKU" numeric(38,0),
    "MAARAKENNUSINDEKSI" numeric(38,19),
    "MAANTIEN_LAKKAAMINEN" numeric(38,10),
    "KIIREELLINEN_KASITTELY" numeric(38,10),
    "MUISTUTUSTEN_LUKUMAARA" numeric(38,0),
    "KOHDE_ID" numeric(38,0),
    "KOHDE_ID2" numeric(38,0),
    "JATKOPAATOS_1_ANNETTU" timestamp without time zone,
    "JATKOPAATOS_2_ANNETTU" timestamp without time zone,
    "PALAUTETTU_ELYLLE" timestamp without time zone,
    "LVM_LAADITTU" timestamp without time zone,
    "LVM_HYVAKSYMISPAATOS" timestamp without time zone,
    "HAO_VALIPAATOKSEN_PAIVAMAARA" character varying(500),
    "HAO_KUMOTTU" numeric(38,10),
    "KHO_VALIPAATOKSEN_PAIVAMAARA" character varying(1000),
    "KHO_KUMOTTU" numeric(38,10),
    "RIVILUOTUPVM" timestamp without time zone,
    "RIVIMUOKATTUPVM" timestamp without time zone,
    "RIVIMUOKKAAJATUNNUS" character varying(150),
    "DOCUMENT_ID" character varying(255),
    "RAUENNUT" timestamp without time zone,
    "HAO_VALIPAATOS_SISALTO" character varying(1000),
    "KHO_VALIPAATOS_SISALTO" character varying(1000),
    "LAINVOIMAISUUS" timestamp without time zone,
    "OSAPAATOS_ANNETTU" timestamp without time zone
);


ALTER TABLE tiesutst."YLEISSUUNITELMA" OWNER TO tiesu;

--
-- Name: YLEISSUUNITELMA_15102020; Type: TABLE; Schema: tiesutst; Owner: tiesu
--

CREATE TABLE tiesutst."YLEISSUUNITELMA_15102020" (
    "YS_WID" numeric(38,0) NOT NULL,
    "YLEISSUUNITELMAN_NRO" numeric(38,0),
    "YLEISSUUNNITELMAN_NIMI" character varying(1000) NOT NULL,
    "KASITTELIJA" character varying(100),
    "SUUNNITELMALAJI" character varying(500),
    "YLEISSUUNITELMAN_KUVAUS" character varying(2000),
    "DIAARI" character varying(60) NOT NULL,
    "ELY_KESKUS" character varying(50),
    "Y_STATUS_ID" numeric(38,0),
    "HYVAKSYTTY_ESITYS_LAADITTU" timestamp without time zone,
    "HYVAKSYTTY_ESITYS_SAAPUNUT" timestamp without time zone,
    "MUISTUTUKSET" numeric(38,0),
    "HYVAKSYTTY_PAATOS_ANNETTU" timestamp without time zone,
    "VALITUSTEN_MAARA" numeric(38,0),
    "SELITYS" character varying(1000),
    "KASITTELY_VRK" numeric(38,0),
    "OSAPAATOS_ANNETTU" character varying(500),
    "HAO_PVM" timestamp without time zone,
    "HAO_SISALTO" character varying(1000),
    "KHO_PVM" timestamp without time zone,
    "KHO_SISALTO" character varying(1000),
    "LAINVOIMAISUUS" character varying(200),
    "LAINVOIMASUUS_PAATTYY" timestamp without time zone,
    "RAENNUT" character varying(1000),
    "TIESUUNNITELMA_LAADITTU" character varying(1000),
    "JATKOPAATOS" timestamp without time zone,
    "YVA_HANKE" numeric(38,10),
    "KOKONAISKUSTANNUKSET" double precision,
    "ALOITUSKUULUTUS" timestamp without time zone,
    "VALTIO" double precision,
    "KUNTA" double precision,
    "MUUT" double precision,
    "SAHKO" double precision,
    "VIESTINTA" double precision,
    "VESI" double precision,
    "INDEKSIVUOSILUKU" numeric(38,0),
    "MAARAKENNUSINDEKSI" numeric(38,19),
    "MAANTIEN_LAKKAAMINEN" numeric(38,10),
    "KIIREELLINEN_KASITTELY" numeric(38,10),
    "MUISTUTUSTEN_LUKUMAARA" numeric(38,0),
    "KOHDE_ID" numeric(38,0),
    "KOHDE_ID2" numeric(38,0),
    "JATKOPAATOS_1_ANNETTU" timestamp without time zone,
    "JATKOPAATOS_2_ANNETTU" timestamp without time zone,
    "PALAUTETTU_ELYLLE" timestamp without time zone,
    "LVM_LAADITTU" timestamp without time zone,
    "LVM_HYVAKSYMISPAATOS" timestamp without time zone,
    "HAO_VALIPAATOKSEN_PAIVAMAARA" character varying(500),
    "HAO_KUMOTTU" numeric(38,10),
    "KHO_VALIPAATOKSEN_PAIVAMAARA" character varying(1000),
    "KHO_KUMOTTU" numeric(38,10),
    "RIVILUOTUPVM" timestamp without time zone,
    "RIVIMUOKATTUPVM" timestamp without time zone,
    "RIVIMUOKKAAJATUNNUS" character varying(150),
    "DOCUMENT_ID" character varying(255),
    "RAUENNUT" timestamp without time zone,
    "HAO_VALIPAATOS_SISALTO" character varying(1000),
    "KHO_VALIPAATOS_SISALTO" character varying(1000)
);


ALTER TABLE tiesutst."YLEISSUUNITELMA_15102020" OWNER TO tiesu;

--
-- Name: YLEISSUUNNITELMAHISTORIA; Type: TABLE; Schema: tiesutst; Owner: tiesu
--

CREATE TABLE tiesutst."YLEISSUUNNITELMAHISTORIA" (
    "RIVI_ID" numeric(38,10) NOT NULL,
    "TUNNUS" numeric(38,0),
    "SUUNNITELMAN_NIMI" character varying(1000),
    "KASITTELIJA" character varying(100),
    "SUUNNITELMALAJI" character varying(500),
    "SUUNNITELMAN_KUVAUS" character varying(2000),
    "ASIANUMERO" character varying(60),
    "ELY_KESKUS" character varying(50),
    "STATUS_ID" numeric(38,0),
    "HYVAKSYTTY_ESITYS_LAADITTU" timestamp without time zone,
    "HYVAKSYTTY_ESITYS_SAAPUNUT" timestamp without time zone,
    "MUISTUTUKSET" numeric(38,0),
    "HYVAKSYTTY_PAATOS_ANNETTU" timestamp without time zone,
    "VALITUSTEN_MAARA" numeric(38,0),
    "SELITYS" character varying(1000),
    "KASITTELY_VRK" numeric(38,0),
    "OLD_OSAPAATOS_ANNETTU" character varying(500),
    "HAO_PVM" timestamp without time zone,
    "HAO_SISALTO" character varying(1000),
    "KHO_PVM" timestamp without time zone,
    "KHO_SISALTO" character varying(1000),
    "OLD_LAINVOIMAISUUS" character varying(200),
    "LAINVOIMAISUUS_PAATTYY" timestamp without time zone,
    "RAENNUT" character varying(1000),
    "SUUNNITELMA_LAADITTU" character varying(1000),
    "LVM_JATKOPAATOS" timestamp without time zone,
    "YVA_HANKE" numeric(38,10),
    "ALOITUSKUULUTUS" timestamp without time zone,
    "KOKONAISKUSTANNUKSET" double precision,
    "VALTIO" double precision,
    "KUNTA" double precision,
    "MUUT" double precision,
    "SAHKO" double precision,
    "VIESTINTA" double precision,
    "VESI" double precision,
    "INDEKSIVUOSILUKU" numeric(38,0),
    "MAARAKENNUSINDEKSI" numeric(38,19),
    "MAANTIEN_LAKKAAMINEN" numeric(38,10),
    "KIIREELLINEN_KASITTELY" numeric(38,10),
    "MUISTUTUSTEN_LUKUMAARA" numeric(38,0),
    "KOHDE_ID" numeric(38,0),
    "KOHDE_ID2" numeric(38,0),
    "JATKOPAATOS_1_ANNETTU" timestamp without time zone,
    "JATKOPAATOS_2_ANNETTU" timestamp without time zone,
    "PALAUTETTU_ELYLLE" timestamp without time zone,
    "LVM_LAADITTU" timestamp without time zone,
    "LVM_HYVAKSYMISPAATOS" timestamp without time zone,
    "HAO_VALIPAATOKSEN_PAIVAMAARA" character varying(500),
    "HAO_KUMOTTU" numeric(38,10),
    "KHO_VALIPAATOKSEN_PAIVAMAARA" character varying(1000),
    "KHO_KUMOTTU" numeric(38,10),
    "HISTORIATYYPPI" character varying(6) NOT NULL,
    "RIVITUNNUS" numeric(38,10),
    "RIVITILA" character varying(15),
    "RIVILUOTUPVM" timestamp without time zone,
    "RIVIMUOKATTUPVM" timestamp without time zone,
    "RIVIMUOKKAAJATUNNUS" character varying(150),
    "DOCUMENT_ID" character varying(255),
    "RAUENNUT" timestamp without time zone,
    "HAO_VALIPAATOS_SISALTO" character varying(1000),
    "KHO_VALIPAATOS_SISALTO" character varying(1000),
    "LAINVOIMAISUUS" timestamp without time zone,
    "OSAPAATOS_ANNETTU" timestamp without time zone
);


ALTER TABLE tiesutst."YLEISSUUNNITELMAHISTORIA" OWNER TO tiesu;

--
-- Name: YLEISSUUNNITELMAHIST_15102020; Type: TABLE; Schema: tiesutst; Owner: tiesu
--

CREATE TABLE tiesutst."YLEISSUUNNITELMAHIST_15102020" (
    "RIVI_ID" numeric(38,10) NOT NULL,
    "TUNNUS" numeric(38,0),
    "SUUNNITELMAN_NIMI" character varying(1000),
    "KASITTELIJA" character varying(100),
    "SUUNNITELMALAJI" character varying(500),
    "SUUNNITELMAN_KUVAUS" character varying(2000),
    "ASIANUMERO" character varying(60),
    "ELY_KESKUS" character varying(50),
    "STATUS_ID" numeric(38,0),
    "HYVAKSYTTY_ESITYS_LAADITTU" timestamp without time zone,
    "HYVAKSYTTY_ESITYS_SAAPUNUT" timestamp without time zone,
    "MUISTUTUKSET" numeric(38,0),
    "HYVAKSYTTY_PAATOS_ANNETTU" timestamp without time zone,
    "VALITUSTEN_MAARA" numeric(38,0),
    "SELITYS" character varying(1000),
    "KASITTELY_VRK" numeric(38,0),
    "OSAPAATOS_ANNETTU" character varying(500),
    "HAO_PVM" timestamp without time zone,
    "HAO_SISALTO" character varying(1000),
    "KHO_PVM" timestamp without time zone,
    "KHO_SISALTO" character varying(1000),
    "LAINVOIMAISUUS" character varying(200),
    "LAINVOIMAISUUS_PAATTYY" timestamp without time zone,
    "RAENNUT" character varying(1000),
    "SUUNNITELMA_LAADITTU" character varying(1000),
    "LVM_JATKOPAATOS" timestamp without time zone,
    "YVA_HANKE" numeric(38,10),
    "ALOITUSKUULUTUS" timestamp without time zone,
    "KOKONAISKUSTANNUKSET" double precision,
    "VALTIO" double precision,
    "KUNTA" double precision,
    "MUUT" double precision,
    "SAHKO" double precision,
    "VIESTINTA" double precision,
    "VESI" double precision,
    "INDEKSIVUOSILUKU" numeric(38,0),
    "MAARAKENNUSINDEKSI" numeric(38,19),
    "MAANTIEN_LAKKAAMINEN" numeric(38,10),
    "KIIREELLINEN_KASITTELY" numeric(38,10),
    "MUISTUTUSTEN_LUKUMAARA" numeric(38,0),
    "KOHDE_ID" numeric(38,0),
    "KOHDE_ID2" numeric(38,0),
    "JATKOPAATOS_1_ANNETTU" timestamp without time zone,
    "JATKOPAATOS_2_ANNETTU" timestamp without time zone,
    "PALAUTETTU_ELYLLE" timestamp without time zone,
    "LVM_LAADITTU" timestamp without time zone,
    "LVM_HYVAKSYMISPAATOS" timestamp without time zone,
    "HAO_VALIPAATOKSEN_PAIVAMAARA" character varying(500),
    "HAO_KUMOTTU" numeric(38,10),
    "KHO_VALIPAATOKSEN_PAIVAMAARA" character varying(1000),
    "KHO_KUMOTTU" numeric(38,10),
    "HISTORIATYYPPI" character varying(6) NOT NULL,
    "RIVITUNNUS" numeric(38,10),
    "RIVITILA" character varying(15),
    "RIVILUOTUPVM" timestamp without time zone,
    "RIVIMUOKATTUPVM" timestamp without time zone,
    "RIVIMUOKKAAJATUNNUS" character varying(150),
    "DOCUMENT_ID" character varying(255),
    "RAUENNUT" timestamp without time zone,
    "HAO_VALIPAATOS_SISALTO" character varying(1000),
    "KHO_VALIPAATOS_SISALTO" character varying(1000)
);


ALTER TABLE tiesutst."YLEISSUUNNITELMAHIST_15102020" OWNER TO tiesu;

--
-- Name: YLEISSUUNNITELMA_KASITE_ARVO; Type: TABLE; Schema: tiesutst; Owner: tiesu
--

CREATE TABLE tiesutst."YLEISSUUNNITELMA_KASITE_ARVO" (
    "KASITE_WID" numeric(38,0) NOT NULL,
    "KASITE" character varying(100),
    "ARVO" character varying(200)
);


ALTER TABLE tiesutst."YLEISSUUNNITELMA_KASITE_ARVO" OWNER TO tiesu;

--
-- Name: YS_KOHDE; Type: TABLE; Schema: tiesutst; Owner: tiesu
--

CREATE TABLE tiesutst."YS_KOHDE" (
    "KOHDE_ID" numeric(38,0) NOT NULL,
    "KOHDE_SELITE" character varying(100)
);


ALTER TABLE tiesutst."YS_KOHDE" OWNER TO tiesu;

--
-- Name: YS_STATUS; Type: TABLE; Schema: tiesutst; Owner: tiesu
--

CREATE TABLE tiesutst."YS_STATUS" (
    "STATUS_ID" numeric(38,0) NOT NULL,
    "SELITE" character varying(300),
    "READONLY" numeric(38,10)
);


ALTER TABLE tiesutst."YS_STATUS" OWNER TO tiesu;

--
-- Name: RATASUUNNITELMA RATASUUNNITELMA_pkey; Type: CONSTRAINT; Schema: tiesutst; Owner: tiesu
--

ALTER TABLE ONLY tiesutst."RATASUUNNITELMA"
    ADD CONSTRAINT "RATASUUNNITELMA_pkey" PRIMARY KEY ("TUNNUS");


--
-- Name: RAUTATIEN_YLEISSUUNNITELMA RAUTATIEN_YLEISSUUNNITELMA_pkey; Type: CONSTRAINT; Schema: tiesutst; Owner: tiesu
--

ALTER TABLE ONLY tiesutst."RAUTATIEN_YLEISSUUNNITELMA"
    ADD CONSTRAINT "RAUTATIEN_YLEISSUUNNITELMA_pkey" PRIMARY KEY ("TUNNUS");


--
-- Name: RS_KOHDE RS_KOHDE_pkey; Type: CONSTRAINT; Schema: tiesutst; Owner: tiesu
--

ALTER TABLE ONLY tiesutst."RS_KOHDE"
    ADD CONSTRAINT "RS_KOHDE_pkey" PRIMARY KEY ("KOHDE_ID");


--
-- Name: RS_STATUS RS_STATUS_pkey; Type: CONSTRAINT; Schema: tiesutst; Owner: tiesu
--

ALTER TABLE ONLY tiesutst."RS_STATUS"
    ADD CONSTRAINT "RS_STATUS_pkey" PRIMARY KEY ("STATUS_ID");


--
-- Name: RT_HISTORIA RT_HISTORIA_pkey; Type: CONSTRAINT; Schema: tiesutst; Owner: tiesu
--

ALTER TABLE ONLY tiesutst."RT_HISTORIA"
    ADD CONSTRAINT "RT_HISTORIA_pkey" PRIMARY KEY ("RIVI_ID");


--
-- Name: RT_KASITE_ARVO RT_KASITE_ARVO_pkey; Type: CONSTRAINT; Schema: tiesutst; Owner: tiesu
--

ALTER TABLE ONLY tiesutst."RT_KASITE_ARVO"
    ADD CONSTRAINT "RT_KASITE_ARVO_pkey" PRIMARY KEY ("KASITE_WID");


--
-- Name: RT_YLEIS_KASITE_ARVO RT_YLEIS_KASITE_ARVO_pkey; Type: CONSTRAINT; Schema: tiesutst; Owner: tiesu
--

ALTER TABLE ONLY tiesutst."RT_YLEIS_KASITE_ARVO"
    ADD CONSTRAINT "RT_YLEIS_KASITE_ARVO_pkey" PRIMARY KEY ("KASITE_WID");


--
-- Name: RYS_HISTORIA RYS_HISTORIA_pkey; Type: CONSTRAINT; Schema: tiesutst; Owner: tiesu
--

ALTER TABLE ONLY tiesutst."RYS_HISTORIA"
    ADD CONSTRAINT "RYS_HISTORIA_pkey" PRIMARY KEY ("RIVI_ID");


--
-- Name: RYS_KOHDE RYS_KOHDE_pkey; Type: CONSTRAINT; Schema: tiesutst; Owner: tiesu
--

ALTER TABLE ONLY tiesutst."RYS_KOHDE"
    ADD CONSTRAINT "RYS_KOHDE_pkey" PRIMARY KEY ("KOHDE_ID");


--
-- Name: RYS_STATUS RYS_STATUS_pkey; Type: CONSTRAINT; Schema: tiesutst; Owner: tiesu
--

ALTER TABLE ONLY tiesutst."RYS_STATUS"
    ADD CONSTRAINT "RYS_STATUS_pkey" PRIMARY KEY ("STATUS_ID");


--
-- Name: TIESUUNNITELMAHISTORIA TIESUUNNITELMAHISTORIA_pkey; Type: CONSTRAINT; Schema: tiesutst; Owner: tiesu
--

ALTER TABLE ONLY tiesutst."TIESUUNNITELMAHISTORIA"
    ADD CONSTRAINT "TIESUUNNITELMAHISTORIA_pkey" PRIMARY KEY ("RIVI_ID");


--
-- Name: TIESUUNNITELMA_KASITE_ARVO TIESUUNNITELMA_KASITE_ARVO_pkey; Type: CONSTRAINT; Schema: tiesutst; Owner: tiesu
--

ALTER TABLE ONLY tiesutst."TIESUUNNITELMA_KASITE_ARVO"
    ADD CONSTRAINT "TIESUUNNITELMA_KASITE_ARVO_pkey" PRIMARY KEY ("KASITE_WID");


--
-- Name: TIESUUNNITELMA TIESUUNNITELMA_pkey; Type: CONSTRAINT; Schema: tiesutst; Owner: tiesu
--

ALTER TABLE ONLY tiesutst."TIESUUNNITELMA"
    ADD CONSTRAINT "TIESUUNNITELMA_pkey" PRIMARY KEY ("TS_WID");


--
-- Name: TS_KOHDE TS_KOHDE_pkey; Type: CONSTRAINT; Schema: tiesutst; Owner: tiesu
--

ALTER TABLE ONLY tiesutst."TS_KOHDE"
    ADD CONSTRAINT "TS_KOHDE_pkey" PRIMARY KEY ("KOHDE_ID");


--
-- Name: TS_STATUS TS_STATUS_pkey; Type: CONSTRAINT; Schema: tiesutst; Owner: tiesu
--

ALTER TABLE ONLY tiesutst."TS_STATUS"
    ADD CONSTRAINT "TS_STATUS_pkey" PRIMARY KEY ("STATUS_ID");


--
-- Name: YLEISSUUNITELMA YLEISSUUNITELMA_pkey; Type: CONSTRAINT; Schema: tiesutst; Owner: tiesu
--

ALTER TABLE ONLY tiesutst."YLEISSUUNITELMA"
    ADD CONSTRAINT "YLEISSUUNITELMA_pkey" PRIMARY KEY ("YS_WID");


--
-- Name: YLEISSUUNNITELMAHISTORIA YLEISSUUNNITELMAHISTORIA_pkey; Type: CONSTRAINT; Schema: tiesutst; Owner: tiesu
--

ALTER TABLE ONLY tiesutst."YLEISSUUNNITELMAHISTORIA"
    ADD CONSTRAINT "YLEISSUUNNITELMAHISTORIA_pkey" PRIMARY KEY ("RIVI_ID");


--
-- Name: YLEISSUUNNITELMA_KASITE_ARVO YLEISSUUNNITELMA_KASITE_ARVO_pkey; Type: CONSTRAINT; Schema: tiesutst; Owner: tiesu
--

ALTER TABLE ONLY tiesutst."YLEISSUUNNITELMA_KASITE_ARVO"
    ADD CONSTRAINT "YLEISSUUNNITELMA_KASITE_ARVO_pkey" PRIMARY KEY ("KASITE_WID");


--
-- Name: YS_KOHDE YS_KOHDE_pkey; Type: CONSTRAINT; Schema: tiesutst; Owner: tiesu
--

ALTER TABLE ONLY tiesutst."YS_KOHDE"
    ADD CONSTRAINT "YS_KOHDE_pkey" PRIMARY KEY ("KOHDE_ID");


--
-- Name: YS_STATUS YS_STATUS_pkey; Type: CONSTRAINT; Schema: tiesutst; Owner: tiesu
--

ALTER TABLE ONLY tiesutst."YS_STATUS"
    ADD CONSTRAINT "YS_STATUS_pkey" PRIMARY KEY ("STATUS_ID");


--
-- PostgreSQL database dump complete
--

CREATE SEQUENCE tiesutst."TIESUUNNITELMA_SEQ" START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
CREATE SEQUENCE tiesutst."YLEISSUUNITELMA_SEQ" START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
CREATE SEQUENCE tiesutst."RAUTATIEN_YLEISSUUNNITELMA_SEQ" START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
CREATE SEQUENCE tiesutst."RATASUUNNITELMA_SEQ" START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
CREATE SEQUENCE tiesutst."TIESUUNNITELMA_HIST_SEQ" START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
CREATE SEQUENCE tiesutst."YLEISSUUNNITELMA_HIST_SEQ" START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
CREATE SEQUENCE tiesutst."RYS_HIST_SEQ" START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
CREATE SEQUENCE tiesutst."RT_HIST_SEQ" START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
