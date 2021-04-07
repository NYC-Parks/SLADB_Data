@echo off

REM Use the BCP utility to export a json file with the unit reference data
bcp "declare @json nvarchar(max) = (select unit_id, unit_desc, unit_class, unit_mrc, unit_status, gisobjid, unit_commiss, unit_updated, unit_withdraw from sladb.dbo.tbl_ref_unit for json path); if (isjson(@json) = 1) begin select @json as result end;" queryout tbl_ref_unit.json -T -c

cd /d %~d0

cd %~dp0

git add .

git commit -m "Added latest tbl_ref_unit data export to the json."

REM git push origin master

pause
