USE [master]

ALTER DATABASE [VOICE_CONTROLLED_PARKINGFACILITY] set single_user with rollback immediate;
ALTER DATABASE [TAAL] set single_user with rollback immediate;
ALTER DATABASE [LOG] set single_user with rollback immediate;

DROP DATABASE IF exists [VOICE_CONTROLLED_PARKINGFACILITY];
DROP DATABASE IF exists [TAAL];
DROP DATABASE IF exists [LOG];

CREATE DATABASE [VOICE_CONTROLLED_PARKINGFACILITY]
CREATE DATABASE [TAAL]
CREATE DATABASE [LOG]

USE [VOICE_CONTROLLED_PARKINGFACILITY]
EXEC sp_addmessage @msgnum=50001, @severity=25, @msgtext='ERROR: De zin moet minstens drie woorden bevatten.', @replace='replace';
EXEC sp_addmessage @msgnum=50101, @severity=25, @msgtext='ERROR: De bestuurder bestaat niet in de database.', @replace='replace';
EXEC sp_addmessage @msgnum=50201, @severity=25, @msgtext='ERROR: De auto bestaat niet in de database.', @replace='replace';
EXEC sp_addmessage @msgnum=50202, @severity=25, @msgtext='ERROR: De auto behoort tot een andere bestuurder.', @replace='replace';
EXEC sp_addmessage @msgnum=50301, @severity=25, @msgtext='ERROR: Onbekende actie opgegeven.', @replace='replace';
EXEC sp_addmessage @msgnum=50401, @severity=25, @msgtext='ERROR: Auto staat al in de garage, kan niet parkeren.', @replace='replace';
EXEC sp_addmessage @msgnum=50402, @severity=25, @msgtext='ERROR: De garage zit vol.', @replace='replace';
EXEC sp_addmessage @msgnum=50403, @severity=25, @msgtext='ERROR: Auto staat niet in de garage, kan niet verlaten.', @replace='replace';
