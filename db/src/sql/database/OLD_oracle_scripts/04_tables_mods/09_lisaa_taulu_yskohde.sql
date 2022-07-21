-- Adding a kohde table for yleissuunnitelma.
-- This is currently not used by the application, but the values can be viewed in the database and used
-- for other purposes.

--------------------------------------------------------
--  DDL for Table YS_KOHDE
--------------------------------------------------------
CREATE TABLE "YS_KOHDE"
   (
   	"KOHDE_ID" NUMBER(*,0),
	"KOHDE_SELITE" VARCHAR2(100 BYTE)
   );
--------------------------------------------------------
--  Constraints for Table YS_KOHDE
--------------------------------------------------------
ALTER TABLE "YS_KOHDE" ADD PRIMARY KEY ("KOHDE_ID");
ALTER TABLE "YS_KOHDE" MODIFY ("KOHDE_ID" NOT NULL ENABLE);

INSERT INTO YS_KOHDE (KOHDE_ID, KOHDE_SELITE) VALUES (0,'moottoritie tai moottoriliikennetie');
INSERT INTO YS_KOHDE (KOHDE_ID, KOHDE_SELITE) VALUES (4,'ohituskaistatie');
INSERT INTO YS_KOHDE (KOHDE_ID, KOHDE_SELITE) VALUES (1,'maantie');
INSERT INTO YS_KOHDE (KOHDE_ID, KOHDE_SELITE) VALUES (2,'eritasoliittymä');
INSERT INTO YS_KOHDE (KOHDE_ID, KOHDE_SELITE) VALUES (7,'siltapaikka');
INSERT INTO YS_KOHDE (KOHDE_ID, KOHDE_SELITE) VALUES (11,'muu');
