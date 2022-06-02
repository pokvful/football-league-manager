# ***Disclaimer*** | De lay-out van de PDF-versie voor dit document kan verschillen met de markdown versie, voor een accurate weergave zie markdown bestand in [bitbucket](https://isebitbucket.aimsites.nl/projects/S22122A4/repos/football-league-manager/browse/docs).

# Testplan

- [***Disclaimer*** | De lay-out van de PDF-versie voor dit document kan verschillen met de markdown versie, voor een accurate weergave zie markdown bestand in bitbucket.](#disclaimer--de-lay-out-van-de-pdf-versie-voor-dit-document-kan-verschillen-met-de-markdown-versie-voor-een-accurate-weergave-zie-markdown-bestand-in-bitbucket)
- [Testplan](#testplan)
	- [Inleiding](#inleiding)
	- [Wanneer worden er testen geschreven](#wanneer-worden-er-testen-geschreven)
	- [Waarover worden de testen geschreven](#waarover-worden-de-testen-geschreven)
	- [Wat niet getest wordt](#wat-niet-getest-wordt)
	- [Benodigdheden](#benodigdheden)
	- [Hoe worden de testen geschreven.](#hoe-worden-de-testen-geschreven)
	- [Schema](#schema)
	- [Test volledigheid](#test-volledigheid)

## Inleiding
Om te controleren of de requirements uit het FO goed geïmplementeerd zijn moeten er tests geschreven worden.
In dit document wordt beschreven hoe, wat en waarover testen geschreven worden.

## Wanneer worden er testen geschreven

Voor dit project worden alleen unit tests geschreven.
Deze unit tests worden geschreven voor iedere Stored Procedure, Trigger en Check-constraint dat in dit project wordt gemaakt in MSSQL Server.
Deze testen worden gemaakt nadat de code zelf is geschreven om de code te testen.

Daarnaast worden er testen geschreven voor de security of dat de aangemaakte de rollen de rechten hebben die zijn afgesproken.

## Waarover worden de testen geschreven

Er worden bij de test minimaal een succes, faal, en edge scenario behaald

Als voorbeeld met de check: leeftijd > 18

Het successcenario moet passen wanneer de leeftijd 25 is.
Het failurescenario moet falen wanneer de leeftijd 15 is.
De edgecase moet falen wanneer de leeftijd 18 is.

Er wordt gecontroleerd of de afgesproken errors gegooid worden wanneer ze moeten, daarbij ook dat ze niet erroren wanneer het niet moet.

Als er waardes aangepast wordt, wordt er gecontroleerd of de aanpassingen juist uitgevoerd word.

Als er waardes worden teruggegeven dan wordt gecontroleerd of die correct zijn.

Verder worden de testen na elk aanpassing uitgevoert om te controlleren of de testen nog slagen. Bij een faal wordt de code meteen gerepareerd om de code kwaliteit te behouden.

## Wat niet getest wordt

-Transport script wordt niet getest.

## Benodigdheden

Er is een specifieke dev-test database die de normale database nabootst.

Voor het schrijven van de testen wordt het tSQLt framework gebruik.

|No.|Resources|Descriptions|
|--|--|--|
|1.|Server|De Database server met MySQL server en MongoDB.|
|2.|Test tool|tSQLt.NewTestClass om een test tabel aan te maken en tSQLt.RunTestClass om de onderdelen te testen|
|3.|Netwerk|Alle testen worden lokaal getest|
|4.|Computer|Op zijn minst een computer met Windows 7, Ram 2GB, CPU 3.4GHZ|

## Hoe worden de testen geschreven.

Wanneer de tests worden aangemaakt moet je eerst vanuit tSQLt een testklasse aanmaken. 

De testklasse heeft als naam de volledige naam van de  de functionaliteit + vooraan test_ (bijv test_TR_auto_update_manager_income of test_CH_player_older_than_18)

als er meer dan twee tests zijn dan wordt een \[SetUp\] procedure toegevoegd aan de klasse waarin de fake tables worden opgezet en o.a. het geteste onderdeel wordt geactiveerd en de verwachte tabel gedropt.

De testen zelf worden geschreven als \[testklasse\].\[test \[naam van test\]\]

Testen zijn stored procedures.

De volgorde van de code in de test is:
- ARRANGE: voorbereiden test (verwachte tabel vullen)
- EXPECT: error (welke) of geen error
- ACT: de geteste actie
- ASSERT: wat zou het scenario moeten zijn.

De template van een losse test is:

```SQL
CREATE OR ALTER PROCEDURE [testklasse].[test [naam test]]
AS
BEGIN
	--ARRANGE

	--EXPECT

	--ACT

	--ASSERT
END
```

## Schema
Per IR worden ook meteen te testen gemaakt. Er wordt geschat dat er onggeveer 45 min voor nodig is om alle testen per IR uit te werken.

|Opdracht|uitvoeren|Geschatte tijd|
|-------|----|-----------|
|Testen maken|alle A4 leden|675 min|
|Testen controlleren|twee A4 leden|300 min|
|Testen uitvoeren|Tester|60 min|
|Test raport maken|Tester|120 min|
|Totaal||19 uur 15 min (1155 min)|

## Test volledigheid

Nadat de code is getest met behulp van de geschreven unit tests en een slagings percentage van 100% heeft behaald. Worden de testen gecontrolleerd of er minimaal een succes, een failure en een edge case wordt gedenkt met unittesten. Verder wordt er gekeken naar de eenvoudigheid van de test, de test moet makkelijk te onderhouden zijn. 
Op het laatst worden de tests gereviewed en gecontrolleerd op de defintion of done. Als de tests worden goed gekeurd wordt in het testrapport het bewijs van het slagen van de tests neergezet en wordt de test report opgeleverd. 