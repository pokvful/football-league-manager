"""
Some beautiful python code to transfer data from MSSQL to Mongo
"""

import pyodbc
import time

CONNECTION_URL_MSSQL = "DRIVER={ODBC Driver 17 for SQL Server};SERVER=db_mssql,1433;UID=sa;PWD=Football!;DATABASE=flm"
CONNECTION_URL_MONGO = ""

def main():
	time.sleep(15)

	connection = pyodbc.connect(CONNECTION_URL_MSSQL)

	cursor = connection.cursor()

	cursor.execute("SELECT * FROM MOCK_DATA")
	rows = cursor.fetchall()

	for row in rows:
		print( "ID=%d, first_name=%s" % ( row.id, row.first_name ) )

	connection.close()

if __name__ == "__main__":
	main()
