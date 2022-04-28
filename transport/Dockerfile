FROM python:3.8.13-bullseye

USER root

# install mssql odbc driver
RUN set -x \
	&& curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - \
	&& curl https://packages.microsoft.com/config/debian/11/prod.list > /etc/apt/sources.list.d/mssql-release.list \
	&& apt update \
	&& ACCEPT_EULA=Y apt install -y msodbcsql17 unixodbc-dev

ENV PATH="/opt/mssql-tools/bin:${PATH}"

# default python stuff
WORKDIR /app

COPY ./requirements.txt ./

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD [ "python", "-u", "./transport.py" ]
