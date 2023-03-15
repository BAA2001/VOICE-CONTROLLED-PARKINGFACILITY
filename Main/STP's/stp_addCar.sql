use VOICE_CONTROLLED_PARKINGFACILITY;
go

create or alter procedure stp_addCar
	@user varchar(10),
	@plate varchar(4)
as
	insert into [AUTO] (Kenteken, FK_Naam) values (@plate, @user)
	exec LOG..stp_log 'stp_addCar', @user, @contents= 'Execution Successful';
	return 0;
go