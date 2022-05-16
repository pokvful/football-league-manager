/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2014                    */
/* Created on:     10/05/2022 14:49:44                          */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CITY') and o.name = 'FK_CITY_CITY_LOCA_COUNTRY')
alter table CITY
   drop constraint FK_CITY_CITY_LOCA_COUNTRY
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CLUB') and o.name = 'FK_CLUB_CLUB_LOCA_CITY')
alter table CLUB
   drop constraint FK_CLUB_CLUB_LOCA_CITY
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CLUB') and o.name = 'FK_CLUB_COACH_OF__COACH')
alter table CLUB
   drop constraint FK_CLUB_COACH_OF__COACH
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CLUB') and o.name = 'FK_CLUB_STADIUM_O_STADIUM')
alter table CLUB
   drop constraint FK_CLUB_STADIUM_O_STADIUM
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CLUB_PLAYS_IN_EDITION') and o.name = 'FK_CLUB_PLA_CLUB_PLAY_CLUB')
alter table CLUB_PLAYS_IN_EDITION
   drop constraint FK_CLUB_PLA_CLUB_PLAY_CLUB
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CLUB_PLAYS_IN_EDITION') and o.name = 'FK_CLUB_PLA_CLUB_PLAY_EDITION')
alter table CLUB_PLAYS_IN_EDITION
   drop constraint FK_CLUB_PLA_CLUB_PLAY_EDITION
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('COACH') and o.name = 'FK_COACH_IS_A_PERS_PERSON')
alter table COACH
   drop constraint FK_COACH_IS_A_PERS_PERSON
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CORNER') and o.name = 'FK_CORNER_EVENT_HAP_MATCH')
alter table CORNER
   drop constraint FK_CORNER_EVENT_HAP_MATCH
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CORNER') and o.name = 'FK_CORNER_PERSON_IN_PERSON')
alter table CORNER
   drop constraint FK_CORNER_PERSON_IN_PERSON
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('DOMESTIC_LEAGUE') and o.name = 'FK_DOMESTIC_TYPE_OF_C_COMPETIT')
alter table DOMESTIC_LEAGUE
   drop constraint FK_DOMESTIC_TYPE_OF_C_COMPETIT
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('EDITION') and o.name = 'FK_EDITION_EDITION_I_SEASON')
alter table EDITION
   drop constraint FK_EDITION_EDITION_I_SEASON
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('EDITION') and o.name = 'FK_EDITION_EDITION_O_COMPETIT')
alter table EDITION
   drop constraint FK_EDITION_EDITION_O_COMPETIT
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('FOUL') and o.name = 'FK_FOUL_EVENT_HAP_MATCH')
alter table FOUL
   drop constraint FK_FOUL_EVENT_HAP_MATCH
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('FOUL') and o.name = 'FK_FOUL_PERSON_IN_PERSON')
alter table FOUL
   drop constraint FK_FOUL_PERSON_IN_PERSON
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('GOAL') and o.name = 'FK_GOAL_EVENT_HAP_MATCH')
alter table GOAL
   drop constraint FK_GOAL_EVENT_HAP_MATCH
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('GOAL') and o.name = 'FK_GOAL_PERSON_IN_PERSON')
alter table GOAL
   drop constraint FK_GOAL_PERSON_IN_PERSON
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('MATCH') and o.name = 'FK_MATCH_MATCH_HOM_CLUB')
alter table MATCH
   drop constraint FK_MATCH_MATCH_HOM_CLUB
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('MATCH') and o.name = 'FK_MATCH_MATCH_IN__MATCHDAY')
alter table MATCH
   drop constraint FK_MATCH_MATCH_IN__MATCHDAY
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('MATCH') and o.name = 'FK_MATCH_MATCH_IN__STADIUM')
alter table MATCH
   drop constraint FK_MATCH_MATCH_IN__STADIUM
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('MATCH') and o.name = 'FK_MATCH_MATCH_OUT_CLUB')
alter table MATCH
   drop constraint FK_MATCH_MATCH_OUT_CLUB
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('MATCH') and o.name = 'FK_MATCH_REFEREE_I_REFEREE')
alter table MATCH
   drop constraint FK_MATCH_REFEREE_I_REFEREE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('MATCHDAY') and o.name = 'FK_MATCHDAY_MATCHDAY__ROUND')
