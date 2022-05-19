# Opzet structuur voor assessment

## Begin

- Begroeten van product owner en projectbegeleider(s).
- Voorstellen van groepsleden.
- Kleine introductie, wat gaan we vertellen?

## Midden

### De opdracht (football-league-manager).

- Stukje over NUTMEG, achtergrond, etc.

`Projectgroep A4 van de hogeschool Arnhem Nijmegen is in opdracht om een informatiesysteem te ontwikkelen en zijn verantwoordelijk voor het gehele project. Het team bestaat uit IT’ers die gespecialiseerd zijn in Data Modulering, Database Design en Database-implementatie.
Dit project wordt uitgevoerd voor het bedrijf NUTMEG met als opdrachtgever Michel Koolwaaij. NUTMEG is een organisatie die sportdata verzamelt en verkoopt aan sportclubs. Data-analisten binnen die sportclubs kunnen die data dan analyseren.
`

- Waarom deze opdracht?, functie van applicatie.

`
Dit project is een vervolg van eerdere projecten. Ze hebben klanten in verschillende sporten als atletiek en zwemmen, maar willen nu ook data gaan aanbieden voor voetbalclubs. Hiervoor moet een database opgesteld worden met belangrijke data over voetbalcompetities en eventueel knock-out toernooien.
`

- Eventueel iets van diagrammen laten zien voor algemeen beeld applicatie (CDM bijvoorbeeld).

### Hoe werken wij met onze projectmethode (RUP)?

- Toelichten van de verschillende fasen waarin we hebben gewerkt (Conceptie, elaboratie, constructie).
- Wat hebben we gedaan per sprint?

Conceptie: Opzet plan van Aanpak, nog geen sprints toegepast.

Elaboratie: Twee sprints gehad van 1 week, focus gelegd op ontwerp en schrijven van documentatie.

Constructie: Bestaat uit drie sprints, 2 daarvan zijn 1,5 week de laatste sprint is 1 week.

In de constructie fase zijn we bezig geweest met het implementeren van ons ontwerp. Hier en daar kleine aanpassingen gemaakt, maar vooral de focus gelegd op het schrijven van code.

- Burndown chart of iets van grafieken laten zien.
- Wat vertellen over ons review-beleid, hoe waarborgen wij kwaliteit?

Voor elke taak wordt een aparte branch aangemaakt in development, zodra iemand klaar is met zijn taak wordt een pull request aangemaakt die vervolgens gereviewd wordt door minimaal 1 persoon uit de projectgroep.

Als de pull request wordt goedgekeurd kan de code gemergd worden naar de development branch.

Aan het einde van een sprint wordt de code van development naar master gepushed.

- Hoe zien de toekomstige sprints eruit? Waar leggen we de komende periode de focus op?

De documentatie moet de functionaliteit van de applicatie beter beschrijven, op dit moment is het nog wat mager of zijn bepaalde onderdelen niet toegelicht.

Ontwerpkeuzes die zijn gemaakt tijdens de constructie fase moeten nog aan het TO worden toegevoegd.

Realiseren van knock-out tournament.

### Workshop (demonstratie van mongo shell, ophalen van informatiebehoeften)

- Laat zien dat er geen insert scripts in `./dockerFiles/mongo/` staan en overtuig ze dat er dus niks geïnsert wordt;
- Start docker op, **zonder de `-d`**, en laat de output zien. Er staat als het goed is eerst dat er allemaal SQL bestanden worden uitgevoerd. Hierna zegt het export script dat hij data aan het ophalen is van alle tabellen en daarna zie je dat het transport script zegt dat hij dingen recreate, gemixt met MONGO die zegt dat hij de dingen aanmaakt;
- Een kleine demo:
	- Er is genoeg overgenomen;
		- MSSQL: `SELECT COUNT(*) FROM POSITION` en daarna `go`;
		- MONGO: `db.POSITION.find().count()`;
	- Ook de goede data is overgenomen;
		- MSSQL: `SELECT TOP 3 * FROM POSITION` en daarna `go`;
		- MONGO: `db.POSITION.find().limit(3)`;
	- Ook de views worden overgenomen;
		- MSSQL: `SELECT COUNT(*) FROM VW_GET_PLAYROUND_DATA` en daarna `go`;
		- MONGO: `db.VW_GET_PLAYROUND_DATA.find().count()`
- Een kleine demo van dingen die deze week nog hebben toegevoegd;
	- Een nieuwe scheidsrechter toevoegen (MSSQL only);
		- `SELECT * FROM REFEREE ORDER BY PERSON_ID DESC` en daarna `go`;
		- `SELECT TOP 5 * FROM PERSON ORDER BY PERSON_ID DESC` en daarna `go`;
		- `EXEC PROC_INSERT_NEW_REFEREE @Country_name = 'Greece', @First_name = 'Henk', @Last_name = 'Hank', @Birth_date = '2000-01-01'` en daarna `go`;
		- Bewijzen dat ze zijn toegevoegd;
			- `SELECT * FROM REFEREE ORDER BY PERSON_ID DESC` en daarna `go`;
			- `SELECT TOP 5 * FROM PERSON ORDER BY PERSON_ID DESC` en daarna `go`;
	- Ophalen van de tussentijdse matchinfo;
		- `EXEC GET_SCORE_EDITION @Season = '19/20', @Competition = 'Eredivisie'` en daarna `go`;
	- Ophalen van club info;
		- `EXEC GET_CLUB_INFORMATION @Club = 'Wikido'` en daarna `go`;

## Slot

- Bedanken van product owner en projectbegeleider(s).
- Zijn er nog vragen?
