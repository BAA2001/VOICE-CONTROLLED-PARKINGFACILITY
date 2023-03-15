use VOICE_CONTROLLED_PARKINGFACILITY;
go

create or alter function func_doesNameMatchOwner (
	@user varchar(10),
	@plate varchar(10)
	) returns bit
begin
	if exists (select 1 from [AUTO] where Kenteken = @plate and FK_Naam = @user)
		return 1;
	
	return 0;
end
go