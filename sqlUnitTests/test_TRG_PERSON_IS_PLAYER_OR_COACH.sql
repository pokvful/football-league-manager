/*
	Test: Trigger that checks if person is player or coach
	Event: Add yellow card to table
	Testing: Exception (player_id not available in position or player_as_reserve_in_match)
*/

EXEC tsqlt.newtestclass 'test_TRG_PERSON_IS_PLAYER_OR_COACH_YELLOW';

CREATE OR ALTER PROCEDURE [Test_Trg_Person_Is_Player_Or_Coach_Yellow].[Test_Trg_Person_Is_Player_Or_Coach_Yellow_Player_Not_Available_Exception]
AS
BEGIN
	-- Assemble:
	EXEC tsqlt.faketable 'PERSON';
	EXEC tsqlt.faketable 'REFEREE';
	EXEC tsqlt.faketable 'MATCH';
	EXEC tsqlt.faketable 'PLAYER_AS_RESERVE_IN_MATCH';
	EXEC tsqlt.faketable 'POSITION';
	EXEC tsqlt.faketable 'YELLOW_CARD';

	INSERT INTO person([Person_Id], [Country_Name], [First_Name], [Last_Name], [Middle_Name], [Birth_Date])
	VALUES (1, 'Nederland', 'Oktay', 'Soyturk', NULL, '1999-05-24'),
		   (2, 'Nederland', 'Yatko', 'Krutyos', NULL, '1999-05-31'),
		   (3, 'Portugal', 'Cristiano', 'Ronaldo', NULL, '1999-05-11'),
		   (4, 'Argentina', 'Lionel', 'Messi', NULL, '1999-02-15')

	INSERT INTO referee([Person_Id])
	VALUES (1);

	INSERT INTO match (match_id, season_name, competition_name, start_date, match_day, home_club_name, out_club_name,
					   stadium_name, referee_person_id, ball_possession_home, ball_possession_out, spectators)
	VALUES (1, 'NL', 'Eredivisie', '2022-02-01', '2022-02-05', 'Ajax', 'Feyenoord', 'Johan Cruijff Arena', 1, 40, 60,
			70000);

	INSERT INTO player_as_reserve_in_match (player_person_id, match_id)
	VALUES (2, 1);

	INSERT INTO position (player_person_id, match_id, position_type)
	VALUES (3, 1, 'Attacker');

	EXEC tsqlt.applytrigger 'YELLOW_CARD', 'TRG_PERSON_IS_PLAYER_OR_COACH_YELLOW';

	-- Expect:
	EXEC tsqlt.expectexception @expectedmessage = 'Player/coach is not available in match!';

	-- Act:
	INSERT INTO yellow_card([Match_Id], [Time], [Person_Id])
	VALUES (1, 15, 4);
END
GO

EXEC tsqlt.run [Test_Trg_Person_Is_Player_Or_Coach_Yellow.Test_Trg_Person_Is_Player_Or_Coach_Yellow_Player_Not_Available_Exception]
GO


/*
	Test: Trigger that checks if person is referee
	Event: Add yellow card to table
	Testing: Exception (player_id is available in table referee)
*/

