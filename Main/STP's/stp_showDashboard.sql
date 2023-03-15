use VOICE_CONTROLLED_PARKINGFACILITY;
go

create or alter view v_totaal_overzicht as
select 
	 [CHECK-IN_OUT].ID as CheckInID, BESTUURDER.Naam, [AUTO].Kenteken, CheckIn, CheckOut, FK_Facturering as Facturering
from
	bestuurder
inner join [AUTO]
	on BESTUURDER.Naam = [AUTO].FK_Naam
inner join [CHECK-IN_OUT]
	on [AUTO].Kenteken = [CHECK-IN_OUT].FK_Kenteken
left join TRANSACTIE_GESCHIEDENIS
	on TRANSACTIE_GESCHIEDENIS.FK_ID = [CHECK-IN_OUT].ID
go

create or alter view v_huidge_bezetting as
select
	ParkeerSpot, Kenteken, Naam, CheckIn
from
	BESTUURDER
inner join [AUTO]
	on BESTUURDER.Naam = [AUTO].FK_Naam
inner join [CHECK-IN_OUT]
	on [AUTO].Kenteken = [CHECK-IN_OUT].FK_Kenteken
inner join PARKEERLOCATIE
	on PARKEERLOCATIE.FK_Kenteken = [AUTO].Kenteken
go

create or alter view v_omzet as
select
	year(dateadd(month, datediff(month, 0, CheckOut), 0)) as jaar, 
	month(dateadd(month, datediff(month, 0, CheckOut), 0)) as maand,
	sum(FK_Facturering) as omzet
from
	BESTUURDER
inner join [AUTO]
	on BESTUURDER.Naam = [AUTO].FK_Naam
inner join [CHECK-IN_OUT]
	on [AUTO].Kenteken = [CHECK-IN_OUT].FK_Kenteken
inner join TRANSACTIE_GESCHIEDENIS
	on TRANSACTIE_GESCHIEDENIS.FK_ID = [CHECK-IN_OUT].ID
group by dateadd(month, datediff(month, 0, CheckOut), 0)
go

create or alter procedure stp_showDashboard
as
	select * from v_huidge_bezetting;
	select * from v_totaal_overzicht;
	select * from v_omzet;
	exec LOG..stp_log 'stp_showDashboard', 'system', @contents= 'Execution Successful';
	return 0;
go