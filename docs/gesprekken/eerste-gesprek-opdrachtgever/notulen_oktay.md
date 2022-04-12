# Notulen

**Datum:** 12 April 2022

### Deelnemers:

- Oktay Soytürk (notulist)
- Joram Buitenhuis (facilitator)
- Thom Kraaijvanger (eerste gespreksleider)
- Elmar Wiese (tweede gespreksleider)
- Tim Meeuwsen (notulist)
- Junjie Juan (back-up)

### Afwezig:

- n.v.t.

### Doel(en):

- Kennismaken met de opdrachtgever
- Onduidelijkheden over de casus verhelderen

### Agendapunt(en):

| Tijd   | Item                                 | Persoon           | Notities                        |
|--------|--------------------------------------|-------------------|---------------------------------|
| 3 min  | Inleiding                            | Joram Buitenhuis  | Rollen van groepsleden aangeven |
| 5 min  | Casus van de opdrachtgever luisteren | Michel Koolwaaij  |                                 |
| 10 min | Vragen over de casus (Team)          | Thom Kraaijvanger |                                 |
| 5 min  | Algemene vragen / opmerkingen        | Thom kraaijvanger | Hoe houden we contact?          |
| 2 min  | Afsluiten                            | Joram Buitenhuis  | Volgende afspraak inplannen?    |

### Vragen:

**Vraag 1: Welke gebruikers mogen data toevoegen, aanpassen en uitlezen?**

Beheerders mogen rechtstreeks in MSSQL werken (toevoegen en aanpassen), maar andere gebruikers moeten het uitlezen via MongoDB doen.

**Vraag 2: In welke taal wordt de data opgeslagen?**

Het wordt in een MSSQL database opgeslagen.

**Vraag 3: Moeten we zelf data toevoegen, of is er al bestaande data?**

Nee, maar je zou de data kunnen gebruiken van de meegeleverde websites. Als er niets beschikbaar is, dan kun je zelf data genereren.

**Vraag 4: Moeten we een back-end gaan schrijven voor de API? Zijn er restricties qua taal/framework?**

Data uitlezen moet in MongoDB en niet rechtstreeks in MSSQL.

**Vraag 5: Nog eventuele randvoorwaarden? Extra eisen van de opdrachtgever?**
1. Unittests op contraints, triggers en stored procedures.
2. History bijhouden van wijzigingen en updates die in de database plaatsvinden.
3. Tabelnamen in het Engels en data in het Nederlands.

**Vraag 6: Hoe houden we contact?**

Contact via Teams. Je mag een prive bericht sturen, maar het mag ook met een vermelding in de chat.