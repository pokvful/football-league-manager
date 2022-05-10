USE flm;

GO

CREATE LOGIN Administrator WITH PASSWORD = 'Administr@tor!';
CREATE USER Administrator FOR LOGIN Administrator

GO

CREATE LOGIN Data_analist WITH PASSWORD = 'M@nager!'
CREATE USER Data_analist FOR LOGIN Data_analist

GO

--CRUD access in DB football_league
GRANT SELECT, UPDATE, INSERT, DELETE TO Administrator;

GO

--READ access in DB football_league
GRANT SELECT TO Data_analist;

GO