# Functioneel ontwerp

# Verwoordingen feittypen

## Competitie

### Naam

Er bestaat een competitie Eredivisie.

Er bestaat een competitie <u>Champions League</u>.

---

ET COMPETITIE

ID: Att Name

Predicate: Er bestaat een competitie \<Name\>.

## Editie

In seizoen 17/18 vond er een editie van de eredivisie plaats.

In seizoen *<u>19/20</u> vond er een editie van de <u>WK</u>* plaats.

---

ET: SEASON

ID: Att Season_name

---

ET: *EDITION*

ID: ET SEASON + ET COMPETITION

MATCH MATCH

---

RT EDITION_of_COMPETITION tussen EDITION(afhankelijk) en COMPETITION.

RT EDITION_in_SEASON tussen EDITION(afhankelijk) en SEASON.

Predicate: In seizoen \<Season_name\> vond er een editie van de \<Name\> plaats.

### Clubs

De club Manchester United doet mee aan de competitie Eredivisie in het seizoen 17/18.

De club <u>*Vitesse*</u> doet mee aan de competitie <u>Eredivisie in het seizoen 17/18</u>.

---

ET *CLUB*

ID: Att Name

---

ETT: EDITION

MATCH

---

RT CLUB_plays_in_EDITION tussen CLUB en EDITION.

Predicate: \<Name\> doet mee aan de competitie \<Competion_name\>.

### Thuisstad

De club Manchester United heeft als thuisstad Manchester.

De club <u>Vitesse</u> heeft als thuisstad <u>*Arnhem*</u>.

---

ET CLUB

Att: Club_name

---

ET *CITY*

ID: Att City_name

---

RT: CLUB_in_CITY tussen CLUB en CITY.

Predicate: De club \<Club_name\> heeft als thuisstad \<City_name\>.

### Stadion

Het stadion Old Trafford bevat 47.140 stoelen.

Het stadion <u>Gelredome</u> bevat <u>28.000</u> stoelen.

---

ET: STADIUM

ID: Att Stadium_name

Att: Capacity

Predicate: Het stadion \<Stadium_name\> bevat \<Capacity\> stoelen.

### personen

De persoon 45 heeft als voornaam henk.

De persoon <u>7</u> heeft als naam <u>Elmar</u>.

---

ET: PERSON

ID: Att Person_id

Att: First_name

Predicate: De persoon \<Person_id\> heeft als naam \<First_name\>.

### persoonachternaam

de persoon 7 heeft als achternaam Wiese.

De persoon <u>45</u> heeft als achternaam <u>Boss</u>.

ET: PERSON

MATCH

Att: Last_name

Predicate: De persoon \<Person_id\> heeft als achternaam \<Last_name\>.

### persoon middelnaam

De persoon 123 heeft als tussenvoegsel van de.

De persoon <u>45</u> heeft als tussenvoegsel <u>de</u>.

---

ET: PERSON

MATCH

Att: Middle_name

Predicate: De persoon \<Person_id\> heeft als tussenvoegsel \<Middle_name\>.

### GEBOORTEDATUM

De persoon 11 is geboren op 11 februari 1996.

De persoon <u>364524144</u> is geboren op <u>8 Maart 1929</u>.

ET: PERSON

MATCH

Att: Birth_date

Predicate: De persoon \<Person_id\> is geboren op \<Birth_date\>.

### NATIONALITEIT

De persoon 11 heeft een nederlandse paspoort.

De persoon <u>122343</u> heeft een <u>*Zuid-Africa*</u> paspoort

ET: PERSON

MATCH

---

ET: *COUNTRY*

ID: Att Country_name

---

RT PERSON_nationality_of_COUNTRY tussen PERSON en COUNTRY.

Predicate: De persoon <u>122343</u> heeft een <u>*Zuid-Africa*</u> paspoort

### land van stad

De stad Amsterdam ligt in het land Nederland.

De stad <u>Londen</u> ligt in het land <u>*Engeland*</u>.

---

ET: CITY

MATCH

---

ET: *COUNTRY*

