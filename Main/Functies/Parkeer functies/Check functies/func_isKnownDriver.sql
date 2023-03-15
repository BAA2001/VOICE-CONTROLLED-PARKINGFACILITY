use VOICE_CONTROLLED_PARKINGFACILITY;
go

create or alter function func_isKnownDriver (
	@user varchar(10)
	) returns bit
begin
	if exists (select 1 from BESTUURDER where Naam = @user)
		return 1;
	
	return 0;
end
go