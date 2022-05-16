"""
A very beautiful script to generate scripts
"""

import pyodbc
from random import randint

TOTAL_ROUNDS = 5
TOTAL_COACHES = 9
TOTAL_PLAYERS = 153
CONNECTION_URL_MSSQL = "DRIVER={ODBC Driver 17 for SQL Server};SERVER=localhost,14330;UID=sa;PWD=Football!;DATABASE=flm"

def format_sql(table, dict):
	columns = [ key for key, value in dict.items() ]
	values = [ str(value) for key, value in dict.items() ]

	result = f"insert into {table} ("

	result += ", ".join(columns)

	result += ") values ("

	result += ", ".join(values)

	result += ");"

	return result

def generate_rounds(cursor, editions): # {{{
	result = []

	for edition in editions:
		result.append( format_sql(
			"ROUND",
			{
				"Season_name": f"'{edition[0]}'",
				"Competition_name": f"'{edition[1]}'",
				"Start_date": "'2000/01/01'",
			}
		) )

	with open("17-insert_rounds.sql", "w") as file:
		file.write( "set nocount on;\n" + "\n".join(result) )
# }}}

def generate_matchdays(cursor, editions): # {{{
	result = []

	for edition in editions:
		result.append( format_sql(
			"MATCHDAY",
			{
				"Season_name": f"'{edition[0]}'",
				"Competition_name": f"'{edition[1]}'",
				"Start_date": "'2000/01/01'",
				"Match_day": "'2000/01/01'",
			}
		) )

	with open("18-insert_matchdays.sql", "w") as file:
		file.write( "set nocount on;\n" + "\n".join(result) )
# }}}

def generate_matches(cursor, editions, clubs): # {{{
	result = []
	counter = 1

	for edition in editions:
		for club_home in clubs:
			for club_out in clubs:
				ball_possession_home = randint(0, 100)

				result.append( format_sql(
					"MATCH",
					{
						"Match_id": counter,
						"Season_name": f"'{edition[0]}'",
						"Competition_name": f"'{edition[1]}'",
						"Start_date": "'2000-01-01'",
						"Match_day": "'2000-01-01'",
						"Home_club_name": f"'{club_home[0]}'",
						"Out_club_name": f"'{club_out[0]}'",
						"Stadium_name": f"'{club_home[1]}'",
						"Referee_person_id": counter % 8 + 1 + TOTAL_COACHES + TOTAL_PLAYERS,
						"Ball_possession_home": ball_possession_home,
						"Ball_possession_out": 100 - ball_possession_home,
						"Spectators": 0,
					}
				) )

				counter += 1

	with open("19-insert_matches.sql", "w") as file:
		result = "set nocount on;\nset identity_insert MATCH on;\n\n" + "\n".join(result)

		file.write(result)
# }}}

def main():
	connection = pyodbc.connect(CONNECTION_URL_MSSQL)

	cursor = connection.cursor()

	editions = cursor.execute("SELECT Season_name, Competition_name FROM EDITION").fetchall()
	clubs = cursor.execute("SELECT Club_name, Stadium_name FROM CLUB").fetchall()

	generate_rounds(cursor, editions)
	generate_matchdays(cursor, editions)
	generate_matches(cursor, editions, clubs)

	connection.close()

if __name__ == "__main__":
	main()
