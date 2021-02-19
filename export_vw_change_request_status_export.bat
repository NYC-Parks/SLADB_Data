@echo off

sqlcmd -S . -E -i export_vw_change_request_status_export.sql -s "|" -o temp_tbl_change_request_status.csv -m 1 -W & find /V "---" < temp_tbl_change_request_status.csv > tbl_change_request_status.csv

del temp_tbl_change_request_status.csv

git add .

git commit -m "Added latest tbl_change_request_status data export to the csv."

git push origin master

exit
