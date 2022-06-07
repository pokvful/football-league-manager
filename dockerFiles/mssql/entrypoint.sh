#!/bin/bash

set -m # turn on job control (https://unix.stackexchange.com/a/637004/430375)

function run_sql_files {
	echo "=== RUNNING FILES ==="
	# if [[2 -eq 2]]
	# then find ./sql-files/ -type f \( -iname "*.sql" -not -iname "CREATE_DATABASE.sql" \)
	# else find ./sql-files/ -type f \( -iname "*.sql" -not -iname "CREATE_DATABASE.sql" -not -iname "*-INSERT_*.sql" \) fi 	
	# 	\| sort -n -t / -k 3.1 \
	# 	| xargs -I {} sh -c "echo === Executing '{}' === && /opt/mssql-tools/bin/sqlcmd -S 'localhost' -U 'sa' -P 'Football!' -d 'flm' -i {}"
	
	# test=$(find ./ -type f \( -iname "*.sql" -not -iname "CREATE_DATABASE.sql" \))
	# echo $test
		# echo $(find ./sql-files/ -type f \( -iname "*.sql" -not -iname "CREATE_DATABASE.sql" \))
		
		# echo $(find ./ -type f \( -iname "*.sql" -not -iname "CREATE_DATABASE.sql" \) | sort -n -t / -k 3.1)

		# test=$(find ./ -type f \( -iname "*.sql" -not -iname "CREATE_DATABASE.sql" \))
		# echo $("$test" | sort -n -t / -k 3.1)


		# find ./sql-files/ -type f \( -iname "*.sql" -not -iname "CREATE_DATABASE.sql" \) \
		# | sort -n -t / -k 3.1 \
		# | xargs -I {} sh -c "echo === Executing '{}' === && /opt/mssql-tools/bin/sqlcmd -S 'localhost' -U 'sa' -P 'Football!' -d 'flm' -i {}"


	# Works almost except when sql runs it gives errors
	# if [[ 2 -eq 2 ]]
	# then 
	# 	test=$(find ./ -type f \( -iname "*.sql" -not -iname "CREATE_DATABASE.sql" \))
	# else 
	# 	test=$(find ./ -type f \( -iname "*.sql" -not -iname "CREATE_DATABASE.sql" -not -iname "*-INSERT_*.sql" \))
	# fi

	# "$test" | sort -n -t / -k 3.1 \
	# | xargs -I {} sh -c "echo === Executing '{}' === && /opt/mssql-tools/bin/sqlcmd -S 'localhost' -U 'sa' -P 'Football!' -d 'flm' -i {}"

	#   \
	# | sort -n -t / -k 3.1 \
	# | xargs -I {} sh -c "echo === Executing '{}' === && /opt/mssql-tools/bin/sqlcmd -S 'localhost' -U 'sa' -P 'Football!' -d 'flm' -i {}"
	
	if [[ 2 -eq 2 ]]; then
		find ./ -type f \( -iname "*.sql" -not -iname "CREATE_DATABASE.sql" \)
	else
		find ./ -type f \( -iname "*.sql" -not -iname "CREATE_DATABASE.sql" -not -iname "*-INSERT_*.sql" \)
	fi | sort -n -t / -k 3.1 | xargs -I {} sh -c "echo === Executing '{}' === && /opt/mssql-tools/bin/sqlcmd -S 'localhost' -U 'sa' -P 'Football!' -d 'flm' -i {}"
	
	echo "=== DONE RUNNING FILES ==="
	# echo $test
}

# from https://github.com/twright-msft/mssql-node-docker-demo-app/blob/master/import-data.sh

/opt/mssql/bin/sqlservr "$@" & # start mssqlserver

# run the setup script to create the DB and the schema in the DB. do this in a
# loop because the timing for when the SQL instance is ready is indeterminate
for i in {1..60};
do
	/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P "Football!" -d master -i ./sql-files/CREATE_DATABASE.sql

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
