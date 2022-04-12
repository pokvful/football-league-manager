Projectleden:
- Joram Buitenhuis (653253)
- Tim Meuwsen (652989)
- Oktay Soyturk (635692)
- Thom Kraaijvanger ()
- Elmar Wiese ()
- Junjie Juan ()

Projectgroep: A4
Klas: ITA-ISE-A-f
Datum: 15-04-2022
Versienummer: 1.0
Organisatie: NUTMEG
Opdrachtgever: Michel Koolwaaij

# Inleiding

Het bedrijf NUTMEG heeft ons de opdracht geven de back-end voor het informatiesysteem "Football League Manager" te ontwikkelen. Door middel van dit systeem kunnen gebruikers informatie van voetbalwedstrijden toevoegen en bestaande informatie uitlezen.

Binnen dit document zal eerst de concrete opdracht worden toegelicht. Vervolgens zal er in worden gegaan op de doelstelling van de opdracht en welke resultaten er opgeleverd gaan worden. Ook worden projectgrenzen en randvoorwaarden gesteld om de verantwoordelijkheid van het ontwikkelteam duidelijk te maken. Voor het waarborgen van de kwaliteit van het gehele product zijn ook kwaliteitseisen benoemd.

Verder wordt de ontwikkelmethode die het ontwikkelteam gaat gebruiken (RUP) toegelicht, evenals hoe deelnemers en stakeholders tijdens het project communiceren. Aan het einde van het document is een planning te vinden, met daarbij een opsomming van mogelijke risico's die het verloop van het project kunnen verstoren.

Bij elk van deze risico's zijn haalbare maatregelen ten behoeven van het voortzetten van het project vastgelegd om afwijkingen van de planning en doelstelling van het project tot een minimum te beperken.

# Achtergrond van het project

NUTMEG is een nieuw startup bedrijf dat van plan is om voetbalcompetitie informatie te verkopen.
Ze specialiseren zich nu alleen in leagues.
Andere bedrijven willen de voetbal gegevens opvragen voor vele verschillende doeleinden.
Het bedrijf heeft nog geen database en ze hebben er een nodig.

# Doelstelling, opdracht en op te leveren resultaten voor het bedrijf

Probleem:

NUTMEG is een startup bedrijf dat voetbal (competitie) informatie verkoopt.

De informatie veranderd constant en ze krijgen constant nieuwe informatie.

Al die gegevens moeten worden opgeslagen.

Doelstelling:

Het bedrijf wil een database waar alle informatie kan worden opgeslagen en uit worden gehaald over voetbalcompetities.

Opdracht:

Een database waarin voetbalcompetitie kan worden opgeslagen en beheerd.

Daarbij moet er een staging area worden gemaakt om als gebruiker bij de database gegevens te komen.

De data moet in JSON geleverd kunnen worden.

Ook moet vanuit de database een current league table en top score lijst worden gegenereerd.

De gebruikers kunnen alleen gegevens lezen.

De database moet openstaan voor uitbreiding.

Resultaat:

- PvA met daarin ook Software Development Plan en Risk List.

- De gemaakte Iteratieplannen

- FO, TO waarbij de diagrammen zijn gemaakt in powerdesigner.

- SQL server database.

- Mongo DB staging area.

- De gemaakte proof of concepts.

- Testplan

- testrapport en bijbehorende tests.

# Projectgrenzen

De periode waarin we werken aan het project is van 11 april 2022 t/m 9 juni 2022.

Tijdens het project is team a4 aanwezig op de han op maandag t/m vrijdag van 9:00 t/m 17:00 uur. Hierbij is er uitzonderingen voor paar feestdagen en een vakantie.

De dagen dat A4 niet werkt aan het project zijn:
- 15 april 2022, goeie vrijdag
- 18 april 2022, 2e Paasdag
- 27 april 2022, koningsdag
- 2 mei t/m 6 mei 2022, mei vakantie

Voor het project zijn bepaalde methode en tools gegeven door school die wij moeten gebruiken binnen dit project:
- Projectmethode RUP.
- Jira om taken te plannen.
- BitBucket voor het managen van code.

Deze methode en tools moeten gebruikt worden binnen het project en er mag geen alternatief worden ingezet.

