use VOICE_CONTROLLED_PARKINGFACILITY
go

create or alter function func_isIkUser (
	@user varchar(10)
	) returns bit
begin
	if @user = 'ik' or @user = 'Ik'
		return 1;
	
	return 0;
end
go