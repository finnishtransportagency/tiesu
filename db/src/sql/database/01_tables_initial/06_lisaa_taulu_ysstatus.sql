--------------------------------------------------------
--  DDL for Table YS_STATUS
--------------------------------------------------------
CREATE TABLE "YS_STATUS" 
   (	
    "STATUS_ID" NUMBER(*,0), 
	"SELITE" VARCHAR2(300 BYTE)
   );
--------------------------------------------------------
--  Constraints for Table YS_STATUS
--------------------------------------------------------
ALTER TABLE "TIESU"."YS_STATUS" ADD PRIMARY KEY ("STATUS_ID");
ALTER TABLE "TIESU"."YS_STATUS" MODIFY ("STATUS_ID" NOT NULL ENABLE);

INSERT INTO YS_STATUS (STATUS_ID, SELITE) VALUES (-1,'Ei statusta');
INSERT INTO YS_STATUS (STATUS_ID, SELITE) VALUES (1,'Hyväksymisesitys saapunut, ei käsittelyssä');
INSERT INTO YS_STATUS (STATUS_ID, SELITE) VALUES (2,'Otettu hyväksymiskäsittelyyn');
INSERT INTO YS_STATUS (STATUS_ID, SELITE) VALUES (3,'Hyväksymispäätös annettu');
INSERT INTO YS_STATUS (STATUS_ID, SELITE) VALUES (4,'Valitus');
INSERT INTO YS_STATUS (STATUS_ID, SELITE) VALUES (5,'Odottaa päätöstä, kuulutustodistusta, lisätietoja tms.');