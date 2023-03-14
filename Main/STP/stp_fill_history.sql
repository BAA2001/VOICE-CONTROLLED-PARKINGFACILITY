use VOICE_CONTROLLED_PARKINGFACILITY;
go

create or alter procedure stp_fill_history
	@id int,
	@random float
as
	declare @kenteken varchar(4)
	select @kenteken = kenteken from 
	(
		select kenteken, row_number() over ( order by kenteken ) as temp_number
		from [auto]
	) as temp
	where temp.temp_number = ceiling(@random*100)
	
	declare @starttime datetime, @endtime datetime, @hours int, @hourprice decimal(9,2)
	select top 1 @hourprice = PrijsPerUur from UURPRIJS
	set @hours = @random * 24;
	set @starttime = dateadd(month, @random*(-12), CURRENT_TIMESTAMP)
	set @endtime = dateadd(hour, @hours, @starttime)

	insert into [CHECK-IN_OUT] (ID, FK_Kenteken, CheckIn, CheckOut)
	values (@id, @kenteken, @starttime, @endtime);



	insert into TRANSACTIE_GESCHIEDENIS (FK_ID, FK_Facturering)
	values (@id, @hourprice*@hours);
go