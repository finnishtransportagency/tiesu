--------------------------------------------------------
--  DDL for Table TS_STATUS
--------------------------------------------------------
CREATE TABLE "TS_STATUS" 
   (	
    "STATUS_ID" NUMBER(*,0), 
	"STATUS_SELITE" VARCHAR2(100 BYTE)
   );
--------------------------------------------------------
--  Constraints for Table TS_STATUS
--------------------------------------------------------
ALTER TABLE "TS_STATUS" ADD PRIMARY KEY ("STATUS_ID");
ALTER TABLE "TS_STATUS" MODIFY ("STATUS_ID" NOT NULL ENABLE);

INSERT INTO TS_STATUS (STATUS_ID, STATUS_SELITE) VALUES (0,'Hyväksymisesitys saapunut, ei käsittelyssä');
INSERT INTO TS_STATUS (STATUS_ID, STATUS_SELITE) VALUES (1,'Hyväksymisesitys käsittelyssä');
INSERT INTO TS_STATUS (STATUS_ID, STATUS_SELITE) VALUES (2,'Hyväksymispäätös annettu / odottaa kuulutustod., lainv.päätöstä tms.');
INSERT INTO TS_STATUS (STATUS_ID, STATUS_SELITE) VALUES (3,'Hyväksymispäätös annettu, lainvoimainen');
INSERT INTO TS_STATUS (STATUS_ID, STATUS_SELITE) VALUES (4,'Luovutettu liikenteelle osittain');
INSERT INTO TS_STATUS (STATUS_ID, STATUS_SELITE) VALUES (5,'Luovutettu liikenteelle kokonaan');
INSERT INTO TS_STATUS (STATUS_ID, STATUS_SELITE) VALUES (6,'Valitus');
INSERT INTO TS_STATUS (STATUS_ID, STATUS_SELITE) VALUES (7,'LVM:n hyväksymispäätös');
INSERT INTO TS_STATUS (STATUS_ID, STATUS_SELITE) VALUES (8,'Rauennut');
INSERT INTO TS_STATUS (STATUS_ID, STATUS_SELITE) VALUES (9,'Ei statusta');