CREATE OR ALTER PROCEDURE [Test_Trg_Person_Is_Player_Or_Coach_Yellow].[Test_Trg_Person_Is_Player_Or_Coach_Yellow_Player_Is_Referee_Exception]
AS
BEGIN
	-- Assemble:
	EXEC tsqlt.faketable 'PERSON';
	EXEC tsqlt.faketable 'REFEREE';
	EXEC tsqlt.faketable 'MATCH';
	EXEC tsqlt.faketable 'PLAYER_AS_RESERVE_IN_MATCH';
	EXEC tsqlt.faketable 'POSITION';
	EXEC tsqlt.faketable 'YELLOW_CARD';

	INSERT INTO person([Person_Id], [Country_Name], [First_Name], [Last_Name], [Middle_Name], [Birth_Date])
	VALUES (1, 'Nederland', 'Oktay', 'Soyturk', NULL, '1999-05-24'),
		   (2, 'Nederland', 'Yatko', 'Krutyos', NULL, '1999-05-31'),
		   (3, 'Portugal', 'Cristiano', 'Ronaldo', NULL, '1999-05-11'),
		   (4, 'Argentina', 'Lionel', 'Messi', NULL, '1999-02-15')

	INSERT INTO referee([Person_Id])
	VALUES (1);

	INSERT INTO match (match_id, season_name, competition_name, start_date, match_day, home_club_name, out_club_name,
					   stadium_name, referee_person_id, ball_possession_home, ball_possession_out, spectators)
	VALUES (1, 'NL', 'Eredivisie', '2022-02-01', '2022-02-05', 'Ajax', 'Feyenoord', 'Johan Cruijff Arena', 1, 40, 60,
			70000);

	INSERT INTO player_as_reserve_in_match (player_person_id, match_id)
	VALUES (2, 1);

	INSERT INTO position (player_person_id, match_id, position_type)
	VALUES (3, 1, 'Attacker');

	EXEC tsqlt.applytrigger 'YELLOW_CARD', 'TRG_PERSON_IS_PLAYER_OR_COACH_YELLOW';

	-- Expect:
	EXEC tsqlt.expectexception @expectedmessage = 'Referee can not have a yellow card!';

	-- Act:
	INSERT INTO yellow_card([Match_Id], [Time], [Person_Id])
	VALUES (1, 15, 1);
END
GO

EXEC tsqlt.run [Test_Trg_Person_Is_Player_Or_Coach_Yellow.Test_Trg_Person_Is_Player_Or_Coach_Yellow_Player_Is_Referee_Exception]
GO


/*
	Test: Trigger that checks if person is player or coach
	Event: Add yellow card to table
	Testing: No Exception (player_id available in position or player_as_reserve_in_match)
*/

CREATE OR ALTER PROCEDURE [Test_Trg_Person_Is_Player_Or_Coach_Yellow].[Test_Trg_Person_Is_Player_Or_Coach_Yellow_Player_Available_No_Exception]
AS
BEGIN
	-- Assemble:
	EXEC tsqlt.faketable 'PERSON';
	EXEC tsqlt.faketable 'REFEREE';
	EXEC tsqlt.faketable 'MATCH';
	EXEC tsqlt.faketable 'PLAYER_AS_RESERVE_IN_MATCH';
	EXEC tsqlt.faketable 'POSITION';
	EXEC tsqlt.faketable 'YELLOW_CARD';

	INSERT INTO person([Person_Id], [Country_Name], [First_Name], [Last_Name], [Middle_Name], [Birth_Date])
	VALUES (1, 'Nederland', 'Oktay', 'Soyturk', NULL, '1999-05-24'),
		   (2, 'Nederland', 'Yatko', 'Krutyos', NULL, '1999-05-31'),
		   (3, 'Portugal', 'Cristiano', 'Ronaldo', NULL, '1999-05-11'),
		   (4, 'Argentina', 'Lionel', 'Messi', NULL, '1999-02-15')

	INSERT INTO referee([Person_Id])
	VALUES (1);

	INSERT INTO match (match_id, season_name, competition_name, start_date, match_day, home_club_name, out_club_name,
					   stadium_name, referee_person_id, ball_possession_home, ball_possession_out, spectators)
	VALUES (1, 'NL', 'Eredivisie', '2022-02-01', '2022-02-05', 'Ajax', 'Feyenoord', 'Johan Cruijff Arena', 1, 40, 60,
			70000);

	INSERT INTO player_as_reserve_in_match (player_person_id, match_id)
	VALUES (2, 1);

	INSERT INTO position (player_person_id, match_id, position_type)
	VALUES (3, 1, 'Attacker');

	EXEC tsqlt.applytrigger 'YELLOW_CARD', 'TRG_PERSON_IS_PLAYER_OR_COACH_YELLOW';

	-- Expect:
	EXEC tsqlt.ExpectNoException;

	-- Act:
	INSERT INTO yellow_card([Match_Id], [Time], [Person_Id])
	VALUES (1, 15, 3);
END
GO