MATCH

---

RT CITY_located_in_COUNTRY tussen CITY en COUNTRY.

Predicate: De stad \<City_name\> ligt in het land \<Country_name\>.

### Coach

De coach van Manchester United is persoon 3.

De coach van <u>Vitesse</u> is persoon <u>9876</u>.

---

ET: CLUB

MATCH

---

ET: COACH

MATCH

---

RT COACH_of_CLUB tussen CLUB en COACH.

Predicate: De coach van \<Club_name\> is persoon \<Person_id\>.

### Spelers

#### Rugnummer, voornaam en achternaam

De speler 90 heeft rugnummer 26.

De speler <u>56</u> heeft rugnummer <u>14</u>.

---

ET: PLAYER

Att: Jersey

### Speler in club

De speler <u>12</u> zit in club <u>ajax</u>.

De speler <u>1234132412</u> zit in <u>*psv*</u>.

---

ET: PLAYER

MATCH

---

ET: *CLUB*

MATCH

---

RT PLAYER_in_CLUB tussen PLAYER en CLUB.

## Voetbalwedstrijd

Er is een voetbalwedstrijd op 5 januari 2020 tussen thuis team Ajax thuis en uit team psv uit in de speelronde 3 januari 2020 in het seizoen 20/21 in competitie keuken kampioen divisie

Er is een voetbalwedstrijd op <u>5 januari 2020</u> tussen thuis team <u>FC Barcelona</u> thuis en uit team <u>FC Madrid</u> uit in de speelronde <u>3 januari 2020</u> in het seizoen <u>20/21</u> in competitie <u>LaLiga</u> geweest.

<!-- FIXME: -->
ET: MATCH

ID: ET: MATCHDAY
        ID: ET: GAMEROUNDE + ATT: Match_datum
                MATCH

+ ET: CLUB
  MATCH
+ ET:CLUB
  MATCH

RT VOETBALWEDSTRIJD_SPEELDAG tussen VOETBALWEDSTRIJD(afhankelijk) en MATCHDAY.

RT VOETBALWEDSTRIJD_thuis_CLUB tussen VOETBALWEDSTRIJD(afhankelijk) en CLUB.

RT VOETBALWEDSTRIJD_uit_CLUB tussen VOETBALWDSTRIJD(afhankelijk) en CLUB.

### Positie

Tijdens de voetbalwedstrijd op <u>5 januari 2020 tussen thuis team FC Barcelona en uit team FC Madrid in de speelronde 3 januari 2020 in het seizoen 20/21 in competitie LaLiga</u> heeft de speler <u>21</u> de positie <u>middenvelder</U>.

---

ET POSITION

ID: ET VOETBALWEDSTRIJD + ET PLAYER

MATCH MATCH

---

RT PLAYER_plays_on_POSITION tussen POSITION en PLAYER.

RT POSITION_in_MATCH tussen POSITION en MATCH.

### RESERVE

Tijdens de voetbalwedstrijd op <u>5 januari 2020 tussen thuis team FC Barcelona thuis en uit team FC Madrid uit in de speelronde 3 januari 2020 in het seizoen 20/21 in competitie LaLiga</u> was de speler <u>*1223*</u> reserve.

---

ET: MATCH

MATCH

---


ET: *SPELER*
MATCH

---

RT PLAYER_as_reserve_in_MATCH tussen PLAYER en MATCH.

### Schoten thuis

Tijdens de voetbalwedstrijd op <u>5 januari 2020 tussen thuis team FC Barcelona thuis en uit team FC Madrid uit in de speelronde 3 januari 2020 in het seizoen 20/21 in competitie LaLiga</u> heeft het thuis team <u>5</u> goals gemaakt.

---

ET: MATCH

MATCH

Att: Shots_home

### Schoten uit

Tijdens de voetbalwedstrijd op <u>5 januari 2020 tussen thuis team FC Barcelona thuis en uit team FC Madrid uit in de speelronde 3 januari 2020 in het seizoen 20/21 in competitie LaLiga</u> heeft het uit team <u>5</u> goals gemaakt.

