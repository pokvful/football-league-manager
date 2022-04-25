# Functioneel ontwerp

# Verwoordingen feittypen

## Competitie

### Naam

Er bestaat een competitie Eredivisie.

Er bestaat een competitie <u>Champions League</u>.

---

ET COMPETITIE

ID: Att: NAME

## Editie

In seizoen 17/18 vond er een editie eredivisie plaats
In seizoen <u>19/20</u> vond er een editie van <u>WK</u> plaats

ET: EDITIE
ID: ET SEASON     +       ET: COMPETITIE
ID: ATT:SEAZON_NAME             MATCH

RT COMPETITIE_VAN_EDITIE tussen EDITIE(afhankelijk) en COMPETITIE
RT SEIZOEN_VAN_EDITIE tussen EDITIE(afhankelijk) en SEIZOEN

### Clubs

De club Manchester United doet mee aan de competitie Eredivisie in het seizoen 17/18.

De club <u>Vitesse</u> doet mee aan de competitie <u>*Eredivisie*</u> in het <u>seizoen 17/18</u>.

---

ET CLUB

ID: Att: NAME

---
ETT: EDITIE
MATCH

RT CLUB_speelt_in_COMPETITIE tussen CLUB en EDITIE.

### Thuisstad

De club Manchester United heeft als thuisstad Manchester.

De club <u>Vitesse</u> heeft als thuisstad <u>*Arnhem*</u>.

---

ET CLUB

Att: CITYNAME

---

ET CITY

ID: Att: NAME

---

RT: CLUB_in_STAD tussen CLUB en STAD.

### Stadion

Het stadion Old Trafford bevat 47.140 stoelen.

Het stadion <u>Gelredome</u> bevat <u>28.000</u> stoelen.

---

ET: STADION

ID: Att: NAME

Att: Seat_capacity

### personen
De persoon 45 heeft als voornaam henk.
De persoon <u>7</u> heeft als naam <u>Elmar</u>

ET: PERSON
ID: ATT: PERSONID
----
ATT: FIRSTNAME

### persoonachternaam

de persoon 7 heeft als achternaam Wiese.
De persoon <u>45</u> heeft als achternaam <u>Boss</u>.

ET: PERSON
MATCH
----
ATT: LASTNAME

### persoon middelnaam

De persoon 123 heeft als middelnaam stoel.
De persoon <u>45</u> heeft als middelnaam <u>de</u>.
ET: PERSON
MATCH
----
ATT: MIDDELNAME

### GEBOORTEDATUM

De persoon 11 is geboren op 11 februari 1996.
De persoon <u>364524144</u> is geboren op <u>8 Maart 1929</u>.

ET: PERSON
MATCH
----
ATT: BIRTHDATE

### NATIONALITEIT

De persoon 11 heeft een nederlandse paspoord.
De persoon <u>122343</u> heeft een <u>Zuid-Africa</u> paspoort

ET: PERSON
MATCH
----
ET: COUNTRY
ID: ATT: COUNTRYNAME
    
RT LAND_van_PERSOON tussen PERSOON en LAND

### land van stad

De stad Amsterdam zit in de land Nederland.

De stad <u>Londen</u> zit in de land <u>Engeland</u>.

ET: CITY
MATCH

ET: COUNTRY
MATCH

RT STAD_in_LAND tussen CITY en COUNTRY

### Coach

De coach van Manchester United is 3.

De coach van <u>Vitesse</u> is <u>9876</u>.

---

ET: CLUB
    MATCH

MATCH

ET: COACH
    subtype of PERSON
                MATCH


RT COACH_of_CLUB tussen CLUB en COACH

### Spelers

#### Rugnummer, voornaam en achternaam

De speler 90 heeft rugnummer 26.

De speler <u>56</u> heeft rugnummer <u>14</u>.

---

ET: PLAYER
    subtype of PERSON
---

Att: Jersey_nummer

### Speler in club

De speler <u>12</u> zit in club <u>ajax</u>.
De speler <u>1234132412</u> zit in <u>psv</u>.

ET: PLAYER
MATCH

ET: CLUB
MATCH

RT SPELER_in_CLUB tussen PLAYER en CLUB

## Voetbalwedstrijd

