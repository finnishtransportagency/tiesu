ALTER TABLE TS_STATUS ADD READONLY NUMBER DEFAULT 0;

UPDATE TS_STATUS SET READONLY=1 WHERE STATUS_ID = 9;

INSERT INTO TS_STATUS (STATUS_ID, STATUS_SELITE) VALUES (11,'Palautettu ELYlle');