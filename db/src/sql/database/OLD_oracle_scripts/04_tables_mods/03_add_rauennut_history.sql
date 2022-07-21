declare
    column_exists exception;
    pragma exception_init (column_exists , -01430);
begin
    execute immediate 'ALTER TABLE "YLEISSUUNNITELMAHISTORIA" ADD ("RAUENNUT" DATE)';
    execute immediate 'ALTER TABLE "TIESUUNNITELMAHISTORIA" ADD ("RAUENNUT" DATE)';
    execute immediate 'ALTER TABLE "RYS_HISTORIA" ADD ("RAUENNUT" DATE)';
    exception when column_exists then null;
end;
/




