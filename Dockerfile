FROM mcr.microsoft.com/mssql/server:2019-CU15-ubuntu-20.04

WORKDIR /data

COPY ./dockerFiles/mssql/entrypoint.sh ./

USER mssql

EXPOSE 1433

ENTRYPOINT /bin/bash ./entrypoint.sh
