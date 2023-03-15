use VOICE_CONTROLLED_PARKINGFACILITY
go

create or alter procedure stp_applicatie 
	@zin varchar(100)
as
	set @zin = RTRIM( @zin, '.');
	if @zin = 'dashboard' or @zin = 'Dashboard'
	begin
		exec LOG..stp_log 'stp_applicatie', 'stp', 'Executing stp_showDashboard';
		exec stp_showDashboard;
		exec LOG..stp_log 'stp_applicatie', 'stp', 'Execution successful';
		return 0;
	end

	if 2 >= ( select count(1) from string_split(@zin, ' ') )
	begin
		exec LOG..stp_log 'stp_applicatie', 'stp', 'Execution failed. Error 50001';
		raiserror( 50001, 1, 1)
	end

	declare @bestuurder varchar(30), @kenteken varchar(10), @werkwoord varchar(30);
	set @bestuurder = dbo.func_LeesBestuurder(@zin);
	set @kenteken = dbo.func_LeesKenteken(@zin);
	set @werkwoord = dbo.func_LeesWerkwoord(@zin);

	/*
	if not exists ( select 1 from ZWAKKEWW where Stam = @werkwoord ) 
	and not exists ( select 1 from STERKEWW where Stam = @werkwoord )
		set @werkwoord = RTRIM(@werkwoord, 't');
	*/
	set @werkwoord = (SELECT dbo.func_StamMaker(@werkwoord))

	declare @actie varchar(50)
	set @actie = dbo.func_ActieBepaler(@werkwoord);

	if @actie = 'parkeren'
		exec stp_parkeren @bestuurder, @kenteken;
	else if @actie = 'verlaten'
		exec stp_verlaten @bestuurder, @kenteken;
	else
		raiserror(50301,1,1)

	select dbo.func_BouwSuccesZin(@zin);
go