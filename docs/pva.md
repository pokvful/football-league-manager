# Plan van aanpak

> Football league manager

**Projectleden:**
- Joram Buitenhuis (653253)
- Tim Meuwsen (652989)
- Oktay Soyturk (635692)
- Thom Kraaijvanger (652413)
- Elmar Wiese (654870)
- Junjie Juan (637823)

**Projectgroep**: A4

**Klas**: ITA-ISE-A-f

**Datum**: 14-04-2022

**Versienummer**: 1.1

**Organisatie**: NUTMEG

**Opdrachtgever**: Michel Koolwaaij

---

# Inhoudsopgave

- [Inhoudsopgave](#inhoudsopgave)
- [Inleiding](#inleiding)
- [1. Achtergrond van het project](#1-achtergrond-van-het-project)
- [2. Doelstelling, opdracht en op te leveren resultaten voor het bedrijf](#2-doelstelling-opdracht-en-op-te-leveren-resultaten-voor-het-bedrijf)
	- [Probleem](#probleem)
	- [Doelstelling](#doelstelling)
	- [Opdracht](#opdracht)
	- [Resultaat](#resultaat)
- [3. Projectgrenzen](#3-projectgrenzen)
- [4. Randvoorwaarden](#4-randvoorwaarden)
- [5. Op te leveren producten en kwaliteitseisen](#5-op-te-leveren-producten-en-kwaliteitseisen)
- [6. Ontwikkelmethoden](#6-ontwikkelmethoden)
- [7. Projectorganisatie en communicatie](#7-projectorganisatie-en-communicatie)
	- [7.1 Begeleiders](#71-begeleiders)
	- [7.2 Opdrachtgever](#72-opdrachtgever)
	- [7.3 Rolverdeling](#73-rolverdeling)
	- [7.4 Afspraken](#74-afspraken)
- [8. Planning](#8-planning)
	- [8.1 Globale planning](#81-globale-planning)
	- [8.2 Inleverdata](#82-inleverdata)
- [9. Risico’s](#9-risicos)
	- [9.1 Risk List](#91-risk-list)
- [Bijlagen](#bijlagen)
	- [Bijlage I - Rollenbeschrijvingen](#bijlage-i---rollenbeschrijvingen)
		- [Bijlage I - Rollenbeschrijvingen - Informatieanalist](#bijlage-i---rollenbeschrijvingen---informatieanalist)
		- [Bijlage I - Rollenbeschrijvingen - Use case designer](#bijlage-i---rollenbeschrijvingen---use-case-designer)
		- [Bijlage I - Rollenbeschrijvingen - Software architect](#bijlage-i---rollenbeschrijvingen---software-architect)
		- [Bijlage I - Rollenbeschrijvingen - Programmeur](#bijlage-i---rollenbeschrijvingen---programmeur)
		- [Bijlage I - Rollenbeschrijvingen - Tester](#bijlage-i---rollenbeschrijvingen---tester)
- [Literatuurlijst](#literatuurlijst)

# Inleiding

Het bedrijf NUTMEG heeft ons de opdracht gegeven de back-end voor het informatiesysteem "Football League Manager" te ontwikkelen. Met dit systeem kunnen gebruikers informatie van voetbalwedstrijden toevoegen en bestaande informatie uitlezen.

Binnen dit document zal eerst de concrete opdracht worden toegelicht. Vervolgens zal er in worden gegaan op de doelstelling van de opdracht en welke resultaten er opgeleverd gaan worden. Ook worden projectgrenzen en randvoorwaarden gesteld om de verantwoordelijkheid van het ontwikkelteam duidelijk te maken. Voor het waarborgen van de kwaliteit van het gehele product zijn ook kwaliteitseisen benoemd.

Verder wordt de ontwikkelmethode die het ontwikkelteam gaat gebruiken (RUP) toegelicht, evenals hoe deelnemers en betrokken partijen tijdens het project communiceren. Aan het einde van het document is een planning te vinden, met daarbij een opsomming van mogelijke risico's die het verloop van het project kunnen verstoren.

Bij elk van deze risico's zijn haalbare maatregelen ten hoeven van het voortzetten van het project vastgelegd om afwijkingen van de planning en doelstelling van het project tot een minimum te beperken.

# 1. Achtergrond van het project

NUTMEG is een nieuw startup bedrijf dat van plan is om voetbalcompetitie informatie te verkopen.

Ze specialiseren zich nu alleen in leagues.

Andere bedrijven willen de voetbal gegevens opvragen voor vele verschillende doeleinden.

Het bedrijf heeft nog geen database en ze hebben er een nodig.

# 2. Doelstelling, opdracht en op te leveren resultaten voor het bedrijf

## 2.1 Probleem

NUTMEG is een startup bedrijf dat voetbal (competitie) informatie verkoopt. De informatie veranderd constant en ze krijgen constant nieuwe informatie. Al die gegevens moeten worden opgeslagen.

## 2.2 Doelstelling

Het bedrijf wil een database waar alle informatie kan worden opgeslagen en uit worden gehaald over voetbalcompetities.

## 2.3 Opdracht

Een database waarin data omtrent voetbal kan worden opgeslagen en beheerd. De beheerder kan direct verbinding maken met de database om zo bijvoorbeeld bestaande data aan te passen of nieuwe data toe te voegen. Daarbij moet er een staging area worden gemaakt, zodat gebruikers gegevens die in de database staan uit kunnen lezen. De data moet in JSON geleverd kunnen worden. Ook moet vanuit de database een current league table en top score lijst worden gegenereerd. De gebruikers kunnen alleen gegevens lezen. De database moet openstaan voor eventuele uitbreidingen.

## 2.4 Resultaat

- PvA met daarin ook Software Development Plan en Risk List.
- De gemaakte Iteratieplannen.
- Functioneel ontwerp.
- Technisch ontwerp.
- MSSQL server database.
- Staging area.
- De gemaakte proof of concepts.
- Testplan.
- Testrapport en bijbehorende tests.

# 3. Projectgrenzen

De periode waarin we werken aan het project is van 11 april 2022 t/m 9 juni 2022.

Tijdens het project is team A4 aanwezig op de HAN te Arnhem op maandag t/m vrijdag van 9:00 t/m 17:00 uur. Hierbij is er uitzonderingen voor paar feestdagen en een vakantie periode.

De dagen dat de groep A4 niet werkt aan het project zijn:

- 15 april 2022, goeie vrijdag;
- 18 april 2022, 2e Paasdag;
- 27 april 2022, koningsdag;
- 2 mei t/m 6 mei 2022, mei vakantie.

Voor het project zijn bepaalde methode en tools gegeven door school die wij moeten gebruiken binnen dit project:

- Projectmethode RUP;
- Jira om taken te plannen;
- BitBucket voor het managen van code.

Deze methode en tools moeten gebruikt worden binnen het project en er mag geen alternatief worden ingezet.

Team A4 gaat in ieder geval gebruik maken van MSSQL en Docker. Verder wordt er eerst onderzoek gedaan naar MongoDB, hieruit zal blijken of MongoDB ook gebruikt gaat worden voor het realiseren van het eindproduct.

De opdrachtgever kan tijdens de transition fase geen nieuwe requirements of functionaliteiten meer geven. In deze tijd wordt er gewerkt om het project af te ronden.

# 4. Randvoorwaarden

In dit hoofdstuk worden de randvoorwaarden beschreven, hierin staat wat er geregeld moet worden om het project mogelijk te maken.

- De HAN levert beschikbare ruimtes met stroom en internet gedurende het project.
- De HAN voorziet toegang tot Jira en BitBucket gedurende kantooruren.
- De opdrachtgever, procesbegeleider en professional skills docent zijn minimaal één keer per week bereikbaar gedurende het project.
- ISE ritme dicteert (denk hierbij bijvoorbeeld aan inleverdeadlines).
- NUTMEG erkent dat opgaven gegeven door de HAN prioriteit hebben over het project.

# 5. Op te leveren producten en kwaliteitseisen

In dit hoofdstuk worden de op te leveren producten en de bijbehorende kwaliteitseisen besproken.

Algemene eisen aan producten zijn gespecificeerd in de Definition of Done (DoD). In de kolom 'Product Kwaliteitseisen' zijn product specifieke eisen opgesteld.

De volgende tabel beschrijft:

- De op te leveren producten;
- De kwaliteitseisen waaraan de producten moeten voldoen;
- Wat het team moet uitvoeren om tot een succesvol product te komen;
- Hoe het team ervoor zorgt dat kwaliteitseisen behaald worden.

| Product         | Productkwaliteitseisen  (SMART)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 | Benodigde activiteiten om te komen tot het product                                                                                                                                                                                   | Proceskwaliteitseisen  (5XW 1xH)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
|-----------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| FO              | Bevat een korte samenvatting van de op te leveren functionaliteit. FO is up-to-date met de huidige implementatie.  Bevat een domeinmodel met alle domeinconcepten van de applicatie.   Bevat een glossary met alle concepten en attributen uit het domeinmodel.  De functionele requirements zijn uitgewerkt in de vorm van usecases.  De niet-ingeplande usecases uit de backlog zijn uitgewerkt in brief format.   De geplande usecases zijn uitgewerkt in fully-dressed format.   Bevat een CDM (Conceptual Domain Model). Per usecase dient het volgende te zijn beschreven: Primaire actor. Stakeholders en per stakeholder zijn interesses. Brief description (brief format). Preconditie (concreet booleaans m.b.t. het domeinmodel). Postconditie (concreet booleaans m.b.t. het domeinmodel). Happy flow. Optionele alternative flows. | Requirements uitvragen. Functionele requirements uitwerken in use cases. Niet-functionele requirements uitwerken. Use cases uitschrijven in brief-format.  Bij oppakken van een brief-format use case, deze fully dressed uitwerken. | Oplevering en goedkeuring van  opdrachtgever aan het einde van iedere sprint.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| TO              | TO is up-to-date met de huidige implementatie. Bevat een PDM (Physical Domain Model). Bevat een databaseontwerp. Bevat beargumentatie van de ontwerpkeuzes weergegeven in de bovengenoemde diagrammen.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          | Use cases opstellen Database design opstellen. PDM opstellen.                                                                                                                                                                        | Oplevering door opdrachtgever aan het einde van iedere sprint.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| Code            | Voldoet aan code conventies wanneer de code uit een branch gemerged wordt met de dev branch. Deze conventies zijn te vinden in de Definition of Done.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           | Eerst wordt de code geschreven. Wanneer de code is geschreven, worden er unittests gemaakt. Deze tests moeten minstens 80% coverage hebben (oor de coverage wordt de coverage van tSQLt aangehouden).                                | Wanneer iemand een stuk code wil plaatsen op BitBucket, wordt dit gedaan door een pull request (PR) aan te maken. Deze PR wordt gecontroleerd door minimaal 1 ander teamlid. Dit gebeurt binnen maximaal 1 werkdag. Als dat teamlid een (grote) bug vindt in de code of vindt dat de code niet voldoet aan de DoD, wordt de PR tegengehouden en moet de code herzien worden door de auteur van de PR. Wanneer er geen bugs (meer) in de code zitten, mag de code op BitBucket gezet worden. Op deze manier voorkomt het team dat er bugs worden geïntroduceerd. |
| Plan van Aanpak | Een dag voor het opleveren van het PvA, is het PvA geschreven volgens de toelichting op het plan van aanpak (Praktijkbureau AIM, Hogeschool Arnhem Nijmegen).                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   | Introductiegesprek met opdrachtgever. In kaart brengen van de requirements. Afspraken maken over ontwikkelmethode. Compleetheid van PvA bespreken met inhoudelijk begeleider en professional skills begeleider.                      | Vóór de elaboratie fase moet het PvA gereviewd worden door alle teamleden. Het PvA moet zijn ingeleverd voor de opgegeven datum zodat de procesbegeleider het PvA kan beoordelen. Als de procesbegeleider feedback heeft op het ingeleverde PvA, wordt deze feedback binnen 1 werkweek verwerkt.                                                                                                                                                                                                                                                                |
| Eindverslag     | Eén dag voor het inlevermoment van het projectverslag bevat het projectverslag een uitleg voor iedere vereiste competentie voor de beoordeling. Ook volgt het projectverslag één dag voor het inlevermoment de structuur van het aangeleverde template.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         | De factsheet wordt ingevuld. Situatiebeschrijvingen worden geformuleerd. Er wordt gereflecteerd op handelen binnen het project. Iedere student moet goed inplannen wanneer hij aan het verslag gaat werken.                          | Op 13 mei is er tussentijds inlevermoment voor het eindverslag. Alle teamleden leveren voor die datum het verslag in om feedback te krijgen van de professional skills begeleider. Verder kan er altijd aan de professional skills begeleider om feedback gevraagd worden. Op 9 juni moet het definitieve eindverslag ingeleverd worden. Alle teamleden leveren het eindverslag in om een eindcijfer te krijgen.                                                                                                                                                |
| Testrapport     | Wanneer het document wordt opgeleverd, toont het document het slagingspercentage van de geteste code. Ook beschrijft het document redenen voor eventuele gefaalde tests.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        | Er zijn testdoelen opgesteld. Resultaten van tests zijn genoteerd. De redenen voor gefaalde tests zijn uitgeschreven.                                                                                                                | Er wordt gebruik gemaakt van tSQLt om de applicatie te testen, de resultaten hiervan worden verwerkt in het testrapport.                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| Testplan        | Wanneer het document wordt opgeleverd, geeft het document de stappen weer om de gewenste code coverage te behalen. Ook geeft het document het doel van alle tests weer en geeft het document weer hoe er getest wordt.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          | Methoden die gebruikt worden om te testen zijn uitgeschreven. Gewenste input en resultaten zij opgesteld.                                                                                                                            | Het testplan wordt door het hele team gereviewed. Feedback uit deze reviews wordt binnen 1 werkdag verwerkt.                                                                                                                                                                                                                                                                                                                                                                                                                                                    |

# 6. Ontwikkelmethoden

Tijdens dit project zal de RUP-ontwikkelmethode toegepast worden, deze methode wordt namelijk vanuit de HAN voorgeschreven.

Vanaf de Elaboratie-fase zullen elementen vanuit SCRUM overgenomen worden, bijvoorbeeld de Daily Stand-up en het gebruik van een SCRUM-board.

We hebben ervoor gekozen om de Elaboratie-fase op te delen in twee fases. Tijdens de eerste week zullen we veel gaan timeboxen om zo kennis te maken met technieken die nieuw voor ons zijn, zoals staging in MongoDB. In de tweede week zullen we een korte SCRUM-sprint houden om doelgericht onderzoek te kunnen doen.

Tijdens de Construction-fase zal iedere iteratie een SCRUM-sprint gehouden worden (elke sprint zal ongeveer bestaan uit 1,5 week)

Tevens moet het team ook persoonlijke ontwikkeling gedurende het project bijhouden. Dit vermindert de tijd die uiteindelijk aan het product besteed kan worden. Het team heeft ingeschat één middag per week kwijt te zijn aan het bijhouden van de persoonlijke ontwikkeling.


# 7. Projectorganisatie en communicatie

## 7.1 Begeleiders

| Persoon           | Rol               | Contact                                               | Beschikbaarheid    |
|-------------------|-------------------|-------------------------------------------------------|--------------------|
| Nils Bijleveld    | Procesbegeleider  | [nils.bijleveld@han.nl](mailto:nils.bijleveld@han.nl) | Nog onbekend       |
| Chris Scholten    | Projectbegeleider | [chris.scholten@han.nl](mailto:chris.scholten@han.nl) | Nog onbekend       |

## 7.2 Opdrachtgever

| Persoon           | Rol              | Contact                                                                       | Beschikbaarheid    |
|-------------------|------------------|-------------------------------------------------------------------------------|--------------------|
| Michael Koolwaaij | Opdrachtgever    | Bericht in teams of [michel.koolwaaij@han.nl](mailto:michel.koolwaaij@han.nl) | Dinsdag en Vrijdag |

## 7.3 Rolverdeling

| Persoon           | Rol                | Wat                                                                                                                            | Contact                                                                 |
|-------------------|--------------------|--------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------|
| Elmar Wiese        | Software Architect | Zie de bijlage [Bijlage I - Rollenbeschrijvingen - Software architect](#bijlage-i---rollenbeschrijvingen---software-architect) | [ej.wiese@student.han.nl](mailto:ej.wiese@student.han.nl)               |
| Joram Buitenhuis  | Programmeur        | Zie de bijlage [Bijlage I - Rollenbeschrijvingen - Programmeur](#bijlage-i---rollenbeschrijvingen---programmeur)               | [jej.buitenhuis@student.han.nl](mailto:jej.buitenhuis@studnet.han.nl)   |
| Junjie Juan       | Use case designer  | Zie de bijlage [Bijlage I - Rollenbeschrijvingen - Use case designer](#bijlage-i---rollenbeschrijvingen---use-case-designer)   | [jj.juan@student.han.nl](mailto:jj.juan@student.han.nl)                 |
| Oktay Soytürk     | Tester             | Zie de bijlage [Bijlage I - Rollenbeschrijvingen - Tester](#bijlagei---rollenbeschrijvingen---tester)                          | [o.soyturk@student.han.nl](mailto:o.soyturk@student.han.nl)               |
| Thom Kraaijvanger | Informatieanalist  | Zie de bijlage [Bijlage I - Rollenbeschrijvingen - Informatieanalist](#bijlage-i---rollenbeschrijvingen---informatieanalist)   | [t.kraaijvanger1@student.han.nl](mailto:t.kraaijvanger1@student.han.nl) |
| Tim Meuwsen       | Programmeur        | Zie de bijlage [Bijlage I - Rollenbeschrijvingen - Programmeur](#bijlage-i---rollenbeschrijvingen---programmeur)               | [t.meuwsen@student.han.nl](mailto:t.meuwsen@student.han.nl)             |

## 7.4 Afspraken

Tijdens het project zijn er meerdere afspraken gemaakt binnen de groep.

- De groep werkt iedere maandag t/m vrijdag van 9:00 t/m 17:00.
- Bij afwezigheid geeft de des betreffende persoon het op zijn minst een week van te voren aan.
- Bij afwezigheid door ziekte moet de persoon dit voor 9 uur aangeven.
	- Als de persoon thuis is vanwege ziekte wordt er via teams gewerkt, mits hij hier toe in staat is.
- Op einde van de dag moet alles gepushed zijn naar de bij behorende branch.
- Elke dag is er een pauze van 12:00 tot 13:00.
- Bij conflicten worden de personen apart gehouden en uitgepraat totdat het conflict opgelost is.
- Er wordt iedere werkdag, tijdens de elaboration- en construction fase, een daily stand-up gehouden om 9:15 en duurt maximaal 15 minuten.

# 8. Planning

Het ISE-project vindt plaats op 11-04-2022 t/m 09-06-2022. Binnen deze periode staat er een vakantie van 02-05-2022 t/m 08-05-2022 gepland. Hierdoor is de totale duur van het project acht weken. De ontwikkelmethode waar gebruik van wordt gemaakt is RUP.

## 8.1 Globale planning

| Fase        | Start | Eind  |
|-------------|-------|-------|
| Inception   | OW-0  | OW-1  |
| Elaboration | OW-2  | OW-4  |
| Construction| OW-5  | OW-8  |
| Transition  | OW-9  | OW-10 |

## 8.2 Inleverdata

| In te leveren                               | Datum      | Tijd  |
|---------------------------------------------|------------|-------|
| Individuele projectvoorbereiding            | 15-04-2022 | 16:00 |
| Groepsbeoordeling tussentijds               | 13-05-2022 | 16:00 |
| Verantwoording projectbijdrage tussentijds  | 13-05-2022 | 16:00 |
| Groepsbeoordeling aan het eind              | 09-06-2022 | 16:00 |
| Verantwoording projectbijdrage aan het eind | 09-06-2022 | 16:00 |


# 9. Risico’s
| Risico | Kans (groot-middel-klein) | Impact (groot-middel-klein) | Tegenmaatregel | Uitwijkstrategie |
|--------|-------------------------- | ----------------------------|----------------|------------------|
| De toolstack is (tijdelijk) niet beschikbaar      | klein                         | groot                           | -              | Met projectbegeleider en opdrachtgever bespreken hoe het nu verder moet. |

## 9.1 Risk List

| Risico                                  | Tegenmaatregel | Uitwijkstrategie |
|-----------------------------------------|----------------|------------------|
| Mongo Database opzetten                 | PoC voor docker omgeving mac  |  De mac-gebruikers moeten windows of linux runnen. Anders andere laptop regelen. |
| Mongo database koppelen aan SQL server | PoC maken voor de koppeling  | Staging area veranderen naar spring boot. |

# Bijlagen

## Bijlage I - Rollenbeschrijvingen

### Bijlage I - Rollenbeschrijvingen - Informatieanalist

De rol van Informatieanalist is verantwoordelijk voor het helder krijgen van requirements en het modelleren van Use Cases, waardoor hij de functionaliteit en grenzen van het te bouwen systeem bepaalt en bewaakt (Naslagsite 2011, 2011).

### Bijlage I - Rollenbeschrijvingen - Use case designer

De rol van Use Case Designer is verantwoordelijk voor het specificeren van Use Cases, inclusief schermontwerpen en schermverloop (Naslagsite 2011, 2011).

### Bijlage I - Rollenbeschrijvingen - Software architect

De rol van Softwarearchitect is verantwoordelijk voor het maken, beargumenteren en documenteren van de technische keuzes in het project, die de architectuur en dus de technische grenzen en mogelijkheden voor de te bouwen applicatie bepalen. Tevens draagt de Softwarearchitect de verantwoordelijkheid voor het communiceren van de architectuur en ziet hij erop toe dat deze ook wordt geïmplementeerd (Naslagsite 2011, 2011).

### Bijlage I - Rollenbeschrijvingen - Programmeur

De rol van Programmeur is verantwoordelijk voor het technisch ontwerpen, ontwikkelen, documenteren en (het automatiseren van) testen van software (Naslagsite 2011, 2011).

### Bijlage I - Rollenbeschrijvingen - Tester

De rol van Tester is verantwoordelijk voor het specificeren van test cases en het vastleggen daarvan in een Testontwerp. Daarnaast draagt hij zorg voor het uitvoeren ervan (Naslagsite 2011, 2011).

# Literatuurlijst

- *Naslagsite 2011*. (2011). RUP Op Maat. Geraadpleegd op 12 april 2022, van [http://rupopmaat.nl/naslagsite2011/](http://rupopmaat.nl/naslagsite2011/)
- *Hogeschool Arnhem Nijmegen*. (2019, 2 september). AIM controlekaart. Onderwijs Online. Geraadpleegd op 12 april 2022, van [https://onderwijsonline.han.nl/elearning/content/oNkklGNj](https://onderwijsonline.han.nl/elearning/content/oNkklGNj)
- *HAN*. Organisatie - Project Cheatsheet - Studiehandleiding ISE-project 2021-2022. OnderwijsOnline. Geraadpleegd op 12 april 2022, van [https://han.onderwijsonline.nl/elearning/lesson/Xyrrjkjy](https://han.onderwijsonline.nl/elearning/lesson/Xyrrjkjy)
- *Praktijkbureau AIM, Hogeschool Arnhem Nijmegen*. (2020, september).  Hoe kom je tot een goed plan van aanpak en wat moet erin staan? [Handleiding]. Onderwijs Online. Geraadpleegd op 12 april 2022,  [https://onderwijsonline.han.nl/elearning/lessonfile/XD5kJg1N/eyJpdiI6InNFQW5lNHRzRDh5SWpVeWg4K1pPWkE9PSIsInZhbHVlIjoiMEdEalZsQmJyajR2RmJFRlR4dTVWcy9VWGE4cmdGenJGWTFYQTZQajZxbTdjNFVQM1JsQTBneWYxMjZKMWs1MCIsIm1hYyI6ImRiYzEyNTkzMWZlMjVjZjRiNDBkODc1ODk4MjZhZDNhMjliYTg1ZGFkMTU3ZjhlMzJhZjVlZTllM2M5YzAwZWUifQ==](https://onderwijsonline.han.nl/elearning/lessonfile/XD5kJg1N/eyJpdiI6InNFQW5lNHRzRDh5SWpVeWg4K1pPWkE9PSIsInZhbHVlIjoiMEdEalZsQmJyajR2RmJFRlR4dTVWcy9VWGE4cmdGenJGWTFYQTZQajZxbTdjNFVQM1JsQTBneWYxMjZKMWs1MCIsIm1hYyI6ImRiYzEyNTkzMWZlMjVjZjRiNDBkODc1ODk4MjZhZDNhMjliYTg1ZGFkMTU3ZjhlMzJhZjVlZTllM2M5YzAwZWUifQ==)
