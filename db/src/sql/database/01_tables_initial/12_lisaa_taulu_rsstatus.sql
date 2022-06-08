--------------------------------------------------------
--  DDL for Table RS_STATUS
--------------------------------------------------------
CREATE TABLE "RS_STATUS" 
   (	
    "STATUS_ID" NUMBER(*,0), 
	"SELITE" VARCHAR2(300 BYTE),
	"READONLY" NUMBER DEFAULT 0
   );
--------------------------------------------------------
--  Constraints for Table RYS_STATUS
--------------------------------------------------------
ALTER TABLE "TIESU"."RS_STATUS" ADD PRIMARY KEY ("STATUS_ID");
ALTER TABLE "TIESU"."RS_STATUS" MODIFY ("STATUS_ID" NOT NULL ENABLE);

INSERT INTO RS_STATUS (STATUS_ID, SELITE) VALUES (1,'Suunnitelma käynnissä');
INSERT INTO RS_STATUS (STATUS_ID, SELITE) VALUES (2,'Hyväksymisesitys käsittelyssä');
INSERT INTO RS_STATUS (STATUS_ID, SELITE) VALUES (3,'Hyväksymispäätös annettu / odottaa kuulutustod. lainv.päätöstä');
INSERT INTO RS_STATUS (STATUS_ID, SELITE) VALUES (4,'Hyväksymispäätös lainvoimainen');
INSERT INTO RS_STATUS (STATUS_ID, SELITE) VALUES (5,'Rakentaminen käynnissä');
INSERT INTO RS_STATUS (STATUS_ID, SELITE) VALUES (6,'Osittainen käyttöönottolupa annettu');
INSERT INTO RS_STATUS (STATUS_ID, SELITE) VALUES (7,'Käyttöönottolupa annettu');
INSERT INTO RS_STATUS (STATUS_ID, SELITE) VALUES (8,'Valitus');
INSERT INTO RS_STATUS (STATUS_ID, SELITE) VALUES (9,'LVM:n hyväksymispäätös');
INSERT INTO RS_STATUS (STATUS_ID, SELITE) VALUES (10,'Rauennut');

