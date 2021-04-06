@echo off

bcp "use sladb open symmetric key sladb_symkey decryption by certificate sladb_cert; declare @json nvarchar(max) = (select change_request_status_id, change_request_id, sla_change_status, created_date_utc, created_user from sladb.dbo.vw_change_request_status_export for json path); if (isjson(@json) = 1) begin select @json as result end; close symmetric key sladb_symkey;" queryout tbl_change_request_status.json -T -c

cd /d %~d0

cd %~dp0

git add .

git commit -m "Added latest tbl_change_request_status data export to the csv."

REM git push origin master

pause