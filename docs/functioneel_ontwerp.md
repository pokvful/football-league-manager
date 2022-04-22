# Functioneel ontwerp

# Verwoordingen feittypen

## Competitie

### Naam

Er bestaat een competitie Eredivisie.

Er bestaat een competitie <u>Champions League</u>.

---

ET COMPETITION

ID: Att: Na`me`

### Clubs

De club Manchester United doet mee aan de competitie Eredivisie.

De club <u>Vitesse</u> doet mee aan de competitie <u>*Eredivisie*</u>.

---

ET CLUB

ID: Att: Name

---

ET *COMPETITION*

MATCH

RT CLUB_plays_in_COMPETITION tussen CLUB en COMPETITION.

### Seizoen

De competitie Eredivisie wordt gespeeld in het seizoen 18/19.

De competitie <u>Champions League</u> wordt gespeeld in het seizoen <u>*20/21*</u>.

---

ET COMPETITION

MATCH

---

ET *SEASON*

ID: Att: Year

--
RT EDITIE tussen COMPETITIE en SEASON


### Standen

* Op basis van VOETBALWEDSTRIJD

### Top lijsten

* Op basis van VOETBALWEDSTRIJD

## Club

### Thuisstad

De club Manchester United heeft als thuisstad Manchester.

De club <u>Vitesse</u> heeft als thuisstad <u>*Arnhem*</u>.

---

ET CLUB

ID: Att: Name

---

ET *CITY*

ID: Att: Name

---

RT: CLUB_in_CITY tussen CLUB en CITY.

### Stadion

Het stadion Old Trafford bevat 47.140 stoelen.

Het stadion <u>Gelredome</u> bevat <u>28.000</u> stoelen.

---

ET: STADIUM

ID: Att: Name

Att: Seat_capacity

### Manager

De coach van Manchester United is Ralf Rangnick.

De coach van <u>Vitesse</u> is <u>Thomas Letsch</u>.

---

ET: CLUB
    MATCH

MATCH

ET: COACH
    [moet nog]


RT COACH_of_CLUB tussen CLUB en COACH

### Spelers

#### Rugnummer, voornaam en achternaam

De speler 90 van Manchester United heeft rugnummer 26.

De speler <u>56</u> van <u>Manchester United</u> heeft rugnummer <u>14</u>.

---

ET CLUB_OF_PLAYER

ID: ET: PLAYER + ET: CLUB

RT CLUB_has_PLAYER tussen CLUB_OF_PLAYER(afhankelijk) en CLUB
RT PLAYER_part_of_CLUB tussen CLUB_OF_PLAYER(afhankelijk) en PLAYER
---

MATCH

Att: Jersey_number

### Nationaliteit

De persoon 44 is geboren in Engeland.

De persoon <u>33</u> is geboren in <u>*Engeland*</u>.

---

ET PERSON

MATCH

---

ET COUNTRY

ID: Att: Name

---

RT PERSON_born_in_COUNTRY tussen PLAYER en COUNTRY.

### naam


De speler <u>7</u> van <u>Tottemham Hotspur</u> heet <u>Son Heung-min</u>

ET: PLAYER

MATCH

ET:Club

MATCH

ET:Player_Name

ID: Att: Name

#### Geboortedatum

De speler 90 van Manchester United is geboren op 01/10/2001.

De speler <u>7</u> van <u>Tottemham Hotspur</u> is geboren op <u>08/07/1992</u>.

---

ET: PLAYER

MATCH

ET:Club

MATCH

Att: Birth_date

#### Positie
<!-- 
De speler 90 van Manchester United is verdediger.

De speler <u>91</u> van <u>Manchester United</u> is aanvaller.

---
(type bepaling)
ET: PLAYER

MATCH

Att: Position -->

## Voetbalwedstrijd

Een voetbalwedstrijd wordt gespeeld tijdens een competitie

Een voetbalwedstrijd wordt tussen <u>FC Barcelona</u> en <u>FC Madrid</u> gespeeld op <u>19 april 2002</u> in de <u>speelronde 10</u>.

## Editie

In seizoen 17/18 vond er een editie eredivisie plaats
In seizoen <u>19/20</u> vond er een editie van <u>WK</u> plaats

ET: editie
ID: et seizoen      +       ET: Compitition
ID: Periode             MATCH

### Schoten

Tijdens de voetbalwedstrijd op <u>5 januari 2020</u> tussen thuis team <u>FC Barcelona</u> thuis en uit team <u>FC Madrid</u> uit in de speelronde <u>3 januari 2020</u> in het seizoen <u>20/21</u> in competitie <u>LaLiga</u> heeft het uit team 5 goals geschoten.

ET:VOETBALWEDSTRIJD

ID: ET: MATCHDAY
        ID: ET: SPEELRONDE + ATT: Match_datum
                MATCH

+ ET: CLUB
  MATCH
+ ET:CLUB
  MATCH