Er is een voetbalwedstrijd op <u>5 januari 2020</u> tussen thuis team <u>Ajax</u> thuis en uit team <u>psv</u> uit in de speelronde <u>3 januari 2020</u> in het seizoen <u>20/21</u> in competitie <u>keuken kampioen divisie</u>
Er is een voetbalwedstrijd op <u>5 januari 2020</u> tussen thuis team <u>FC Barcelona</u> thuis en uit team <u>FC Madrid</u> uit in de speelronde <u>3 januari 2020</u> in het seizoen <u>20/21</u> in competitie <u>LaLiga</u> geweest.

ET:FOOTBAL_MATCH

ID: ET: MATCHDAY
        ID: ET: GAMEROUNDE + ATT: Match_datum
                MATCH

+ ET: CLUB
  MATCH
+ ET:CLUB
  MATCH

RT VOETBALWEDSTRIJD_SPEELDAG tussen VOETBALWEDSTRIJD(afhankelijk) en MATCHDAY
RT VOETBALWEDSTRIJD_thuis_CLUB tussen VOETBALWEDSTRIJD(afhankelijk) en CLUB
RT VOETBALWEDSTRIJD_uit_CLUB tussen VOETBALWDSTRIJD(afhankelijk) en CLUB

#### Positie
De speler 90 van Manchester United is verdediger.

De speler <u>91</u> van <u>Manchester United</u> is aanvaller.

Tijdens de voetbalwedstrijd op <u>5 januari 2020</u> tussen thuis team <u>FC Barcelona</u> thuis en uit team <u>FC Madrid</u> uit in de speelronde <u>3 januari 2020</u> in het seizoen <u>20/21</u> in competitie <u>LaLiga</u> heeft de speler <u>21</u> de positie <u>middenvelder</U>
---
ET MIDFIELDER
    subtype van POSITIE
                ID: ET VOETBALWEDSTRIJD + ET PLAYER
                        MATCH                MATCH

### RESERVE

Tijdens de voetbalwedstrijd op <u>5 januari 2020</u> tussen thuis team <u>FC Barcelona</u> thuis en uit team <u>FC Madrid</u> uit in de speelronde <u>3 januari 2020</u> in het seizoen <u>20/21</u> in competitie <u>LaLiga</u> was de speler <u>1223</u> reserve.

ET: FOOTBAL_MATCH
MATCH

ET: SPELER
MATCH

### Schoten

Tijdens de voetbalwedstrijd op <u>5 januari 2020</u> tussen thuis team <u>FC Barcelona</u> thuis en uit team <u>FC Madrid</u> uit in de speelronde <u>3 januari 2020</u> in het seizoen <u>20/21</u> in competitie <u>LaLiga</u> heeft het uit team 5 goals geschoten.

ET:FOOTBAL_MATCH
MATCH
-----

ATT: SHOOT_TOTAL_HOME


### Schoten_op_Doel_UIT

Tijdens de voetbalwedstrijd op <u>5 januari 2020</u> tussen thuis team <u>FC Barcelona</u> thuis en uit team <u>FC Madrid</u> uit in de speelronde <u>3 januari 2020</u> in het seizoen <u>20/21</u> in competitie <u>LaLiga</u> heeft het uit team <u>5</u> schoten op doel gemaakt.

ET:FOOTBAL_MATCH
    MATCH

ATT: SHOOT_TOTAL_OUT

### Schoten_op_Doel_THUIS

Tijdens de voetbalwedstrijd op <u>5 januari 2020</u> tussen thuis team <u>FC Barcelona</u> thuis en uit team <u>FC Madrid</u> uit in de speelronde <u>3 januari 2020</u> in het seizoen <u>20/21</u> in competitie <u>LaLiga</u> heeft het thuis team <u>7</u> schoten op doel gemaakt.

ET:FOOTBAL_MATCH
MATCH

ATT: SHOOT_ON_GOAL_HOME

### Goals

Tijdens de voetbalwedstrijd op 5 januari 2020 tussen thuis team FC Barcelona en uit team FC Madrid in de speelronde 3 januari 2020 in het seizoen 19/20 in competitie LaLiga heeft het uit team 5 goals gescored.

Tijdens de voetbalwedstrijd op <u>5 januari 2020</u> tussen thuis team <u>FC Barcelona</u> thuis en uit team <u>FC Madrid</u> uit in de speelronde <u>3 januari 2020</u> in het seizoen <u>20/21</u> in competitie <u>LaLiga</u> heeft speler <u>55</u> gescored op <u>48ste</u> minuut. 

