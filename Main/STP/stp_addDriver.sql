use VOICE_CONTROLLED_PARKINGFACILITY;
go

create or alter procedure stp_addDriver
	@user varchar(10)
as
	insert into BESTUURDER (Naam) values (@user)
	return 0;
go