# Functioneel ontwerp

# Use cases

![Use case diagram](images/usecase_diagram_nutmeg.png)

# Fully-Dressed Use-cases
<!--- Staging area bij alles nog weggelaten, updaten na onderzoek --->
|Naam               |Ophalen top-lijst                                  							|
|-------------------|-------------------------------------------------------------------------------|
|Actors             |Data-analist Klant / NUTMEG Voetbal Admin  									|
|Preconditie        |1.Er zijn wedstrijden gepseeld waarop de relevante data gebaseerd kan worden	|
|Postconditie       |Systeem toont de gewenste top-lijst											|
|Brief Description  |Actor haalt een top-lijst met gewenste informatiebehoefte op uit het systeem	|
|Happy Flow         |1.Actor geeft aan een top-lijst met de gewenste informatiebehoefte op te vragen. <br> 2.Systeem toont de top-lijst. 	|


|Naam               |Ophalen tussenstand competitie															|
|-------------------|---------------------------------------------------------------------------------------|
|Actors             |Data-analist Klant / NUTMEG Voetbal Admin												|
|Preconditie        |Er zijn wedstrijden gespeeld in de gewenste competite tijdens het gewenste seizoen		|
|Postconditie       |Systeem toont de tussenstand van de gewenste competitie tijdens het gewenste seizoen	|
|Brief Description  |Actor haalt de tussenstand van een gewenste competitie tijdens een gewenst seizoen op	|
|Happy Flow         |1.Actor geeft aan de tussenstand van een gewenste competitie tijdens een gewenst seizoen te willen zien. <br> 2.Systeem toont de tussenstand.	|


|Naam               |Ophalen clubinfo																										|
|-------------------|-----------------------------------------------------------------------------------------------------------------------|
|Actors             |Data-analist Klant / NUTMEG Voetbal Admin																				|
|Preconditie        |<!--- evt. club bevat informatie ofzo, maar lijkt me overbodig --->													|
|Postconditie       |Systeem toont informatie over de gewenste club																		|
|Brief Description  |Actor haalt het team, de coach, de thuisstad, het stadion en de capaciteit van het stadion van een gewenste club op	|
|Happy Flow         |1.Actor geeft aan informatie over een gewenste club te willen zien. <br> 2.Systeem toont clubinformatie over de gewenste club.	|


|Naam               |Ophalen matchinfo									|
|-------------------|---------------------------------------------------|
|Actors             |Data-analist Klant / NUTMEG Voetbal Admin			|
|Preconditie        |De match is gespeeld								|
|Postconditie       |Systeem toont de informatie van de gewenste match	|
|Brief Description  |Actor haalt per team balbezit, passes, schoten, schoten op doel, passprecisie, overtredingen, corners, goals, kaarten en wissels van de gewenste match	op	|
|Happy Flow         |1.Actor geeft aan informatie over een gewenste match te willen zien. <br> 2.Systeem toont de informatie van de match.	|


|Naam               |Ophalen speelrondeinfo	                                                                    |
|-------------------|-------------------------------------------------------------------------------------------|
|Actors             |Data-analist Klant / NUTMEG Voetbal Admin	                                                |
|Preconditie        |De speelronde is al gespeeld	                                                            |
|Postconditie       |Systeem toont de informatie van de gewenste speelronde	                                    |
|Brief Description  |Actor haalt de uitslagen en speeldagen van wedstrijden tijdens een gewenste speelronde op	|
|Happy Flow         |1.Actor geeft aan de uitslagen en speeldagen van wedstrijden tijdens een gewenste speelronde te willen zien. <br> 2.Systeemm toont de uitslagen en speeldagen van wedstrijden tijdens de gewenste speelronde.	|
<!--- Onderstaande alternative flows zijn gemaakt voordat er een CDM_V2 is gemaakt.--->
<!--- Alternative Flow A is misschine iets te implementatie gericht--->


