--------------------------------------------------------
--  DDL for Table TIESUUNNITELMA
--------------------------------------------------------

  CREATE TABLE "TIESUUNNITELMA" 
   (	
    "TS_WID" NUMBER(*,0), 
	"TIESUUNNITELMA_NRO" NUMBER(*,0), 
	"TIESUUNNITELMA_NIMI" VARCHAR2(1000 BYTE), 
	"KASITTELIJA" VARCHAR2(500 BYTE), 
	"TIESUUNNITELMAN_KUVAUS" VARCHAR2(1000 BYTE), 
	"DIAARI" VARCHAR2(250 BYTE), 
	"ELY_KESKUS" VARCHAR2(10 BYTE), 
	"STATUS_ID" NUMBER(*,0), 
	"HYVAKSYTTY_ESITYS_LAADITTU" DATE, 
	"HYVAKSYTTY_ESITYS_SAAPUNUT" DATE, 
	"KOKONAISKUSTANNUKSET" FLOAT(126), 
	"VALTIO" FLOAT(126), 
	"VALTIO_OSUUS" FLOAT(126), 
	"KUNTA" FLOAT(126), 
	"KUNTA_OSUUS" FLOAT(126), 
	"MUUT" FLOAT(126), 
	"MUUT_OSUUS" FLOAT(126), 
	"INDEKSIVUOSILUKU" NUMBER(*,0), 
	"MAARAKENNUSINDEKSI" NUMBER(*,19), 
	"MAANTIEN_LAKKAAMINEN" NUMBER, 
	"KIIREELLINEN_KASITTELY" NUMBER, 
	"MUISTUTUSTEN_LUKUMAARA" NUMBER(*,0), 
	"TS_KOHDE_ID" NUMBER(*,0), 
	"TS_KOHDE_ID2" NUMBER(*,0), 
	"SELITYS" VARCHAR2(1000 BYTE), 
	"HYVAKSYTTY_PAATOS_ANNETTU" DATE, 
	"KASITTELY_VRK" NUMBER(*,0), 
	"LVM_LAADITTU" DATE, 
	"LVM_HYVAKSYMISPAATOS" DATE, 
	"JATKOPAATOS" DATE, 
	"OSAPAATOS_ANNETTU" DATE, 
	"VALITUSTEN_MAARA" NUMBER(*,0), 
	"HAO_VALIPAATOKSEN_PAIVAMAARA" VARCHAR2(500 BYTE), 
	"HAO_KUMOTTU" NUMBER, 
	"HAO_PAATOKSEN_PAIVAMAARA" DATE, 
	"HAO_PAATOKSEN_SISALTO" VARCHAR2(1000 BYTE), 
	"KHO_VALIPAATOKSEN_PAIVAMAARA" VARCHAR2(1000 BYTE), 
	"KHO_KUMOTTU" NUMBER, 
	"KHO_PAATOKSEN_PAIVAMAARA" DATE, 
	"KHO_PAATOKSEN_SISALTO" VARCHAR2(1000 BYTE), 
	"LAINVOIMAISUUS" VARCHAR2(1000 BYTE), 
	"LAINVOIMAISUUDEN_PAATTYMINEN" DATE, 
	"LIIKENTEESEENLUOVUTUS_OSA" VARCHAR2(1000 BYTE), 
	"LIIKENTEESEENLUOVUTUS_KOKO" VARCHAR2(1000 BYTE)
   ); 

--------------------------------------------------------
--  Constraints for Table TIESUUNNITELMA
--------------------------------------------------------

  ALTER TABLE "TIESUUNNITELMA" ADD PRIMARY KEY ("TS_WID");
  ALTER TABLE "TIESUUNNITELMA" MODIFY ("DIAARI" NOT NULL ENABLE);
  ALTER TABLE "TIESUUNNITELMA" MODIFY ("TIESUUNNITELMA_NIMI" NOT NULL ENABLE);
  ALTER TABLE "TIESUUNNITELMA" MODIFY ("TS_WID" NOT NULL ENABLE);

  
--------------------------------------------------------
--  DDL for Sequence TIESUUNNITELMA_SEQ
--------------------------------------------------------

 CREATE SEQUENCE "TIESUUNNITELMA_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1000 CACHE 20 NOORDER  NOCYCLE ;
  