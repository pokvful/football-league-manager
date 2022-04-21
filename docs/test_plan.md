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
Deze testen worden gemaakt nadat de code zelf is geschreven om de coe te testen.

## Benodigdheden

Er is een specifieke dev-test database die de normale database nabootst.

Voor het schrijven van de testen wordt het tSQLt framework gebruik.

## Hoe worden de testen geschreven.

