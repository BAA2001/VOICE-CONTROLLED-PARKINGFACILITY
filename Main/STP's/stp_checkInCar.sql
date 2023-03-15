use VOICE_CONTROLLED_PARKINGFACILITY;
go

create or alter procedure stp_checkInCar
	@plate varchar(10)
as
	insert into [CHECK-IN_OUT] (FK_Kenteken, CheckIn)
	values (@plate, CURRENT_TIMESTAMP)


	exec LOG..stp_log 'stp_checkInCar', @plate, @contents= 'Execution Successful';
	return 0;
go
