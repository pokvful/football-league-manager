## Datum: 12-04-2022

## Notulist: Tim Meuwsen

---

Bijhouden van voetbal competties met uitslagen, per wedstrijd wordt data vastgelegd. 
Zoals aantal toeschouwers, wie kreeg welke minuut een gele kaart, wie heeft de doelpunten gemaakt, wissels, scheidsrechter, etc.

Gebruiken van bestaande data, maar wel uitbreiden. (Extra statistieken)

# Gebruikers: 

## Welke gebruikers mogen data uitlezen? 

Beheerder kan rechtstreeks via de MSSQL database, data uitlezen. Gebruikers kunnen data uitlezen via de staging area (mongoDB).

## Welke gebruikers mogen data toevoegen? 

## Welke gebruikers mogen data aanpassen? 

 

# Data: 

## In welke taal wordt de data opgeslagen? 

Met voorkeur Nederlands, tabelnamen kunnen wel in het Engels.

Als we tijd overhouden kunnen we gebruik maken een "taal-switcher" zo kunnen we de inhoud binnen de database kunnen vertalen van het Nederlands naar het Engels.

## Moeten we zelf data toevoegen, of is er al bestaande data beschikbaar? 

Zelf data toevoegen, bestaande data halen we uit linkjes onderaan de casus.
 

# Tabellen: 

## Is er al een bestaand datamodel? 

Geen bestaand datamodel, gebruik maken van bestaande data, eventuele data toevoegen.

## Wat moet er worden getoond met de current league table? 

## Voor wie allemaal moet game statistics worden bijgehouden? 

## Welke gegevens moet worden opgeslagen bij de game statistics? 

## Wat moet er vastgelegd worden bij een “knockout-tournament”? 

## Hoe moet de top score lijst eruitzien? 

 

# Restricties: 

## Moeten we een back-end gaan schrijven voor de API? Zijn er restricties qua taal/framework? 

MSSQL database, uitvragen van data, maken van staging area waarin JSON uitgelezen kan worden, gebruik van mongoDB voor opvragen van data.

Gebruik van API is optioneel.

## Zijn er bepaalde restricties op de database die we moeten gebruiken voor het realiseren van de casus? 

## Gebruik van back-end? Restricties? 

 

# Overig

Data die toegevoegd wordt, moet bijgehouden worden in bijvoorbeeld een log table.

Unit testen schrijven voor stored procedures en constraints.

Dinsdag en vrijdag kunnen we contact leggen met opdrachtgever.