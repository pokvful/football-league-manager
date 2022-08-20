# Football League Manager

Database for storing and analysing football statistics, project developed with a group of 6 people during my second school year of the HAN. 

# Starting the database

To run the database, you need to have [docker](https://docs.docker.com/get-docker/) and [docker-compose](https://docs.docker.com/compose/install/) installed.

`cd` into this project and run the following command:

If you are a developer
```bash
docker-compose -f docker-compose.yaml -f docker-compose.dev.yaml up --build --force-recreate -d
```

If you want the production environment
```bash
docker-compose -f docker-compose.yaml -f docker-compose.prod.yaml up --build --force-recreate -d
```

When you are done, you can stop the database by running the following command in this directory:

```bash
docker-compose down
```

If you have problems with the ports of the databases add a `.env` file in the project root. In the `.env` you can add `DATABASE_PORT_MSSQL=new_port` for MSSQL and `DATABASE_PORT_MONGO=new_port` for MONGO.

# Creating mock data

When you want to create new or more mock data, you need to do some stuff. First, you need to create an account on [mockaroo.com](https://mockaroo.com/). When you have done this, you need to ask Joram to get access to the project. You can use mockaroo to mock the following tables:

- `CITY`;
- `COACH`;
- `DOMESTIC_LEAGUE`;
- `PERSON`;
- `PLAYER`;
- `SEASON`;
- `STADIUM`.

There is also a `create_insert_scripts.sh` file (in `dockerFiles/mssql/`), which generates data according to the content in the files generated by mockaroo. It also formats all the insert scripts and checks for duplicate lines. More in depth explanations about what it does can be found in the script. The script can be used to generate data for the following tables:

- `COUNTRY`;
- `COMPETITION`;
- `EDITION`;
- `CLUB_plays_in_EDITION`.

Lastly, there are three python scripts, which generate the last bits of data. They require that the database is running, so before you run these, you need to spin up the docker containers. The scripts are `generate-events.py`, `generate-matches-matchdays-rounds.py` and `generate-positions.py`. More in depth explanations about what is does can be found in the script. The scripts can be used to generate data for the following tables:

- `generate-events.py`:
	- `RED_CARD`;
	- `YELLOW_CARD`;
	- `PASS`;
	- `GOAL`;
	- `SHOT`;
	- `FOUL`;
	- `CORNER`;
	- `SUBSTITUTE`.
- `generate-matches-matchdays-rounds.py`:
	- `ROUND`;
	- `MATCHDAY`;
	- `MATCH`.
- `generate-positions.py`:
	- `POSITION`;
	- `PLAYER_as_reserve_in_MATCH`.

The scripts need to be run in a specific order, otherwise they won't work. The order is defined below:

```bash
# mock stuff in mockaroo
cd dockerFiles/mssql/
./create_insert_scripts.sh
# spin up the docker containers
python3 ./generate-matches-matchdays-rounds.py
python3 ./generate-lineups.py
./create_insert_scripts.sh # run this one more time, so everything is sorted correctly
# restart the docker containers
python3 ./generate-events.py
./create_insert_scripts.sh # run this one more time, to ensure there are no duplicates
```
