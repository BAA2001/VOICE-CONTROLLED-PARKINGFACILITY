use VOICE_CONTROLLED_PARKINGFACILITY;
go

create or alter procedure stp_checkInCar
	@plate varchar(10)
as
	insert into [CHECK-IN_OUT] (FK_Kenteken, CheckIn)
	values (@plate, CURRENT_TIMESTAMP)
go