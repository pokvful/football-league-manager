# Football League Manager

# Starting the database

To run the database, you need to have [docker](https://docs.docker.com/get-docker/) and [docker-compose](https://docs.docker.com/compose/install/) installed.

`cd` into this project and run the following command:

```bash
docker-compose up --build --force-recreate -d
```

When you are done, you can stop the database by running the following command in this directory:

```bash
docker-compose down
```