Team a4 gaat in ieder geval gebruik maken van  Microsoft SQL, docker, docker compose.
Verder wordt er eerst onderzoek gekeken naar mongodb.

De opdrachtgever kan tijdens transition fase geen nieuwe requiremens of functionaliteiten meer geven. In deze tijd wordt er gewerkt om het project af te ronden.

# Randvoorwaarden

In dit hoofdstuk worden de randvoorwaarden beschreven, hierin staat wat er geregeld moet worden om het project mogelijk te maken.

- De HAN levert beschikbare ruimtes met stroom en internet gedurende het project
- De HAN voorziet toegang tot Jira, BitBucket en MSSQL gedurende kantooruren
- De opdrachtgever, procesbegeleider en professional skills docent zijn bereikbaar gedurende het project
- ISE ritme dicteert (denk hierbij bijvoorbeeld aan inleverdeadlines) NUTMEG
- ISE casusopdracht gaat voor de wensen van NUTMEG

# Op te leveren producten en kwaliteitseisen

In dit hoofdstuk behandel je alle producten die je in hoofdstuk 4 beschreven hebt en moet opleveren, zoveel mogelijk in detail. Het gaat dan zowel om producten die je aan je opdrachtgever levert, als om de producten die school van je vraagt. Daarin rafel je de resultaten die je moet opleveren uiteen in kleinere (deel)producten. Zo kan het resultaat ‘een stuk werkende code’ bestaan uit een ontwerp, code, een testrapport en overdrachtsdocumentatie, etc.  In elk geval staan de volgende zaken ook op die lijst:

- Een projectverslag (projecten)
- Afstudeerverslag (afstuderen)
- Eindpresentatie (projecten en afstuderen)
- Bijlagen (waarnaar je in de hoofdtekst correct verwijst)

Voor ieder van de beschreven producten definieer je vervolgens meetbare (SMART) kwaliteitseisen. Je bedenkt welke activiteiten je moet doen om de producten volgens die kwaliteitseisen te maken en hoe je ervoor zorgt dat die kwaliteit ook in het proces bewaakt wordt (proceskwaliteitseisen). Dit breng je onder in een tabel. Hieronder staat een voorbeeld, dat expres niet uitputtend is ingevuld, ook zijn de kwaliteitseisen nog niet SMART geformuleerd. En… realiseer je dat het slechts een voorbeeld is!

In dit hoofdstuk zullen de op te leveren producten worden behandeld. Hierbij worden de productkwaliteitseisen benoemd die worden gebruikt om te beoordelen of een product klaar is om opgeleverd te worden.

Voor alle opgeleverde producten gelden de volgende proceskwaliteitseisen:
- Na wijzigen van een deelproduct worden de wijzigingen gereviewd door een teamgenoot.
- Bij het reviewen past de reviewer het originele werk niet aan. De reviewer plaatst comments, welke door de originele auteur worden opgelost.
- Voor alle geschreven documentatie geldt dat ze moeten voldoen aan de AIM-controlekaart. (Hogeschool Arnhem Nijmegen, 2019)

| Product           | Productkwaliteitseisen (SMART(T))              | Benodigde activiteiten om te komen tot het product                                                                       | Proceskwaliteitseisen (5xW 1xH)    |
|-------------------|------------------|-------------------------------------------------------------------------------|--------------------|
| FO 				| - Bevat een korte samenvatting van de op te leveren functionaliteit
- FO is up-to-date met huidige implementatie. - De functionele requirements zijn uitgewerkt in de vorm use cases.
- Bevat een Conceptual Domain Model


    | - Requirements uitvragen
	- Functionele requirements uitwerken in use cases
	CDM maken|  |
# Ontwikkelmethoden

Tijdens dit project zal de RUP-ontwikkelmethode toegepast worden, deze methode wordt namelijk vanuit de HAN voorgeschreven.

Vanaf de Elaboratie-fase zullen elementen vanuit SCRUM overgenomen worden, bijvoorbeeld de Daily Stand-up en het gebruik van een SCRUM-board.

We hebben ervoor gekozen om de Elaboratie-fase op te delen in twee fases. Tijdens de eerste week zullen we veel gaan timeboxen om zo kennis te maken met technieken die nieuw voor ons zijn, zoals staging in MongoDB. In de tweede week zullen we een korte SCRUM-sprint houden om doelgericht onderzoek te kunnen doen.

