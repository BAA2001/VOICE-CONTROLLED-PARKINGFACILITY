use VOICE_CONTROLLED_PARKINGFACILITY;
go

create or alter function func_isCarInGarage (
	@plate varchar(10)
	) returns bit
begin
	if exists (select 1 from [PARKEERLOCATIE] where FK_Kenteken = @plate)
		return 1;
	
	return 0;
end
go