RT VOETBALWEDSTRIJD_SPEELDAG tussen VOETBALWEDSTRIJD(afhankelijk) en MATCHDAY
RT VOETBALWEDSTRIJD_thuis_CLUB tussen VOETBALWEDSTRIJD(afhankelijk) en CLUB
RT VOETBALWEDSTRIJD_uit_CLUB tussen VOETBALWDSTRIJD(afhankelijk) en CLUB
-----

ATT: schoten_totaal_thuis


### Schoten_op_Doel_UIT

Tijdens de voetbalwedstrijd op <u>5 januari 2020</u> tussen thuis team <u>FC Barcelona</u> thuis en uit team <u>FC Madrid</u> uit in de speelronde <u>3 januari 2020</u> in het seizoen <u>20/21</u> in competitie <u>LaLiga</u> heeft het uit team <u>5</u> schoten op doel gemaakt.

ET:VOETBALWEDSTRIJD 
    MATCH

ATT: SCHOTEN_OP_DOEL_UIT

### Schoten_op_Doel_THUIS

Tijdens de voetbalwedstrijd op <u>5 januari 2020</u> tussen thuis team <u>FC Barcelona</u> thuis en uit team <u>FC Madrid</u> uit in de speelronde <u>3 januari 2020</u> in het seizoen <u>20/21</u> in competitie <u>LaLiga</u> heeft het thuis team <u>7</u> schoten op doel gemaakt.

ET:VOETBALWEDSTRIJD
MATCH

ATT: SCHOTEN_OP_DOEL_THUIS
### Goals

Tijdens de voetbalwedstrijd op 5 januari 2020 tussen thuis team FC Barcelona en uit team FC Madrid in de speelronde 3 januari 2020 in het seizoen 19/20 in competitie LaLiga heeft het uit team 5 goals gescored.

Tijdens de voetbalwedstrijd op <u>5 januari 2020</u> tussen thuis team <u>FC Barcelona</u> thuis en uit team <u>FC Madrid</u> uit in de speelronde <u>3 januari 2020</u> in het seizoen <u>20/21</u> in competitie <u>LaLiga</u> heeft speler <u>55</u> gescored op <u>48ste</u> minuut. 

ET: VOETBALWEDSTRIJD
    MATCH

ET: SPELER
    MATCH

ID: ET: GOAL
    subtype of ET: EVENT
    ID: ET: VOETBALWEDSTRIJD + ATT: TIME


### Balbezit_UIT
Tijdens de voetbalwedstrijd op 3 februari 2014 tussen thuis team ajax en uit psv in de speelronde 1 februari 2014 in het seizoen 14/15 in competitie NK heeft de uit team 36 balbezit
Tijdens de voetbalwedstrijd op 4 maart 2020 tussen thuis team FC Barcelona en uit team FC Madrid in de speelronde 3 maart 2020 in het seizoen 19/20 in competitie LaLiga heeft het uit team 32% balbezit.

ET: VOETBALWEDSTRIJD
MATCH

ATT: BALBEZIT_UIT

### Balbezit_thuis
Tijdens de voetbalwedstrijd op 3 februari 2014 tussen thuis team ajax en uit psv in de speelronde 1 februari 2014 in het seizoen 14/15 in competitie NK heeft de thuis team 36 balbezit
Tijdens de voetbalwedstrijd op 4 maart 2020 tussen thuis team FC Barcelona en uit team FC Madrid in de speelronde 3 maart 2020 in het seizoen 19/20 in competitie LaLiga heeft het thuis team <u>68%</u> balbezit.

ET: VOETBALWEDSTRIJD
MATCH

ATT: BALBEZIT_THUIS

### aantal passes thuis

Tijdens de voetbalwedstrijd op 3 februari 2014 tussen thuis team ajax en uit psv in de speelronde 1 februari 2014 in het seizoen 14/15 in competitie NK heeft het thuis team 874 passes gemaakt.

Tijdens de voetbalwedstrijd op 4 maart 2020 tussen thuis team FC Barcelona en uit team FC Madrid in de speelronde 3 maart 2020 in het seizoen 19/20 in competitie LaLiga heeft het thuis team <u>947</U> passes gemaakt.

ET: VOETBALWEDSTRIJD
MATCH

ATT: passes

### aantal passes uit

Tijdens de voetbalwedstrijd op 3 februari 2014 tussen thuis team ajax en uit psv in de speelronde 1 februari 2014 in het seizoen 14/15 in competitie NK heeft het uit team 434 passes gemaakt.

Tijdens de voetbalwedstrijd op 4 maart 2020 tussen thuis team FC Barcelona en uit team FC Madrid in de speelronde 3 maart 2020 in het seizoen 19/20 in competitie LaLiga heeft het uit team <u>823</U> passes gemaakt.

ET: VOETBALWEDSTRIJD
MATCH

ATT: passes

