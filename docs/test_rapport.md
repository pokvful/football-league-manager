# Testrapport

## Doel van het document
Het doel van dit document is een duidelijk overzicht te geven van het testproces van de database football league manager. In de volgende hoofdstukken wordt u door de tesproces geleid. 

## tets_ALTER_CLUB_INFO


## test_SHOW_CLUB_INFO


| Test case ID | Test Case                                                                               | Test steps                                                                                                               | Pre-conditions                                                                                                                                                               | Test Data               | Post Conditions                            | Expected Results                                                                                                           | Actual Result | Status   |
|--------------|-----------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------|--------------------------------------------|----------------------------------------------------------------------------------------------------------------------------|---------------|----------|
| TC-1         | test_SHOW_SELECTION_CLUB_EDITION.[test GET_SELECTION_CLUB_OF_EDITION club2 comp1 20/21] | 1.Open file test_SHOW_CLUB_INFO.sql<br>2.Run tSQLt.Run 'test_SHOW_CLUB_INFORMATION.[test proc GET_CLUB_INFORMATION]'     | 1.Database moet opgezet zijn<br>2.Database moet gegevens hebben om een read te kunnen uitvoeren.<br>3.De procedure test_SHOW_SELECTION_CLUB_EDITION.SetUp moet gerunned zijn | 'club2','comp1','20/21' | Systeem toont de gewenste club informatie. | Systeem toont tabel met de gegevens<br>(2,'first', NULL ,'last','2222-02-02'),<br>(4,'first','middle','last','2222-02-02') |               | Geslaagd |
| TC-2         | test_SHOW_SELECTION_CLUB_EDITION.[test nonexistent club]                                | 1.Open file test_SHOW_CLUB_INFO.sql<br>2.Run the procedure test_SHOW_SELECTION_CLUB_EDITION.[test nonexistent club       | Zie pre-conditions TC-1                                                                                                                                                      | 'a','comp1','20/21'     | Systeem toont een lege tabel               | Systeem toont een lege tabel                                                                                               |               | Geslaagd |
| TC-3         | test_SHOW_CLUB_INFORMATION.[test proc GET_CLUB_INFORMATION]                             | 1.Open file test_SHOW_CLUB_INFO.sql<br>2.Run the procedure 'test_SHOW_CLUB_INFORMATION.[test proc GET_CLUB_INFORMATION]' | Zie pre-conditions TC-1                                                                                                                                                      | 'Ajax'                  | Systeem toont de gewenste club informatie. | Systeem toond tabel met de gegevens<br>('Ajax','Amsterdam','The Netherlands','De Kuip',150000,12)                          |               | Geslaagd |

|Test case ID|Test Case|Test steps|Pre-conditions|Test Data|Post Conditions|Expected Results|Actual Result|Status|
|------------|---------|----------|--------------|---------|---------------|----------------|-------------|------|
|TC-1|| | | | | | | |
|TC-2|| | | | | | | |