Tijdens de Construction-fase zal iedere iteratie een SCRUM-sprint gehouden worden.


# Projectorganisatie en communicatie

Nu de verlangde resultaten en ontwikkelmethode bekend zijn kun je pas de projectorganisatie ( in 9.) en de planning (in 10.) behandelen. Dit is een heel praktisch hoofdstuk dat inzicht geeft in contactfrequenties tussen jou, de organisatie en de schoolbegeleider(s). Ga in elk geval in op:

- Wie zijn je begeleiders (school en bedrijf)
- Hoe vaak heb je contact met hen?
- Waarover?
- Wie heeft welke rol en wie is waarvoor verantwoordelijk?
- Wat zijn ieders –inclusief je eigen- contactgegevens?
- Welke overleggen zijn er gedurende het project met het team, de opdrachtgever, de stakeholders
- (Als je werkt in een team): Wie heeft welke rol en welke verantwoordelijkheden horen daarbij, zijn er groepsafspraken (verwijs naar een bijlage)
- Hoe zien de processen eruit die kwaliteit waarborgen (als de gegevens uit de tabel uit H6 aanvulling behoeven)

In dit hoofdstuk wordt duidelijk wie er bij het project betrokken zijn, wat hun taak is en op welke manier deze bereikt kunnen worden.


Overzicht van fasen, met per fase
belangrijkste doelen 
aantal iteraties
(verwachte) start- en einddatum
Overzicht van globale iteratiedoelen
Overzicht van opleveringen
Projectagenda: globaal overzicht van belangrijke afrondingsdata in project


## Begeleiders

| Persoon           | Rol               | Contact                                                                       | Beschikbaarheid    |
|-------------------|-------------------|-------------------------------------------------------------------------------|--------------------|
| Nils Bijleveld    | Procesbegeleider  | [nils.bijleveld@han.nl](mailto:nils.bijleveld@han.nl)                         | Nog onbekend       |
| Chris Scholten    | Projectbegeleider | [chris.scholten@han.nl](mailto:chris.scholten@han.nl)                         | Nog onbekend       |

## Opdrachtgever

| Persoon           | Rol              | Contact                                                                       | Beschikbaarheid    |
|-------------------|------------------|-------------------------------------------------------------------------------|--------------------|
| Michael Koolwaaij | Opdrachtgever    | Bericht in teams of [michel.koolwaaij@han.nl](mailto:michel.koolwaaij@han.nl) | Dinsdag en Vrijdag |

## Rolverdeling

| Persoon           | Rol                | Wat | Contact |
|-------------------|--------------------|--------------------------------------------------------------------------------------------------------------------------------|---------|

