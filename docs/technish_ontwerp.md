# Technisch ontwerp

# Non-Functional Requirements

## Performance and scalability

- Data uitlezen wordt gedaan in MongoDB om MSSQL niet te overladen

## Portability and compatibility

- MSSQL 2019 is vereist voor het *opzetten* van de database
- MongoDB is vereist voor het *uitlezen* van de database

## Reliability, availability, maintainability

- De data wordt opgeslagen in MSSQL en periodiek overgezet naar MongoDB
- MSSQL maakt elke dag een back-up
- MSSQL zal 99% geen overload ervaren

## Security

- Administrators van NUTMEG kunnen de database volledig beheren
- Data-analisten van klanten kunnen de database alleen lezen

## Localization

- De data wordt in het Nederlands opgeslagen

## Usability

- Data-analisten kunnen met MongoDB Shell data uitlezen
- Fouten kunnen alleen ontstaan door het verkeerd schrijven van een MongoDB Shell