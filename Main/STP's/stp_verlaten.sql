USE VOICE_CONTROLLED_PARKINGFACILITY;
GO	

create or alter procedure stp_verlaten
	@driver varchar(10),
	@plate varchar(10)
as
	if dbo.func_isIkUser(@driver) = 1
		set @driver = dbo.func_getIkUser();

	if dbo.func_isKnownDriver(@driver) = 0
		raiserror(50101,1,1);
	
	if dbo.func_isKnownCar(@plate) = 0
		raiserror(50201,1,1);

	else if dbo.func_doesNameMatchOwner(@driver, @plate) = 0
		raiserror(50202, 1, 1);

	if dbo.func_isCarInGarage(@plate) = 0
		raiserror(50403, 1, 1);


	exec stp_VerwijderBestuurder @driver, @plate;
	exec stp_checkInCar @plate;

	return 0;
go