USE [VOICE_CONTROLLED_PARKINGFACILITY]

IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'TRANSACTIE_GESCHIEDENIS')
BEGIN
	ALTER TABLE [TRANSACTIE_GESCHIEDENIS] DROP CONSTRAINT FK_TransactieID;
	DROP TABLE [TRANSACTIE_GESCHIEDENIS];
END

IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'CHECK-IN_OUT')
BEGIN
	ALTER TABLE [Check-in_out] DROP CONSTRAINT FK_CheckKenteken;
	DROP TABLE [Check-in_out];
END

DROP TABLE IF EXISTS[UURPRIJS]

IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'TRANSACTIE_GESCHIEDENIS')
BEGIN
	ALTER TABLE [TRANSACTIE_GESCHIEDENIS] DROP CONSTRAINT FK_TransactieBestuurder;
	ALTER TABLE [TRANSACTIE_GESCHIEDENIS] DROP CONSTRAINT FK_TransactieKenteken;
	DROP TABLE	[TRANSACTIE_GESCHIEDENIS];
END

IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'PARKEERLOCATIE')
BEGIN
	ALTER TABLE [PARKEERLOCATIE] DROP CONSTRAINT FK_LocatieKenteken;
	DROP TABLE [PARKEERLOCATIE];
END

IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'AUTO')
BEGIN
	ALTER TABLE [AUTO] DROP CONSTRAINT FK_AutoBestuurder;
	DROP TABLE [AUTO];
END

DROP TABLE IF EXISTS [BESTUURDER];

>>>>>>> 46b7aae9d36d31cac92c1f4d563fc05f024e4f76

CREATE TABLE [BESTUURDER] (
	Naam VARCHAR(10) PRIMARY KEY
)

CREATE TABLE [AUTO] (
	Kenteken VARCHAR(10) PRIMARY KEY
,	FK_Naam VARCHAR(10)
,		CONSTRAINT FK_AutoBestuurder FOREIGN KEY (FK_Naam) REFERENCES [BESTUURDER](Naam)
)

CREATE TABLE [PARKEERLOCATIE] (
	ParkeerSpot VARCHAR(10) PRIMARY KEY
,	FK_Kenteken VARCHAR(10)
,		CONSTRAINT FK_LocatieKenteken FOREIGN KEY (FK_Kenteken) REFERENCES [AUTO](Kenteken)
)

CREATE TABLE [UURPRIJS](
	PrijsPerUur DECIMAL(9,2)
)

CREATE TABLE [CHECK-IN_OUT](
	ID INT PRIMARY KEY
,	FK_Kenteken VARCHAR(10)
		CONSTRAINT FK_CheckKenteken FOREIGN KEY (FK_Kenteken) REFERENCES [AUTO](Kenteken)
,	CheckIn DATETIME
,	CheckOut DATETIME
)

CREATE TABLE [TRANSACTIE_GESCHIEDENIS] (
	FK_ID INT PRIMARY KEY
,		CONSTRAINT FK_TransactieID FOREIGN KEY (FK_ID) REFERENCES [CHECK-IN_OUT](ID)
,	FK_Facturering DECIMAL(9,2)
)