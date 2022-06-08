--------------------------------------------------------
--  DDL for Table RS_KOHDE
--------------------------------------------------------
CREATE TABLE "RS_KOHDE" 
   (	
   	"KOHDE_ID" NUMBER(*,0), 
	"KOHDE_SELITE" VARCHAR2(100 BYTE),
	"READONLY" NUMBER DEFAULT 0
   );
--------------------------------------------------------
--  Constraints for Table RS_KOHDE
--------------------------------------------------------
ALTER TABLE "RS_KOHDE" ADD PRIMARY KEY ("KOHDE_ID");
ALTER TABLE "RS_KOHDE" MODIFY ("KOHDE_ID" NOT NULL ENABLE);

INSERT INTO RS_KOHDE (KOHDE_ID, KOHDE_SELITE) VALUES (1,'Kaksoisraide');
INSERT INTO RS_KOHDE (KOHDE_ID, KOHDE_SELITE) VALUES (2,'Ratapiha');
INSERT INTO RS_KOHDE (KOHDE_ID, KOHDE_SELITE) VALUES (3,'Liikennepaikka');
INSERT INTO RS_KOHDE (KOHDE_ID, KOHDE_SELITE) VALUES (4,'Kolmioraide');
INSERT INTO RS_KOHDE (KOHDE_ID, KOHDE_SELITE) VALUES (5,'Tasoristeys');
INSERT INTO RS_KOHDE (KOHDE_ID, KOHDE_SELITE) VALUES (6,'Sähköistys');
INSERT INTO RS_KOHDE (KOHDE_ID, KOHDE_SELITE) VALUES (7,'Radan lakkauttaminen');
INSERT INTO RS_KOHDE (KOHDE_ID, KOHDE_SELITE) VALUES (8,'Nopeuden nosti');
INSERT INTO RS_KOHDE (KOHDE_ID, KOHDE_SELITE) VALUES (9,'Akselipainon nosto');

