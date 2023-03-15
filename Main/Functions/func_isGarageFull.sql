use VOICE_CONTROLLED_PARKINGFACILITY;
go

create or alter function func_isGarageFull () returns bit
begin
	if exists (select 1 from [PARKEERLOCATIE] where FK_Kenteken = null)
		return 0;
	
	return 1;
end
go