alter table MATCHDAY
   drop constraint FK_MATCHDAY_MATCHDAY__ROUND
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PASS') and o.name = 'FK_PASS_EVENT_HAP_MATCH')
alter table PASS
   drop constraint FK_PASS_EVENT_HAP_MATCH
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PASS') and o.name = 'FK_PASS_PERSON_IN_PERSON')
alter table PASS
   drop constraint FK_PASS_PERSON_IN_PERSON
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PERSON') and o.name = 'FK_PERSON_PERSON_NA_COUNTRY')
alter table PERSON
   drop constraint FK_PERSON_PERSON_NA_COUNTRY
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PLAYER') and o.name = 'FK_PLAYER_IS_A_PERS_PERSON')
alter table PLAYER
   drop constraint FK_PLAYER_IS_A_PERS_PERSON
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PLAYER') and o.name = 'FK_PLAYER_PLAYER_IN_CLUB')
alter table PLAYER
   drop constraint FK_PLAYER_PLAYER_IN_CLUB
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PLAYER_AS_RESERVE_IN_MATCH') and o.name = 'FK_PLAYER_A_PLAYER_AS_PLAYER')
alter table PLAYER_AS_RESERVE_IN_MATCH
   drop constraint FK_PLAYER_A_PLAYER_AS_PLAYER
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PLAYER_AS_RESERVE_IN_MATCH') and o.name = 'FK_PLAYER_A_PLAYER_AS_MATCH')
alter table PLAYER_AS_RESERVE_IN_MATCH
   drop constraint FK_PLAYER_A_PLAYER_AS_MATCH
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('POSITION') and o.name = 'FK_POSITION_PLAYER_PL_PLAYER')
alter table POSITION
   drop constraint FK_POSITION_PLAYER_PL_PLAYER
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('POSITION') and o.name = 'FK_POSITION_POSITIONS_MATCH')
alter table POSITION
   drop constraint FK_POSITION_POSITIONS_MATCH
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('RED_CARD') and o.name = 'FK_RED_CARD_EVENT_HAP_MATCH')
alter table RED_CARD
   drop constraint FK_RED_CARD_EVENT_HAP_MATCH
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('RED_CARD') and o.name = 'FK_RED_CARD_PERSON_IN_PERSON')
alter table RED_CARD
   drop constraint FK_RED_CARD_PERSON_IN_PERSON
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('REFEREE') and o.name = 'FK_REFEREE_IS_A_PERS_PERSON')
alter table REFEREE
   drop constraint FK_REFEREE_IS_A_PERS_PERSON
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('ROUND') and o.name = 'FK_ROUND_ROUND_IN__EDITION')
alter table ROUND
   drop constraint FK_ROUND_ROUND_IN__EDITION
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('SHOT') and o.name = 'FK_SHOT_EVENT_HAP_MATCH')
alter table SHOT
   drop constraint FK_SHOT_EVENT_HAP_MATCH
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('SHOT') and o.name = 'FK_SHOT_PERSON_IN_PERSON')
alter table SHOT
   drop constraint FK_SHOT_PERSON_IN_PERSON
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('SUBSTITUTE') and o.name = 'FK_SUBSTITU_EVENT_HAP_MATCH')
alter table SUBSTITUTE
   drop constraint FK_SUBSTITU_EVENT_HAP_MATCH
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('SUBSTITUTE') and o.name = 'FK_SUBSTITU_PERSON_OUT_PERSON')
alter table SUBSTITUTE
   drop constraint FK_SUBSTITU_PERSON_OUT_PERSON
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('SUBSTITUTE') and o.name = 'FK_SUBSTITU_PERSON_IN_PERSON')
alter table SUBSTITUTE
   drop constraint FK_SUBSTITU_PERSON_IN_PERSON
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('YELLOW_CARD') and o.name = 'FK_YELLOW_C_EVENT_HAP_MATCH')
alter table YELLOW_CARD
   drop constraint FK_YELLOW_C_EVENT_HAP_MATCH
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('YELLOW_CARD') and o.name = 'FK_YELLOW_C_PERSON_IN_PERSON')
alter table YELLOW_CARD
   drop constraint FK_YELLOW_C_PERSON_IN_PERSON
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CITY')
            and   name  = 'CITY_LOCATED_IN_COUNTRY_FK'
            and   indid > 0
            and   indid < 255)
   drop index CITY.CITY_LOCATED_IN_COUNTRY_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CITY')
            and   type = 'U')
   drop table CITY
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CLUB')
            and   name  = 'CLUB_LOCATED_IN_CITY_FK'
            and   indid > 0
            and   indid < 255)
   drop index CLUB.CLUB_LOCATED_IN_CITY_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CLUB')
            and   name  = 'STADIUM_OF_A_CLUB2_FK'
            and   indid > 0
            and   indid < 255)
   drop index CLUB.STADIUM_OF_A_CLUB2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CLUB')
            and   name  = 'COACH_OF_CLUB2_FK'
            and   indid > 0
            and   indid < 255)
   drop index CLUB.COACH_OF_CLUB2_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CLUB')
            and   type = 'U')
   drop table CLUB
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CLUB_PLAYS_IN_EDITION')
            and   name  = 'CLUB_PLAYS_IN_EDITION2_FK'
            and   indid > 0
            and   indid < 255)
   drop index CLUB_PLAYS_IN_EDITION.CLUB_PLAYS_IN_EDITION2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CLUB_PLAYS_IN_EDITION')
            and   name  = 'CLUB_PLAYS_IN_EDITION_FK'
            and   indid > 0
            and   indid < 255)
   drop index CLUB_PLAYS_IN_EDITION.CLUB_PLAYS_IN_EDITION_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CLUB_PLAYS_IN_EDITION')
            and   type = 'U')
   drop table CLUB_PLAYS_IN_EDITION
go

if exists (select 1
            from  sysobjects
           where  id = object_id('COACH')
            and   type = 'U')
   drop table COACH
go

if exists (select 1
            from  sysobjects
           where  id = object_id('COMPETITION')
            and   type = 'U')
   drop table COMPETITION
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CORNER')
            and   name  = 'EVENT_HAPPENED_IN_MATCH7_FK'
            and   indid > 0
            and   indid < 255)
   drop index CORNER.EVENT_HAPPENED_IN_MATCH7_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CORNER')
            and   name  = 'PERSON_INVOLVED_IN_EVENT7_FK'
            and   indid > 0
            and   indid < 255)
   drop index CORNER.PERSON_INVOLVED_IN_EVENT7_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CORNER')
            and   type = 'U')
   drop table CORNER
go

if exists (select 1
            from  sysobjects
           where  id = object_id('COUNTRY')
            and   type = 'U')
   drop table COUNTRY
go

