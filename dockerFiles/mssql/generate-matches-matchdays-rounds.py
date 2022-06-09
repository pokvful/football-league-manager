"""
A very beautiful script to generate matches scripts
"""

from datetime import datetime, timedelta
import math
import pyodbc
import random

TOTAL_MATCHES_PER_MATCHDAY = 2 # days
TOTAL_MATCHDAYS_PER_ROUND = 2 # days
TOTAL_DAYS_IN_ROUND = 7 # days, 1 week
TOTAL_ROUND_LENGTH = 7 # days
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

def generate_rounds_and_matchdays(club_pairs, editions, match_count): # {{{
	result_rounds = []
	result_matchdays = []
	result_matches = []

	day_count = math.ceil(match_count / TOTAL_MATCHES_PER_MATCHDAY)
	days_between_matches = TOTAL_DAYS_IN_ROUND / TOTAL_MATCHDAYS_PER_ROUND
	start_date = datetime.strptime("2000-01-01", "%Y-%m-%d")
	club_iter = iter(club_pairs)
	match_counter = 0

	for edition in editions:
		amount_of_generated_rounds = 0
		amount_of_generated_matchdays = 0

		while amount_of_generated_matchdays < day_count:
			matchday_count = 0
			start_date_round = start_date + timedelta(days=amount_of_generated_rounds * TOTAL_MATCHDAYS_PER_ROUND)
			start_date_round_text = start_date_round.date()

			result_rounds.append( format_sql(
				"ROUND",
				{
					"Season_name": f"'{edition[0]}'",
					"Competition_name": f"'{edition[1]}'",
					"Start_date": f"'{start_date_round_text}'",
				}
			) )

			while matchday_count < TOTAL_MATCHDAYS_PER_ROUND:
				matchday_date = start_date_round + timedelta(days=days_between_matches * amount_of_generated_matchdays)
				matchday_date_text = matchday_date.date()

				result_matchdays.append( format_sql(
					"MATCHDAY",
					{
						"Season_name": f"'{edition[0]}'",
						"Competition_name": f"'{edition[1]}'",
						"Start_date": f"'{start_date_round_text}'",
						"Match_day": f"'{matchday_date_text}'",
					}
				) )

				match_count = 0

				while match_count < TOTAL_MATCHES_PER_MATCHDAY:
					try:
						club_pair = next(club_iter)
					except StopIteration:
						# reset iterator
						club_iter = iter(club_pairs)
						club_pair = next(club_iter)

					club_home = club_pair[0]
					club_out = club_pair[1]
					stadium = club_pair[2]
					ball_possession_home = random.randint(0, 100)
					capacity = club_pair[3]
					spectators = random.randint( int(capacity * 0.25), capacity )

					result_matches.append( format_sql(
						"MATCH",
						{
							"Match_id": match_counter,
							"Season_name": f"'{edition[0]}'",
							"Competition_name": f"'{edition[1]}'",
							"Start_date": "'2000-01-01'",
							"Match_day": "'2000-01-01'",
							"Home_club_name": f"'{club_home}'",
							"Out_club_name": f"'{club_out}'",
							"Stadium_name": f"'{stadium}'",
							"Referee_person_id": match_counter % 8 + 1 + TOTAL_COACHES + TOTAL_PLAYERS,
							"Ball_possession_home": ball_possession_home,
							"Ball_possession_out": 100 - ball_possession_home,
							"Spectators": spectators,
						}
					) )

					match_count += 1
					match_counter += 1

				matchday_count += 1
				amount_of_generated_matchdays += 1

			amount_of_generated_rounds += 1

	with open("214-INSERT_ROUNDS.sql", "w") as file:
		file.write( "set nocount on;\ncommit transaction;\n/* z ← don't remove this (see https://isebitbucket.aimsites.nl/projects/S22122A4/repos/football-league-manager/pull-requests/88/overview) */ begin transaction;\n" )
		file.write( "\n".join(result_rounds) )

	with open("215-INSERT_MATCHDAYS.sql", "w") as file:
		file.write( "set nocount on;\ncommit transaction;\n/* z ← don't remove this (see https://isebitbucket.aimsites.nl/projects/S22122A4/repos/football-league-manager/pull-requests/88/overview) */ begin transaction;\n" )
		file.write( "\n".join(result_matchdays) )

	with open("216-INSERT_MATCHES.sql", "w") as file:
		file.write( "set nocount on;\nset identity_insert MATCH on;\ncommit transaction;\n/* z ← don't remove this (see https://isebitbucket.aimsites.nl/projects/S22122A4/repos/football-league-manager/pull-requests/88/overview) */ begin transaction;\n" )
		file.write( "\n".join(result_matches) )
# }}}

def generate_club_pairs(clubs): # {{{
	result = []

	for club_home in clubs:
		for club_out in clubs:
			if club_home == club_out:
				continue

			# home_name, out_name, stadium, capacity, counter
			result.append([ club_home[0], club_out[0], club_home[1], club_home[2] ])

	return result
# }}}

def main():
	connection = pyodbc.connect(CONNECTION_URL_MSSQL)

	cursor = connection.cursor()

	club_count = cursor.execute("SELECT COUNT(Club_name) FROM CLUB;").fetchone()[0]
	editions = cursor.execute("SELECT Season_name, Competition_name FROM EDITION").fetchall()
	clubs = cursor.execute("SELECT C.Club_name, S.Stadium_name, S.Capacity FROM CLUB C INNER JOIN STADIUM S ON S.Stadium_name = C.Stadium_name").fetchall()

	match_count = club_count * (club_count - 1)

	club_pairs = generate_club_pairs(clubs)
	generate_rounds_and_matchdays(club_pairs, editions, match_count)

	connection.close()

if __name__ == "__main__":
	main()
