USE [master]

alter database [VOICE_CONTROLLED_PARKINGFACILITY] set single_user with rollback immediate;
alter database [TAAL] set single_user with rollback immediate;
alter database [LOG] set single_user with rollback immediate;

drop database if exists [VOICE_CONTROLLED_PARKINGFACILITY];
drop database if exists [TAAL];
drop database if exists [LOG];

CREATE DATABASE [VOICE_CONTROLLED_PARKINGFACILITY]
CREATE DATABASE [TAAL]
CREATE DATABASE [LOG]

use [VOICE_CONTROLLED_PARKINGFACILITY]
exec sp_addmessage @msgnum=50001, @severity=16, @msgtext='ERROR: De zin moet minstens drie woorden bevatten.', @replace='replace';
exec sp_addmessage @msgnum=50101, @severity=16, @msgtext='ERROR: De bestuurder bestaat niet in de database.', @replace='replace';
exec sp_addmessage @msgnum=50201, @severity=16, @msgtext='ERROR: De auto bestaat niet in de database.', @replace='replace';
exec sp_addmessage @msgnum=50202, @severity=16, @msgtext='ERROR: De auto behoort tot een andere bestuurder.', @replace='replace';
exec sp_addmessage @msgnum=50301, @severity=16, @msgtext='ERROR: Onbekende actie opgegeven.', @replace='replace';
exec sp_addmessage @msgnum=50401, @severity=16, @msgtext='ERROR: Auto staat al in de garage, kan niet parkeren.', @replace='replace';
exec sp_addmessage @msgnum=50402, @severity=16, @msgtext='ERROR: De garage zit vol.', @replace='replace';
exec sp_addmessage @msgnum=50403, @severity=16, @msgtext='ERROR: Auto staat niet in de garage, kan niet verlaten.', @replace='replace';