if exists (select 1
            from  sysobjects
           where  id = object_id('DOMESTIC_LEAGUE')
            and   type = 'U')
   drop table DOMESTIC_LEAGUE
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('EDITION')
            and   name  = 'EDITION_IN_SEASON_FK'
            and   indid > 0
            and   indid < 255)
   drop index EDITION.EDITION_IN_SEASON_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('EDITION')
            and   type = 'U')
   drop table EDITION
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('FOUL')
            and   name  = 'EVENT_HAPPENED_IN_MATCH8_FK'
            and   indid > 0
            and   indid < 255)
   drop index FOUL.EVENT_HAPPENED_IN_MATCH8_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('FOUL')
            and   name  = 'PERSON_INVOLVED_IN_EVENT8_FK'
            and   indid > 0
            and   indid < 255)
   drop index FOUL.PERSON_INVOLVED_IN_EVENT8_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('FOUL')
            and   type = 'U')
   drop table FOUL
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('GOAL')
            and   name  = 'EVENT_HAPPENED_IN_MATCH3_FK'
            and   indid > 0
            and   indid < 255)
   drop index GOAL.EVENT_HAPPENED_IN_MATCH3_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('GOAL')
            and   name  = 'PERSON_INVOLVED_IN_EVENT3_FK'
            and   indid > 0
            and   indid < 255)
   drop index GOAL.PERSON_INVOLVED_IN_EVENT3_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('GOAL')
            and   type = 'U')
   drop table GOAL
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('MATCH')
            and   name  = 'REFEREE_IN_CHARGE_OF_MATCH_FK'
            and   indid > 0
            and   indid < 255)
   drop index MATCH.REFEREE_IN_CHARGE_OF_MATCH_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('MATCH')
            and   name  = 'MATCH_OUT_CLUB_FK'
            and   indid > 0
            and   indid < 255)
   drop index MATCH.MATCH_OUT_CLUB_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('MATCH')
            and   name  = 'MATCH_HOME_CLUB_FK'
            and   indid > 0
            and   indid < 255)
   drop index MATCH.MATCH_HOME_CLUB_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('MATCH')
            and   name  = 'MATCH_IN_STADIUM_FK'
            and   indid > 0
            and   indid < 255)
   drop index MATCH.MATCH_IN_STADIUM_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('MATCH')
            and   name  = 'MATCH_IN_MATCHDAY_FK'
            and   indid > 0
            and   indid < 255)
   drop index MATCH.MATCH_IN_MATCHDAY_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('MATCH')
            and   type = 'U')
   drop table MATCH
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('MATCHDAY')
            and   name  = 'MATCHDAY_IN_ROUND_FK'
            and   indid > 0
            and   indid < 255)
   drop index MATCHDAY.MATCHDAY_IN_ROUND_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('MATCHDAY')
            and   type = 'U')
   drop table MATCHDAY
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PASS')
            and   name  = 'EVENT_HAPPENED_IN_MATCH5_FK'
            and   indid > 0
            and   indid < 255)
   drop index PASS.EVENT_HAPPENED_IN_MATCH5_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PASS')
            and   name  = 'PERSON_INVOLVED_IN_EVENT5_FK'
            and   indid > 0
            and   indid < 255)
   drop index PASS.PERSON_INVOLVED_IN_EVENT5_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PASS')
            and   type = 'U')
   drop table PASS
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PERSON')
            and   name  = 'PERSON_NATIONALITY_OF_COUNTRY_FK'
            and   indid > 0
            and   indid < 255)
   drop index PERSON.PERSON_NATIONALITY_OF_COUNTRY_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PERSON')
            and   type = 'U')
   drop table PERSON
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PLAYER')
            and   name  = 'PLAYER_IN_CLUB_FK'
            and   indid > 0
            and   indid < 255)
   drop index PLAYER.PLAYER_IN_CLUB_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PLAYER')
            and   type = 'U')
   drop table PLAYER
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PLAYER_AS_RESERVE_IN_MATCH')
            and   name  = 'PLAYER_AS_RESERVE_IN_MATCH2_FK'
            and   indid > 0
            and   indid < 255)
   drop index PLAYER_AS_RESERVE_IN_MATCH.PLAYER_AS_RESERVE_IN_MATCH2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PLAYER_AS_RESERVE_IN_MATCH')
            and   name  = 'PLAYER_AS_RESERVE_IN_MATCH_FK'
            and   indid > 0
            and   indid < 255)
   drop index PLAYER_AS_RESERVE_IN_MATCH.PLAYER_AS_RESERVE_IN_MATCH_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PLAYER_AS_RESERVE_IN_MATCH')
            and   type = 'U')
   drop table PLAYER_AS_RESERVE_IN_MATCH
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('POSITION')
            and   name  = 'POSITIONS_IN_MATCH_FK'
            and   indid > 0
            and   indid < 255)
   drop index POSITION.POSITIONS_IN_MATCH_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('POSITION')
            and   name  = 'PLAYER_PLAYS_ON_POSITION_FK'
            and   indid > 0
            and   indid < 255)
   drop index POSITION.PLAYER_PLAYS_ON_POSITION_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('POSITION')
            and   type = 'U')
   drop table POSITION
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('RED_CARD')
            and   name  = 'EVENT_HAPPENED_IN_MATCH_FK'
            and   indid > 0
            and   indid < 255)
   drop index RED_CARD.EVENT_HAPPENED_IN_MATCH_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('RED_CARD')
            and   name  = 'PERSON_INVOLVED_IN_EVENT_FK'
            and   indid > 0
            and   indid < 255)
   drop index RED_CARD.PERSON_INVOLVED_IN_EVENT_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('RED_CARD')
            and   type = 'U')
   drop table RED_CARD
go

if exists (select 1
            from  sysobjects
           where  id = object_id('REFEREE')
            and   type = 'U')
   drop table REFEREE
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('ROUND')
            and   name  = 'ROUND_IN_EDITION_FK'
            and   indid > 0
            and   indid < 255)
   drop index ROUND.ROUND_IN_EDITION_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('ROUND')
            and   type = 'U')
   drop table ROUND
go

if exists (select 1
            from  sysobjects
           where  id = object_id('SEASON')
            and   type = 'U')
   drop table SEASON
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('SHOT')
            and   name  = 'EVENT_HAPPENED_IN_MATCH6_FK'
            and   indid > 0
            and   indid < 255)
   drop index SHOT.EVENT_HAPPENED_IN_MATCH6_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('SHOT')
            and   name  = 'PERSON_INVOLVED_IN_EVENT6_FK'
            and   indid > 0
            and   indid < 255)
   drop index SHOT.PERSON_INVOLVED_IN_EVENT6_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('SHOT')
            and   type = 'U')
   drop table SHOT
go

if exists (select 1
            from  sysobjects
           where  id = object_id('STADIUM')
            and   type = 'U')
   drop table STADIUM
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('SUBSTITUTE')
            and   name  = 'EVENT_HAPPENED_IN_MATCH4_FK'
            and   indid > 0
            and   indid < 255)
   drop index SUBSTITUTE.EVENT_HAPPENED_IN_MATCH4_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('SUBSTITUTE')
            and   name  = 'PERSON_INVOLVED_IN_EVENT4_FK'
            and   indid > 0
            and   indid < 255)
   drop index SUBSTITUTE.PERSON_INVOLVED_IN_EVENT4_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('SUBSTITUTE')
            and   name  = 'PERSON_IN_SUBSTITUTE_FK'
            and   indid > 0
            and   indid < 255)
   drop index SUBSTITUTE.PERSON_IN_SUBSTITUTE_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('SUBSTITUTE')
            and   type = 'U')
   drop table SUBSTITUTE
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('YELLOW_CARD')
            and   name  = 'EVENT_HAPPENED_IN_MATCH2_FK'
            and   indid > 0
            and   indid < 255)
   drop index YELLOW_CARD.EVENT_HAPPENED_IN_MATCH2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('YELLOW_CARD')
            and   name  = 'PERSON_INVOLVED_IN_EVENT2_FK'
            and   indid > 0
            and   indid < 255)
   drop index YELLOW_CARD.PERSON_INVOLVED_IN_EVENT2_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('YELLOW_CARD')
            and   type = 'U')
   drop table YELLOW_CARD
go

if exists(select 1 from systypes where name='BOOLEAN')
   drop type BOOLEAN
go

if exists(select 1 from systypes where name='CAPACITY')
   drop type CAPACITY
go

if exists(select 1 from systypes where name='CITY_NAME')
   drop type CITY_NAME
go

if exists(select 1 from systypes where name='CLUB_NAME')
   drop type CLUB_NAME
go

if exists(select 1 from systypes where name='COMPETITION_NAME')
   drop type COMPETITION_NAME