|Naam               |Invoeren matchdata	                                                                            |
|-------------------|-----------------------------------------------------------------------------------------------|
|Actors             |NUTMEG Voetbal Admin	                                                                        |
|Preconditie        |<!--- je zou kunnen zeggen match is gespeeld maar in principe kan je ook gewoonde verkeerde data invoeren, is geen preconditie> --->	|
|Postconditie       |De match met al zijn gegevens staat geregistreerd in het systeem	                            |
|Brief Description  |Actor	voert matchdata van een gespeelde wedstrijd in                                          |
|Happy Flow         |1.Actor voert de matchdata in in STORED PROCEDURE <br> 2.Systeem slaat matchdata op	        |
|Alternatieve Flow  |2A.Systeem geeft aan dat de ingevoerde waarde van balbezit/passprecisie niet tussen 0-100 is. <br> 3A.Ga terug naar stap 1 <br> - <br> 2B.Systeem geeft aan dat speler gekoppeld aan een event/pass/corner/overtreding/schot(op doel) niet in het is correcte team zit. <br> 3B.Ga terug naar stap 1 <br> - <br> 2C.Systeem geeft aan dat speler niet opgesteld is tijdens de wedstrijd. <br> 3C.Ga terug naar stap 1	|


|Naam               |Updaten clubinfo	|
|-------------------|-------------------------------------------------------------------------------|
|Actors             |NUTMEG Voetbal Admin	|
|Preconditie        |De club bestaat al	|
|Postconditie       |De updated clubinformatie is opgeslagen in het systeem	|
|Brief Description  |Actor update de clubinformatie. Hieronder wordt het team, de coach, de thuisstad het stadion en de stadioncapaciteit verstaan.	|
|Happy Flow         |1.Actor geeft de informatie mee die geüpdatet moet worden. 2.Systeem update de informatie. |
|Alternative FLow	|2A.Systeem geeft aan dat een speler/coach die moet worden toegevoegd nog bij een ander team ingeschreven staat. <br> Ga terug naar stap 1.


|Naam               |Start nieuw seizoen competitie	|
|-------------------|-------------------------------------------------------------------------------|
|Actors             |NUTMEG Voetbal Admin	|
|Preconditie        |Het vorige seizoen is afgelopen <!--- iets met speelrondes ofzo? 2x aantal clubs --->	|
|Postconditie       |De juiste clubs zijn gedegradeerd/gepromoveert. Een nieuw seizoen is gestart	|
|Brief Description  |Actor update de correcte clubs in de nieuwe editie, start vervolgens een leeg seizoen (lege matches, speeldrondes en een nieuwe editie).	|
|Happy Flow         |1.Actor geeft aan welke clubs gedegradeerd/gepromoveert worden middels STORED PROCEDURE en start daarmee het nieuwe seizeoen. <br> 2.Systeem zet de correcte clubs in de nieuwe editie <br> 3.Systeem maakt matches, speelrondes en een nieuwe editie aan.	|
|Alternative Flow	| 2A. Systeem geeft aan dat een gepromoveerde club al in de competitie zit. <br> 3A. Ga terug naar stap 1. <br> 2B.Systeem geeft aan dat het aantal promoties en degradaties niet gelijk is. <br> 3B.Ga terug naar stap 1


|Naam               |Toevoegen nieuwe persoon	|
|-------------------|-------------------------------------------------------------------------------|
|Actors             |NUTMEG Voetbal Admin	|
|Preconditie        |Geen	|
|Postconditie       |Nieuw persoon staat in het systeem	|
|Brief Description  |Actor zet een nieuw persoon in het systeem	|
|Happy Flow         |1.Actor geeft informatie van niewe persoon op en geeft aan deze op te willen slaan in het systeem. 2.Nieuw persoon staat in het systeem.	|
|Alternative Flow	|2B.Systeem geeft aan dat informatie onvolledig is  <br> 3B.Ga terug naar stap 1

# Verwoordingen feittypen

## Competitie

### Naam

Er bestaat een competitie Eredivise.

Er bestaat een competitie Champions League.

### Clubs

De club Manchester United doet mee aan de competitie Eredivisie.

