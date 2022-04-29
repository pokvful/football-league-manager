# Technisch ontwerp

# Non-Functional Requirements

## Performance and scalability

- Data uitlezen wordt gedaan via een staging area met mongoDB, hierdoor wordt de load op de MSSQL database verlaagd

## Portability and compatibility

- MSSQL is vereist voor het *opzetten* van de database
- MongoDB is vereist voor het *uitlezen* van de database

## Reliability, availability, maintainability

- De data wordt opgeslagen in MSSQL en periodiek overgezet naar MongoDB staging area

## Security

- Administrators van NUTMEG kunnen de MSSQL database volledig beheren
- Data-analisten van klanten kunnen de database alleen uitlezen via de staging area

## Localization

- De data wordt in het Nederlands opgeslagen
- Tabelnamen staan in het Engels

## Usability

- Data-analisten kunnen via de MongoDB shell data uitlezen van de staging area

# Ontwerkpeuzes

## MATCH id
Door de afhankelijkheden van match zou de orignele primary key maarliefst 6 kolommen lang zijn. Event, position en Player_as_Reserve zouden daarnaast ook  afhankelijk zijn van match waardoor deze tabellen ook allemaal de 6 kolommen lange primary key zouden bevatten. Om deze reden is ervoor gekozen om match van een ID te voorzien.

## PERSON id
Om een persoon van een daadwerkelijk van een unieke identifier te voorzien moeten niet alleen de naam en de achternaam gebruikt worden, maar ook de geboortedatum, melfs met deze waarden is er echter nog een nihiele kans dat de waardne niet uniek zijn. Daarnaast wordt de primary key van Person in maar liefst 3 andere tabellen gebruikt. Om deze redenen is ervoor gekozen om Person een uniek ID te geven.

## 0..22 Position
Om een wedstrijd te starten moet er uiteraard 22 spelers op het veld staan, echter worden wedstrijden als vastgesteld en aangemaakt ver voordat de opstelling bekend zijn. Hierom hebben ervoor gekozen het ook mogelijk te 0 tot 22 spelers op te stellen. Met een trigger wordt gecheckt of er wel 22 spelers zijn opgesteld voordat de wedstrijd daadwerkelijk start.

# Toelichting Domeinen

|Domein				|Datatype		|Toelichting															|
|-------------------|---------------|-----------------------------------------------------------------------|
|PERSON_ID			|bigint			|Automatisch gegenereerd ID												|
|NAME				|varchar(128)	|																		|
|DATE				|Date			|																		|
|CLUB_NAME			|varchar(128)	|																		|
|CITY_NAME			|varchar(128)	|																		|
|COUNTRY_NAME		|varchar(128)	|																		|
|STADIUM_NAME		|varchar(60)	|																		|
|COMPETITON_NAME	|varchar(128)	|																		|
|CAPACITY			|bigint			|																		|
|PERCENTAGE			|numeric(5,2)	|(0-100)																|
|COUNT				|bigint			|																		|
|BOOLEAN			|bit			|																		|
|EVENTY_TYPE		|varchar(128)	|(Red card, Yellow card, Pass, Goal, Shot, Foul, Corner, Substitute)	|
|MINUTE IN MATCH	|numeric(6,3)	|																		|
|JERSEY_NUMBER		|numeric(2,0)	|(1-99)                                                    				|
|POSITION_TYPE		|varchar(128)	|(Aanvaller, Middenvelder, Verdediger, Keeper)							|
|SEASON_NAME		|char(5)		|Altijd twee getallen met een slash. (bijv.22/21)       				|