go

if exists(select 1 from systypes where name='COUNT')
   drop type COUNT
go

if exists(select 1 from systypes where name='COUNTRY_NAME')
   drop type COUNTRY_NAME
go

if exists(select 1 from systypes where name='EVENT_TYPE')
   drop type EVENT_TYPE
go

if exists(select 1 from systypes where name='G_IDENTITY')
   drop type G_IDENTITY
go

if exists(select 1 from systypes where name='JERSEY_NUMBER')
   drop type JERSEY_NUMBER
go

if exists(select 1 from systypes where name='MINUTE_IN_MATCH')
   drop type MINUTE_IN_MATCH
go

if exists(select 1 from systypes where name='NAME')
   drop type NAME
go

if exists(select 1 from systypes where name='PERCENTAGE')
   drop type PERCENTAGE
go

if exists(select 1 from systypes where name='PERSON_ID')
   drop type PERSON_ID
go

if exists(select 1 from systypes where name='PERSON_TYPE')
   drop type PERSON_TYPE
go

if exists(select 1 from systypes where name='POSITION_TYPE')
   drop type POSITION_TYPE
go

if exists(select 1 from systypes where name='SEASON_NAME')
   drop type SEASON_NAME
go

if exists(select 1 from systypes where name='STADIUM_NAME')
   drop type STADIUM_NAME
go

if exists(select 1 from systypes where name='_DATE_')
   drop type _DATE_
go

if exists(select 1 from systypes where name='_TIME_')
   drop type _TIME_
go

/*==============================================================*/
/* Domain: BOOLEAN                                              */
/*==============================================================*/
create type BOOLEAN
   from bit
go

/*==============================================================*/
/* Domain: CAPACITY                                             */
/*==============================================================*/
create type CAPACITY
   from bigint
go

/*==============================================================*/
/* Domain: CITY_NAME                                            */
/*==============================================================*/
create type CITY_NAME
   from varchar(128)
go

/*==============================================================*/
/* Domain: CLUB_NAME                                            */
/*==============================================================*/
create type CLUB_NAME
   from varchar(128)
go

/*==============================================================*/
/* Domain: COMPETITION_NAME                                     */
/*==============================================================*/
create type COMPETITION_NAME
   from varchar(128)
go

/*==============================================================*/
/* Domain: COUNT                                                */
/*==============================================================*/
create type COUNT
   from bigint
go

/*==============================================================*/
/* Domain: COUNTRY_NAME                                         */
/*==============================================================*/
create type COUNTRY_NAME
   from varchar(128)
go

/*==============================================================*/
/* Domain: EVENT_TYPE                                           */
/*==============================================================*/
create type EVENT_TYPE
   from varchar(128)
go

/*==============================================================*/
/* Domain: G_IDENTITY                                           */
/*==============================================================*/
create type G_IDENTITY
   from bigint
go

/*==============================================================*/
/* Domain: JERSEY_NUMBER                                        */
/*==============================================================*/
create type JERSEY_NUMBER
   from numeric(2,0)
go

/*==============================================================*/
/* Domain: MINUTE_IN_MATCH                                      */
/*==============================================================*/
create type MINUTE_IN_MATCH
   from numeric(6,3)
go

/*==============================================================*/
/* Domain: NAME                                                 */
/*==============================================================*/
create type NAME
   from varchar(128)
go

/*==============================================================*/
/* Domain: PERCENTAGE                                           */
/*==============================================================*/
create type PERCENTAGE
   from numeric(5,2)
go

/*==============================================================*/
/* Domain: PERSON_ID                                            */
/*==============================================================*/
create type PERSON_ID
   from bigint
go

/*==============================================================*/
/* Domain: PERSON_TYPE                                          */
/*==============================================================*/
create type PERSON_TYPE
   from varchar(128)
go

/*==============================================================*/
/* Domain: POSITION_TYPE                                        */
/*==============================================================*/
create type POSITION_TYPE
   from varchar(128)
go

/*==============================================================*/
/* Domain: SEASON_NAME                                          */
/*==============================================================*/
create type SEASON_NAME
   from char(5)
go

/*==============================================================*/
/* Domain: STADIUM_NAME                                         */
/*==============================================================*/
create type STADIUM_NAME
   from varchar(60)
go

/*==============================================================*/
/* Domain: _DATE_                                               */
/*==============================================================*/
create type _DATE_
   from date
go

/*==============================================================*/
/* Domain: _TIME_                                               */
/*==============================================================*/
create type _TIME_
   from time
go

/*==============================================================*/
/* Table: CITY                                                  */
/*==============================================================*/
create table CITY (
   COUNTRY_NAME         COUNTRY_NAME         not null,
   CITY_NAME            CITY_NAME            not null,
   constraint PK_CITY primary key (COUNTRY_NAME, CITY_NAME)
)
go

/*==============================================================*/
/* Index: CITY_LOCATED_IN_COUNTRY_FK                            */
/*==============================================================*/




create nonclustered index CITY_LOCATED_IN_COUNTRY_FK on CITY (COUNTRY_NAME ASC)
go

/*==============================================================*/
/* Table: CLUB                                                  */
/*==============================================================*/
create table CLUB (
   CLUB_NAME            CLUB_NAME            not null,
   STADIUM_NAME         STADIUM_NAME         not null,
   COUNTRY_NAME         COUNTRY_NAME         not null,
   CITY_NAME            CITY_NAME            not null,
   COACH_PERSON_ID      PERSON_ID            not null,
   constraint PK_CLUB primary key (CLUB_NAME)
)
go

/*==============================================================*/
/* Index: COACH_OF_CLUB2_FK                                     */
/*==============================================================*/




create nonclustered index COACH_OF_CLUB2_FK on CLUB (COACH_PERSON_ID ASC)
go

/*==============================================================*/
/* Index: STADIUM_OF_A_CLUB2_FK                                 */
/*==============================================================*/




create nonclustered index STADIUM_OF_A_CLUB2_FK on CLUB (STADIUM_NAME ASC)
go

/*==============================================================*/
/* Index: CLUB_LOCATED_IN_CITY_FK                               */
/*==============================================================*/




create nonclustered index CLUB_LOCATED_IN_CITY_FK on CLUB (COUNTRY_NAME ASC,
  CITY_NAME ASC)
go

/*==============================================================*/
/* Table: CLUB_PLAYS_IN_EDITION                                 */
/*==============================================================*/
create table CLUB_PLAYS_IN_EDITION (
   CLUB_NAME            CLUB_NAME            not null,
   SEASON_NAME          SEASON_NAME          not null,
   COMPETITION_NAME     COMPETITION_NAME     not null,
   constraint PK_CLUB_PLAYS_IN_EDITION primary key (CLUB_NAME, SEASON_NAME, COMPETITION_NAME)
)
go

