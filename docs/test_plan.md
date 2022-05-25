- [Testplan](#testplan)
	- [Inleiding](#inleiding)
	- [Wanneer worden er testen geschreven](#wanneer-worden-er-testen-geschreven)
	- [Benodigdheden](#benodigdheden)
	- [Hoe worden de testen geschreven.](#hoe-worden-de-testen-geschreven)
	- [Waarover worden de testen geschreven](#waarover-worden-de-testen-geschreven)
	- [Achteraf](#achteraf)

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

### Wat er getest wordt

Alle Integrity rules worden getest
|*Integrity rules*|*tabel*|*Omschrijving*|
|-------|--------------|---------------|
|IR1|POSITION|Er zijn maximaal 22 spelers aan een match verbonden (11 per club)|
|IR2|PLAYER|Er zijn minimaal 11 spelers aan een club verbonden|
|IR3|COACH|Een club heeft altijd precies 1 coach|
|IR4|ROUND|Er zijn maximaal 52 speelrondes per editie van een competitie|
|IR5|PLAYER|Een rugnummer van een speler moet hoger zijn dan 0 (mag niet 0 zijn) en mag niet hoger zijn dan 99 (mag wel 99 zijn)|
|IR6|ROUND|De startdatum van een speelronde ligt binnen de start- en einddatum van het bijbehorende seizoen|
|IR7|MATCHDAY|De startdatum van een speeldag moet voor de startdatum van een opvolgende speelronde zijn, maar hetzelfde of na de startdatum van de gekoppelde speelronde|
|IR8|POSITION<BR>PLAYER_as_reserve_in_MATCH|De spelers die aan een wedstrijd zijn gekoppeld moeten lid zijn van één van de twee clubs die aan de wedstrijd meedoen|
|IR9|MATCH|Een club mag alleen meedoen aan een wedstrijd als ze ook aan de bijbehorende editie meedoen|
|IR10|YELLOW_CARD<BR>RED_CARD|Alleen spelers en coaches mogen een rode of gele kaart krijgen|
|IR11|PASS<BR>GOAL<BR>SHOT<BR>FOUL<BR>CORNER<BR>SUBSTITUTE|Alleen voor spelende spelers in een wedstrijd worden het aantal schoten, het aantal passes, de wissels, de overtredingen, de corners en of de persoon heeft gescoord bijgehouden|
|IR12|PERSON|Een persoon mag niet jonger zijn dan 15 jaar|
|IR13|MATCH|Het aantal toeschouwers bij een wedstrijd mag niet groter zijn dan de capaciteit van het stadion waar de wedstrijd wordt gehouden|
|IR14|RED_CARD<BR>YELLOW_CARD<BR>PASS<BR>GOAL<BR>SHOT<BR>FOUL<BR>CORNER<BR>SUBSTITUTE.|De minuut in een wedstrijd mag niet negatief zijn|
|IR15|PLAYER<BR>COACH<BR>REFEREE|Een persoon moet een speler, coach of scheidsrechter zijn|

|*Applicable Roles*|*Description*|
|---------------|--------------|
|NUTMEG Voetbal Admin||

### wat niet getest wordt

-Er worden geen tests geschreven voor de HISTORY tabellen.

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



