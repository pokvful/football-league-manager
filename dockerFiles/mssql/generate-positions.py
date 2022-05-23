"""
A very beautiful script to generate positions scripts
"""

import random
import pyodbc

POSITIONS = [
	[ "KEEPER" ] * 1
		+ [ "DEFENDER" ] * 3
		+ [ "MIDFIELDER" ] * 4
		+ [ "ATTACKER" ] * 3,
	[ "KEEPER" ] * 1
		+ [ "DEFENDER" ] * 4
		+ [ "MIDFIELDER" ] * 3
		+ [ "ATTACKER" ] * 3,
]
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

def get_players_from_club(players, club):
	return [ player for player in players if player[1] == club ]

def generate_positions(matches, players): # {{{
	result_positions = []
	result_reserves = []

	for match in matches:
		positions_home, positions_out = random.choices(POSITIONS, k = 2)
		players_home = get_players_from_club( players, match[1] )
		players_out = get_players_from_club( players, match[2] )

		for home_index in range(11):
			player = players_home[home_index]

			result_positions.append( format_sql(
				"POSITION",
				{
					"Player_person_id": player[0],
					"Match_id": match[0],
					"Position_type": f"'{positions_home[home_index]}'",
				}
			) )

		for out_index in range(11):
			player = players_out[out_index]

			result_positions.append( format_sql(
				"POSITION",
				{
					"Player_person_id": player[0],
					"Match_id": match[0],
					"Position_type": f"'{positions_out[out_index]}'",
				}
			) )

		for home_reserve_index in range( 11, len(players_home) ):
			player = players_home[home_reserve_index]

			result_reserves.append( format_sql(
				"PLAYER_as_reserve_in_MATCH",
				{
					"Player_person_id": player[0],
					"Match_id": match[0],
				}
			) )

		for out_reserve_index in range( 11, len(players_home) ):
			player = players_home[out_reserve_index]

			result_reserves.append( format_sql(
				"PLAYER_as_reserve_in_MATCH",
				{
					"Player_person_id": player[0],
					"Match_id": match[0],
				}
			) )

	with open("216-INSERT_POSITIONS.sql", "w") as file:
		file.write( "set nocount on;\ncommit transaction;\n/* z ← don't remove this (see https://isebitbucket.aimsites.nl/projects/S22122A4/repos/football-league-manager/pull-requests/88/overview) */ begin transaction;\n" )
		file.write( "\n".join(result_positions) )

	with open("217-INSERT_RESERVES.sql", "w") as file:
		file.write( "set nocount on;\ncommit transaction;\n/* z ← don't remove this (see https://isebitbucket.aimsites.nl/projects/S22122A4/repos/football-league-manager/pull-requests/88/overview) */ begin transaction;\n" )
		file.write( "\n".join(result_reserves) )
# }}}

def main():
	connection = pyodbc.connect(CONNECTION_URL_MSSQL)

	cursor = connection.cursor()

	matches = cursor.execute("SELECT Match_id, Home_club_name, Out_club_name FROM MATCH;").fetchall()
	players = cursor.execute("SELECT Person_id, Club_name FROM PLAYER;").fetchall()

	generate_positions(matches, players)

if __name__ == "__main__":
	main()