EXEC tsqlt.run [Test_Trg_Person_Is_Player_Or_Coach_Yellow.Test_Trg_Person_Is_Player_Or_Coach_Yellow_Player_Available_No_Exception]
GO


/*
	Test: Trigger that checks if person is player or coach
	Event: Add red card to table
	Testing: Exception (player_id not available in position or player_as_reserve_in_match)
*/

EXEC tsqlt.newtestclass 'test_TRG_PERSON_IS_PLAYER_OR_COACH_RED';

CREATE OR ALTER PROCEDURE [Test_Trg_Person_Is_Player_Or_Coach_Red].[Test_Trg_Person_Is_Player_Or_Coach_Red_Player_Not_Available_Exception]
AS
BEGIN
	-- Assemble:
	EXEC tsqlt.faketable 'PERSON';
	EXEC tsqlt.faketable 'REFEREE';
	EXEC tsqlt.faketable 'MATCH';
	EXEC tsqlt.faketable 'PLAYER_AS_RESERVE_IN_MATCH';
	EXEC tsqlt.faketable 'POSITION';
	EXEC tsqlt.faketable 'RED_CARD';

	INSERT INTO person([Person_Id], [Country_Name], [First_Name], [Last_Name], [Middle_Name], [Birth_Date])
	VALUES (1, 'Nederland', 'Oktay', 'Soyturk', NULL, '1999-05-24'),
		   (2, 'Nederland', 'Yatko', 'Krutyos', NULL, '1999-05-31'),
		   (3, 'Portugal', 'Cristiano', 'Ronaldo', NULL, '1999-05-11'),
		   (4, 'Argentina', 'Lionel', 'Messi', NULL, '1999-02-15')

	INSERT INTO referee([Person_Id])
	VALUES (1);

	INSERT INTO match (match_id, season_name, competition_name, start_date, match_day, home_club_name, out_club_name,
					   stadium_name, referee_person_id, ball_possession_home, ball_possession_out, spectators)
	VALUES (1, 'NL', 'Eredivisie', '2022-02-01', '2022-02-05', 'Ajax', 'Feyenoord', 'Johan Cruijff Arena', 1, 40, 60,
			70000);

	INSERT INTO player_as_reserve_in_match (player_person_id, match_id)
	VALUES (2, 1);

	INSERT INTO position (player_person_id, match_id, position_type)
	VALUES (3, 1, 'Attacker');

	EXEC tsqlt.applytrigger 'RED_CARD', 'TRG_PERSON_IS_PLAYER_OR_COACH_RED';

	-- Expect:
	EXEC tsqlt.expectexception @expectedmessage = 'Player/coach is not available in match!';

	-- Act:
	INSERT INTO red_card([Match_Id], [Time], [Person_Id])
	VALUES (1, 15, 4);
END
GO

EXEC tsqlt.run [Test_Trg_Person_Is_Player_Or_Coach_Red.Test_Trg_Person_Is_Player_Or_Coach_Red_Player_Not_Available_Exception]
GO


/*
	Test: Trigger that checks if person is referee
	Event: Add red card to table
	Testing: Exception (player_id is available in table referee)
*/