De club Vitesse doet mee aan de competitie Eredivise.

### Seizoen

De competitie Eredivise wordt gespeeld in het seizoen 18/19.

De competitie Champions League wordt gespeeld in het seizoen 20/21.

### Standen

* Op basis van VOETBALWEDSTRIJD

### Toplijsten

* Op basis van VOETBALWEDSTRIJD

## Voetbalwedstrijd

Een voetbalwedstrijd wordt gespeeld tijdens een competitie

### Schoten

Tijdens de voetbalwedstrijd op 23 maart 2019 heeft de speler Edinson Cavani in de 45ste minuut op het doel geschoten.

Tijdens de voetbalwedstrijd op 23 maart 2019 heeft de speler Edinson Cavani in de 60ste minuut naast het doel geschoten.

### Goals

Tijdens de voetbalwedstrijd op 23 maart 2019 heeft de speler Edinson Cavani in de 39ste minuut gescoord.

Tijdens de voetbalwedstrijd op 23 maart 2019 heeft de speler Edinson Cavani in de 75ste minuut gescoord.

### Balbezit 

Tijdens de voetbalwedstrijd op 23 maart 2019 had de speler Edinson Cavani een balbezit van 9%.

Tijdens de voetbalwedstrijd op 23 maart 2019 had de speler Edinson Cavani een balbezet van 5%.

### Aantal passes

Tijdens de voetbalwedstrijd op 23 maart 2019 had de speler Edinson Cavani 25 keer de bal gepaast.

Tijdens de voetbalwedstrijd op 23 maart 2019 had de speler Edinson Cavani 30 keer de bal gepaast.

### Overtredingen

Tijdens de voetbalwedstrijd op 23 maart 2019 had de speler Edinson Cavani een speler getackeld in  de 12de minuut.

Tijdens de voetbalwedstrijd op 23 maart 2019 had de speler Edinson Cavani een speler getackeld in  de 70ste minuut.

Tijdens de voetbalwedstrijd op 23 maart 2019 had de speler Jesse Lingard 1 gele kaart gekregen in 30ste minuut.

### Gele kaarten

Tijdens de voetbalwedstrijd op 23 maart 2019 had de speler Edinson Cavani 1 gele kaart gekregen in 12de minuut.

Tijdens de voetbalwedstrijd op 23 maart 2019 had de speler Edinson Cavani 1 rode kaart gekregen in de 70ste minuut.

### Rode kaarten

Tijdens de voetbalwedstrijd op 23 maart 2019 had de speler Edinson Cavani 1 rode kaart gekregen in de 70ste minuut.

Tijdens de voetbalwedstrijd op 23 maart 2019 had de speler Edinson Cavani 1 rode kaart gekregen in de 70ste minuut.

### Buitenspel

Tijdens de voetbalwedstrijd op 23 maart 2019 was de speler Jesse Lingard buitenspel in de 60ste minuut.

Tijdens de voetbalwedstrijd op 23 maart 2019 was de speler Jesse Lingard buitenspel in de 81ste minuut.

### Hoekschoppen

Tijdens de voetbalwedstrijd op 23 maart 2019 had de speler Edinson Cavani in de 34ste minuut een hoekschop getrapt.

Tijdens de voetbalwedstrijd op 23 maart 2019 had de speler Edinson Cavani in de 70ste minuut een hoekschop getrapt.

### Wissels

Tijdens de voetbalwedstrijd op 23 maart 2019 was de speler Juan Mata ingewisseld voor Scott McTominay in de 30ste minuut.

Tijdens de voetbalwedstrijd op 23 maart 2019 was de speler Scott McTominay ingewisseld voor Paul Pogba in de 70ste minuut.

## Match day

### Speelronde

#### Scheidsrechter

Binnen de competitie Eredivisie seizoen 17/18 in speelronde 2 was tijdens de voetbalwedstrijd op 30 maart de scheidsrechter Bas Neijnhuis.

