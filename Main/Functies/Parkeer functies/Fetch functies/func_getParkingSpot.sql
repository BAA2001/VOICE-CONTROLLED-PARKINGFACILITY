use VOICE_CONTROLLED_PARKINGFACILITY;
go

create or alter function func_getParkingSpot (
	@plate varchar(10)	
) returns varchar(10)
begin
	declare @result varchar(10);
	
	select 
		@result = ParkeerSpot
	from 
		PARKEERLOCATIE
	where 
		FK_Kenteken = @plate
	
	return @result;
end
go