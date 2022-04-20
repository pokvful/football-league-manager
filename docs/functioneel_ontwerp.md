# Functioneel ontwerp

# Verwoordingen feittypen

## Competitie

### Naam

Er bestaat een competitie Eredivisie.

Er bestaat een competitie <u>Champions League</u>.

---

ET COMPETITION

ID: Att: Name

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

#### Geboortedatum

De speler 90 van Manchester United is geboren op 01/10/2001.

De speler <u>91</u> van <u>Manchester United</u> is geboren op <u>15/12/1992</u>.

---

ET: PLAYER

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

Een wedstrijd wordt tussen FC Barcelona en FC Madrid gespeeld op 19 april 2002 in de speelronde 10.



### Schoten

Tijdens de voetbalwedstrijd tussen FC Barcelona en club FC Madrid in de speelronde 20 seizoen 10 in competitie LaLiga heeft de speler 55 in de 45ste minuut <u>op</u> het doel geschoten.

Tijdens de voetbalwedstrijd tussen FC Barcelona en club FC Madrid in de speelronde 20 seizoen 10 in competitie LaLiga heeft de speler 55 in de 60ste minuut <u>naast</u> het doel geschoten.

### Goals

Tijdens de voetbalwedstrijd tussen FC Barcelona en club FC Madrid in de speelronde 20 seizoen 10 in competitie LaLiga heeft de speler 55 in de 39ste minuut gescoord.

Tijdens de voetbalwedstrijd tussen FC Barcelona en club FC Madrid in de speelronde 20 seizoen 10 in competitie LaLiga heeft de speler 55 in de 75ste minuut gescoord.

### Balbezit

Tijdens de voetbalwedstrijd tussen FC Barcelona en club FC Madrid in de speelronde 20 seizoen 10 in competitie LaLiga had de speler 55 een balbezit van 9%.

Tijdens de voetbalwedstrijd tussen FC Barcelona en club FC Madrid in de speelronde 20 seizoen 10 in competitie LaLiga had de speler 44 een balbezit van 5%.

### Aantal passes

Tijdens de voetbalwedstrijd tussen FC Barcelona en club FC Madrid in de speelronde 20 seizoen 10 in competitie LaLiga heeft de speler 55 25 keer de bal gepaast.

Tijdens de voetbalwedstrijd tussen FC Barcelona en club FC Madrid in de speelronde 20 seizoen 10 in competitie LaLiga heeft de speler 44 30 keer de bal gepaast.

### Overtredingen

Tijdens de voetbalwedstrijd tussen FC Barcelona en club FC Madrid in de speelronde 20 seizoen 10 in competitie LaLiga heeft de speler 55 een speler getackeld in  de 12de minuut.

Tijdens de voetbalwedstrijd tussen FC Barcelona en club FC Madrid in de speelronde 20 seizoen 10 in competitie LaLiga heeft de speler 55 een speler getackeld in  de 70ste minuut.

Tijdens de voetbalwedstrijd op 23 maart 2019 had de speler Jesse Lingard 1 gele kaart gekregen in 30ste minuut.

### Gele kaarten

Tijdens de voetbalwedstrijd tussen FC Barcelona en club FC Madrid in de speelronde 20 seizoen 10 in competitie LaLiga had de speler 55 1 gele kaart gekregen in 12de minuut.

Tijdens de voetbalwedstrijd tussen FC Barcelona en club FC Madrid in de speelronde 20 seizoen 10 in competitie LaLiga had de speler 55 1 gele kaart gekregen in de 70ste minuut.


### Rode kaarten

Tijdens de voetbalwedstrijd tussen FC Barcelona en club FC Madrid in de speelronde 20 seizoen 10 in competitie LaLiga had de speler 55 1 rode kaart gekregen in de 70ste minuut.

Tijdens de voetbalwedstrijd tussen FC Barcelona en club FC Madrid in de speelronde 20 seizoen 10 in competitie LaLiga had de speler 55 1 rode kaart gekregen in de 70ste minuut.

### Buitenspel

Tijdens de voetbalwedstrijd tussen FC Barcelona en club FC Madrid in de speelronde 20 seizoen 10 in competitie LaLiga was de speler 55 buitenspel in de 60ste minuut.

Tijdens de voetbalwedstrijd tussen FC Barcelona en club FC Madrid in de speelronde 20 seizoen 10 in competitie LaLiga was de speler 55 buitenspel in de 81ste minuut.

### Hoekschoppen