ET: FOOTBAL_MATCH
    MATCH

ET: PLAYER
    MATCH

ID: ET: GOAL
    subtype of ET: EVENT
    ID: ET: FOOTBAL_MATCH + ATT: TIME


### Balbezit_UIT
Tijdens de voetbalwedstrijd op 3 februari 2014 tussen thuis team ajax en uit psv in de speelronde 1 februari 2014 in het seizoen 14/15 in competitie keuken kampioen divisie heeft de uit team 36 balbezit
Tijdens de voetbalwedstrijd op 4 maart 2020 tussen thuis team FC Barcelona en uit team FC Madrid in de speelronde 3 maart 2020 in het seizoen 19/20 in competitie LaLiga heeft het uit team 32% balbezit.

ET: FOOTBAL_MATCH
MATCH

ATT: BALPOSSESION_OUT

### Balbezit_thuis
Tijdens de voetbalwedstrijd op 3 februari 2014 tussen thuis team ajax en uit psv in de speelronde 1 februari 2014 in het seizoen 14/15 in competitie keuken kampioen divisie heeft de thuis team 36 balbezit
Tijdens de voetbalwedstrijd op 4 maart 2020 tussen thuis team FC Barcelona en uit team FC Madrid in de speelronde 3 maart 2020 in het seizoen 19/20 in competitie LaLiga heeft het thuis team <u>68%</u> balbezit.

ET: FOOTBAL_MATCH
MATCH

ATT: BALPOSSESION_HOME

### aantal passes thuis

Tijdens de voetbalwedstrijd op 3 februari 2014 tussen thuis team ajax en uit psv in de speelronde 1 februari 2014 in het seizoen 14/15 in competitie keuken kampioen divisie heeft het thuis team 874 passes gemaakt.

Tijdens de voetbalwedstrijd op 4 maart 2020 tussen thuis team FC Barcelona en uit team FC Madrid in de speelronde 3 maart 2020 in het seizoen 19/20 in competitie LaLiga heeft het thuis team <u>947</U> passes gemaakt.

ET: FOOTBAL_MATCH
MATCH

ATT: passes

### aantal passes uit

Tijdens de voetbalwedstrijd op 3 februari 2014 tussen thuis team ajax en uit psv in de speelronde 1 februari 2014 in het seizoen 14/15 in competitie keuken kampioen divisie heeft het uit team 434 passes gemaakt.

Tijdens de voetbalwedstrijd op 4 maart 2020 tussen thuis team FC Barcelona en uit team FC Madrid in de speelronde 3 maart 2020 in het seizoen 19/20 in competitie LaLiga heeft het uit team <u>823</U> passes gemaakt.

ET: FOOTBAL_MATCH
MATCH

ATT: passes

### preciesie passes thuis
Tijdens de voetbalwedstrijd op 3 februari 2014 tussen thuis team ajax en uit psv in de speelronde 1 februari 2014 in het seizoen 14/15 in competitie keuken kampioen divisie heeft het thuis team 65% passes precisie
Tijdens de voetbalwedstrijd op <u>4 maart 2020</u> tussen thuis team <u>FC Barcelona</u> en uit team <u>FC Madrid</u> in de speelronde <u>3 maart 2020</u> in het seizoen <u>19/20</u> in competitie <u>LaLiga</u> heeft het thuis team <u>77%</u> passes precisie.

ET: FOOTBAL_MATCH
MATCH

ATT: precision_PASSES_THUIS

### preciesie passes thuis
Tijdens de voetbalwedstrijd op 3 februari 2014 tussen thuis team ajax en uit psv in de speelronde 1 februari 2014 in het seizoen 14/15 in competitie keuken kampioen divisie heeft het uit team 35% passes precisie
Tijdens de voetbalwedstrijd op <u>4 maart 2020</u> tussen thuis team <u>FC Barcelona</u> en uit team <u>FC Madrid</u> in de speelronde <u>3 maart 2020</u> in het seizoen <u>19/20</u> in competitie <u>LaLiga</u> heeft het uit team <u>33%</u> passes precisie.

ET: FOOTBAL_MATCH
MATCH

ATT: precision_PASSES_OUT

### Overtredingen

