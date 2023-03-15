use VOICE_CONTROLLED_PARKINGFACILITY;
go

create or alter procedure stp_addDriver
	@user varchar(10)
as
	insert into BESTUURDER (Naam) values (@user)
	exec LOG..stp_log 'stp_addDriver', @user, @contents= 'Execution Successful';
	return 0;
go