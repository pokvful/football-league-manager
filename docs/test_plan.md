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

De uiteindelijke template is:

```SQL
CREATE OR ALTER PROCEDURE [naam_wat_wordt_getest].[test [naam test]]
AS
BEGIN
	--ARRANGE

	--EXPECT

	--ACT

	--ASSERT
END
```

## Waarover worden de testen geschreven

