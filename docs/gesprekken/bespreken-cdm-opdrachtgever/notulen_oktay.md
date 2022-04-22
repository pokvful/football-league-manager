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

- Duidelijk beeld over datamodel geven aan opdrachtgever
- Knock-out tournooi bespreken

### Agendapunt(en):

| Tijd   | Item                                 | Persoon           | Notities                        |
|--------|--------------------------------------|-------------------|---------------------------------|
| 3 min  | Inleiding                            | Joram Buitenhuis  |                                 |
| 10 min | CDM bespreken                        | Als Team          |                                 |
| 5 min  | Vragen over knock-out toernooien     | Als Team          |                                 |
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

antwoord:

antwoord bij vraag 2.

**2. Hoe wordt er tegen MongoDB aangepraat?**

- De queries worden geschreven en uitgevoerd in `mongosh` (een cli) of een ander programma;
- De data wordt opgevraagd aan MongoDB via HTTP requests;
- HOE?!?
- De data wordt opgevraagd aan MongoDB via een losstaande API (in bijvoorbeeld SpringBoot);

antwoord:

Makkelijkste optie is dat we in MongoDB iets starten die data ophaalt. Realtime hoeft niet, maar haal het periodiek op. Misschien is het mogelijk
om data vanuit een stored procedure richting MongoDB te sturen. Maar ik vind het prima dat je het via MongoDB ophaalt. Los Python script mag ook.


**3. Moeten knock-out toernooien ook in de database opgenomen worden?**

antwoord:

Begin nu met de huidige CDM als versie 1 en kijk later uit naar of je het kan uitbreiden.

**4. Hoe komen de mensen bij de data die in MongoDB staan?**

antwoord:

Geen REST API of iets dergelijks, maar gewoon in Mongo een script die uitgevoerd moet worden.

**5. Moeten we de events uitbreiden?, want we hadden nu alleen kaarten, wissels en goals**
Fijn om te weten hoeveel goede passes een speler geeft.