# Functioneel ontwerp





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