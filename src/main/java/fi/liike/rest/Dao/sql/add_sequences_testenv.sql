-- TIETOJÄRJESTELMÄSALKKU
--drop sequence jarjestelma_seq;
--drop sequence jarjestelma_id_seq;
--create sequence jarjestelma_seq start with 1;
--create sequence jarjestelma_id_seq start with 1;

-- TIETOJÄRJESTELMÄSALKKUHISTORIA
--drop sequence jarjestelmahist_seq;
--drop sequence jarjestelmahist_id_seq;
--create sequence jarjestelmahist_seq start with 1;
--create sequence jarjestelmahist_id_seq start with 1;

-- update rivi_id automatically. this is needed only for unit tests. Not in product environment
--create or replace trigger jarjestelmahist_trig
--before insert on TIETOJARJESTELMASALKKUHISTORIA
--for each row
--begin 
--    select jarjestelmahist_id_seq.NEXTVAL
--    into :new.rivi_id
--    from dual;
--end;
--/