---

ET: MATCH

MATCH

Att: Shots_out

### Schoten op doel thuis

Tijdens de voetbalwedstrijd op <u>5 januari 2020 tussen thuis team FC Barcelona thuis en uit team FC Madrid uit in de speelronde 3 januari 2020 in het seizoen 20/21 in competitie LaLiga</u> heeft het thuis team <u>5</u> schoten op doel gemaakt.

---

ET: MATCH

MATCH

Att: Shots_on_goal_home

### Schoten op doel uit

Tijdens de voetbalwedstrijd op <u>5 januari 2020 tussen thuis team FC Barcelona thuis en uit team FC Madrid uit in de speelronde 3 januari 2020 in het seizoen 20/21 in competitie LaLiga</u> heeft het uit team <u>5</u> schoten op doel gemaakt.

---

ET: MATCH

MATCH

Att: Shots_on_goal_out

### Balbezit uit

Tijdens de voetbalwedstrijd op 3 februari 2014 tussen thuis team ajax en uit psv in de speelronde 1 februari 2014 in het seizoen 14/15 in competitie keuken kampioen divisie heeft de uit team 36 balbezit

Tijdens de voetbalwedstrijd op <u>4 maart 2020 tussen thuis team FC Barcelona en uit team FC Madrid in de speelronde 3 maart 2020 in het seizoen 19/20 in competitie LaLiga</u> heeft het uit team <u>32%</u> balbezit.

---

ET: MATCH

MATCH

Att: Ball_possession_out

### Balbezit thuis

Tijdens de voetbalwedstrijd op 3 februari 2014 tussen thuis team ajax en uit psv in de speelronde 1 februari 2014 in het seizoen 14/15 in competitie keuken kampioen divisie heeft de thuis team 36 balbezit

Tijdens de voetbalwedstrijd op <u>4 maart 2020 tussen thuis team FC Barcelona en uit team FC Madrid in de speelronde 3 maart 2020 in het seizoen 19/20 in competitie LaLiga</u> heeft het thuis team <u>68%</u> balbezit.

---

ET: MATCH

MATCH

ATT: Ball_possession_home

### Aantal passes thuis

Tijdens de voetbalwedstrijd op 3 februari 2014 tussen thuis team ajax en uit psv in de speelronde 1 februari 2014 in het seizoen 14/15 in competitie keuken kampioen divisie heeft het thuis team 874 passes gemaakt.

Tijdens de voetbalwedstrijd op <u>4 maart 2020 tussen thuis team FC Barcelona en uit team FC Madrid in de speelronde 3 maart 2020 in het seizoen 19/20 in competitie LaLiga</u> heeft het thuis team <u>947</U> passes gemaakt.

---

ET: MATCH

MATCH

ATT: Pass_count_home

### aantal passes uit

Tijdens de voetbalwedstrijd op 3 februari 2014 tussen thuis team ajax en uit psv in de speelronde 1 februari 2014 in het seizoen 14/15 in competitie keuken kampioen divisie heeft het uit team 434 passes gemaakt.

Tijdens de voetbalwedstrijd op <u>4 maart 2020 tussen thuis team FC Barcelona en uit team FC Madrid in de speelronde 3 maart 2020 in het seizoen 19/20 in competitie LaLiga</u> heeft het uit team <u>823</U> passes gemaakt.

---

ET: MATCH

MATCH

ATT: Pass_count_home

### Precisie passes thuis

Tijdens de voetbalwedstrijd op 3 februari 2014 tussen thuis team ajax en uit psv in de speelronde 1 februari 2014 in het seizoen 14/15 in competitie keuken kampioen divisie heeft het thuis team 65% passes precisie

Tijdens de voetbalwedstrijd op <u>4 maart 2020 tussen thuis team FC Barcelona en uit team FC Madrid in de speelronde 3 maart 2020 in het seizoen 19/20 in competitie LaLiga</u> heeft het thuis team <u>77%</u> passes precisie.

---

ET: MATCH

MATCH

ATT: Pass_accuracy_home

