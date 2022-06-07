# End-to-End testing

## Use cases

### Ophalen top-lijst

#### Test stappen

1. Maak verbinding met MongoDB
2. Voer query uit voor het ophalen van top-lijst rode kaarten

| Stap | Actie                                                      | Input                                                                       | Output                                                                      |
|------|------------------------------------------------------------|-----------------------------------------------------------------------------|-----------------------------------------------------------------------------|
| 1    | Maak verbinding met de database                            | mongosh 127.0.0.1:27017/flm -u mongo -p toor --authenticationDatabase admin | ![Database verbinding](images/test_results/verbinding-resultaat.png)        |
| 2    | Voer query uit voor het ophalen van top-lijst rode kaarten | db.VW_TOP_LIST_RED_CARD.find()                                              | ![Database verbinding](images/test_results/ophalen-top-lijst-resultaat.png) |

### Ophalen tussenstand competitie

#### Test stappen

1. Maak verbinding met MongoDB
2. Voer query uit voor het ophalen van tussenstand competitie

| Stap | Actie                                                      | Input                                                                       | Output                                                                                   |
|------|------------------------------------------------------------|-----------------------------------------------------------------------------|------------------------------------------------------------------------------------------|
| 1    | Maak verbinding met de database                            | mongosh 127.0.0.1:27017/flm -u mongo -p toor --authenticationDatabase admin | ![Database verbinding](images/test_results/verbinding-resultaat.png)                     |
| 2    | Voer query uit voor het ophalen van tussenstand competitie | db.SCORE_EDITIONS.find()                                                    | ![Database verbinding](images/test_results/ophalen-tussenstand-competitie-resultaat.png) |

### Ophalen clubinfo

#### Test stappen

1. Maak verbinding met MongoDB
2. Voer query uit voor het ophalen van club informatie over Eadel

| Stap | Actie                                                          | Input                                                                       | Output                                                                     |
|------|----------------------------------------------------------------|-----------------------------------------------------------------------------|----------------------------------------------------------------------------|
| 1    | Maak verbinding met de database                                | mongosh 127.0.0.1:27017/flm -u mongo -p toor --authenticationDatabase admin | ![Database verbinding](images/test_results/verbinding-resultaat.png)       |
| 2    | Voer query uit voor het ophalen van club informatie over Eadel | db.CLUB.find({CLUB_NAME:"EADEL"})                                           | ![Database verbinding](images/test_results/ophalen-clubinfo-resultaat.png) |

### Ophalen matchinfo

#### Test stappen

1. Maak verbinding met MongoDB
2. Voer query uit voor het ophalen van match met ID 0

| Stap | Actie                                              | Input                                                                       | Output                                                                      |
|------|----------------------------------------------------|-----------------------------------------------------------------------------|-----------------------------------------------------------------------------|
| 1    | Maak verbinding met de database                    | mongosh 127.0.0.1:27017/flm -u mongo -p toor --authenticationDatabase admin | ![Database verbinding](images/test_results/verbinding-resultaat.png)        |
| 2    | Voer query uit voor het ophalen van match met ID 0 | db.MATCH.find({MATCH_ID:0})                                                 | ![Database verbinding](images/test_results/ophalen-matchinfo-resultaat.png) |

### Ophalen speelronde info

#### Test stappen

1. Maak verbinding met MongoDB
2. Voer query uit voor het ophalen van speelronde informatie

### Ophalen matchday info

#### Test stappen

1. Maak verbinding met MongoDB
2. Voer query uit voor het ophalen van matchday informatie

### Invoeren matchdata

### Updaten clubinfo

### Start nieuw seizoen competitie

### Toevoegen nieuw persoon

### Toevoegen nieuw event type

### Overzetten data