### preciesie passes thuis
Tijdens de voetbalwedstrijd op 3 februari 2014 tussen thuis team ajax en uit psv in de speelronde 1 februari 2014 in het seizoen 14/15 in competitie NK heeft het thuis team 65% passes precisie
Tijdens de voetbalwedstrijd op <u>4 maart 2020</u> tussen thuis team <u>FC Barcelona</u> en uit team <u>FC Madrid</u> in de speelronde <u>3 maart 2020</u> in het seizoen <u>19/20</u> in competitie <u>LaLiga</u> heeft het thuis team <u>77%</u> passes precisie.

ET: VOETBALWEDSTRIJD
MATCH

ATT: PRECISIE_PASSES_THUIS

### preciesie passes thuis
Tijdens de voetbalwedstrijd op 3 februari 2014 tussen thuis team ajax en uit psv in de speelronde 1 februari 2014 in het seizoen 14/15 in competitie NK heeft het uit team 35% passes precisie
Tijdens de voetbalwedstrijd op <u>4 maart 2020</u> tussen thuis team <u>FC Barcelona</u> en uit team <u>FC Madrid</u> in de speelronde <u>3 maart 2020</u> in het seizoen <u>19/20</u> in competitie <u>LaLiga</u> heeft het uit team <u>33%</u> passes precisie.

ET: VOETBALWEDSTRIJD
MATCH

ATT: PRECISIE_PASSES_UIT

### Overtredingen

Tijdens de voetbalwedstrijd op 3 februari 2014 tussen thuis team ajax en uit psv in de speelronde 1 februari 2014 in het seizoen 14/15 in competitie NK heeft de speler 55 een speler getackeld in  de 12de minuut.

Tijdens de voetbalwedstrijd op <u>4 maart 2020</u> tussen thuis team <u>FC Barcelona</u> en uit team <u>FC Madrid</u> in de speelronde <u>3 maart 2020</u> in het seizoen <u>19/20</u> in competitie <u>LaLiga</u> heeft de speler <u>Son Heung-min</u> een speler getackeld in  de <u>70ste</u> minuut.

ET:voetbalwedstrijd
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

ET:voetbalwedstrijd
MATCH

ATT: HOEKSCHOP_UIT

### Hoekschoppen_THUIS
Tijdens de voetbalwedstrijd op 4 maart 2020 tussen thuis team ajax en uit team PSV in de speelronde 3 maart 2020 in het seizoen 19/20 in competitie LaLiga heeft de thuis team 23 hoekschoppen gemaakt.
Tijdens de voetbalwedstrijd op <u>4 maart 2020</u> tussen thuis team <u>FC Barcelona</u> en uit team <u>FC Madrid</u> in de speelronde <u>3 maart 2020</u> in het seizoen <u>19/20</u> in competitie <u>LaLiga</u> heeft de thuis team <u>36</u> hoekschoppen gemaakt.

ET:voetbalwedstrijd
MATCH

ATT: HOEKSCHOP_THUIS


### Wissels

<!-- Tijdens de voetbalwedstrijd op 23 maart 2019 was de speler Juan Mata ingewisseld voor Scott McTominay in de 30ste minuut. -->

Tijdens de voetbalwedstrijd op 4 maart 2020 tussen thuis team FC Barcelona en uit team FC Madrid in de speelronde 3 maart 2020 in het seizoen 19/20 in competitie LaLiga werdt de speler 33 ingewisseld voor speler 1111 in de 30ste minuut.  

<!-- Tijdens de voetbalwedstrijd op 23 maart 2019 was de speler Scott McTominay ingewisseld voor Paul Pogba in de 70ste minuut. -->

Tijdens de voetbalwedstrijd op <u>4 maart 2020</u> tussen thuis team <u>FC Barcelona</u> en uit team <u>FC Madrid</u> in de speelronde <u>3 maart 2020</u> in het seizoen <u>19/20</u> in competitie <u>LaLiga</u> werdt de speler <u>55</u> ingewisseld voor speler <u>66</u> in de <u>40ste</u> minuut. 

ET:voetbalwedstrijd
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

ET:voetbalwedstrijd
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

ET: voetbalwedstrijd

ET:Selection
ATT: player
MATCH

#### Aantal toeschouwers

Tijdens de voetbalwedstrijd op 4 maart 2020 tussen thuis team FC Barcelona en uit team FC Madrid in de speelronde 3 maart 2020 in het seizoen 19/20 in competitie LaLiga was het aantal toeschouwers 40000.

Tijdens de voetbalwedstrijd op <u>4 maart 2020</u> tussen thuis team <u>FC Barcelona</u> en uit team <u>FC Madrid</u> in de speelronde <u>3 maart 2020</u> in het seizoen <u>19/20</u> in competitie <u>LaLiga</u> was het aantal toeschouwers 30000.

ET:voetbalwedstrijd
MATCH

Att: Seat_Occupied
