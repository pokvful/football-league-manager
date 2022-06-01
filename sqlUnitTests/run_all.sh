find ./ -type f -iname "*.sql" \
	| xargs -I {} sh -c "echo === Executing '{}' === && /opt/mssql-tools/bin/sqlcmd -S 'localhost,${PORT:-1433}' -U 'sa' -P 'Football!' -d 'flm' -i {}"
