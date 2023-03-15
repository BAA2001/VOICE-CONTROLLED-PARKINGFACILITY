use VOICE_CONTROLLED_PARKINGFACILITY;
go

create or alter procedure stp_parkeren
	@driver varchar(10),
	@plate varchar(10)
as
	exec LOG..stp_log 'stp_parkeren', @driver, @contents= 'Calling dbo.func_isIkUser.';
	if dbo.func_isIkUser(@driver) = 1
	begin	
		exec LOG..stp_log 'stp_parkeren', @driver, @contents= 'Calling dbo.func_getIkUser.';
		set @driver = dbo.func_getIkUser();
	end

	exec LOG..stp_log 'stp_parkeren', @driver, @contents= 'Calling dbo.func_isKnownDriver.';
	if dbo.func_isKnownDriver(@driver) = 0
	begin	
		exec LOG..stp_log 'stp_parkeren', @driver, @contents= 'Executing stp_addDriver.';
		exec stp_addDriver @driver;
	end

	exec LOG..stp_log 'stp_parkeren', @driver, @contents= 'Calling dbo.func_isKnownCar.';
	if dbo.func_isKnownCar(@plate) = 0
	begin	
		exec LOG..stp_log 'stp_parkeren', @driver, @contents= 'Executing stp_addCar.';
		exec stp_addCar @driver, @plate;
	end
	else
	begin
		exec LOG..stp_log 'stp_parkeren', @driver, @contents= 'Calling dbo.func_doesNameMatchOwner.';
		if dbo.func_doesNameMatchOwner(@driver, @plate) = 0
				raiserror(50202, 1, 1);
	end

	exec LOG..stp_log 'stp_parkeren', @driver, @contents= 'Calling dbo.isCarInGarage.';
	if dbo.func_isCarInGarage(@plate) = 1
		raiserror(50401, 1, 1);

	exec LOG..stp_log 'stp_parkeren', @driver, @contents= 'Calling dbo.func_isGarageFull.';
	if dbo.func_isGarageFull() = 1
		raiserror(50402, 1, 1);

	exec LOG..stp_log 'stp_parkeren', @driver, @contents= 'Executing stp_parkRandomSpot.';
	exec stp_parkRandomSpot @plate;
	exec LOG..stp_log 'stp_parkeren', @driver, @contents= 'Executing stp_checkInCar.';
	exec stp_checkInCar @plate;

	exec LOG..stp_log 'stp_parkeren', @driver, @contents= 'Execution Successful';
	return 0;
go