| Elmar Wise        | Software Architect | Zie de bijlage [Bijlage I - Rollenbeschrijvingen - Software architect](#bijlage-i---rollenbeschrijvingen---software-architect) |
| Joram Buitenhuis  | Programmeur        | Zie de bijlage [Bijlage I - Rollenbeschrijvingen - Programmeur](#bijlage-i---rollenbeschrijvingen---programmeur)               |
| Junjie Juan       | Use case designer  | Zie de bijlage [Bijlage I - Rollenbeschrijvingen - Use case designer](#bijlage-i---rollenbeschrijvingen---use-case-designer)   |
| Oktay Soytürk     | Tester             |  Zie de bijlage [Bijlage I - Rollenbeschrijvingen - Tester](#bijlagei---rollenbeschrijvingen---tester)                         | [jj.juan@student.han.nl](mailto:o.soyturk@student.han.nl) |
| Thom Kraaijvanger | Informatieanalist  |  Zie de bijlage [Bijlage I - Rollenbeschrijvingen - Informatieanalist](#bijlage-i---rollenbeschrijvingen---informatieanalist)|   [t.kraaijvanger1@student.han.nl](mailto:t.kraaijvanger1@student.han.nl) |
| Tim Meuwsen       | Programmeur        |  Zie de bijlage [Bijlage I - Rollenbeschrijvingen - Programmeur](#bijlage-i---rollenbeschrijvingen---programmeur)              | [t.meuwsen@student.han.nl](mailto:t.meuwsen@student.han.nl) |

## Afspraken
Tijdens het project zijn er meerdere afspraken gemaakt binnen de groep.

- Bij afwezigheid geeft de des betreffende persoon het op zijn minst een week van te voren aan.

- Bij afwezigheid door ziekte moet de persoon voor 9 uur aangeven voor absent.
- Als de persoon thuis is vanwege ziekete wordt er via teams gewerkt, mits hij er toe in staat is.
- Op einde van de dag moet alles gepushed zijn naar de bij behorende branch.

- Elke dag is er een pauze van 12:00 tot 13:00.
- Bij conflicten worden de personen appart gehouden en uitgepraat totdat de conflict opgelost is.
- 



## Gesprekken opdrachtgever



# Planning


Het ISE-project vindt plaats op 11-04-2022 t/m 09-06-2022. Binnen deze periode staat er een vakantie van 02-05-2022 t/m 08-05-2022 gepland. Hierdoor is de totale duur van het project acht weken. De ontwikkelmethode waar gebruik van wordt gemaakt is RUP.

## Globale planning

| Fase |        Start | Eind | 

------|--------------|------|-
|  Inception   | OW-0  | OW-1  |
| Elaboration | OW-2  | OW-4  |
| Construction| OW-5  | OW-8  |
| Transition  | OW-9  | OW-10 |


## Inleverdata

| In te leveren                               | Datum      | Tijd  |
|---------------------------------------------|------------|-------|
| Individuele projectvoorbereiding            | 15-04-2022 | 16:00 |
| Groepsbeoordeling tussentijds               | 13-05-2022 | 16:00 |
| Verantwoording projectbijdrage tussentijds  | 13-05-2022 | 16:00 |
| Groepsbeoordeling aan het eind              | 09-06-2022 | 16:00 |
| Verantwoording projectbijdrage aan het eind | 09-06-2022 | 16:00 |

## Meetings

### Opdrachtgever



### Procesbegeleider

### Professional Skills begeleider




# Risico’s

Dit hoofdstuk is een soort ‘final check’. Je vraagt je af ‘wat kan er nu nog mis gaan?’. Een risico is iets wat buiten je macht/invloed op kan treden, en als het optreedt dan wordt de doelstelling van het project niet gehaald. Het project wordt dan te laat, met budgetoverschrijding of met (sterk) verminderde functionaliteit opgeleverd. Iets wat kan optreden maar wat planmatig bestreden kan worden is dus geen risico. Dit soort zaken neem je op in je planning, je randvoorwaarden, of daar waar het in het plan van aanpak thuishoort. Denk bijvoorbeeld aan voldoende overlegmomenten met je opdrachtgever.  Alléén de risico’s die je niet vooraf kunt beïnvloeden neem je op in deze paragraaf. Een voorbeeld: als je weet dat je tijdens je project gaat verhuizen kun je in je planning opnemen op welke dagen je niet werkt. Afwezigheid door verhuizing is dus geen risico.  Maar, als je afhankelijk bent van de levering van een server door een nieuwe leverancier, kan het anders zijn. Natuurlijk neem je eerst in de planning op dat je er nog een keer extra achter aan belt (dit noemen we een tegenmaatregel), maar je vraagt je ook af wat je gaat doen als het onverhoopt tóch misgaat (je uitwijkstrategie). Dit geef je weer in een tabel die er zo uit kan zien:

| Risico | Kans (groot-middel-klein) | Impact (groot-middel-klein) | Tegenmaatregel | Uitwijkstrategie |
|--------|-------------------------- | ----------------------------|----------------|------------------|
| 1      | 1                         | 1                           | 1              | 1                |

## Risk List

| Risico | Tegenmaatregel | Uitwijkstrategie |
|--------|----------------|-------------------|
| Mongo Database opzetten | 1 | 1 |
| Mongo database koppellen aan SQL server | 1 | 23


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
- *Hogeschool Arnhem Nijmegen*. (2019, 2 september). AIM controlekaart. Onderwijs Online. Geraadpleegd op 9 november 2021, van [https://onderwijsonline.han.nl/elearning/content/oNkklGNj](https://onderwijsonline.han.nl/elearning/content/oNkklGNj)