/*==============================================================*/
/* Index: CLUB_PLAYS_IN_EDITION_FK                              */
/*==============================================================*/




create nonclustered index CLUB_PLAYS_IN_EDITION_FK on CLUB_PLAYS_IN_EDITION (CLUB_NAME ASC)
go

/*==============================================================*/
/* Index: CLUB_PLAYS_IN_EDITION2_FK                             */
/*==============================================================*/




create nonclustered index CLUB_PLAYS_IN_EDITION2_FK on CLUB_PLAYS_IN_EDITION (SEASON_NAME ASC,
  COMPETITION_NAME ASC)
go

/*==============================================================*/
/* Table: COACH                                                 */
/*==============================================================*/
create table COACH (
   PERSON_ID            PERSON_ID            not null,
   constraint PK_COACH primary key (PERSON_ID)
)
go

/*==============================================================*/
/* Table: COMPETITION                                           */
/*==============================================================*/
create table COMPETITION (
   COMPETITION_NAME     COMPETITION_NAME     not null,
   constraint PK_COMPETITION primary key (COMPETITION_NAME)
)
go

/*==============================================================*/
/* Table: CORNER                                                */
/*==============================================================*/
create table CORNER (
   MATCH_ID             G_IDENTITY           not null,
   TIME                 MINUTE_IN_MATCH      not null,
   PERSON_ID            PERSON_ID            not null,
   constraint PK_CORNER primary key (MATCH_ID, TIME)
)
go

/*==============================================================*/
/* Index: PERSON_INVOLVED_IN_EVENT7_FK                          */
/*==============================================================*/




create nonclustered index PERSON_INVOLVED_IN_EVENT7_FK on CORNER (PERSON_ID ASC)
go

/*==============================================================*/
/* Index: EVENT_HAPPENED_IN_MATCH7_FK                           */
/*==============================================================*/




create nonclustered index EVENT_HAPPENED_IN_MATCH7_FK on CORNER (MATCH_ID ASC)
go

/*==============================================================*/
/* Table: COUNTRY                                               */
/*==============================================================*/
create table COUNTRY (
   COUNTRY_NAME         COUNTRY_NAME         not null,
   constraint PK_COUNTRY primary key (COUNTRY_NAME)
)
go

/*==============================================================*/
/* Table: DOMESTIC_LEAGUE                                       */
/*==============================================================*/
create table DOMESTIC_LEAGUE (
   COMPETITION_NAME     COMPETITION_NAME     not null,
   constraint PK_DOMESTIC_LEAGUE primary key (COMPETITION_NAME)
)
go

/*==============================================================*/
/* Table: EDITION                                               */
/*==============================================================*/
create table EDITION (
   SEASON_NAME          SEASON_NAME          not null,
   COMPETITION_NAME     COMPETITION_NAME     not null,
   constraint PK_EDITION primary key (SEASON_NAME, COMPETITION_NAME)
)
go

/*==============================================================*/
/* Index: EDITION_IN_SEASON_FK                                  */
/*==============================================================*/




create nonclustered index EDITION_IN_SEASON_FK on EDITION (SEASON_NAME ASC)
go

/*==============================================================*/
/* Table: FOUL                                                  */
/*==============================================================*/
create table FOUL (
   MATCH_ID             G_IDENTITY           not null,
   TIME                 MINUTE_IN_MATCH      not null,
   PERSON_ID            PERSON_ID            not null,
   constraint PK_FOUL primary key (MATCH_ID, TIME)
)
go

/*==============================================================*/
/* Index: PERSON_INVOLVED_IN_EVENT8_FK                          */
/*==============================================================*/




create nonclustered index PERSON_INVOLVED_IN_EVENT8_FK on FOUL (PERSON_ID ASC)
go

/*==============================================================*/
/* Index: EVENT_HAPPENED_IN_MATCH8_FK                           */
/*==============================================================*/




create nonclustered index EVENT_HAPPENED_IN_MATCH8_FK on FOUL (MATCH_ID ASC)
go

/*==============================================================*/
/* Table: GOAL                                                  */
/*==============================================================*/
create table GOAL (
   MATCH_ID             G_IDENTITY           not null,
   TIME                 MINUTE_IN_MATCH      not null,
   PERSON_ID            PERSON_ID            not null,
   constraint PK_GOAL primary key (MATCH_ID, TIME)
)
go

/*==============================================================*/
/* Index: PERSON_INVOLVED_IN_EVENT3_FK                          */
/*==============================================================*/




create nonclustered index PERSON_INVOLVED_IN_EVENT3_FK on GOAL (PERSON_ID ASC)
go

/*==============================================================*/
/* Index: EVENT_HAPPENED_IN_MATCH3_FK                           */
/*==============================================================*/




create nonclustered index EVENT_HAPPENED_IN_MATCH3_FK on GOAL (MATCH_ID ASC)
go

/*==============================================================*/
/* Table: MATCH                                                 */
/*==============================================================*/
create table MATCH (
   MATCH_ID             G_IDENTITY           identity,
   SEASON_NAME          SEASON_NAME          not null,
   COMPETITION_NAME     COMPETITION_NAME     not null,
   START_DATE           _DATE_               not null,
   MATCH_DAY            _DATE_               not null,
   HOME_CLUB_NAME       CLUB_NAME            not null,
   OUT_CLUB_NAME        CLUB_NAME            not null,
   STADIUM_NAME         STADIUM_NAME         not null,
   REFEREE_PERSON_ID    PERSON_ID            not null,
   BALL_POSSESSION_HOME PERCENTAGE           null,
   BALL_POSSESSION_OUT  PERCENTAGE           null,
   SPECTATORS           COUNT                null,
   constraint PK_MATCH primary key (MATCH_ID),
   constraint AK_AK_2_MATCH unique (SEASON_NAME, COMPETITION_NAME, START_DATE, MATCH_DAY, HOME_CLUB_NAME, OUT_CLUB_NAME)
)
go

/*==============================================================*/
/* Index: MATCH_IN_MATCHDAY_FK                                  */
/*==============================================================*/




create nonclustered index MATCH_IN_MATCHDAY_FK on MATCH (SEASON_NAME ASC,
  COMPETITION_NAME ASC,
  START_DATE ASC,
  MATCH_DAY ASC)
go

/*==============================================================*/
/* Index: MATCH_IN_STADIUM_FK                                   */
/*==============================================================*/




