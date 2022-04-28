"""
Some beautiful python code to transfer data from MSSQL to Mongo
"""

import pymssql

CONNECTION_URL_MSSQL = {
	"server": "localhost:14330",
	"user": "sa",
	"password": "Football!",
	"database": "flm",
}
CONNECTION_URL_MONGO = {
	"server": "",
	"user": "",
	"password": "",
	"database": "",
}

def main():
	connection = pymssql.connect(
		CONNECTION_URL_MSSQL["server"],
		CONNECTION_URL_MSSQL["user"],
		CONNECTION_URL_MSSQL["password"],
		CONNECTION_URL_MSSQL["database"],
	)

	cursor = connection.cursor(as_dict=True)

	cursor.execute("SELECT * FROM MOCK_DATA")

	for row in cursor:
		print( "ID=%d, first_name=%s" % ( row["id"], row["first_name"] ) )

	connection.close()

if __name__ == "__main__":
	main()
