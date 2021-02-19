@echo off

sqlcmd -S . -E -i export_vw_change_request_export.sql -s "|" -o temp_tbl_change_request.csv -m 1 -W & find /V "---" < temp_tbl_change_request.csv > tbl_change_request.csv

del temp_tbl_change_request.csv

git add .

git commit -m "Added latest tbl_change_request data export to the csv."

git push origin master

pause