### preciesie passes thuis
Tijdens de voetbalwedstrijd op 3 februari 2014 tussen thuis team ajax en uit psv in de speelronde 1 februari 2014 in het seizoen 14/15 in competitie keuken kampioen divisie heeft het uit team 35% passes precisie

Tijdens de voetbalwedstrijd op <u>4 maart 2020 tussen thuis team FC Barcelona en uit team FC Madrid in de speelronde 3 maart 2020 in het seizoen 19/20 in competitie LaLiga</u> heeft het uit team <u>33%</u> passes precisie.

---

ET: MATCH

MATCH

ATT: Pass_accuracy_home

### Overtredingen

Tijdens de voetbalwedstrijd op 3 februari 2014 tussen thuis team ajax en uit psv in de speelronde 1 februari 2014 in het seizoen 14/15 in competitie keuken kampioen divisie heeft de speler 55 een speler getackeld in  de 12de minuut.

Tijdens de voetbalwedstrijd op <u>4 maart 2020 tussen thuis team FC Barcelona en uit team FC Madrid in de speelronde 3 maart 2020 in het seizoen 19/20 in competitie LaLiga</u> heeft de speler <u>Son Heung-min</u> een speler getackeld in  de <u>70ste</u> minuut.

---

ET: MATCH

MATCH

ET:Player_Name
MATCH

ATT: FALSE_UIT

ATT: Time

### Hoekschoppen_UIT

Tijdens de voetbalwedstrijd op 4 maart 2020 tussen thuis team ajax en uit team PSV in de speelronde 3 maart 2020 in het seizoen 19/20 in competitie LaLiga heeft het uit team 23 hoekschoppen gemaakt.

Tijdens de voetbalwedstrijd op <u>4 maart 2020 tussen thuis team FC Barcelona en uit team FC Madrid in de speelronde 3 maart 2020 in het seizoen 19/20 in competitie LaLiga</u> heeft het uit team <u>26</u> hoekschoppen gemaakt.

---

ET: MATCH

MATCH

Att: Corners_out

### Hoekschoppen_THUIS

Tijdens de voetbalwedstrijd op 4 maart 2020 tussen thuis team ajax en uit team PSV in de speelronde 3 maart 2020 in het seizoen 19/20 in competitie LaLiga heeft de thuis team 23 hoekschoppen gemaakt.

Tijdens de voetbalwedstrijd op <u>4 maart 2020 tussen thuis team FC Barcelona en uit team FC Madrid in de speelronde 3 maart 2020 in het seizoen 19/20 in competitie LaLiga</u> heeft de thuis team <u>36</u> hoekschoppen gemaakt.

---

ET: MATCH

MATCH

Att: Corners_home

## Events

### Goals

Tijdens de voetbalwedstrijd op 5 januari 2020 tussen thuis team FC Barcelona en uit team FC Madrid in de speelronde 3 januari 2020 in het seizoen 19/20 in competitie LaLiga heeft het uit team 5 goals gescored.

Tijdens de voetbalwedstrijd op <u>*5 januari 2020 tussen thuis team FC Barcelona thuis en uit team FC Madrid uit in de speelronde 3 januari 2020 in het seizoen 20/21 in competitie LaLiga*</u> heeft speler <u>**55**</u> gescoort in de <u>48ste</u> minuut.

---

ET: *MATCH*

MATCH

---

ET: **PLAYER**

MATCH

---

ET: GOAL

ID: ET: *MATCH* + ET: **PLAYER** + Att: Time

---

RT GOAL_scored_by_PERSON tussen GOAL en PERSON.

### Gele kaarten

Tijdens de voetbalwedstrijd op 4 maart 2020 tussen thuis team FC Barcelona en uit team FC Madrid in de speelronde 3 maart 2020 in het seizoen 19/20 in competitie LaLiga heeft de speler 55 1 gele kaart gekregen in de 70ste minuut.

