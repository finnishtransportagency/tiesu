ALTER TABLE "YLEISSUUNITELMA" ADD (
"YVA_HANKE" NUMBER,
"KOKONAISKUSTANNUKSET" FLOAT(126),
"ALOITUSKUULUTUS" DATE,
"VALTIO" FLOAT(126), 
"KUNTA" FLOAT(126), 
"MUUT" FLOAT(126), 
"SAHKO" FLOAT(126),
"VIESTINTA" FLOAT(126),
"VESI" FLOAT(126),
"INDEKSIVUOSILUKU" NUMBER(*,0), 
"MAARAKENNUSINDEKSI" NUMBER(*,19), 
"MAANTIEN_LAKKAAMINEN" NUMBER, 
"KIIREELLINEN_KASITTELY" NUMBER, 
"MUISTUTUSTEN_LUKUMAARA" NUMBER(*,0), 
"KOHDE_ID" NUMBER(*,0), 
"KOHDE_ID2" NUMBER(*,0), 
"JATKOPAATOS_1_ANNETTU" DATE,
"JATKOPAATOS_2_ANNETTU" DATE,
"PALAUTETTU_ELYLLE" DATE,
"LVM_LAADITTU" DATE, 
"LVM_HYVAKSYMISPAATOS" DATE, 
"HAO_VALIPAATOKSEN_PAIVAMAARA" VARCHAR2(500 BYTE), 
"HAO_KUMOTTU" NUMBER,
"KHO_VALIPAATOKSEN_PAIVAMAARA" VARCHAR2(1000 BYTE), 
"KHO_KUMOTTU" NUMBER, 

"RIVILUOTUPVM" TIMESTAMP (6),
"RIVIMUOKATTUPVM" TIMESTAMP (6),
"RIVIMUOKKAAJATUNNUS" VARCHAR2(150),
"DOCUMENT_ID" VARCHAR2(255)
);








