# ***Disclaimer*** | De lay-out van de PDF-versie voor dit document kan verschillen met de markdown versie, voor een accurate weergave zie markdown bestand in [bitbucket](https://isebitbucket.aimsites.nl/projects/S22122A4/repos/football-league-manager/browse/docs).

# Overdrachtsdocument

## Gebruik van Docker

### Docker Compose

Docker Compose is een applicatie om gemakkelijk meerdere containers mee op te starten. Dit bestand is te vinden onder `docker-compose.yaml`.

Om gebruik te maken van Docker Compose wordt het volgende commando gedraait in de root directory (`/football-league-manager`) van het project: 

```bash
docker-compose up --build --force-recreate -d
```

### Gebruik van Docker tijdens ontwikkeling

Tijdens de ontwikkeling van het project wordt gebruik gemaakt van Docker; dit heeft als reden dat we door middel van Docker de omgeving van de applicatie kunnen wegabstraheren. Op deze manier hoeven wij ons zelf niet druk te maken over het installeren en onderhouden van installaties van bijvoorbeeld SQL Server en/of Linux.

Wij gebruiken Docker zo dat elke keer zodra de containers worden opgestart, alle data in de database wordt gereset. Dit houdt in dat alle mockdata scripts opnieuw worden gedraaid en de bestaande data in de docker omgeving wordt verwijderd. Zo beginnen we elke keer met een schone database. Het voordeel hiervan is dat op elk moment de database hetzelfde is zoals gedefinieerd in de SQL bestanden.

Zo is er altijd databaseinhoud om mee te testen en is de database consistent tussen de verschillende ontwikkelaars. Als iemand een schema, view of een procedure aanpast wordt deze wijziging meegecommit met de code. Zo lopen versies nooit uit elkaar.

### Gebruik van Docker na uitrol systeem

Om gebruik te maken van Docker voor het uitrollen van de applicatie moet eerst de volgende aanpassing worden gemaakt aan het bash script. Anders wordt er mockdata in de database geisnert, wat niet wenselijk is. Daarnaast is de data in de database niet persistent. Elke keer als de docker omgeving opnieuw wordt opgestart door middel van `docker-compose down` en `docker-compose up` wordt de bestaande data verwijderd.

## Hier eventueel een kopje over de implementatie van knock-out tournament

*Dit kopje alleen uitwerken als we de implementatie van het knock-out tournament niet optijd afkrijgen.


