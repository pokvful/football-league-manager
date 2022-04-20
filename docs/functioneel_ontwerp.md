# Functioneel ontwerp

# Use cases

![Use case diagram](images/usecase_diagram_nutmeg.png)

## Fully-Dressed Use-cases

|Naam               |Read Data                                  	|
|-------------------|-----------------------------------------------|
|Actors             |Data-analist Klant / NUTMEG Voetbal Admin  	|
|Preconditie        |												|
|Postconditie       |\<Actor\> heeft informatiebehoefte opgehaald	|
|Brief Description  |\<Actor\> geeft een informatiebehoefte door aan het systeem. [[[EVENTUEEL STAGING AREA]]]. Systeem toont informatiebehoefte|
|Happy Flow         |1.\<Actor\> geeft informatiebehoefte door aan systeem <br> 2. [[[IETS OVER STAGING AREA]]] <br> 3. Systeem toont informatiebehoefte|

|Naam               |CUD Data (Create)                                  	|
|-------------------|-------------------------------------------------------|
|Actors             |NUTMEG Voetbal Admin  									|
|Preconditie        |NUTMEG Voetbal Admin heeft administratorrechten		|
|Postconditie       |De data is aangemaakt in de database					|
|Brief Description  |NUTMEG Voetbal Admin geeft aan data toe te willen voegen aan de database. [[[EVENTUEEL STAGING AREA]]]. Systeem voegt data toe.|
|Happy Flow         |1.NUTMEG Voetbal Admin geeft aan data toe te willen voegen aan de database <br> 2. [[[IETS OVER STAGING AREA]]] <br> 3. Systeem voegt data toe aan database|

|Naam               |CUD Data (UPDATE)                                  	|
|-------------------|-------------------------------------------------------|
|Actors             |NUTMEG Voetbal Admin  									|
|Preconditie        | - NUTMEG Voetbal Admin heeft administratorrechten <br> - De data die geüpdatet moet worden bestaat|
|Postconditie       |De data is aangepast in database						|
|Brief Description  |NUTMEG Voetbal Admin geeft aan data aan te willen passen in de database. [[[EVENTUEEL STAGING AREA]]]. Systeem past data aan.|
|Happy Flow         |1.NUTMEG Voetbal Admin geeft aan data aan te willen passen in de database <br> 2. [[[IETS OVER STAGING AREA]]] <br> 3. Systeem past data aan in database|

|Naam               |CUD Data (DELETE)                                  	|
|-------------------|-------------------------------------------------------|
|Actors             |NUTMEG Voetbal Admin  									|
|Preconditie        | - NUTMEG Voetbal Admin heeft administratorrechten <br> - De data die verwijdert moet worden bestaat|
|Postconditie       |De data is verwijderd uit de database	|
|Brief Description  |NUTMEG Voetbal Admin geeft aan data te willen verwijderen uit de database. [[[EVENTUEEL STAGING AREA]]]. Systeem verwijdert data.|
|Happy Flow         |1.NUTMEG Voetbal Admin geeft aan data te willen verwijderen uit de database <br> 2. [[[IETS OVER STAGING AREA]]] <br> 3. Systeem verwijdert data uit database|

|Naam               |Alter Schema                              	|
|-------------------|-------------------------------------------------------|
|Actors             |NUTMEG Voetbal Admin  									|
|Preconditie        |NUTMEG Voetbal Admin heeft administratorrechten		|
|Postconditie       |Het schema is aangepast								|
|Brief Description  |NUTMEG Voetbal Admin geeft aan het schema van de database aan te willen passen. Systeem past schema aan.|
|Happy Flow         |1.NUTMEG Voetbal Admin geeft aan het schema van de database aan te willen passen. <br> 2. Systeem past schema aan|

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

## Functionele requirements.

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

# Ontwerp keuzes

- Een speler kan maar 1 positie (aanvaller, keeper, etc) hebben;
- Er wordt maar 1 coach/trainer vastgelegd;
