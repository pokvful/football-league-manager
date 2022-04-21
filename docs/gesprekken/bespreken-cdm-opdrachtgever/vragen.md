# Agenda

# Vragen over MongoDB staging area

1. Hoe moet het precies gedaan worden?
	- Op een manier alle informatie in SQL Server ophalen vanuit MongoDB en dit hier opslaan;
		- SQL Server exporteren naar csv en dit inladen in MongoDB;
		- Een script dat alle `SELECT`'S en `VIEWS` in SQL Server uitgevoerd en de resultaten van deze queries opslaat in MongoDB;
		- Een programma om SQL Server te exporteren naar MongoDB;
	- De queries die MongoDB binnen krijgt gelijk doorgeven aan SQL Server (soort van transpiler in MongoDB);
2. Hoe wordt er tegen MongoDB aangepraat?
	- De queries worden geschreven en uitgevoerd in `mongosh` (een cli) of een ander programma;
	- De data wordt opgevraagd aan MongoDB via HTTP requests;
		- HOE?!?
	- De data wordt opgevraagd aan MongoDB via een losstaande API (in bijvoorbeeld SpringBoot);
3. Moeten knock-out toernooien ook in de database opgenomen worden?