create nonclustered index MATCH_IN_STADIUM_FK on MATCH (STADIUM_NAME ASC)
go

/*==============================================================*/
/* Index: MATCH_HOME_CLUB_FK                                    */
/*==============================================================*/




create nonclustered index MATCH_HOME_CLUB_FK on MATCH (HOME_CLUB_NAME ASC)
go

/*==============================================================*/
/* Index: MATCH_OUT_CLUB_FK                                     */
/*==============================================================*/




create nonclustered index MATCH_OUT_CLUB_FK on MATCH (OUT_CLUB_NAME ASC)
go

/*==============================================================*/
/* Index: REFEREE_IN_CHARGE_OF_MATCH_FK                         */
/*==============================================================*/




create nonclustered index REFEREE_IN_CHARGE_OF_MATCH_FK on MATCH (REFEREE_PERSON_ID ASC)
go

/*==============================================================*/
/* Table: MATCHDAY                                              */
/*==============================================================*/
create table MATCHDAY (
   SEASON_NAME          SEASON_NAME          not null,
   COMPETITION_NAME     COMPETITION_NAME     not null,
   START_DATE           _DATE_               not null,
   MATCH_DAY            _DATE_               not null,
   constraint PK_MATCHDAY primary key (SEASON_NAME, COMPETITION_NAME, START_DATE, MATCH_DAY)
)
go

/*==============================================================*/
/* Index: MATCHDAY_IN_ROUND_FK                                  */
/*==============================================================*/




create nonclustered index MATCHDAY_IN_ROUND_FK on MATCHDAY (SEASON_NAME ASC,
  COMPETITION_NAME ASC,
  START_DATE ASC)
go

/*==============================================================*/
/* Table: PASS                                                  */
/*==============================================================*/
create table PASS (
   MATCH_ID             G_IDENTITY           not null,
   TIME                 MINUTE_IN_MATCH      not null,
   PERSON_ID            PERSON_ID            not null,
   SUCCES               BOOLEAN              not null,
   constraint PK_PASS primary key (MATCH_ID, TIME)
)
go

/*==============================================================*/
/* Index: PERSON_INVOLVED_IN_EVENT5_FK                          */
/*==============================================================*/




create nonclustered index PERSON_INVOLVED_IN_EVENT5_FK on PASS (PERSON_ID ASC)
go

/*==============================================================*/
/* Index: EVENT_HAPPENED_IN_MATCH5_FK                           */
/*==============================================================*/




create nonclustered index EVENT_HAPPENED_IN_MATCH5_FK on PASS (MATCH_ID ASC)
go

/*==============================================================*/
/* Table: PERSON                                                */
/*==============================================================*/
create table PERSON (
   PERSON_ID            PERSON_ID            identity,
   COUNTRY_NAME         COUNTRY_NAME         not null,
   FIRST_NAME           NAME                 not null,
   LAST_NAME            NAME                 not null,
   MIDDLE_NAME          NAME                 null,
   BIRTH_DATE           _DATE_               not null,
   constraint PK_PERSON primary key (PERSON_ID)
)
go

/*==============================================================*/
/* Index: PERSON_NATIONALITY_OF_COUNTRY_FK                      */
/*==============================================================*/




create nonclustered index PERSON_NATIONALITY_OF_COUNTRY_FK on PERSON (COUNTRY_NAME ASC)
go

/*==============================================================*/
/* Table: PLAYER                                                */
/*==============================================================*/
create table PLAYER (
   PERSON_ID            PERSON_ID            not null,
   CLUB_NAME            CLUB_NAME            not null,
   JERSEY               JERSEY_NUMBER        not null,
   constraint PK_PLAYER primary key (PERSON_ID)
)
go

/*==============================================================*/
/* Index: PLAYER_IN_CLUB_FK                                     */
/*==============================================================*/




create nonclustered index PLAYER_IN_CLUB_FK on PLAYER (CLUB_NAME ASC)
go

/*==============================================================*/
/* Table: PLAYER_AS_RESERVE_IN_MATCH                            */
/*==============================================================*/
create table PLAYER_AS_RESERVE_IN_MATCH (
   PLAYER_PERSON_ID     PERSON_ID            not null,
   MATCH_ID             G_IDENTITY           not null,
   constraint PK_PLAYER_AS_RESERVE_IN_MATCH primary key (MATCH_ID, PLAYER_PERSON_ID)
)
go

/*==============================================================*/
/* Index: PLAYER_AS_RESERVE_IN_MATCH_FK                         */
/*==============================================================*/




create nonclustered index PLAYER_AS_RESERVE_IN_MATCH_FK on PLAYER_AS_RESERVE_IN_MATCH (PLAYER_PERSON_ID ASC)
go

/*==============================================================*/
/* Index: PLAYER_AS_RESERVE_IN_MATCH2_FK                        */
/*==============================================================*/




create nonclustered index PLAYER_AS_RESERVE_IN_MATCH2_FK on PLAYER_AS_RESERVE_IN_MATCH (MATCH_ID ASC)
go

/*==============================================================*/
/* Table: POSITION                                              */
/*==============================================================*/
create table POSITION (
   PLAYER_PERSON_ID     PERSON_ID            not null,
   MATCH_ID             G_IDENTITY           not null,
   POSITION_TYPE        POSITION_TYPE        not null,
   constraint PK_POSITION primary key (MATCH_ID, PLAYER_PERSON_ID)
)
go

/*==============================================================*/
/* Index: PLAYER_PLAYS_ON_POSITION_FK                           */
/*==============================================================*/




create nonclustered index PLAYER_PLAYS_ON_POSITION_FK on POSITION (PLAYER_PERSON_ID ASC)
go

/*==============================================================*/
/* Index: POSITIONS_IN_MATCH_FK                                 */
/*==============================================================*/




create nonclustered index POSITIONS_IN_MATCH_FK on POSITION (MATCH_ID ASC)
go

/*==============================================================*/
/* Table: RED_CARD                                              */
/*==============================================================*/
create table RED_CARD (
   MATCH_ID             G_IDENTITY           not null,
   TIME                 MINUTE_IN_MATCH      not null,
   PERSON_ID            PERSON_ID            not null,
   constraint PK_RED_CARD primary key (MATCH_ID, TIME)
)
go

/*==============================================================*/
/* Index: PERSON_INVOLVED_IN_EVENT_FK                           */
/*==============================================================*/




create nonclustered index PERSON_INVOLVED_IN_EVENT_FK on RED_CARD (PERSON_ID ASC)
go

/*==============================================================*/
/* Index: EVENT_HAPPENED_IN_MATCH_FK                            */
/*==============================================================*/




