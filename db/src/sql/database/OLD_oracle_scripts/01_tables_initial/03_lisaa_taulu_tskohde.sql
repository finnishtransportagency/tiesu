--------------------------------------------------------
--  DDL for Table TS_KOHDE
--------------------------------------------------------
CREATE TABLE "TS_KOHDE" 
   (	
   	"KOHDE_ID" NUMBER(*,0), 
	"KOHDE_SELITE" VARCHAR2(100 BYTE)
   );
--------------------------------------------------------
--  Constraints for Table TS_KOHDE
--------------------------------------------------------
ALTER TABLE "TS_KOHDE" ADD PRIMARY KEY ("KOHDE_ID");
ALTER TABLE "TS_KOHDE" MODIFY ("KOHDE_ID" NOT NULL ENABLE);

INSERT INTO TS_KOHDE (KOHDE_ID, KOHDE_SELITE) VALUES (1,'Jalkakäytävä ja pyörätie');
INSERT INTO TS_KOHDE (KOHDE_ID, KOHDE_SELITE) VALUES (2,'Yksityisen tien liittymä tai järjestely');
INSERT INTO TS_KOHDE (KOHDE_ID, KOHDE_SELITE) VALUES (4,'Maantie');
INSERT INTO TS_KOHDE (KOHDE_ID, KOHDE_SELITE) VALUES (5,'Moottoritie tai moottoriliikennetie');
INSERT INTO TS_KOHDE (KOHDE_ID, KOHDE_SELITE) VALUES (6,'Ohituskaista');
INSERT INTO TS_KOHDE (KOHDE_ID, KOHDE_SELITE) VALUES (7,'Tasoliittymä');
INSERT INTO TS_KOHDE (KOHDE_ID, KOHDE_SELITE) VALUES (8,'Riista-aita');
INSERT INTO TS_KOHDE (KOHDE_ID, KOHDE_SELITE) VALUES (9,'Eritasoliittymä');
INSERT INTO TS_KOHDE (KOHDE_ID, KOHDE_SELITE) VALUES (10,'Muu');
INSERT INTO TS_KOHDE (KOHDE_ID, KOHDE_SELITE) VALUES (11,'Siltapaikka');
INSERT INTO TS_KOHDE (KOHDE_ID, KOHDE_SELITE) VALUES (12,'Melusuojaus');
INSERT INTO TS_KOHDE (KOHDE_ID, KOHDE_SELITE) VALUES (13,'Maantien lakkautus');