Tijdens de voetbalwedstrijd op <u>*4 maart 2020 tussen thuis team FC Barcelona en uit team FC Madrid in de speelronde 3 maart 2020 in het seizoen 19/20 in competitie LaLiga*</u> heeft de speler <u>**Jesse Lingard**</u> gele kaart gekregen in <u>30ste minuut</u>.

---

ET: *MATCH*

MATCH

---

ET: **PLAYER**

MATCH

---

ET: YELLOW_CARD

ID: ET: *MATCH* + ET: **PLAYER** + Att: Time

MATCH

---

RT YELLOW_CARD_for_PERSON tussen YELLOW_CARD en PERSON.

### Rode kaarten

Tijdens de voetbalwedstrijd op 4 maart 2020 tussen thuis team FC Barcelona en uit team FC Madrid in de speelronde 3 maart 2020 in het seizoen 19/20 in competitie LaLiga heeft de speler 55 1 rode kaart gekregen in de 70ste minuut.

Tijdens de voetbalwedstrijd op <u>*4 maart 2020 tussen thuis team FC Barcelona en uit team FC Madrid in de speelronde 3 maart 2020 in het seizoen 19/20 in competitie LaLiga*</u> heeft de speler <u>**Jesse Lingard**</u> rode kaart gekregen in <u>30ste minuut</u>.

---

ET: *MATCH*

MATCH

---

ET: **PLAYER**

MATCH

---

ET: RED_CARD

ID: ET: *MATCH* + ET: **PLAYER** + Att: Time

---

RT RED_CARD_for_PERSON tussen RED_CARD en PERSON.

### Wissels

Tijdens de voetbalwedstrijd op 4 maart 2020 tussen thuis team FC Barcelona en uit team FC Madrid in de speelronde 3 maart 2020 in het seizoen 19/20 in competitie LaLiga werdt de speler 33 ingewisseld voor speler 1111 in de 30ste minuut.

Tijdens de voetbalwedstrijd op <u>*4 maart 2020 tussen thuis team FC Barcelona en uit team FC Madrid in de speelronde 3 maart 2020 in het seizoen 19/20 in competitie LaLiga*</u> werd de speler <u>**55**</u> ingewisseld voor de speler <u>***66***</u> in de <u>40ste</u> minuut.

---

ET: *MATCH*

MATCH

---

ET: **PLAYER**

MATCH

---

ET: ***PLAYER***

MATCH

---

ET: SUBSTITUTE

ID: ET: *MATCH* + ET: **PLAYER** + ET: ***PLAYER*** + Att: Time

---

RT PERSON_out_SUBSTITUTE tussen PERSON en SUBSTITUTE.
RT PERSON_in_SUBSTITUTE tussen PERSON en SUBSTITUTE.

#### Scheidsrechter

Tijdens de voetbalwedstrijd op 4 maart 2020 tussen thuis team FC Barcelona en uit team FC Madrid in de speelronde 3 maart 2020 in het seizoen 19/20 in competitie LaLiga was Bas Neijnhuis de scheidsrechter.

Tijdens de voetbalwedstrijd op <u>*4 maart 2020 tussen thuis team FC Barcelona en uit team FC Madrid in de speelronde 3 maart 2020 in het seizoen 19/20 in competitie LaLiga*</u> was <u>Danny Makkelie</u> de scheidsrechter.

---

ET: *MATCH*

MATCH

---

ET: REFEREE

<!-- FIXME: Afhankelijk van PERSON -->

RT REFEREE_enforcing_MATCH tussen REFEREE en MATCH.

### Aantal toeschouwers

Tijdens de voetbalwedstrijd op 4 maart 2020 tussen thuis team FC Barcelona en uit team FC Madrid in de speelronde 3 maart 2020 in het seizoen 19/20 in competitie LaLiga was het aantal toeschouwers 40000.

Tijdens de voetbalwedstrijd op <u>4 maart 2020 tussen thuis team FC Barcelona en uit team FC Madrid in de speelronde 3 maart 2020 in het seizoen 19/20 in competitie LaLiga</u> was het aantal toeschouwers <u>30000</u>.

---

ET: MATCH

MATCH

Att: Spectator_count
