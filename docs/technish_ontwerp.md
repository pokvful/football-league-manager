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

# Beschrijving Tabellen en Kolommen

## Tabel: PERSON

Deze tabel bevat alle informatie van personen in de database.
|*Kolom*|*Omschrijving*|
|-------|--------------|
| Person_id| Unieke persoonsnummer |
| Country_name| Naam van nationaliteit|
|First_name | Voornaam van persoon|
|Last_name| Achternaam van persoon|
|Middle_name| Tussenvoegsel van persoon|
|Birth_date| Wanneer de persoon is geboren|

## Tabel: REFEREE

Deze tabel bevat alle personen die ook scheidsrechters zijn.
|*Kolom*|*Omschrijving*|
|-------|--------------|
|Person_id| Unieke persoonsnummer|

## Tabel: COACH

Deze tabel bevat alle personen die ook coaches zijn.
|*Kolom*|*Omschrijving*|
|-------|--------------|
|Person_id| Unieke persoonsnummer|
|Club_name|Naam van de club waarin deze speler speelt|
|Jersey|Rugnummer van deze speler|

## Tabel: COUNTRY

Deze tabel bevat alle landen.
|*Kolom*|*Omschrijving*|
|-------|--------------|
|Country_name| Naam van het desbetrefende land|

## Tabel: CITY

Deze tabel bevat alle steden.
|*Kolom*|*Omschrijving*|
|-------|--------------|
|Country_name|Het land waarin deze stad ligt|
|City_name|De naam van deze stad|

## Tabel: STADIUM

Deze tabel bevat alle stadions
|*Kolom*|*Omschrijving*|
|-------|--------------|
|Stadium_name|Naam van dit stadion|
|Capacity|Het max aantal personen die in dit stadion kunnen|

## Tabel: PLAYER

Deze tabel bevat alle personen die ook spelers zijn.
|*Kolom*|*Omschrijving*|
|-------|--------------|
|Person_id | Unieke persoonsnummer

## Tabel: CLUB

Deze tabel bevat alle clubs die wedstrijden kunnen spelen.
|*Kolom*|*Omschrijving*|
|-------|--------------|
|Club_name|Naam van deze club|
|Stadium_name|Naam van het stadion van deze club|
|Country_name|Land waarin deze club ligt|
|City_name| Stad waarin deze club ligt|
|Coach_person_id|het id van de (hoofd)coach van deze club|

## Tabel: SEASON

Voor uitleg zie FO
|*Kolom*|*Omschrijving*|
|-------|--------------|

## Tabel: DOMESTIC_LEAGUE 

Voor uitleg zie FO
|*Kolom*|*Omschrijving*|
|-------|--------------|

## Tabel: EDITION

Voor uitleg zie FO
|*Kolom*|*Omschrijving*|
|-------|--------------|
## Tabel: ROUND

Voor uitleg zie FO
|*Kolom*|*Omschrijving*|
|-------|--------------|
## Tabel: CLUB_plays_in_EDITION

Voor uitleg zie FO
|*Kolom*|*Omschrijving*|
|-------|--------------|
## Tabel: MATCHDAY

Voor uitleg zie FO
|*Kolom*|*Omschrijving*|
|-------|--------------|
## Tabel: MATCH

Voor uitleg zie FO
|*Kolom*|*Omschrijving*|
|-------|--------------|
## Tabel: POSITION

Voor uitleg zie FO
|*Kolom*|*Omschrijving*|
|-------|--------------|
## Tabel: PLAYER_as_reserve_in_MATCH

Voor uitleg zie FO
|*Kolom*|*Omschrijving*|
|-------|--------------|
## Tabel: SUBSTITUTE

Voor uitleg zie FO
|*Kolom*|*Omschrijving*|
|-------|--------------|
## Tabel: CORNER

Voor uitleg zie FO
|*Kolom*|*Omschrijving*|
|-------|--------------|
## Tabel: FOUL

Voor uitleg zie FO
|*Kolom*|*Omschrijving*|
|-------|--------------|
## Tabel: SHOT

Voor uitleg zie FO
|*Kolom*|*Omschrijving*|
|-------|--------------|
## Tabel: GOAL

Voor uitleg zie FO
|*Kolom*|*Omschrijving*|
|-------|--------------|
## Tabel: PASS

Voor uitleg zie FO
|*Kolom*|*Omschrijving*|
|-------|--------------|
## Tabel: YELLOW_CARD

Voor uitleg zie FO
|*Kolom*|*Omschrijving*|
|-------|--------------|
## Tabel: RED_CARD

Voor uitleg zie FO
|*Kolom*|*Omschrijving*|
|-------|--------------|
# Ontwerkpeuzes

## MATCH id
Door de afhankelijkheden van match zou de orignele primary key maarliefst 6 kolommen lang zijn. Event, position en Player_as_Reserve zouden daarnaast ook  afhankelijk zijn van match waardoor deze tabellen ook allemaal de 6 kolommen lange primary key zouden bevatten. Om deze reden is ervoor gekozen om match van een ID te voorzien.

## PERSON id
Om een persoon van een daadwerkelijk van een unieke identifier te voorzien moeten niet alleen de naam en de achternaam gebruikt worden, maar ook de geboortedatum, melfs met deze waarden is er echter nog een nihiele kans dat de waardne niet uniek zijn. Daarnaast wordt de primary key van Person in maar liefst 3 andere tabellen gebruikt. Om deze redenen is ervoor gekozen om Person een uniek ID te geven.

## 0..22 Position
Om een wedstrijd te starten moet er uiteraard 22 spelers op het veld staan, echter worden wedstrijden als vastgesteld en aangemaakt ver voordat de opstelling bekend zijn. Hierom hebben ervoor gekozen het ook mogelijk te 0 tot 22 spelers op te stellen. Met een trigger wordt gecheckt of er wel 22 spelers zijn opgesteld voordat de wedstrijd daadwerkelijk start.