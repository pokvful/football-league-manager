# ***Disclaimer*** | De lay-out van de PDF-versie voor dit document kan verschillen met de markdown versie, voor een accurate weergave zie markdown bestand in [bitbucket](https://isebitbucket.aimsites.nl/projects/S22122A4/repos/football-league-manager/browse/docs).

# Technisch ontwerp

- [Technisch ontwerp](#technisch-ontwerp)
- [Non-Functional Requirements](#non-functional-requirements)
  - [Performance and scalability](#performance-and-scalability)
  - [Portability and compatibility](#portability-and-compatibility)
  - [Reliability, availability, maintainability](#reliability-availability-maintainability)
  - [Security](#security)
  - [Localization](#localization)
  - [Usability](#usability)
- [Deployment diagram](#deployment-diagram)
- [PDM](#pdm)
- [Beschrijving Tabellen en Kolommen](#beschrijving-tabellen-en-kolommen)
  - [Tabel: PERSON](#tabel-person)
  - [Tabel: REFEREE](#tabel-referee)
  - [Tabel: COACH](#tabel-coach)
  - [Tabel: PLAYER](#tabel-player)
  - [Tabel: COUNTRY](#tabel-country)
  - [Tabel: CITY](#tabel-city)
  - [Tabel: STADIUM](#tabel-stadium)
  - [Tabel: CLUB](#tabel-club)
  - [Tabel: SEASON](#tabel-season)
  - [Tabel: DOMESTIC_LEAGUE](#tabel-domestic_league)
  - [Tabel: EDITION](#tabel-edition)
  - [Tabel: ROUND](#tabel-round)
  - [Tabel: CLUB_plays_in_EDITION](#tabel-club_plays_in_edition)
  - [Tabel: MATCHDAY](#tabel-matchday)
  - [Tabel: MATCH](#tabel-match)
  - [Tabel: POSITION](#tabel-position)
  - [Tabel: PLAYER_as_reserve_in_MATCH](#tabel-player_as_reserve_in_match)
  - [Tabel: SUBSTITUTE](#tabel-substitute)
  - [Tabel: CORNER](#tabel-corner)
  - [Tabel: FOUL](#tabel-foul)
  - [Tabel: SHOT](#tabel-shot)
  - [Tabel: GOAL](#tabel-goal)
  - [Tabel: PASS](#tabel-pass)
  - [Tabel: YELLOW_CARD](#tabel-yellow_card)
  - [Tabel: RED_CARD](#tabel-red_card)
- [Ontwerkpeuzes](#ontwerkpeuzes)
  - [MATCH id](#match-id)
  - [PERSON id](#person-id)
  - [0..22 Position](#022-position)
- [Constraints](#constraints)
  - [Primary key constraints](#primary-key-constraints)
    - [Person](#person)
    - [Match](#match)
    - [Club](#club)
    - [City](#city)
    - [Country](#country)
    - [Competition](#competition)
    - [Season](#season)
    - [Round](#round)
    - [Matchday](#matchday)
    - [Event](#event)
  - [Integrity rules](#integrity-rules)
    - [IR1 komt overeen met C1 en BR12](#ir1-komt-overeen-met-c1-en-br12)
    - [IR2 komt overeen met C2 en BR18](#ir2-komt-overeen-met-c2-en-br18)
    - [IR3 komt overeen met C3 en BR19](#ir3-komt-overeen-met-c3-en-br19)
    - [IR4 komt overeen met C4 en BR16](#ir4-komt-overeen-met-c4-en-br16)
    - [IR5 komt overeen met C5 en BR17](#ir5-komt-overeen-met-c5-en-br17)
    - [IR6 komt overeen met C6 en BR4](#ir6-komt-overeen-met-c6-en-br4)
    - [IR7 komt overeen met C7 en BR5](#ir7-komt-overeen-met-c7-en-br5)
    - [IR8 komt overeen met C8 en BR8](#ir8-komt-overeen-met-c8-en-br8)
    - [IR9 komt overeen met C9 en BR9](#ir9-komt-overeen-met-c9-en-br9)
    - [IR10 komt overeen met C10 en BR10](#ir10-komt-overeen-met-c10-en-br10)
    - [IR11 komt overeen met C11 en BR11](#ir11-komt-overeen-met-c11-en-br11)
    - [IR12 komt overeen met C12 en BR20](#ir12-komt-overeen-met-c12-en-br20)
  - [IR13 komt overeen met C13 en BR21](#ir13-komt-overeen-met-c13-en-br21)
  - [IR14 komt overeen met C14 en BR22](#ir14-komt-overeen-met-c14-en-br22)
  - [IR15 komt overeen met diagram en BR24](#ir15-komt-overeen-met-diagram-en-br24)
- [Toelichting Domeinen](#toelichting-domeinen)
- [Toelichting export MSSQL naar MongoDB](#toelichting-export-mssql-naar-mongodb)
  - [Input](#input)
  - [Output](#output)

# Niet-functionele eisen

| Niet-functionele eisen                                                                                             | Categorieën  |
|--------------------------------------------------------------------------------------------------------------------|--------------|
| Data-analisten lezen alleen data uit vanuit de MongoDB staging area, zo wordt de load op de SQL Server verlicht    | Performance  |
| Administrators van NUTMEG hebben volledige CRUD rechten op zowel de SQL Server als MongoDB database                | Security     |
| Data-analisten hebben alleen lees rechten en lezen data exclusief uit vanuit de staging area                       | Security     |
| De data wordt alleen in het Nederlands opgeslagen                                                                  | Localization |
| Tabelnamen, constraints, triggers, views en procedures in SQL Server worden in het Engels geschreven               | Localization |
| Data-analisten kunnen via de MongoDB shell data uitlezen                                                           | Usability    |
| Iedere dag dient er om 02:00 een kopie van de SQL Server database overgezet te worden naar de MongoDB staging area | Reliability  |

# Deployment diagram

![Deployment diagram.](images/Deployment%20Diagram.png)

**Het bovenstaande diagram geldt alleen voor de ontwikkelomgeving.**

## Server unknown

In het bovenstaande diagram is `Server unknown` alles wat draait op de lokale computer van de ontwikkelaars.

## Client

De client heeft een directe verbinding met de `MongoDB node` dit is de staging area die gebruikt wordt door data-analisten. Data-analisten krijgen niet direct toegang tot de `SQL Server node`, dit mogen alleen de admins.

## Transport Script

Binnen deze container draaien alle scripts die van belang zijn voor het overzetten van de SQL Server JSON naar MongoDB.

## MongoDB

De client interact met de MongoDB staging area, dit is ook hoe de uiteindelijke omgeving eruit komt te zien. De client is dus niet direct in verbinding met de SQL Server maar eerst met de staging area (MongoDB). Tijdens de constructie fase van het project zal ook direct verbinding gemaakt worden met de SQL Server, echter is dit in de uiteindelijke versie van de applicatie niet het geval (dan hebben alleen de admins direct toegang tot de SQL Server).

## SQL Server

Binnen de SQL Server container draait een Microsoft SQL Server 2018 Server image. Vanaf deze node wordt alle data geleverd die gebruikt kan worden in de staging area. Deze node staat niet per direct in verbinding met de MongoDB node. Dit heeft als reden dat alle data eerst omgezet moet worden naar JSON die vervolgens MongoDB weer kan gebruiken om data mee te importeren.

## Docker Compose

Docker Compose is een applicatie om gemakkelijk meerdere containers mee op te starten. Dit bestand is te vinden onder `docker-compose.yaml`.

Om gebruik te maken van Docker Compose wordt het volgende commando gedraait in de root directory (`/football-league-manager`) van het project: 

```bash
docker-compose up --build --force-recreate -d
```

## Gebruik van Docker

Tijdens de ontwikkeling van het project wordt gebruik gemaakt van Docker; dit heeft als reden dat we door middel van Docker de omgeving van de applicatie kunnen wegabstraheren. Op deze manier hoeven wij ons zelf niet druk te maken over het installeren en onderhouden van installaties van bijvoorbeeld SQL Server en/of Linux.

Wij gebruiken Docker zo dat elke keer zodra de containers worden opgestart, alle data in de database wordt gereset. Dit houdt in dat alle mockdata scripts opnieuw worden gedraaid en de bestaande data in de docker omgeving wordt verwijderd. Zo beginnen we elke keer met een schone database. Het voordeel hiervan is dat op elk moment de database hetzelfde is zoals gedefinieerd in de SQL bestanden.

Zo is er altijd databaseinhoud om mee te testen en is de database consistent tussen de verschillende ontwikkelaars. Als iemand een schema, view of een procedure aanpast wordt deze wijziging meegecommit met de code. Zo lopen versies nooit uit elkaar.

# PDM

![Het PDM.](images/pdm_no_ko.png)

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
|Club_name|De naam van de club waar deze coach werkt|

## Tabel: PLAYER

Deze tabel bevat alle personen die ook spelers zijn.

|*Kolom*|*Omschrijving*|
|-------|--------------|
|Person_id | Unieke persoonsnummer|
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

## Tabel: CLUB

Deze tabel bevat alle clubs die wedstrijden kunnen spelen.

|*Kolom*|*Omschrijving*|
|-------|--------------|
|Club_name|Unieke naam van deze club|
|Stadium_name|Naam van het stadion van deze club|
|Country_name|Land waarin deze club ligt|
|City_name| Stad waarin deze club ligt|

## Tabel: SEASON

Voor uitleg zie FO

|*Kolom*|*Omschrijving*|
|-------|--------------|
|Season_name|Unieke naam van een bepaald speel seizoen|

## Tabel: DOMESTIC_LEAGUE 

Voor uitleg zie FO

|*Kolom*|*Omschrijving*|
|-------|--------------|
|Competition_name|Unieke naam van deze competitie|

## Tabel: EDITION

Voor uitleg zie FO

|*Kolom*|*Omschrijving*|
|-------|--------------|
|Season_name|Naam van het seizoen van deze editie|
|Competition_name|Naam van de competitie die deze editie heeft|

## Tabel: ROUND

Voor uitleg zie FO

|*Kolom*|*Omschrijving*|
|-------|--------------|
|Season_name|Naam van het seizoen waarin deze ronde wordt gespeeld|
|Competition_name|Naam van de competitie waarin deze ronde wordt gespeeld|
|Start_date|Startdatum van deze specifieke ronde|

## Tabel: CLUB_plays_in_EDITION

In deze tabel staat welke clubs participeren in een specifieke editie.

|*Kolom*|*Omschrijving*|
|-------|--------------|
|Season_name|Naam van het seizoen waarin een club speelt|
|Competition_name|Naam van de competitie waarin een club speelt|
|Club_name|Naam van de club die in een editie speelt|

## Tabel: MATCHDAY

Voor uitleg zie FO

|*Kolom*|*Omschrijving*|
|-------|--------------|
|Season_name|Naam van het seizoen waarin deze speeldag wordt gespeeld|
|Competition_name|Naam van de competitie waarin deze speeldag wordt gespeeld|
|Start_date|Startdatum van de ronde waarin deze speeldag wordt gespeeld|
|Match_day|Een unieke speeldag datum|

## Tabel: MATCH

Voor uitleg zie FO

|*Kolom*|*Omschrijving*|
|-------|--------------|
|Match_id|Unieke gegenereerde id waarde van een wedstrijd|
|Season_name|Naam van het seizoen waarin deze wedstrijd wordt gespeeld|
|Competition_name|Naam van de competitie waarin deze competitie wordt gespeeld|
|Start_date|Startdatum van de ronde waarin deze wedstrijd wordt gespeeld|
|Match_day|Datum van de westrijd|
|Home_club_name|Naam van de thuisclub die deze wedstrijd speelt|
|Out_club_name|Naam van de uitclub die deze wedstrijd speelt|
|Referee_person_id|Id verwijzing naar de scheids van deze wedstrijd|
|Ball_possession_home|Hoeveel de thuisclub de bal in bezit heeft in procenten|
|Ball_possession_out|Hoeveel de uitclub de bal in bezit heeft in procenten|
|Spectators|Aantal toeschouwers die naar deze wedstrijd zijn geweest|

## Tabel: POSITION

Voor uitleg zie FO

|*Kolom*|*Omschrijving*|
|-------|--------------|
|Player_person_id|Unieke id van een persoon dat speler is|
|Match_id|Unieke id van de wedstrijd|
|Position_type|Geeft aan op welke positie een speler staat op het veld bij de wedstrijd (aanvaller, verdediger etc.)|

## Tabel: PLAYER_as_reserve_in_MATCH

In dit tabel staan alle spelers die in de reserve staan bij een bepaalde wedstrijd.

|*Kolom*|*Omschrijving*|
|-------|--------------|
|Player_person_id|Unieke id van een persoon dat speler is|
|Match_id|Unieke id van de wedstrijd|

## Tabel: SUBSTITUTE

Voor uitleg zie FO

|*Kolom*|*Omschrijving*|
|-------|--------------|
|Match_id|Unieke id van de wedstrijd waarin dit is gebeurt|
|Time|Geeft aan in welke minuut deze gebeurtenis is gebeurt|
|In_person_id|Unieke id van de persoon die nu op het veld gaat staan|
|Out_person_id|Unieke id van de persoon die nu uit het veld gaat|

## Tabel: CORNER

Voor uitleg zie FO

|*Kolom*|*Omschrijving*|
|-------|--------------|
|Match_id|Unieke id van de wedstrijd waarin dit is gebeurt|
|Time|Geeft aan in welke minuut deze gebeurtenis is gebeurt|
|Person_id|Id van de persoon die deze gebeurtenis veroorzaakt|

## Tabel: FOUL

Voor uitleg zie FO

|*Kolom*|*Omschrijving*|
|-------|--------------|
|Match_id|Unieke id van de wedstrijd waarin dit is gebeurt|
|Time|Geeft aan in welke minuut deze gebeurtenis is gebeurt|
|Person_id|Id van de persoon die deze gebeurtenis veroorzaakt|

## Tabel: SHOT

Voor uitleg zie FO

|*Kolom*|*Omschrijving*|
|-------|--------------|
|Match_id|Unieke id van de wedstrijd waarin dit is gebeurt|
|Time|Geeft aan in welke minuut deze gebeurtenis is gebeurt|
|Person_id|Id van de persoon die deze gebeurtenis veroorzaakt|
|On_goal|Hiermee wordt aangegeven of het schot naar het doel is geschoten|

## Tabel: GOAL

Voor uitleg zie FO

|*Kolom*|*Omschrijving*|
|-------|--------------|
|Match_id|Unieke id van de wedstrijd waarin dit is gebeurt|
|Time|Geeft aan in welke minuut deze gebeurtenis is gebeurt|
|Person_id|Id van de persoon die deze gebeurtenis veroorzaakt|

## Tabel: PASS

Voor uitleg zie FO

|*Kolom*|*Omschrijving*|
|-------|--------------|
|Match_id|Unieke id van de wedstrijd waarin dit is gebeurt|
|Time|Geeft aan in welke minuut deze gebeurtenis is gebeurt|
|Person_id|Id van de persoon die deze gebeurtenis veroorzaakt|
|Succes|Hiermee wordt aangegeven dat de paas is aangekomen|

## Tabel: YELLOW_CARD

Voor uitleg zie FO

|*Kolom*|*Omschrijving*|
|-------|--------------|
|Match_id|Unieke id van de wedstrijd waarin dit is gebeurt|
|Time|Geeft aan in welke minuut deze gebeurtenis is gebeurt|
|Person_id|Id van de persoon die deze gebeurtenis veroorzaakt|

## Tabel: RED_CARD

Voor uitleg zie FO

|*Kolom*|*Omschrijving*|
|-------|--------------|
|Match_id|Unieke id van de wedstrijd waarin dit is gebeurt|
|Time|Geeft aan in welke minuut deze gebeurtenis is gebeurt|
|Person_id|Id van de persoon die deze gebeurtenis veroorzaakt|

# Ontwerkpeuzes

## MATCH id

Door de afhankelijkheden van match zou de orignele primary key maarliefst 6 kolommen lang zijn. Event, position en Player_as_Reserve zouden daarnaast ook  afhankelijk zijn van match waardoor deze tabellen ook allemaal de 6 kolommen lange primary key zouden bevatten. Om deze reden is ervoor gekozen om match van een ID te voorzien.

## PERSON id

Om een persoon van een daadwerkelijk van een unieke identifier te voorzien moeten niet alleen de naam en de achternaam gebruikt worden, maar ook de geboortedatum, melfs met deze waarden is er echter nog een nihiele kans dat de waardne niet uniek zijn. Daarnaast wordt de primary key van Person in maar liefst 3 andere tabellen gebruikt. Om deze redenen is ervoor gekozen om Person een uniek ID te geven.

## 0..22 Position

Om een wedstrijd te starten moet er uiteraard 22 spelers op het veld staan, echter worden wedstrijden als vastgesteld en aangemaakt ver voordat de opstelling bekend zijn. Hierom hebben ervoor gekozen het ook mogelijk te 0 tot 22 spelers op te stellen. Met een trigger wordt gecheckt of er wel 22 spelers zijn opgesteld voordat de wedstrijd daadwerkelijk start.

# Constraints

## Primary key constraints

### Person

PI: Person ID

### Match

PI: Club_name + club_name + match_day + start_date + end_date + competition_name + season_name

### Club

PI: Club_name

### City

PI: City_name

### Country

PI: Country_name

### Competition

PI: Competition_name

### Season

PI: Season_name

### Round

PI: Start_date + end_date

### Matchday

PI: Match_day + start_date + end_date + competition_name + season_name

### Event

PI: Time + club_name + club_name + match_day + start_date + end_date + competition_name + season_name

## Integrity rules

### IR1 komt overeen met C1 en BR12

- Omschrijving: Er zijn maximaal 22 spelers aan een match verbonden (11 per club);
- Implementatie: Een trigger `TRG_CHECK_PLAYER_COUNT` op de tabel `POSITION`.

### IR2 komt overeen met C2 en BR18

- Omschrijving: Er zijn minimaal 7 spelers aan een club verbonden;
- Implementatie: Een trigger `TRG_MINIMUM_PLAYERS_IN_CLUB` op de tabel `PLAYER`.

### IR3 komt overeen met C3 en BR19;speelrondes per editie van een competitie;
- Implementatie: Een trigger `TRG_CHECK_MAXIMUM_ROUNDS_OF_EDITION` op de tabel `ROUND`.

### IR5 komt overeen met C5 en BR17

- Omschrijving: Een rugnummer van een speler moet hoger zijn dan 0 (mag niet 0 zijn) en mag niet hoger zijn dan 99 (mag wel 99 zijn);
- Implementatie: Een check-constraint `CHK_VALID_JERSEY` op de tabel `PLAYER`.

### IR6 komt overeen met C6 en BR4

- Omschrijving: De startdatum van een speelronde ligt binnen de start- en einddatum van het bijbehorende seizoen;
- Implementatie: Een check-constraint `CHK_VALID_ROUND_START_DATE` op de tabel `ROUND`. <!-- De startdatum is beschikbaar door de afhankelijkheid. Als dit wordt aangepast, moet de check een trigger worden -->

### IR7 komt overeen met C7 en BR5

- Omschrijving: De startdatum van een speeldag moet voor de startdatum van een opvolgende speelronde zijn, maar hetzelfde of na de startdatum van de gekoppelde speelronde;
- Implementatie: Een trigger `TRG_CHECK_VALID_MATCHDAY_START_DATE` op de tabel `MATCHDAY`.

### IR8 komt overeen met C8 en BR8

- Omschrijving: De spelers die aan een wedstrijd zijn gekoppeld moeten lid zijn van één van de twee clubs die aan de wedstrijd meedoen;
- Implementatie: Een trigger `TRG_CHECK_CORRECT_PLAYERS_IN_MATCH` op de tabel `POSITION` en `PLAYER_as_reserve_in_MATCH`.

### IR9 komt overeen met C9 en BR9

- Omschrijving: Een club mag alleen meedoen aan een wedstrijd als ze ook aan de bijbehorende editie meedoen;
- Implementatie: Een trigger `TRG_CHECK_CLUB_IN_EDITION` op de tabel `MATCH`.

### IR10 komt overeen met C10 en BR10

- Omschrijving: Alleen spelers en coaches mogen een rode of gele kaart krijgen;
- Implementatie: Een trigger `TRG_PERSON_IS_PLAYER_OR_COACH` op de tabellen `YELLOW_CARD` en `RED_CARD`.

### IR11 komt overeen met C11 en BR11

- Omschrijving: Alleen voor spelende spelers in een wedstrijd worden het aantal schoten, het aantal passes, de wissels, de overtredingen, de corners en of de persoon heeft gescoord bijgehouden;
- Implementatie: Een trigger `TRG_PERSON_IS_PLAYER` op de tabellen `PASS`, `GOAL`, `SHOT`, `FOUL`, `CORNER` en `SUBSTITUTE`.

### IR12 komt overeen met C12 en BR20

- Omschrijving: Een persoon mag niet jonger zijn dan 15 jaar;
- Implementatie: Een check-constraint `CHK_PERSON_HAS_VALID_AGE` op de tabel `PERSON`.

## IR13 komt overeen met C13 en BR21

- Omschrijving: Het aantal toeschouwers bij een wedstrijd mag niet groter zijn dan de capaciteit van het stadion waar de wedstrijd wordt gehouden;
- Implementatie: Een trigger `TRG_VALID_AMOUNT_OF_SPECTATORS` op de tabel `MATCH`.

## IR14 komt overeen met C14 en BR22

- Omschrijving: De minuut in een wedstrijd mag niet negatief zijn;
- Implementatie: Een check-constraint `CHK_VALID_MINUTE_IN_MATCH` op de tabellen `RED_CARD`, `YELLOW_CARD`, `PASS`, `GOAL`, `SHOT`, `FOUL`, `CORNER` en `SUBSTITUTE`.
Om een wedstrijd te starten moet er uiteraard 22 spelers op het veld staan, echter worden wedstrijden als vastgesteld en aangemaakt ver voordat de opstelling bekend zijn. Hierom hebben ervoor gekozen het ook mogelijk te 0 tot 22 spelers op te stellen. Met een trigger wordt gecheckt of er wel 22 spelers zijn opgesteld voordat de wedstrijd daadwerkelijk start.

## IR15 komt overeen met diagram en BR24

- Omschrijving: Een persoon moet een speler, coach of scheidsrechter zijn.
- Implementatie: Een trigger `TRG_PLAYER_MUST_BE_ONE_SUBTYPE` op de tabellen `PLAYER`, `COACH` en `REFEREE`.

## IR16 komt overeen met C15 en BR1

- Omschrijving: Van een lopende competitie mogen alleen de selecties van clubs en de speeldata van wedstrijden aangepast worden
- Implementatie: Een trigger op `TRG_NO_UPDATES_ON_CURRENT_EDITION_[TABEL]` op de tabellen `CLUB`, `MATCH`, `SEASON`, `COMPETITION` en `CLUB_plays_in_EDITION` 

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

# Toelichting export MSSQL naar MongoDB

Voor het omzetten van data in MSSQL Server naar MongoDB wordt gebruik gemaakt van een Python script.

De reden voor het gebruik van Python is omdat het snel is om code mee te schrijven en de code leesbaar is voor iedereen in de projectgroep. (Ook al is niet iedereen vaardig in het schrijven van Python code).

Hieronder staat toegelicht hoe dit script in elkaar zit:

Het script begint met een timer van 15 seconden, de reden hiervoor is omdat MSSQL en MongoDB opgestart moeten zijn voordat ermee verbonden kan worden. Ook moet MSSQL een (groot) aantal create- en insert scripts uitvoeren, waar ook op gewacht moet worden.

Wanneer de verbindingen met de databases zijn gemaakt, wordt aan MSSQL opgevraagt welke tabellen en views er in de database staan. Vervolgens wordt alle data als JSON uit deze tabellen en views getrokken en wordt dit opgeslagen.

Zodra dit is gebeurd, wordt er over alle opgehaalde tabellen en views heen geloopt en worden deze als collections in MongoDB geplaatst.

## Input

```sql
SELECT TOP 10 ID, FIRST_NAME, EMAIL, GENDER, IP_ADDRESS, A_BIG_NUMBER FROM MOCK_DATA;
```

```
id          first_name                                         email                                              gender                                             ip_address           a_big_number
----------- -------------------------------------------------- -------------------------------------------------- -------------------------------------------------- -------------------- ------------
          1 Wells                                              wbraddick0@yellowbook.com                          Male                                               37.5.189.141                  172
          2 Phaidra                                            pdumbellow1@twitter.com                            Female                                             18.254.21.176                 567
          3 Taffy                                              tsherrett2@usnews.com                              Female                                             130.106.253.132               545
          4 Sinclare                                           sdomeney3@irs.gov                                  Male                                               233.160.141.121               106
          5 Park                                               pmacquire4@sogou.com                               Male                                               83.92.149.53                  409
          6 Pauly                                              polsen5@techcrunch.com                             Genderfluid                                        239.135.132.236                25
          7 Pavlov                                             pbygraves6@youtube.com                             Male                                               86.232.150.235                235
          8 Domingo                                            dmelland7@is.gd                                    Male                                               1.96.155.119                  792
          9 Reed                                               rfenning8@prlog.org                                Male                                               249.193.7.1                   260
         10 Sholom                                             schadburn9@etsy.com                                Male                                               204.49.183.139                581
```

## Output

```javascript
db.MOCK_DATA.find({}, { id: 1, first_name: 1, email: 1, gender: 1, ip_address: 1, a_big_number: 1, _id: 0 }).limit(10)
```

```json
[
  {
    "id": 1,
    "first_name": "Wells",
    "email": "wbraddick0@yellowbook.com",
    "gender": "Male",
    "ip_address": "37.5.189.141",
    "a_big_number": 172
  },
  {
    "id": 2,
    "first_name": "Phaidra",
    "email": "pdumbellow1@twitter.com",
    "gender": "Female",
    "ip_address": "18.254.21.176",
    "a_big_number": 567
  },
  {
    "id": 3,
    "first_name": "Taffy",
    "email": "tsherrett2@usnews.com",
    "gender": "Female",
    "ip_address": "130.106.253.132",
    "a_big_number": 545
  },
  ...
]
```

# Stored Procedures

| Naam                                       | Parameters                                                                                          | Doel                                                                                                                | Geeft terug                                                                                                                                                                                                                                                                                                                                            |
|--------------------------------------------|-----------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| PROC_GET_MATCH_INFO                        | match_id, season_name, competition_name, start_date, match_day, home_club, out_club                 | Ophalen van matchinfo.                                                                                              | match_id, season_name, competition_name, start_date, match_day, home_club_name, out_club_name, stadium_name, referee_person_id, ball_possession_home, ball_possession_out, spectators, amount_of_goals, amount_of_corners, amount_of_fouls, amount_of_passes, amount_of_yellow_cards, amount_of_red_cards, amount_of_shots, amount_of_substitutions    |
| PROC_GET_SCORE_EDITION                     | season_name, competition_name                                                                       | Ophalen van score per editie.                                                                                       | rank, competition_name, season_name, club_name, GS (gespeeld), W (gewonnen), G (gelijk gespeeld), L (verloren), DV (doelpunten voor), DT (doelpunten tegen), DS (doelpunten saldo), aantal punten                                                                                                                                                      |
| PROC_GET_SELECTION_CLUB_OF_EDITION         | club_name, competition_name, season_name                                                            | Ophalen selectie clubs van editie.                                                                                  | person_id, first_name, middle_name, last_name, birth_date                                                                                                                                                                                                                                                                                              |
| PROC_ADD_MATCHDATA_RED_CARD                | match_id, time, person_id                                                                           | Toevoegen van rode kaarten aan een match.                                                                           | N.V.T.                                                                                                                                                                                                                                                                                                                                                 |
| PROC_ADD_MATCHDATA_YELLOW_CARD             | match_id, time, person_id                                                                           | Toevoegen van gele kaarten aan een match.                                                                           | N.V.T.                                                                                                                                                                                                                                                                                                                                                 |
| PROC_ADD_MATCHDATA_PASS                    | match_id, time, person_id, success                                                                  | Toevoegen van passes aan een match.                                                                                 | N.V.T.                                                                                                                                                                                                                                                                                                                                                 |
| PROC_ADD_MATCHDATA_GOAL                    | match_id, time, person_id                                                                           | Toevoegen van goals aan een match.                                                                                  | N.V.T.                                                                                                                                                                                                                                                                                                                                                 |
| PROC_ADD_MATCHDATA_SHOT                    | match_id, time, person_id, on_goal                                                                  | Toevoegen van shots aan een match.                                                                                  | N.V.T.                                                                                                                                                                                                                                                                                                                                                 |
| PROC_ADD_MATCHDATA_FOUL                    | match_id, time, person_id                                                                           | Toevoegen van overtredingen aan een match.                                                                          | N.V.T.                                                                                                                                                                                                                                                                                                                                                 |
| PROC_ADD_MATCHDATA_CORNER                  | match_id, time, person_id                                                                           | Toevoegen van corners aan een match.                                                                                | N.V.T.                                                                                                                                                                                                                                                                                                                                                 |
| PROC_ADD_MATCHDATA_SUBSTITUTE              | match_id, time, in_person_id, out_person_id                                                         | Toevoegen van wissels aan een match.                                                                                | N.V.T.                                                                                                                                                                                                                                                                                                                                                 |
| PROC_ADD_MATCHES_TO_MATCHDAY               | competition_name, season_name, date, games, club_pairs_table, start                                 | Toevoegen van match aan een matchday.                                                                               | N.V.T.                                                                                                                                                                                                                                                                                                                                                 |
| PROC_GENERATE_ROUND_ROBIN_TOURNAMENT_TABLE | club_names_table                                                                                    | Aanmaken van tournament door middel van een tabel met daarin club namen. Deze tabel wordt meegegeven als parameter. | N.V.T.                                                                                                                                                                                                                                                                                                                                                 |
| PROC_START_NEW_EDITION                     | competition_name, season_name, club_names_table, date, length, games, amount_of_matchdays_per_round | Starten van een nieuwe editie.                                                                                      | N.V.T.                                                                                                                                                                                                                                                                                                                                                 |
| PROC_INSERT_NEW_COACH                      | country_name, first_name, last_name, middle_name, birth_date                                        | Toevoegen van nieuwe een nieuwe coach.                                                                                               | N.V.T.
| PROC_INSERT_NEW_REFEREE                    | country_name, first_name, last_name, middle_name, birth_date                                        | Toevoegen van een nieuwe scheidsrechter.                                                                                      | N.V.T.
| PROC_INSERT_NEW_PLAYER                     | country_name, first_name, last_name, middle_name, birth_date, club_name, jersey_number              | Toevoegen van een nieuwe speler.                                                                                           | N.V.T.

## Koppeling stored procedures met use cases

| Use case                       | Stored procedure                           |
|--------------------------------|--------------------------------------------|
| Ophalen matchinfo              | PROC_GET_MATCH_INFO                        |
| Ophalen top-lijst              | PROC_GET_SCORE_EDITION                     |
| Ophalen clubinfo               | PROC_GET_SELECTION_CLUB_OF_EDITION         |
| Invoeren matchdata             | PROC_ADD_MATCHDATA_RED_CARD                |
| Invoeren matchdata             | PROC_ADD_MATCHDATA_YELLOW_CARD             |
| Invoeren matchdata             | PROC_ADD_MATCHDATA_PASS                    |
| Invoeren matchdata             | PROC_ADD_MATCHDATA_GOAL                    |
| Invoeren matchdata             | PROC_ADD_MATCHDATA_SHOT                    |
| Invoeren matchdata             | PROC_ADD_MATCHDATA_FOUL                    |
| Invoeren matchdata             | PROC_ADD_MATCHDATA_CORNER                  |
| Invoeren matchdata             | PROC_ADD_MATCHDATA_SUBSTITUTE              |
| Invoeren matchdata             | PROC_ADD_MATCHES_TO_MATCHDAY               |
| Start nieuw seizoen competitie | PROC_GENERATE_ROUND_ROBIN_TOURNAMENT_TABLE |
| Start nieuw seizoen competitie | PROC_START_NEW_EDITION                     |
| Toevoegen nieuw persoon        | PROC_INSERT_NEW_COACH                      |
| Toevoegen nieuw persoon        | PROC_INSERT_NEW_REFEREE                    |
| Toevoegen nieuw persoon        | PROC_INSERT_NEW_PLAYER                     |

## Koppeling stored procedures met views

| Use case                       | View                                       |
|--------------------------------|--------------------------------------------|
| Ophalen clubinfo               | VW_SELECT_ALL_PLAYERS_PLAYED_IN_MATCH      |
| Ophalen top-lijst              | VW_ALL_PLAYERS_EDITIONS                    |
| Ophalen clubinfo               | VW_CLUB_INFORMATION                        |
| Ophalen speelrondeinfo         | VW_GET_PLAYROUND_DATA                      |
| Ophalen tussenstand competitie | VW_GET_INTERIM_SCORE_EDITION               |
| Ophalen clubinfo               | VW_SHOW_CLUB_INFO                          |


## Waarom maken wij gebruik van stored procedures?

### Functioneel
Er zijn twee grote functionele redenen waarom wij hebben gekozen om stored procedures te gebruiken. De eerste reden is omdat bepaalde acties van gebruikers vaak moeten worden herhaald. Bijvoorbeeld het aanmaken van spelers, hiervoor is het dus handig om een stored procedure te gebruiken. Dit gaat hand in hand met de tweede reden: gebruikersgemak. Het is gemakkelijker en sneller voor een gebruiker om een stored procedure aan te roepen i.p.v. steeds een insert statement uit te schrijven voor het toevoegen van spelers.

### Technisch
Een technische reden waarom wij hebben gekozen voor het gebruik van stored procedures is dat het execution plan van een stored procedure wordt opgeslagen in de SQL server omgeving. Acties die dus vaak herhaald worden, worden hierdoor sneller omdat de server voorheen al de exeuction plan heeft opgeslagen.