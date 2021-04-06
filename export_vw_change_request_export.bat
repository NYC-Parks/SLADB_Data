@echo off

REM Use the BCP utility to export a json file with the change request data 
bcp "use sladb open symmetric key sladb_symkey decryption by certificate sladb_cert; declare @json nvarchar(max) = (select change_request_id, unit_id, sla_code, season_id, effective_start, effective_start_adj, change_request_justification, change_request_comments, sla_change_status, edited_user from sladb.dbo.vw_change_request_export for json path); if (isjson(@json) = 1) begin select @json as result end; close symmetric key sladb_symkey;" queryout tbl_change_request.json -T -c

cd /d %~d0

cd %~dp0

git add .

git commit -m "Added latest tbl_change_request data export to the json."

REM git push origin master

pause
