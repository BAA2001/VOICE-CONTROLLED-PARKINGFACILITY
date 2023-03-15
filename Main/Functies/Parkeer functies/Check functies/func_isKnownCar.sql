use VOICE_CONTROLLED_PARKINGFACILITY;
go

create or alter function func_isKnownCar (
	@plate varchar(10)
	) returns bit
begin
	if exists (select 1 from [AUTO] where Kenteken = @plate)
		return 1;
	
	return 0;
end
go