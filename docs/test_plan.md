# Testplan

Aanleiding (Waarom)

Aanpak (Hoe)

Benodigde mensen en middelen (Wie en wat)

Benodigde tijd (planning) (Wat)

Op te leveren producten (Wat)

## Inleiding

Voor de opdracht besproken in het PvA moet voor de requirements (en code) testen worden geschreven om te controleren of die requirement zijn behaald.
In dit document wordt beschreven Hoe, Wat en Waarover testen geschreven worden.

## Wanneer worden er testen geschreven

Voor dit project worden alleen unit tests geschreven.
Deze unit tests worden geschreven voor iedere Stored Procedure, Trigger en Check-constraint dat in dit project wordt gemaakt in MSSQL Server.
Deze testen worden gemaakt nadat de code zelf is geschreven om de code te testen.

Daarnaast worden er testen geschreven voor de security of dat de aangemaakte de rollen de rechten hebben die zijn afgesproken.

Er worden geen tests geschreven voor de HISTORY tabellen.

## Benodigdheden

Er is een specifieke dev-test database die de normale database nabootst.

Voor het schrijven van de testen wordt het tSQLt framework gebruik.

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

## Waarover worden de testen geschreven

Er worden bij de test zoveel mogelijke verschillende succes en faal scenario's behandeld.

Hierbij wordt rekening gehouden met de randvoorwaarden.

Als voorbeeld met de check: leeftijd > 18

- Een succes test is dit checken met leeftijd = 19.
- Een faal test is dit checken met leeftijd = 18.

Er wordt gecontroleerd of de afgesproken errors gegooid worden wanneer ze moeten, daarbij ook dat ze niet erroren wanneer het niet moet.

Als er waardes worden aangepast wordt er gecontroleerd of de aanpassingen die moeten gebeuren juist worden uitgevoerd (dat niet teveel gegevens worden aangepast).

Als er waardes worden teruggegeven dan wordt gecontroleerd of die correct zijn.
## Achteraf

Nadat de code is getest met behulp van de geschreven unit tests worden de tests gereviewed. Als de tests worden goed gekeurd wordt in het testrapport het bewijs van het slagen van de tests neergezet met de datum.