Tijdens de voetbalwedstrijd tussen FC Barcelona en club FC Madrid in de speelronde 20 seizoen 10 in competitie LaLiga heeft de speler 33 in de 34ste minuut een hoekschop getrapt.

Tijdens de voetbalwedstrijd tussen FC Barcelona en club FC Madrid in de speelronde 20 seizoen 10 in competitie LaLiga heeft de speler 55 in de 70ste minuut een hoekschop getrapt.

### Wissels

<!-- Tijdens de voetbalwedstrijd op 23 maart 2019 was de speler Juan Mata ingewisseld voor Scott McTominay in de 30ste minuut. -->

Tijdens de voetbalwedstrijd tussen FC Barcelona en club FC Madrid in de speelronde 20 seizoen 10 in competitie LaLiga werdt de speler 33 ingewisseld voor speler 1111 in de 30ste minuut.  

<!-- Tijdens de voetbalwedstrijd op 23 maart 2019 was de speler Scott McTominay ingewisseld voor Paul Pogba in de 70ste minuut. -->

Tijdens de voetbalwedstrijd tussen Sparta en Feyenoord in de speelronde 22 in seizoen 11 in competitie Eredivisie werdt de speler 55 ingewisseld voor speler 66 in de 40ste minuut. 

Tijdens de wedstijd tussen club \<club_1\> en club \<club_2\> in speelronde \<speelronde_nummer\> in seizoen \<seizoen_nummer\> in competitie \<competitie_naam\> werdt de speler \<speler_1\> ingewisseld voor speler \<speler_2\> in de \<minuut\>ste minuut.

## Match day

## Editie

In seizoen 17/18 wordt de Bundes Liga gespeeld.
In seizoen 20/21 wordt de Bundes Liga gespeeld.

### Speelronde

<!-- Binnen de competitie Eredivisie seizoen 17/18 is een speelronde 2.

Binnen de competitie <u>Eredivisie</u> seizoen <u>20/21</u> is een speelronde <u>1</u>. -->

In seizoen 20/21 wordt de Bundes Liga gespeeld daarin komt voor speeldronde 10.
In seizoen 17/18 wordt de Bundes Liga gespeeld daarin komt voor speeldronde 11.


#### Scheidsrechter

Binnen de competitie Eredivisie seizoen 17/18 in speelronde 2 was tijdens de voetbalwedstrijd op 30 maart de scheidsrechter Bas Neijnhuis.

Binnen de competitie <u>Eredivisie</u> seizoen <u>20/21</u> in speelronde <u>1</u> was tijdens de voetbalwedstrijd op <u>30 maart</u> de scheidsrechter <u>Danny Makkelie</u>.

---

ET ROUND

ID: ET: COMPETITION + ET: SEASON + Att: Number

MATCH MATCH

---

ET MATCH

ID: ET: ROUND + Att: Date

#### Club thuis

Binnen de competitie Eredivisie seizoen 20/21 in speelronde 1 tijdens de voetbalwedstrijd op 30 maart speelde Manchester United thuis.

Binnen de competitie Eredivisie seizoen 20/21 in speelronde 2 tijdens de voetbalwedstrijd op 25 maart speelde Vitesse thuis.

#### Club uit

Binnen de competitie Eredivisie seizoen 17/18 in speelronde 1 tijdens de voetbalwedstrijd op 30 maart speelde Vitesse uit.

Binnen de competitie Eredivisie seizoen 20/21 in speelronde 2 tijdens de voetbalwedstrijd op 30 maart speelde Manchester United uit.

### Selectie

Binnen de competitie Eredivisie seizoen 20/21 in speelronde 2 tijdens de voetbalwedstrijd op 30 maart speelde Phil Jones in de selectie.

Binnen de competitie Eredivisie seizoen 20/21 in speelronde 2 tijdens de voetbalwedstrijd op 30 maart speelde Luke Shaw in de selectie.

#### Uitslag

Binnen de competitie Eredivisie seizoen 20/21 in speelronde 2 tijdens de voetbalwedstrijd op 30 maart was de eindstand 3-1.

Binnen de competitie Eredivisie seizoen 20/21 in speelronde 2 tijdens de voetbalwedstrijd op 30 maart was de eindstand 1-2.

#### Aantal toeschouwers

Binnen de competitie Eredivisie seizoen 20/21 in speelronde 1 tijdens de voetbalwedstrijd op 30 maart was het aantal toeschouwers 40000.

Binnen de competitie Eredivisie seizoen 20/21 in speelronde 2 tijdens de voetbalwedstrijd op 23 maart was het aantal toeschouwers 30000.