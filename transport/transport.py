"""
Some beautiful python code to transfer data from MSSQL to Mongo
"""

from datetime import timedelta
from pymongo import MongoClient
import json
import pyodbc
import time

PRE_TIMEOUT = timedelta( minutes=4, seconds=40 ).seconds
CONNECTION_URL_MSSQL = "DRIVER={ODBC Driver 17 for SQL Server};SERVER=db_mssql,1433;UID=sa;PWD=Football!;DATABASE=flm"
CONNECTION_URL_MONGO = "mongodb://mongo:toor@db_mongo:27017"

def main():
	time.sleep(PRE_TIMEOUT)

	mssql_connection = pyodbc.connect(CONNECTION_URL_MSSQL)
	mongo_client = MongoClient(CONNECTION_URL_MONGO)
	mongo_connection = mongo_client["flm"]

	cursor = mssql_connection.cursor()

	# get all the tables and views in the database, excluding the ones created
	# by tSQLt
	cursor.execute("SELECT table_name FROM INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA <> 'tSQLt' AND TABLE_NAME NOT LIKE '%tSQLt%'")
	rows = cursor.fetchall()
	table = []

	for row in rows:
		table.append(row.table_name)

	data = {}

	for table in table:
		result = ""

		print(f"Retrieving data from {table}")

		# get all the data in the table as json
		cursor.execute(f"SELECT * FROM {table} FOR JSON AUTO, INCLUDE_NULL_VALUES")
		rows = cursor.fetchall()

		# the result is spread over multiple rows, so we need to loop over
		# every row and concat them together. The following code does that
		result = "".join([ row[0] for row in rows ])

		if not result:
			continue

		# convert the json string to a python dictionary (object)
		data[table] = json.loads(result)

	for table in data:
		print(f"Recreating \"{table}\"")

		# insert all the data into mongo
		mongo_connection.drop_collection(table)
		mongo_connection.create_collection(table)
		mongo_connection[table].insert_many( data[table] )

	mongo_client.close()
	mssql_connection.close()

if __name__ == "__main__":
	main()
