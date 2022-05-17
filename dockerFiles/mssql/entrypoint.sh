#!/bin/bash

set -m # turn on job control (https://unix.stackexchange.com/a/637004/430375)

function run_sql_files {
	echo "=== RUNNING FILES ==="
	find ./sql-files/ -type f \( -iname "*.sql" -not -iname "create_database.sql" \) \
		| sort -n -t / -k 3.1 \
		| xargs -I {} /opt/mssql-tools/bin/sqlcmd -S "localhost" -U "sa" -P "Football!" -d "flm" -i {}
	echo "=== DONE RUNNING FILES ==="
}

# from https://github.com/twright-msft/mssql-node-docker-demo-app/blob/master/import-data.sh

/opt/mssql/bin/sqlservr "$@" & # start mssqlserver

# run the setup script to create the DB and the schema in the DB. do this in a
# loop because the timing for when the SQL instance is ready is indeterminate
for i in {1..60};
do
	/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P "Football!" -d master -i ./sql-files/create_database.sql

	if [ $? -eq 0 ]
	then
		run_sql_files
		break
	else
		echo "Waiting for mssql to start ... (try $i)"
		sleep 1
	fi
done

fg %1 # move sqlserver process to foreground