Tijdens de voetbalwedstrijd op 3 februari 2014 tussen thuis team ajax en uit psv in de speelronde 1 februari 2014 in het seizoen 14/15 in competitie keuken kampioen divisie heeft de speler 55 een speler getackeld in  de 12de minuut.

Tijdens de voetbalwedstrijd op <u>4 maart 2020</u> tussen thuis team <u>FC Barcelona</u> en uit team <u>FC Madrid</u> in de speelronde <u>3 maart 2020</u> in het seizoen <u>19/20</u> in competitie <u>LaLiga</u> heeft de speler <u>Son Heung-min</u> een speler getackeld in  de <u>70ste</u> minuut.

ET: FOOTBAL_MATCH
MATCH

ET:Player_Name
MATCH

ATT: FALSE_UIT

ATT: Time

### Gele kaarten

Tijdens de voetbalwedstrijd op 4 maart 2020 tussen thuis team FC Barcelona en uit team FC Madrid in de speelronde 3 maart 2020 in het seizoen 19/20 in competitie LaLiga heeft de speler 55 1 gele kaart gekregen in de 12de minuut.

Tijdens de voetbalwedstrijd op <u>4 maart 2020</u> tussen thuis team <u>FC Barcelona</u> en uit team <u>FC Madrid</u> in de speelronde <u>3 maart 2020</u> in het seizoen <u>19/20</u> in competitie <u>LaLiga</u> heeft <u>de speler 55</u> <u>1 gele kaart</u> gekregen in de <u>70ste</u> minuut.
Tijdens de voetbalwedstrijd op <u>4 maart 2020</u> tussen thuis team <u>FC Barcelona</u> en uit team <u>FC Madrid</u> in de speelronde <u>3 maart 2020</u> in het seizoen <u>19/20</u> in competitie <u>LaLiga</u> heeft de speler <u>Jesse Lingard</u> <u>1 gele kaart</u> gekregen in <u>30ste minuut</u>.
ET:voetbalwedstrijd
MATCH

ET:Player_Name
MATCH

ID: ETT: Yellow_card
    subtype of EVENT
    MATCH

ATT: Time

### Rode kaarten

Tijdens de voetbalwedstrijd op 4 maart 2020 tussen thuis team FC Barcelona en uit team FC Madrid in de speelronde 3 maart 2020 in het seizoen 19/20 in competitie LaLiga heeft de speler 55 1 rode kaart gekregen in de 70ste minuut.

Tijdens de voetbalwedstrijd op <u>4 maart 2020</u> tussen thuis team <u>FC Barcelona</u> en uit team <u>FC Madrid</u> in de speelronde <u>3 maart 2020</u> in het seizoen <u>19/20</u> in competitie <u>LaLiga</u> heeft de speler <u>24</u> <u>1 rode kaart</u> gekregen in de <u>56ste</u> minuut.

ET:voetbalwedstrijd
MATCH

ET: PLAYER
MATCH

ID: ETT: Red_card
    subtype of EVENT
    MATCH

ATT: Time

### Hoekschoppen_UIT

Tijdens de voetbalwedstrijd op 4 maart 2020 tussen thuis team ajax en uit team PSV in de speelronde 3 maart 2020 in het seizoen 19/20 in competitie LaLiga heeft de uit team 23 hoekschoppen gemaakt.

Tijdens de voetbalwedstrijd op <u>4 maart 2020</u> tussen thuis team <u>FC Barcelona</u> en uit team <u>FC Madrid</u> in de speelronde <u>3 maart 2020</u> in het seizoen <u>19/20</u> in competitie <u>LaLiga</u> heeft de uit team <u>26</u> hoekschoppen gemaakt.

ET: FOOTBAL_MATCH
MATCH

ATT: CORNERKICK_OUT

### Hoekschoppen_THUIS
Tijdens de voetbalwedstrijd op 4 maart 2020 tussen thuis team ajax en uit team PSV in de speelronde 3 maart 2020 in het seizoen 19/20 in competitie LaLiga heeft de thuis team 23 hoekschoppen gemaakt.
Tijdens de voetbalwedstrijd op <u>4 maart 2020</u> tussen thuis team <u>FC Barcelona</u> en uit team <u>FC Madrid</u> in de speelronde <u>3 maart 2020</u> in het seizoen <u>19/20</u> in competitie <u>LaLiga</u> heeft de thuis team <u>36</u> hoekschoppen gemaakt.

