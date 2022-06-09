"""
A very beautiful script to generate event scripts
"""

import random
import pyodbc

POSITIONS = [
    "KEEPER",
    "DEFENDER",
    "ATTACKER",
    "MIDFIELDER",
]

def format_sql(table, dict):
	columns = [ key for key, value in dict.items() ]
	values = [ str(value) for key, value in dict.items() ]

	result = f"insert into {table} ("

	result += ", ".join(columns)

	result += ") values ("

	result += ", ".join(values)

	result += ");"

	return result

def event_RED_CARD(match_id, players, reserves): # {{{
	return format_sql(
		"RED_CARD",
		{
			"Match_id": match_id,
			"[Time]": round( random.uniform(0, 95), 3 ),
			"Person_id": random.choice(players)[0],
		},
	)
# }}}

def event_YELLOW_CARD(match_id, players, reserves): # {{{
	return format_sql(
		"YELLOW_CARD",
		{
			"Match_id": match_id,
			"[Time]": round( random.uniform(0, 95), 3 ),
			"Person_id": random.choice(players)[0],
		},
	)
# }}}

def event_PASS(match_id, players, reserves): # {{{
	return format_sql(
		"PASS",
		{
			"Match_id": match_id,
			"[Time]": round( random.uniform(0, 95), 3 ),
			"Person_id": random.choice(players)[0],
			"Succes": random.getrandbits(1),
		},
	)
# }}}

def event_GOAL(match_id, players, reserves): # {{{
	return format_sql(
		"GOAL",
		{
			"Match_id": match_id,
			"[Time]": round( random.uniform(0, 95), 3 ),
			"Person_id": random.choice(players)[0],
		},
	)
# }}}

def event_SHOT(match_id, players, reserves): # {{{
	return format_sql(
		"SHOT",
		{
			"Match_id": match_id,
			"[Time]": round( random.uniform(0, 95), 3 ),
			"Person_id": random.choice(players)[0],
			"On_goal": random.getrandbits(1),
		},
	)
# }}}

def event_FOUL(match_id, players, reserves): # {{{
	return format_sql(
		"FOUL",
		{
			"Match_id": match_id,
			"[Time]": round( random.uniform(0, 95), 3 ),
			"Person_id": random.choice(players)[0],
		},
	)
# }}}

def event_CORNER(match_id, players, reserves): # {{{
	return format_sql(
		"CORNER",
		{
			"Match_id": match_id,
			"[Time]": round( random.uniform(0, 95), 3 ),
			"Person_id": random.choice(players)[0],
		},
	)
# }}}

def event_SUBSTITUTE(match_id, players, reserves): # {{{
	position = random.choice(POSITIONS)

	return format_sql(
		"SUBSTITUTE",
		{
			"Match_id": match_id,
			"[Time]": round( random.uniform(0, 95), 3 ),
			"In_person_id": random.choice(reserves)[0],
			"Out_person_id": random.choice(players)[0],
			"Position_type": f"'{position}'",
		},
	)
# }}}

EVENTS = {
	"RED_CARD": event_RED_CARD,
	"YELLOW_CARD": event_YELLOW_CARD,
	"PASS": event_PASS,
	"GOAL": event_GOAL,
	"SHOT": event_SHOT,
	"FOUL": event_FOUL,
	"CORNER": event_CORNER,
	"SUBSTITUTE": event_SUBSTITUTE,
}
CONNECTION_URL_MSSQL = "DRIVER={ODBC Driver 17 for SQL Server};SERVER=localhost,14330;UID=sa;PWD=Football!;DATABASE=flm"

def get_players_from_match(players, match_id):
	return [ player for player in players if player[1] == match_id ]

def generate_events(matches, players, reserves): # {{{
	event_results = []

	for match in matches:
		for _ in range( random.randint(10, 20) ):
			event = EVENTS[ random.choice( list( EVENTS.keys() ) ) ]

			match_players = get_players_from_match( players, match[0] )
			match_reserves = get_players_from_match( reserves, match[0] )

			event_results.append( event( match[0], match_players, match_reserves ) )

	with open("220-INSERT_EVENTS.sql", "w") as file:
		file.write( "set nocount on;\ncommit transaction;\n/* z ← don't remove this (see https://isebitbucket.aimsites.nl/projects/S22122A4/repos/football-league-manager/pull-requests/88/overview) */ begin transaction;\n" )
		file.write( "\n".join(event_results) )
# }}}

def main():
	connect = pyodbc.connect(CONNECTION_URL_MSSQL)

	cursor = connect.cursor()

	matches = cursor.execute("SELECT Match_id FROM MATCH;").fetchall()
	players = cursor.execute("SELECT Player_person_id, Match_id FROM LINEUP;").fetchall()
	reserves = cursor.execute("SELECT Player_person_id, Match_id FROM PLAYER_as_reserve_in_MATCH;").fetchall()

	generate_events(matches, players, reserves)

if __name__ == "__main__":
	main()