Binnen de competitie Eredivisie seizoen 20/21 in speelronde 1 was tijdens de voetbalwedstrijd op 30 maart de scheidsrechter Danny Makkelie.

#### Club thuis

Binnen de competitie Eredivisie seizoen 20/21 in speelronde 1 tijdens de voetbalwedstrijd op 30 maart speelde Manchester United thuis.

Binnen de competitie Eredivisie seizoen 20/21 in speelronde 2 tijdens de voetbalwedstrijd op 25 maart speelde Vitesse thuis.

#### Club uit

Binnen de competitie Eredivisie seizoen 17/18 in speelronde 1 tijdens de voetbalwedstrijd op 30 maart speelde Vitesse uit.

Binnen de competitie Eredivisie seizoen 20/21 in speelronde 2 tijdens de voetbalwedstrijd op 30 maart speelde Manchester United uit.

### Selectie

Binnen de competitie Eredivisie seizoen 20/21 in speelronde 2 tijdens de voetbalwedstrijd op 30 maart speelde Phil Jones in de selectie.

Binnen de competitie Eredivisie seizoen 20/21 in speelronde 2 tijdens de voetbalwedstrijd op 30 maart speelde Luke Shaw in de selectie.

#### Uitslag

Binnen de competitie Eredivisie seizoen 20/21 in speelronde 2 tijdens de voetbalwedstrijd op 30 maart was de eindstand 3-1.

Binnen de competitie Eredivisie seizoen 20/21 in speelronde 2 tijdens de voetbalwedstrijd op 30 maart was de eindstand 1-2.

#### Aantal toeschouwers

Binnen de competitie Eredivisie seizoen 20/21 in speelronde 1 tijdens de voetbalwedstrijd op 30 maart was het aantal toeschouwers 40000.

Binnen de competitie Eredivisie seizoen 20/21 in speelronde 2 tijdens de voetbalwedstrijd op 23 maart was het aantal toeschouwers 30000.

## Club

### Thuisstad

De club Manchester United heeft als thuisstad Manchester.

De club Vitesse heeft als thuisstad Arnhem.

### Stadion

Het stadion Old Trafford bevat 47.140 stoelen.

Het stadion Gelredome bevat 28.000 stoelen.

### Manager

De manager van Manchester United is Ralf Rangnick.

De manager van Vitesse is Thomas Letsch.

### Spelers

#### Rugnummer, voornaam en achternaam

De speler Mason Greenwood van Manchester United heeft rugnummer 26.

De speler Jesse Lingard van Manchester United heeft rugnummer 14.

### Nationaliteit

De speler Mason Greenwood van Manchester United is geboren in Engeland.

De speler Jesse Lingard van Manchester United is geboren in Engeland.

#### Geboortedatum

De speler Mason Greenwood van Manchester United is geboren op 01/10/2001.

De speler Jesse Lingard van Manchester United is geboren op 15/12/1992.

#### Positie

De speler Edinson Cavani van Manchester United is aanvaller.

De speler Jesse Lingard van Manchester United is aanvaller.

#### Gespeeld

De speler Mason Greenswood van Manchester United heeft in 17 wedstrijden gespeeld.

De speler Jesse Lingard heeft in 14 wedstrijden gespeeld.

# Business Rules

- Van een lopende competitie mag alleen de selectie clubs en de speeldatum van een wedstrijd worden aangepast.
- Van elk gespeelde voetbalronde moeten de posities, schoten, schoten op goal, hoekschoppen en overtredingen worden opgeslagen.
- Een thuis club mag maximaal een keer tegen een uit club spelen binnen een seizoen.

# Functionele requirements.

