Voor alle SQL code die geschreven wordt tijdens de realisatie van de database/back-end van de applicatie wordt de SQL style guide van GitLab aangehouden (style guide, GitLab team).

## Natuurlijke taal

De gebruikte natuurlijke taal is in de gehele implementatie Engels. Dit geldt dus ook voor comments, functienamen, variabelenamen. 

## Variabelenamen

Alle variabelenamen zijn in camelCase.

## Unittests

Unittests voldoen aan het opgestelde testplan (testplan, GroepA4).

## Stored procedures

Bij een stored procedure staan de argumenten altijd in dezelfde volgorde:

    - De attributen van het betreffende domeinobject;
    - De id's van gekoppelde domeinobjecten met enkelvoudige verwijzing;
    - De lijstjes id's van gekoppelde domeinobjecten met een meervoudige verwijzing.

De uitgevoerde kolommen zijn altijd gelabeld en worden altijd expliciet genoemd. Gebruik van SELECT * is dan ook niet toegestaan.

## Overig

Lokale functienamen, domeinfuncties en overige functies zijn zo kort en beschrijvend mogelijk.

## Bronnen

- *GitLab Team*. (n.d.). SQL Style Guide. GitLab. Retrieved May 9, 2022, from [https://about.gitlab.com/handbook/business-technology/data-team/platform/sql-style-guide](https://about.gitlab.com/handbook/business-technology/data-team/platform/sql-style-guide) Groep A4. (2022, April 21). 
- *Football League Manager* - Testplan. Bitbucket. Retrieved May 9, 2022, from [https://isebitbucket.aimsites.nl/projects/S22122A4/repos/football-league-manager/browse/docs/test_plan.md](https://isebitbucket.aimsites.nl/projects/S22122A4/repos/football-league-manager/browse/docs/test_plan.md)