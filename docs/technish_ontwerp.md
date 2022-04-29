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

# Integrity rules

## IR1 komt overeen met C1 en BR12

- Omschrijving: Er zijn maximaal 22 spelers aan een match verbonden (11 per club);
- Implementatie: Een trigger `TRG_CHECK_PLAYER_COUNT` op de tabel `POSITION`.

## IR2 komt overeen met C2 en BR18

<!-- TODO: Hoe doen we dit wanneer er b.v. een nieuwe club wordt aangemaakt, want dan beginnen ze met < 11 spelers... -->
- Omschrijving: Er zijn minimaal 11 spelers aan een club verbonden;
- Implementatie: Een trigger `TRG_MINIMUM_PLAYERS_IN_CLUB` op de tabel `PLAYER`.

## IR3 komt overeen met C3 en BRBR19

- Omschrijving: Een club heeft altijd percies 1 coach;
- Implementatie: Een trigger `TRG_ONE_COACH_PER_CLUB` op de tabel `COACH`.

## IR4 komt overeen met C4 en BR16

- Omschrijving: Er zijn maximaal 52 speelrondes per editie van een competitie;
- Implementatie: Een trigger `TRG_CHECK_MAXIMUM_ROUNDS_OF_EDITION` op de tabel `ROUND`.

## IR5 komt overeen met C5 en BR17

- Omschrijving: Een rugnummer van een speler moet hoger zijn dan 0 (mag niet 0 zijn) en mag niet hoger zijn dan 99 (mag wel 99 zijn);
- Implementatie: Een check-constraint `CHK_VALID_JERSEY` op de tabel `PLAYER`.

## IR6 komt overeen met C6 en BR BR4

- Omschrijving: De startdatum van een speelronde ligt binnen de start- en einddatum van het bijbehorende seizoen;
- Implementatie: Een check-constraint `CHK_VALID_ROUND_START_DATE` op de tabel `ROUND`. <!-- De startdatum is beschikbaar door de afhankelijkheid. Als dit wordt aangepast, moet de check een trigger worden -->

## IR7 komt overeen met C7 en BR5

- Omschrijving: De startdatum van een speeldag moet voor de startdatum van een opvolgende speelronde zijn, maar hetzelfde of na de startdatum van de gekoppelde speelronde;
- Implementatie: Een trigger `TRG_CHECK_VALID_MATCHDAY_START_DATE` op de tabel `MATCHDAY`.

## IR8 komt overeen met C8 en BR8

- Omschrijving: De spelers die aan een wedstrijd zijn gekoppeld moeten lid zijn van één van de twee clubs die aan de wedstrijd meedoen;
- Implementatie: Een trigger `TRG_CHECK_CORRECT_PLAYERS_IN_MATCH` op de tabel `POSITION` en `PLAYER_as_reserve_in_MATCH`.

## IR9 komt overeen met C9 en BR9

- Omschrijving: Een club mag alleen meedoen aan een wedstrijd als ze ook aan de bijbehorende editie meedoen;
- Implementatie: Een trigger `TRG_CHECK_CLUB_IN_EDITION` op de tabel `MATCH`.

## IR10 komt overeen met C10 en BR10

- Omschrijving: Alleen spelers en coaches mogen een rode of gele kaart krijgen;
- Implementatie: Een trigger `TRG_PERSON_IS_PLAYER_OR_COACH` op de tabellen `YELLOW_CARD` en `RED_CARD`.

## IR11 komt overeen met C11 en BR11

- Omschrijving: Alleen voor spelende spelers in een wedstrijd worden het aantal schoten, het aantal passes, de wissels, de overtredingen, de corners en of de persoon heeft gescoord bijgehouden;
- Implementatie: Een trigger `TRG_PERSON_IS_PLAYER` op de tabellen `PASS`, `GOAL`, `SHOT`, `FOUL`, `CORNER` en `SUBSTITUTE`.

## IR12 komt overeen met C12 en BR20

- Omschrijving: Een speler mag niet jonger zijn dan 10 jaar;
- Implementatie: Een trigger `TRG_PLAYER_HAS_VALID_AGE` op de tabel `PLAYER`.

## IR13 komt overeen met C13 en BR22

- Omschrijving: Het aantal toeschouwers bij een wedstrijd mag niet groter zijn dan de capaciteit van het stadion waar de wedstrijd wordt gehouden;
- Implementatie: Een trigger `TRG_VALID_AMOUNT_OF_SPECTATORS` op de tabel `MATCH`.

## IR14 komt overeen met C14 en BR23

- Omschrijving: De minuut in een wedstrijd mag niet negatief zijn;
- Implementatie: Een check-constraint `CHK_VALID_MINUTE_IN_MATCH` op de tabellen `RED_CARD`, `YELLOW_CARD`, `PASS`, `GOAL`, `SHOT`, `FOUL`, `CORNER` en `SUBSTITUTE`.
