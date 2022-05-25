USE flm;

GO

CREATE LOGIN Administrator WITH PASSWORD = 'Administr@tor!';
CREATE USER Administrator FOR LOGIN Administrator;

GO

--CRUD access in DB football_league
GRANT SELECT, UPDATE, INSERT, DELETE TO Administrator;

GO

CREATE LOGIN Transport WITH PASSWORD = 'Tr@nsport123!';
CREATE USER Transport FOR LOGIN Transport;

GO

GRANT SELECT TO Transport;