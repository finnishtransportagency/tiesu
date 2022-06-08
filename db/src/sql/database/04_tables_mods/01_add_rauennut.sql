declare
    column_exists exception;
    pragma exception_init (column_exists , -01430);
begin
    execute immediate 'ALTER TABLE "YLEISSUUNITELMA" ADD ("RAUENNUT" DATE)';
    execute immediate 'ALTER TABLE "TIESUUNNITELMA" ADD ("RAUENNUT" DATE)';
    execute immediate 'ALTER TABLE "RAUTATIEN_YLEISSUUNNITELMA" ADD ("RAUENNUT" DATE)';
    exception when column_exists then null;
end;
/