ET: FOOTBAL_MATCH
MATCH

ATT: CORNERKICK_HOME


### Wissels

<!-- Tijdens de voetbalwedstrijd op 23 maart 2019 was de speler Juan Mata ingewisseld voor Scott McTominay in de 30ste minuut. -->

Tijdens de voetbalwedstrijd op 4 maart 2020 tussen thuis team FC Barcelona en uit team FC Madrid in de speelronde 3 maart 2020 in het seizoen 19/20 in competitie LaLiga werdt de speler 33 ingewisseld voor speler 1111 in de 30ste minuut.  

<!-- Tijdens de voetbalwedstrijd op 23 maart 2019 was de speler Scott McTominay ingewisseld voor Paul Pogba in de 70ste minuut. -->

Tijdens de voetbalwedstrijd op <u>4 maart 2020</u> tussen thuis team <u>FC Barcelona</u> en uit team <u>FC Madrid</u> in de speelronde <u>3 maart 2020</u> in het seizoen <u>19/20</u> in competitie <u>LaLiga</u> werdt de speler <u>55</u> ingewisseld voor speler <u>66</u> in de <u>40ste</u> minuut. 

ET: FOOTBAL_MATCH
MATCH

ET: PLAYER
MATCH

ET: PLAYER
MATCH

ID: ETT: switch
ATT: Time

Tijdens de wedstijd op \<periode\> tussen club \<club_1\> en club \<club_2\> in speelronde \<speelronde_nummer\> in seizoen \<seizoen_nummer\> in competitie \<competitie_naam\> werdt de speler \<speler_1\> ingewisseld voor speler \<speler_2\> in de \<minuut\>ste minuut.

#### Scheidsrechter
Tijdens de voetbalwedstrijd op 4 maart 2020 tussen thuis team FC Barcelona en uit team FC Madrid in de speelronde 3 maart 2020 in het seizoen 19/20 in competitie LaLiga was Bas Neijnhuis de scheidsrechter.

Tijdens de voetbalwedstrijd op <u>4 maart 2020</u> tussen thuis team <u>FC Barcelona</u> en uit team <u>FC Madrid</u> in de speelronde <u>3 maart 2020</u> in het seizoen <u>19/20</u> in competitie <u>LaLiga</u> was <u>Danny Makkelie</u> de scheidsrechter.

ET: FOOTBAL_MATCH
MATCH

ID: ET: referee
ATT: name

Binnen de competitie <u>Eredivisie</u> seizoen <u>20/21</u> in speelronde <u>1</u> was tijdens de voetbalwedstrijd op <u>30 maart</u> de scheidsrechter <u>Danny Makkelie</u>.
---

ET ROUND

ID: ET: COMPETITION + ET: SEASON + Att: Number

MATCH MATCH

---

ET MATCH

ID: ET: ROUND + Att: Date

### Selectie

Tijdens de voetbalwedstrijd op 4 maart 2020 tussen thuis team FC Barcelona en uit team FC Madrid in de speelronde 3 maart 2020 in het seizoen 19/20 in competitie LaLiga speelde Phil Jones in de selectie.

Tijdens de voetbalwedstrijd op <u>4 maart 2020</u> tussen thuis team <u>FC Barcelona</u> en uit team <u>FC Madrid</u> in de speelronde <u>3 maart 2020</u> in het seizoen <u>19/20</u> in competitie <u>LaLiga</u> speelde Luke Shaw in de selectie.

ET: FOOTBAL_MATCH
MATCH

ET:Selection
ATT: player
MATCH

#### Aantal toeschouwers

Tijdens de voetbalwedstrijd op 4 maart 2020 tussen thuis team FC Barcelona en uit team FC Madrid in de speelronde 3 maart 2020 in het seizoen 19/20 in competitie LaLiga was het aantal toeschouwers 40000.

Tijdens de voetbalwedstrijd op <u>4 maart 2020</u> tussen thuis team <u>FC Barcelona</u> en uit team <u>FC Madrid</u> in de speelronde <u>3 maart 2020</u> in het seizoen <u>19/20</u> in competitie <u>LaLiga</u> was het aantal toeschouwers 30000.

ET: FOOTBAL_MATCH
MATCH

Att: Seat_Occupied
