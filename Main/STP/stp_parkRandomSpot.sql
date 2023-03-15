use VOICE_CONTROLLED_PARKINGFACILITY;
go

create or alter procedure stp_parkRandomSpot
	@plate varchar(4)
as
	declare @spot varchar(10);

	select @spot = temp.ParkeerSpot
	from 
	(
		select
			ParkeerSpot, 
			ROW_NUMBER() over 
			( 
				order by ParkeerSpot
			) as temp_number
		from
			PARKEERLOCATIE
		where
			FK_Kenteken is null
	) as temp
	where temp.temp_number = 
	(
		select 
			ceiling(count(1)*rand())
		from
			PARKEERLOCATIE
		where
			FK_Kenteken is null
	)

	update 
		PARKEERLOCATIE
	set
		FK_Kenteken = @plate
	where
		ParkeerSpot = @spot

	exec LOG..stp_log 'stp_parkRandomSpot', @plate, @contents= 'Execution Successful';
	return 0;
go