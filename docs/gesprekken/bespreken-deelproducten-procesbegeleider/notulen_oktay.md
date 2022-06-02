# Notulen

**Datum:** 2 juni 2022

### Deelnemers:

- Oktay Soytürk (notulist)
- Joram Buitenhuis (facilitator)
- Thom Kraaijvanger (eerste gespreksleider)
- Elmar Wiese (tweede gespreksleider)
- Tim Meeuwsen (notulist)
- Junjie Juan (back-up)
- Chris Scholten (procesbegeleider)

### Afwezig:

- n.v.t.

### Doel(en):

- FO en TO bespreken
- Onduidelijkheden bespreken over SDR (Subtype Derivation Type)

### Agendapunt(en):

| Tijd   | Item                         | Persoon          | Notities |
|--------|------------------------------|------------------|----------|
| 3 min  | Inleiding                    | Joram Buitenhuis |          |
| 30 min | Feedback FO                  | Chris Scholten   |          |
| 30 min | Feedback TO                  | Chris Scholten   |          |
| 10 min | Algemene vragen van het team | Als Team         |          |
| 2 min  | Afsluiten                    | Joram Buitenhuis |          |

## Functioneel ontwerp

### Use case model

- Dekken jullie alles af?
- Export naar MongoDB moet duidelijker (functie of actor)

De analist werkt met een secundaire systeem, de staking area. In een usecase diagram geef je de primaire systeem weer. Secundaire systeem zie ik niet als systeem, maar die worden dan ook aangegeven als externe actor.
- Tweede type systeem aangeven (extern MongoDB)

### Fully dressed use cases

- Geen technische dingen in fully dressed use cases benoemen, maar alleen functionele.

### Verwoordingen

- Twee segmenten maximaal en soms zelfs 1
- Legenda erbij zetten zodat het allemaal duidelijk leesbaar is

### CDM

- Feittype erin verwerken, zodat je kan zien hoe een CDM tot stand is gekomen (alleen op cruciale plekken)

### Business Rules

- Heeft fysieke opslag iets van doen met business rules (voorbeeld BR13)
- Een statement over de toestand waarin een realiteit kan verkeren
- Probeer ze onafhankelijk van de database te formuleren (dus niet technisch)
- Alleen regels noteren die van toepassing zijn
- BR18 moet niet club maar team zijn, want een club moet minimaal 11 spelers hebben en een match minimaal 7

### Functionele requirements

- Match met use cases (extra kolom en aangeven bij welke use case het hoort)
- Data in JSON formaat is een non functional requirement

### Ontwerp keuzes

- Is er nog iets anders wat uniek blijft buiten de identifier?

## Technische ontwerp

- Bespreek hoe je de database gaat opleveren. Er staat nu overal Docker, maar dat is meer hoe jullie het systeem ontwikkelen. Je gaat waarschijnlijk geen Docker image opleveren(?)
- Front-end roept stored procedures aan en niet de gebruiker.

### Waarom maken wij gebruik van triggers?

- Triggers kun je niet omzeilen, daarom is het handiger om triggers te gebruiken. Performance Wise hebben ze wel nadelen.

### Beschrijving Tabellen en Kolommen

- Beschrijvingen kunnen weg als het geen toegevoegde waarde heeft

### Design Decision

- Voordeel: Vanuit PowerDesigner is het gemakkelijk te genereren is geen design decision
- Noem dingen die handig zijn voor Michel en niet wat voor jullie makkelijker is

### Definition of Done

- Tracibility belangrijk (controleerbaar voor alle elementen)

### Overige opmerkingen

- Kun je de verwoordingen in de database zetten om te controleren of het allemaal werkt

### SDR

- Handiger om het afleidbaar te maken, want dan is het valideerbaar.