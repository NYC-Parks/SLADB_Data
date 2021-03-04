@echo off

sqlcmd -S . -E -i %~dp0\export_vw_change_request_export.sql -s "|" -o %~dp0\temp_tbl_change_request.csv -m 1 -W & find /V "---" < %~dp0\temp_tbl_change_request.csv > %~dp0\tbl_change_request.csv

del %~dp0\temp_tbl_change_request.csv

cd /d %~d0

cd %~dp0

git add .

git commit -m "Added latest tbl_change_request data export to the csv."

git push origin master

exit

