--------------------------------------------------------
--  DDL for Table RYS_STATUS
--------------------------------------------------------
CREATE TABLE "RYS_STATUS" 
   (	
    "STATUS_ID" NUMBER(*,0), 
	"SELITE" VARCHAR2(300 BYTE),
	"READONLY" NUMBER DEFAULT 0
   );
--------------------------------------------------------
--  Constraints for Table RYS_STATUS
--------------------------------------------------------
ALTER TABLE "TIESU"."RYS_STATUS" ADD PRIMARY KEY ("STATUS_ID");
ALTER TABLE "TIESU"."RYS_STATUS" MODIFY ("STATUS_ID" NOT NULL ENABLE);

INSERT INTO RYS_STATUS (STATUS_ID, SELITE) VALUES (1,'Suunnitelma käynnissä');
INSERT INTO RYS_STATUS (STATUS_ID, SELITE) VALUES (2,'Hyväksymisesitys käsittelyssä');
INSERT INTO RYS_STATUS (STATUS_ID, SELITE) VALUES (3,'Hyväksymispäätös annettu / odottaa kuulutustod. lainv.päätöstä');
INSERT INTO RYS_STATUS (STATUS_ID, SELITE) VALUES (4,'Hyväksymispäätös lainvoimainen');
INSERT INTO RYS_STATUS (STATUS_ID, SELITE) VALUES (5,'Rakentaminen käynnissä');
INSERT INTO RYS_STATUS (STATUS_ID, SELITE) VALUES (6,'Luovutettu liikenteelle osittain');
INSERT INTO RYS_STATUS (STATUS_ID, SELITE) VALUES (7,'Luovutettu liikenteelle kokonaan');
INSERT INTO RYS_STATUS (STATUS_ID, SELITE) VALUES (8,'Valitus');
INSERT INTO RYS_STATUS (STATUS_ID, SELITE) VALUES (9,'LVM:n hyväksymispäätös');
INSERT INTO RYS_STATUS (STATUS_ID, SELITE) VALUES (10,'Rauennut');

