#!/bin/bash

# Extract countries from the city create script, so we always have the correct countries
sed -E "s/CITY \\(Country_name, City_name\\) values \\(('[[:alnum:][:blank:][:punct:]]+'), '[[:alnum:][:blank:][:punct:]]+'\\);\$/COUNTRY (Country_name) values (\1);/" ./201-INSERT_CITY.sql > ./200-INSERT_COUNTRY.sql

# Copy the DOMESTIC_LEAGUE content to the COMPETITION table (competition_type is a default, because we don't mock for KO)
sed -E "s/DOMESTIC_LEAGUE \\(Competition_name\) values \\(('[[:alnum:][:blank:][:punct:]]+')\\);\$/COMPETITION (Competition_name) values (\1, 'Nationale Competitie');/" ./204-INSERT_DOMESTIC_LEAGUE.sql > ./203-INSERT_COMPETITION.sql

# Create a EDITION table
edition_result="set nocount on;"

while read -r competition; do
	while read -r season; do
		edition_result="$edition_result"'\n'"insert into EDITION (Season_name, Competition_name) values ($season, $competition);"
	done < <(tail -n +2 ./205-INSERT_SEASONS.sql | sed -E "s/.+\\(('[^']+').+/\1/")
done < <(tail -n +2 ./203-INSERT_COMPETITION.sql | sed -E "s/.+\\(('[^']+').+/\1/")

echo -e $edition_result > ./211-INSERT_EDITION.sql

# Create a CLUB_plays_in_EDITION table
plays_in_edition_result="set nocount on;"

while read -r edition; do
	while read -r club; do
		plays_in_edition_result="$plays_in_edition_result"'\n'"insert into CLUB_plays_in_EDITION (Club_name, Season_name, Competition_name) values ($club, $edition);"
	done < <(tail -n +2 ./209-INSERT_CLUBS.sql | sed -E "s/.+\\(('[^']+').+/\1/")
done < <(tail -n +2 ./211-INSERT_EDITION.sql | sed -E "s/.+\\(('[^)]+').+/\1/")

echo -e $plays_in_edition_result > ./213-INSERT_CLUBS_THAT_PLAY_IN_EDITION.sql

# loop over all insert files in this directory
for file in ./*-INSERT_*.sql; do
	# sort content in file reversed
	content=$(sort -r "$file")
	# get the duplicate lines, and return them one time
	new_content=$(echo "$content" | uniq --repeated)
	# get all the unique lines
	new_content="$new_content"'\n'"$(echo "$content" | uniq --unique)"

	# sort them one last time
	new_content=$(echo -e "$new_content" | sort -r)

	# place the filtered and sorted content in the file
	echo "$new_content" > "$file"

	# clear the variables, because some weird side-effects
	content=""
	new_content_unique=""
	new_content_repeated=""
	new_content=""
done
