USE VOICE_CONTROLLED_PARKINGFACILITY;
GO

create or alter procedure stp_VerwijderBestuurder
	@driver VARCHAR(10)
,	@plate	VARCHAR(10)

AS
BEGIN
	DELETE FROM [BESTUURDER] WHERE @driver = Naam;
	DELETE FROM [AUTO] WHERE @plate = Kenteken;
	DELETE FROM [PARKEERLOCATIE] WHERE @plate = FK_Kenteken;
END