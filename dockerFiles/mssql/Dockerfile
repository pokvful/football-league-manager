FROM mcr.microsoft.com/mssql/server:2019-CU15-ubuntu-20.04

USER root

WORKDIR /data

RUN apt update && apt install dos2unix -y

COPY ./entrypoint.sh ./

# Because windows is an amazing OS
RUN dos2unix ./entrypoint.sh

USER mssql

EXPOSE 1433

ENTRYPOINT /bin/bash ./entrypoint.sh