| Functional Requirement                              	| MoSCoW 	|
|-----------------------------------------------------	|--------	|
| Bij een lopende competitie mag alleen de speeldatum of speler selectie van een wedstrijd worden veranderd. | M |
| Het moet mogelijk zijn om een current league table te generaten. | M |
| Het moet mogelijk zijn om een top score lijst van een league te genereren. | S |
| De gegevens moet bereikbaar zijn via een online API in JSON formaat. | S |
| Een \[gebruiker\] kan inhoudelijke gegevens uitlezen. 	| M |
| Een \[admin\] kan inhoudelijke gegevens uitlezen. 	| S   	|
| Een \[admin\] kan inhoudelijke gegevens verwijderen. 	| S   	|
| Een \[admin\] kan inhoudelijke gegevens aanpassen. 	| S   	|
| Een \[admin\] kan inhoudelijke gegevens aanmaken. 	| S   	|
| Een \[admin\] kan database schema aanmaken. 	| S   	|
| Een \[admin\] kan database schema lezen. 	| C   	|
| Een \[admin\] kan database schema verwijderen. 	| S   	|
| Een \[admin\] kan database schema aanpassen. 	| S   	|

## Constraints

### Primary key constraints

#### Person

PI: Person ID

#### Match

PI: Club_name + club_name + match_day + start_date + end_date + competition_name + season_name

#### Club

PI: Club_name

#### City

PI: City_name

#### Country 

PI: Country_name

#### Competition

PI: Competition_name

#### Season

PI: Season_name

#### Round

PI: Start_date + end_date

#### Matchday

PI: Match_day + start_date + end_date + competition_name + season_name

#### Event

PI: Time + club_name + club_name + match_day + start_date + end_date + competition_name + season_name

### Check constraints

- Maximaal 22 posities per match (11 per club);
- Minimaal 11 spelers per club;
- Minimaal en maximaal 1 coach per club;
- Maximaal 52 speelrondes per competitie;
- Een rugnummer van een speler mag niet hoger zijn dan 99 en kleiner zijn dan 1.

# Ontwerp keuzes

In dit hoofdstuk gaan de verschillende ontwerp keuzes verwoord worden om het model duidelijk te krijgen. Deze specfieke keuzes staan hieronder uitgelegd.

## Entiteit: Persoon

De entiteit Persoon heeft drie subtypes (coach, referee en player). Hier is voor gekozen zodat elk persoon in de database gekoppeld kan worden aan een type persoon. Hierdoor is het mogelijk om voor elk persoon specifieke data op te slaan.

## Entiteit: Event

Voor de verschillende events (rode kaart, gele kaart, wissel, doelpunt) die tijdens een voetbalwedstrijd plaatsvinden is de entiteit Event bedacht. Deze events zijn als subtype gekoppeld aan Event, zodat elke event gekoppeld kan worden aan een speler met daarbij de minuut waarin het is gebeurd. Hierdoor is het mogelijk om specifieke data op te halen voor spelers.

## Entiteit: Position

Voor entiteit Position hebben we vier subtypes (keeper, verdediger, middenvelder, aanvaller) bedacht. Dit zorgt ervoor dat we elke Speler kunnen koppelen aan een positie. Hierdoor is het mogelijk om voor elke positie de bijhorende spelers op te halen.

## Entiteit: Match

De entiteit Match bevat alle informatie (balbezit, passes, schoten, schoten op doel, passnauwkeurigheid, overtredingen en corners) over de thuis en uit clubs die tegen elkaar spelen. Hij is afhankelijk van de entiteit Club, want die bepaald wie de thuis en uit clubs zijn. Daarnaast is hij ook afhankelijk van de entiteit Matchday, want die specificeert de dag waarop de wedstrijd gespeeld wordt. Door het zo specifiek mogelijk op te slaan, is het mogelijk om data voor elke club nauwkeurig uit te lezen.

# Rechtenstructuur

