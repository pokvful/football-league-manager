-- Er is genoeg overgenomen
SELECT COUNT(*) FROM POSITION;

-- Ook de goede data is overgenomen
SELECT TOP 3 * FROM POSITION;

-- Ook de views worden overgenomen
SELECT COUNT(*) FROM VW_GET_PLAYROUND_DATA;

-- Usecase Toevoegen nieuw persoon (referee)
SELECT * FROM REFEREE ORDER BY PERSON_ID DESC;
SELECT TOP 5 * FROM PERSON ORDER BY PERSON_ID DESC;

EXEC PROC_INSERT_NEW_REFEREE @Country_name = 'Greece', @First_name = 'Henk', @Last_name = 'Hank', @Birth_date = '2000-01-01';

SELECT * FROM REFEREE ORDER BY PERSON_ID DESC;
SELECT TOP 5 * FROM PERSON ORDER BY PERSON_ID DESC;

-- Usecase Ophalen tussenstand competitie
EXEC GET_SCORE_EDITION @Season = '19/20', @Competition = 'Eredivisie';

-- Usecase Ophalen clubinfo
EXEC GET_CLUB_INFORMATION @Club = 'Wikido';
