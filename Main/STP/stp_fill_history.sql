use VOICE_CONTROLLED_PARKINGFACILITY;
go

create or alter procedure stp_fill_history
	@id int
as
	declare @kenteken varchar(4)
	select @kenteken = kenteken from 
	(
		select kenteken, row_number() over ( order by kenteken ) as temp_number
		from [auto]
	) as temp
	where temp.temp_number = ceiling(rand()*100)
	
	declare @starttime datetime, @endtime datetime, @hours int, @hourprice decimal(9,2)
	select top 1 @hourprice = PrijsPerUur from UURPRIJS
	set @hours = rand() * 24;
	set @starttime = dateadd(month, rand()*(-12), CURRENT_TIMESTAMP)
	set @endtime = dateadd(hour, @hours, @starttime)

	insert into [CHECK-IN_OUT] (ID, FK_Kenteken, CheckIn, CheckOut)
	values (@id, @kenteken, @starttime, @endtime);


	insert into TRANSACTIE_GESCHIEDENIS (FK_ID, FK_Facturering)
	values (@id, @hourprice*@hours);

	exec LOG..stp_log 'stp_fill_history', 'system', @contents= 'Execution Successful';
	return 0;
go