| Use Cases                 | Entiteit(en)                                  | Rechten               |
|---------------------------|-----------------------------------------------|-----------------------|
| Ophalen Top-lijst         | Event (inc. subtypes), Match, Person, Club    | Data-Analist en Admin |
| Ophalen Tussenstand Comp  | Competition, Edition, Season, Round           | Data-Analist en Admin |
| Ophalen Club Info         | Club, Person, City, Competition, Coach        | Data-Analist en Admin | 
| Ophalen Match Info        | Match, Person, Matchday, Club, Stadium, Event | Data-Analist en Admin |
| Ophalen Speelronde Info   | Round, Matchday, Edition                      | Data-Analist en Admin |
| Ophalen Matchday Info     | Matchday, Round, Match                        | Data-Analist en Admin |
| Invoeren Match Data       | Match, Event, Matchday, Stadium, Club, Person | Admin                 |
| Updaten Club Info         | Club, Player, Coach, City, Match              | Admin                 |
| Start Nieuwe Seizoen Comp | Season, Competition, Edition, Round, Matchday | Admin                 |
| Toevoegen Nieuwe Persoon  | Person                                        | Admin                 |

# Toelichting Datakwaliteit
Voor dit project is geen data aangeleverd. Alle data in de database wordt gemockt en zoveel mogelijk gebaseerd op voorbeelddata.


Het schema is gebaseerd op een opzet met informatiebehoeften dat met de opdrachtgever is afgestemed. Het schema is vervolgens ontworpen op basis van deze informatiebehoeften.
Relevante keuzes betreft het includeren of uitsluiten van feiten in het schema staan omschreven in het hoofdstuk ontwerpkeuzes.

## Interactiemodel

|  Usecases \ Entiteiten    | Alle  Entiteiten	|
|--------------	|-------	|
| Create Data  	| C     	|
| Read Data    	| R     	|
| Update Data  	| U     	|
| Delete Data  	| D     	|
| Alter Schema 	| n.v.t 	|

Bij Alter Schema is de CRUD matrix van de entiteiten niet van toepassingen, want daarmee wordt de database zelf aangepast.

# Onderbouwing concepten CDM

## Entiteit PERSON

De entiteit PERSOON bevat informatie over een persoon, zoals de voornaam, achternaam, tussenvoegsel(s), geboortedatum en een nummer om de persoon te identificeren in de database.

| Attribuut | Omschrijving |
|---|---|
| Person\_id | Het nummer waar een persoon mee geïdentificeerd kan worden |
| First\_name | De voornaam van de persoon |
| Last\_name | De achternaam van de persoon |
| Middle\_name | Een eventueel tussenvoegsel tussen de voor- en achternaam van de persoon |
| Birth\_date | De geboortedatum van de persoon |

## Entiteit PLAYER

De PLAYER entiteit neemt alle kolommen uit de PERSON entiteit over en krijgt vervolgens ook nog een rugnummer.

| Attribuut | Omschrijving |
|---|---|
| Jersey | Het rugnummer van de speler |

## Entiteit REFEREE

De REFEREE entiteit heeft geen extra kolommen ten opzichte van PLAYER. Deze entiteit wordt dus alleen gebruikt om aan te geven dat een persoon een scheidsrechter is.

## Entiteit COACH

De COACH entiteit heeft geen extra kolommen ten opzichte van PLAYER. Deze entiteit wordt dus alleen gebruikt om aan te geven dat een persoon een coach is.

## Entiteit COUNTRY

In de COUNTRY entiteit staan alle landen opgeslagen.

| Attribuut | Omschrijving |
|---|---|
| Country\_name | De naam van het land |

## Entiteit CITY

In de COUNTRY entiteit staan alle steden en dorpen opgeslagen.

| Attribuut | Omschrijving |
|---|---|
| City\_name | De naam van de stad of het dorp |

## Entiteit CLUB

In de CLUB entiteit staan alle clubs opgeslagen.

| Attribuut | Omschrijving |
|---|---|
| Club\_name | De nama van de voetbal club |

## Entiteit STADIUM

In de entiteit STADIUM staan alle stadionnen van alle clubs.

| Attribuut | Omschrijving |
|---|---|
| Stadium\_name | De naam van het stadion |
| Capacity | Het aantal toeschouwers dat in het stadion aanwezig kunnen zijn totdat het vol is |

## Entiteit COMPETITION

In de entiteit COMPETITION worden alle competities vastgelegd.

| Attribuut | Omschrijving |
|---|---|
| Competition\_name | De naam van de competitie |