create nonclustered index EVENT_HAPPENED_IN_MATCH_FK on RED_CARD (MATCH_ID ASC)
go

/*==============================================================*/
/* Table: REFEREE                                               */
/*==============================================================*/
create table REFEREE (
   PERSON_ID            PERSON_ID            not null,
   constraint PK_REFEREE primary key (PERSON_ID)
)
go

/*==============================================================*/
/* Table: ROUND                                                 */
/*==============================================================*/
create table ROUND (
   SEASON_NAME          SEASON_NAME          not null,
   COMPETITION_NAME     COMPETITION_NAME     not null,
   START_DATE           _DATE_               not null,
   constraint PK_ROUND primary key (SEASON_NAME, COMPETITION_NAME, START_DATE)
)
go

/*==============================================================*/
/* Index: ROUND_IN_EDITION_FK                                   */
/*==============================================================*/




create nonclustered index ROUND_IN_EDITION_FK on ROUND (SEASON_NAME ASC,
  COMPETITION_NAME ASC)
go

/*==============================================================*/
/* Table: SEASON                                                */
/*==============================================================*/
create table SEASON (
   SEASON_NAME          SEASON_NAME          not null,
   START_DATE           _DATE_               not null,
   END_DATE             _DATE_               not null,
   constraint PK_SEASON primary key (SEASON_NAME)
)
go

/*==============================================================*/
/* Table: SHOT                                                  */
/*==============================================================*/
create table SHOT (
   MATCH_ID             G_IDENTITY           not null,
   TIME                 MINUTE_IN_MATCH      not null,
   PERSON_ID            PERSON_ID            not null,
   ON_GOAL              BOOLEAN              not null,
   constraint PK_SHOT primary key (MATCH_ID, TIME)
)
go

/*==============================================================*/
/* Index: PERSON_INVOLVED_IN_EVENT6_FK                          */
/*==============================================================*/




create nonclustered index PERSON_INVOLVED_IN_EVENT6_FK on SHOT (PERSON_ID ASC)
go

/*==============================================================*/
/* Index: EVENT_HAPPENED_IN_MATCH6_FK                           */
/*==============================================================*/




create nonclustered index EVENT_HAPPENED_IN_MATCH6_FK on SHOT (MATCH_ID ASC)
go

/*==============================================================*/
/* Table: STADIUM                                               */
/*==============================================================*/
create table STADIUM (
   STADIUM_NAME         STADIUM_NAME         not null,
   CAPACITY             CAPACITY             not null,
   constraint PK_STADIUM primary key (STADIUM_NAME)
)
go

/*==============================================================*/
/* Table: SUBSTITUTE                                            */
/*==============================================================*/
create table SUBSTITUTE (
   MATCH_ID             G_IDENTITY           not null,
   TIME                 MINUTE_IN_MATCH      not null,
   IN_PERSON_ID         PERSON_ID            not null,
   OUT_PERSON_ID        PERSON_ID            not null,
   constraint PK_SUBSTITUTE primary key (MATCH_ID, TIME)
)
go

/*==============================================================*/
/* Index: PERSON_IN_SUBSTITUTE_FK                               */
/*==============================================================*/




create nonclustered index PERSON_IN_SUBSTITUTE_FK on SUBSTITUTE (IN_PERSON_ID ASC)
go

/*==============================================================*/
/* Index: PERSON_INVOLVED_IN_EVENT4_FK                          */
/*==============================================================*/




create nonclustered index PERSON_INVOLVED_IN_EVENT4_FK on SUBSTITUTE (OUT_PERSON_ID ASC)
go

/*==============================================================*/
/* Index: EVENT_HAPPENED_IN_MATCH4_FK                           */
/*==============================================================*/




create nonclustered index EVENT_HAPPENED_IN_MATCH4_FK on SUBSTITUTE (MATCH_ID ASC)
go

/*==============================================================*/
/* Table: YELLOW_CARD                                           */
/*==============================================================*/
create table YELLOW_CARD (
   MATCH_ID             G_IDENTITY           not null,
   TIME                 MINUTE_IN_MATCH      not null,
   PERSON_ID            PERSON_ID            not null,
   constraint PK_YELLOW_CARD primary key (MATCH_ID, TIME)
)
go

/*==============================================================*/
/* Index: PERSON_INVOLVED_IN_EVENT2_FK                          */
/*==============================================================*/




create nonclustered index PERSON_INVOLVED_IN_EVENT2_FK on YELLOW_CARD (PERSON_ID ASC)
go

/*==============================================================*/
/* Index: EVENT_HAPPENED_IN_MATCH2_FK                           */
/*==============================================================*/




create nonclustered index EVENT_HAPPENED_IN_MATCH2_FK on YELLOW_CARD (MATCH_ID ASC)
go

alter table CITY
   add constraint FK_CITY_CITY_LOCA_COUNTRY foreign key (COUNTRY_NAME)
      references COUNTRY (COUNTRY_NAME)
         on update cascade
go

alter table CLUB
   add constraint FK_CLUB_CLUB_LOCA_CITY foreign key (COUNTRY_NAME, CITY_NAME)
      references CITY (COUNTRY_NAME, CITY_NAME)
         on update cascade
go

alter table CLUB
   add constraint FK_CLUB_COACH_OF__COACH foreign key (COACH_PERSON_ID)
      references COACH (PERSON_ID)
go

alter table CLUB
   add constraint FK_CLUB_STADIUM_O_STADIUM foreign key (STADIUM_NAME)
      references STADIUM (STADIUM_NAME)
         on update cascade
go

alter table CLUB_PLAYS_IN_EDITION
   add constraint FK_CLUB_PLA_CLUB_PLAY_CLUB foreign key (CLUB_NAME)
      references CLUB (CLUB_NAME)
         on update cascade
go

alter table CLUB_PLAYS_IN_EDITION
   add constraint FK_CLUB_PLA_CLUB_PLAY_EDITION foreign key (SEASON_NAME, COMPETITION_NAME)
      references EDITION (SEASON_NAME, COMPETITION_NAME)
         on update cascade
go

alter table COACH
   add constraint FK_COACH_IS_A_PERS_PERSON foreign key (PERSON_ID)
      references PERSON (PERSON_ID)
         on update cascade
go

alter table CORNER
   add constraint FK_CORNER_EVENT_HAP_MATCH foreign key (MATCH_ID)
      references MATCH (MATCH_ID)
         on update cascade
go

alter table CORNER
   add constraint FK_CORNER_PERSON_IN_PERSON foreign key (PERSON_ID)
      references PERSON (PERSON_ID)
         on update cascade
go

