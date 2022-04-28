# Notulen

**Datum:** 22 April 2022

### Deelnemers:

- Oktay Soytürk (notulist)
- Joram Buitenhuis (facilitator)
- Thom Kraaijvanger (eerste gespreksleider)
- Elmar Wiese (tweede gespreksleider)
- Tim Meeuwsen (notulist)
- Junjie Juan (back-up)
- Michel Koolwaaij (opdrachtgever)

### Afwezig:

- n.v.t.

### Doel(en):

- Onduidelijkheden over de casus verhelderen

### Agendapunt(en):

| Tijd   | Item                                 | Persoon           | Notities                        |
|--------|--------------------------------------|-------------------|---------------------------------|
| 3 min  | Inleiding                            | Joram Buitenhuis  |                                 |
| 5 min  | CDM bespreken                        | Als Team          |                                 |
| 10 min | Vragen over knock-out toernooien     | Als Team          |                                 |
| 5 min  | Vragen over de staging area          | Als Team          |                                 |
| 2 min  | Afsluiten                            | Joram Buitenhuis  |                                 |

### Vragen:

**Vragen over MongoDB staging area**

**1. Hoe moet het precies gedaan worden?**

- Op een manier alle informatie in SQL Server ophalen vanuit MongoDB en dit hier opslaan;
- SQL Server exporteren naar csv en dit inladen in MongoDB;
- Een script dat alle `SELECT`'S en `VIEWS` in SQL Server uitgevoerd en de resultaten van deze queries opslaat in MongoDB;
- Een programma om SQL Server te exporteren naar MongoDB;
- De queries die MongoDB binnen krijgt gelijk doorgeven aan SQL Server (soort van transpiler in MongoDB); 

Zijn verschillende opties, makkelijkste optie is in MongoDB iets starten die data automatisch ophaalt uit de MSSQL database.

Use cases omzetten naar procedures, die kan mongo dan aanroepen.

Gebruik maken van een Python script is ook goed.

In de staging area zetten we klaar wat voor data de data-analisten kunnen krijgen. Zo kunnen we al van tevoren optimalisaties toepassen. (Denk aan index paths).

**2. Hoe wordt er tegen MongoDB aangepraat?**

- De queries worden geschreven en uitgevoerd in `mongosh` (een cli) of een ander programma;
- De data wordt opgevraagd aan MongoDB via HTTP requests;
- HOE?!?
- De data wordt opgevraagd aan MongoDB via een losstaande API (in bijvoorbeeld SpringBoot);

Geen gebruik maken van HTTP requests, data-analisten maken gebruik van mongo shell. 

Opdrachtgever verwacht nu wel het knock-out tournament (?)

**3. Moeten knock-out toernooien ook in de database opgenomen worden?**

Optioneel is optioneel (wow), twee versies maken kan handig zijn en dan kunnen we later kijken naar de realisatie van het knock-out tournament.