## Entiteit SEASON

In de entiteit SEASON worden alle seizoenen vastgelegd.

| Attribuut | Omschrijving |
|---|---|
| Season\_name | De naam van het seizoen |

## Entiteit EDITION

In de entiteit EDITION worden de edities van een competitie in een seizoen vastgelegd.

## Entiteit ROUND

De entiteit ROUND bevat alle speelronden van een editie.

| Attribuut | Omschrijving |
|---|---|
| Start\_date | De startdatum van de speelronde |
| End\_date | De einddatum van de speelronde |

## Entiteit MATCHDAY

De MATCHDAY entiteit bevat informatie over een speeldag in een speelronde.

| Attribuut | Omschrijving |
|---|---|
| Match\_day | De datum (een dag) wanneer de speeldag plaats vind |

## Entiteit MATCH

In de entiteit MATCH worden een aantal statistieken bijgehouden van de wedstrijd. Denk hier aan het aantal passes, het balbezit, het aantal schoten (op doel), het aantal overtredingen en het aantal corners.

| Attribuut | Omschrijving |
|---|---|
| Ball\_possession\_home | Het percentage balbezit van de thuis spelende club |
| Ball\_possession\_out | Het percentage balbezit van de uit spelende club |
| Pass\_count\_home | Het aantal passes binnen de thuis spelende club |
| Pass\_count\_out | Het aantal passes binnen de uit spelende club |
| Shots\_home | Het totaal aantal schoten binnen de thuis spelende club |
| Shots\_out | Het totaal aantal schoten binnen de uit spelende club |
| Shots\_on\_goal\_home | Het aantal schoten op goal binnen de thuis spelende club |
| Shots\_on\_goal\_out | Het aantal schoten op goal binnen de uit spelende club |
| Pass\_accuracy\_home | Hoeveel procent van het aantal passes dat goed is aangekomen bij een medespeler van de thuis spelende club |
| Pass\_accuracy\_out | Hoeveel procent van het aantal passes dat goed is aangekomen bij een medespeler van de uit spelende club |
| Fouls\_home | Het aantal overtredingen van de thuis spelende club |
| Fouls\_out | Het aantal overtredingen van de thuis spelende club |
| Corners\_home | Het aantal corners van de thuis spelende club |
| Corners\_out | Het aantal corners van de thuis spelende club |

## Entiteit POSITION

De entiteit POSITION houd bij welke speler in welke wedstrijd op welke positie speelt.

## Entiteit KEEPER

In de KEEPER entiteit staan alle spelers die in een wedstrijd als keeper gespeeld hebben.

## Entiteit DEFENDER

In de DEFENDER entiteit staan alle spelers die in een wedstrijd als verdediger gespeeld hebben.

## Entiteit MIDFIELDER

In de MIDFIELDER entiteit staan alle spelers die in een wedstrijd als middenvelder gespeeld hebben.

## Entiteit ATTACKER

In de ATTACKER entiteit staan alle spelers die in een wedstrijd als aanvaller gespeeld hebben.

## Entiteit EVENT

In de EVENT entiteit worden gebeurtenissen tijdens een wedstrijd bijgehouden. Deze gebeurtenissen gebeuren in een bepaalde minuut in de wedstrijd.

| Attribuut | Omschrijving |
|---|---|
| Time | De minuut in de wedstrijd wanneer het event heeft plaatsgevonden |

## Entiteit SUBSTITUTE

In de entiteit SUBSTITUTE staan alle momenten wanneer een speler voor een andere speler wordt vervangen.

## Entiteit GOAL

In de entiteit GOAL staan alle momenten wanneer er een goal is gemaakt in een wedstrijd.

## Entiteit RED_CARD

In de entiteit RED_CARD staan alle momenten wanneer een speler een rode kaart krijgt in een wedstrijd.

## Entiteit YELLOW_CARD

In de entiteit YELLOW_CARD staan alle momenten wanneer een speler een gele kaart krijgt in een wedstrijd.

# Testplan

Staat in bijlage Testplan.