alter table DOMESTIC_LEAGUE
   add constraint FK_DOMESTIC_TYPE_OF_C_COMPETIT foreign key (COMPETITION_NAME)
      references COMPETITION (COMPETITION_NAME)
         on update cascade
go

alter table EDITION
   add constraint FK_EDITION_EDITION_I_SEASON foreign key (SEASON_NAME)
      references SEASON (SEASON_NAME)
         on update cascade
go

alter table EDITION
   add constraint FK_EDITION_EDITION_O_COMPETIT foreign key (COMPETITION_NAME)
      references COMPETITION (COMPETITION_NAME)
         on update cascade
go

alter table FOUL
   add constraint FK_FOUL_EVENT_HAP_MATCH foreign key (MATCH_ID)
      references MATCH (MATCH_ID)
         on update cascade
go

alter table FOUL
   add constraint FK_FOUL_PERSON_IN_PERSON foreign key (PERSON_ID)
      references PERSON (PERSON_ID)
         on update cascade
go

alter table GOAL
   add constraint FK_GOAL_EVENT_HAP_MATCH foreign key (MATCH_ID)
      references MATCH (MATCH_ID)
         on update cascade
go

alter table GOAL
   add constraint FK_GOAL_PERSON_IN_PERSON foreign key (PERSON_ID)
      references PERSON (PERSON_ID)
         on update cascade
go

alter table MATCH
   add constraint FK_MATCH_MATCH_HOM_CLUB foreign key (HOME_CLUB_NAME)
      references CLUB (CLUB_NAME)
go

alter table MATCH
   add constraint FK_MATCH_MATCH_IN__MATCHDAY foreign key (SEASON_NAME, COMPETITION_NAME, START_DATE, MATCH_DAY)
      references MATCHDAY (SEASON_NAME, COMPETITION_NAME, START_DATE, MATCH_DAY)
         on update cascade
go

alter table MATCH
   add constraint FK_MATCH_MATCH_IN__STADIUM foreign key (STADIUM_NAME)
      references STADIUM (STADIUM_NAME)
go

alter table MATCH
   add constraint FK_MATCH_MATCH_OUT_CLUB foreign key (OUT_CLUB_NAME)
      references CLUB (CLUB_NAME)
go

alter table MATCH
   add constraint FK_MATCH_REFEREE_I_REFEREE foreign key (REFEREE_PERSON_ID)
      references REFEREE (PERSON_ID)
         on update cascade
go

alter table MATCHDAY
   add constraint FK_MATCHDAY_MATCHDAY__ROUND foreign key (SEASON_NAME, COMPETITION_NAME, START_DATE)
      references ROUND (SEASON_NAME, COMPETITION_NAME, START_DATE)
         on update cascade
go

alter table PASS
   add constraint FK_PASS_EVENT_HAP_MATCH foreign key (MATCH_ID)
      references MATCH (MATCH_ID)
         on update cascade
go

alter table PASS
   add constraint FK_PASS_PERSON_IN_PERSON foreign key (PERSON_ID)
      references PERSON (PERSON_ID)
         on update cascade
go

alter table PERSON
   add constraint FK_PERSON_PERSON_NA_COUNTRY foreign key (COUNTRY_NAME)
      references COUNTRY (COUNTRY_NAME)
go

alter table PLAYER
   add constraint FK_PLAYER_IS_A_PERS_PERSON foreign key (PERSON_ID)
      references PERSON (PERSON_ID)
         on update cascade
go

alter table PLAYER
   add constraint FK_PLAYER_PLAYER_IN_CLUB foreign key (CLUB_NAME)
      references CLUB (CLUB_NAME)
         on update cascade
go

alter table PLAYER_AS_RESERVE_IN_MATCH
   add constraint FK_PLAYER_A_PLAYER_AS_PLAYER foreign key (PLAYER_PERSON_ID)
      references PLAYER (PERSON_ID)
go

alter table PLAYER_AS_RESERVE_IN_MATCH
   add constraint FK_PLAYER_A_PLAYER_AS_MATCH foreign key (MATCH_ID)
      references MATCH (MATCH_ID)
         on update cascade
go

alter table POSITION
   add constraint FK_POSITION_PLAYER_PL_PLAYER foreign key (PLAYER_PERSON_ID)
      references PLAYER (PERSON_ID)
         on update cascade
go

alter table POSITION
   add constraint FK_POSITION_POSITIONS_MATCH foreign key (MATCH_ID)
      references MATCH (MATCH_ID)
go

alter table RED_CARD
   add constraint FK_RED_CARD_EVENT_HAP_MATCH foreign key (MATCH_ID)
      references MATCH (MATCH_ID)
         on update cascade
go

alter table RED_CARD
   add constraint FK_RED_CARD_PERSON_IN_PERSON foreign key (PERSON_ID)
      references PERSON (PERSON_ID)
         on update cascade
go

alter table REFEREE
   add constraint FK_REFEREE_IS_A_PERS_PERSON foreign key (PERSON_ID)
      references PERSON (PERSON_ID)
go

alter table ROUND
   add constraint FK_ROUND_ROUND_IN__EDITION foreign key (SEASON_NAME, COMPETITION_NAME)
      references EDITION (SEASON_NAME, COMPETITION_NAME)
         on update cascade
go

alter table SHOT
   add constraint FK_SHOT_EVENT_HAP_MATCH foreign key (MATCH_ID)
      references MATCH (MATCH_ID)
         on update cascade
go

alter table SHOT
   add constraint FK_SHOT_PERSON_IN_PERSON foreign key (PERSON_ID)
      references PERSON (PERSON_ID)
         on update cascade
go

alter table SUBSTITUTE
   add constraint FK_SUBSTITU_EVENT_HAP_MATCH foreign key (MATCH_ID)
      references MATCH (MATCH_ID)
         on update cascade
go

alter table SUBSTITUTE
   add constraint FK_SUBSTITU_PERSON_OUT_PERSON foreign key (OUT_PERSON_ID)
      references PERSON (PERSON_ID)
go

alter table SUBSTITUTE
   add constraint FK_SUBSTITU_PERSON_IN_PERSON foreign key (IN_PERSON_ID)
      references PERSON (PERSON_ID)
go

alter table YELLOW_CARD
   add constraint FK_YELLOW_C_EVENT_HAP_MATCH foreign key (MATCH_ID)
      references MATCH (MATCH_ID)
         on update cascade
go

alter table YELLOW_CARD
   add constraint FK_YELLOW_C_PERSON_IN_PERSON foreign key (PERSON_ID)
      references PERSON (PERSON_ID)
         on update cascade
go

