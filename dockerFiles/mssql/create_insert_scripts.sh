#1/bin/bash

# Extract countries from the city create script, so we always have the correct countries
sed -E "s/CITY \\(Country_name, City_name\\) values \\(('[[:alnum:][:blank:][:punct:]]+'), '[[:alnum:][:blank:][:punct:]]+'\\);\$/COUNTRY (Country_name) values (\1);/" ./5-insert_city.sql > 4-insert_country.sql

# loop over all insert files in this directory
for file in ./*-insert_*.sql; do
	# sort content in file reversed
	content=$(sort -r "$file")
	# get the duplicate lines, and return them one time
	new_content=$(echo "$content" | uniq --repeated)
	# get all the unique lines
	new_content="$new_content"'\n'"$(echo "$content" | uniq --unique)"

	# sort them one last time
	new_content=$(echo "$new_content" | sort -r)

	# place the filtered and sorted content in the file
	echo "$new_content" > "$file"
done