CREATE OR ALTER PROCEDURE [Test_Trg_Person_Is_Player_Or_Coach_Red].[Test_Trg_Person_Is_Player_Or_Coach_Red_Player_Is_Referee_Exception]
AS
BEGIN
	-- Assemble:
	EXEC tsqlt.faketable 'PERSON';
	EXEC tsqlt.faketable 'REFEREE';
	EXEC tsqlt.faketable 'MATCH';
	EXEC tsqlt.faketable 'PLAYER_AS_RESERVE_IN_MATCH';
	EXEC tsqlt.faketable 'POSITION';
	EXEC tsqlt.faketable 'RED_CARD';

	INSERT INTO person([Person_Id], [Country_Name], [First_Name], [Last_Name], [Middle_Name], [Birth_Date])
	VALUES (1, 'Nederland', 'Oktay', 'Soyturk', NULL, '1999-05-24'),
		   (2, 'Nederland', 'Yatko', 'Krutyos', NULL, '1999-05-31'),
		   (3, 'Portugal', 'Cristiano', 'Ronaldo', NULL, '1999-05-11'),
		   (4, 'Argentina', 'Lionel', 'Messi', NULL, '1999-02-15')

	INSERT INTO referee([Person_Id])
	VALUES (1);

	INSERT INTO match (match_id, season_name, competition_name, start_date, match_day, home_club_name, out_club_name,
					   stadium_name, referee_person_id, ball_possession_home, ball_possession_out, spectators)
	VALUES (1, 'NL', 'Eredivisie', '2022-02-01', '2022-02-05', 'Ajax', 'Feyenoord', 'Johan Cruijff Arena', 1, 40, 60,
			70000);

	INSERT INTO player_as_reserve_in_match (player_person_id, match_id)
	VALUES (2, 1);

	INSERT INTO position (player_person_id, match_id, position_type)
	VALUES (3, 1, 'Attacker');

	EXEC tsqlt.applytrigger 'RED_CARD', 'TRG_PERSON_IS_PLAYER_OR_COACH_RED';

	-- Expect:
	EXEC tsqlt.expectexception @expectedmessage = 'Referee can not have a red card!';

	-- Act:
	INSERT INTO red_card([Match_Id], [Time], [Person_Id])
	VALUES (1, 15, 1);
END
GO

EXEC tsqlt.run [Test_Trg_Person_Is_Player_Or_Coach_Red.Test_Trg_Person_Is_Player_Or_Coach_Red_Player_Is_Referee_Exception]
GO


/*
	Test: Trigger that checks if person is player or coach
	Event: Add red card to table
	Testing: No Exception (player_id available in position or player_as_reserve_in_match)
*/

CREATE OR ALTER PROCEDURE [Test_Trg_Person_Is_Player_Or_Coach_Red].[Test_Trg_Person_Is_Player_Or_Coach_Red_Player_Available_No_Exception]
AS
BEGIN
	-- Assemble:
	EXEC tsqlt.faketable 'PERSON';
	EXEC tsqlt.faketable 'REFEREE';
	EXEC tsqlt.faketable 'MATCH';
	EXEC tsqlt.faketable 'PLAYER_AS_RESERVE_IN_MATCH';
	EXEC tsqlt.faketable 'POSITION';
	EXEC tsqlt.faketable 'RED_CARD';

	INSERT INTO person([Person_Id], [Country_Name], [First_Name], [Last_Name], [Middle_Name], [Birth_Date])
	VALUES (1, 'Nederland', 'Oktay', 'Soyturk', NULL, '1999-05-24'),
		   (2, 'Nederland', 'Yatko', 'Krutyos', NULL, '1999-05-31'),
		   (3, 'Portugal', 'Cristiano', 'Ronaldo', NULL, '1999-05-11'),
		   (4, 'Argentina', 'Lionel', 'Messi', NULL, '1999-02-15')

	INSERT INTO referee([Person_Id])
	VALUES (1);

	INSERT INTO match (match_id, season_name, competition_name, start_date, match_day, home_club_name, out_club_name,
					   stadium_name, referee_person_id, ball_possession_home, ball_possession_out, spectators)
	VALUES (1, 'NL', 'Eredivisie', '2022-02-01', '2022-02-05', 'Ajax', 'Feyenoord', 'Johan Cruijff Arena', 1, 40, 60,
			70000);

	INSERT INTO player_as_reserve_in_match (player_person_id, match_id)
	VALUES (2, 1);

	INSERT INTO position (player_person_id, match_id, position_type)
	VALUES (3, 1, 'Attacker');

	EXEC tsqlt.applytrigger 'RED_CARD', 'TRG_PERSON_IS_PLAYER_OR_COACH_RED';

	-- Expect:
	EXEC tsqlt.ExpectNoException;

	-- Act:
	INSERT INTO red_card([Match_Id], [Time], [Person_Id])
	VALUES (1, 15, 3);
END
GO

EXEC tsqlt.run [Test_Trg_Person_Is_Player_Or_Coach_Red.Test_Trg_Person_Is_Player_Or_Coach_Red_Player_Available_No_Exception]
GO

EXEC tsqlt.RunAll