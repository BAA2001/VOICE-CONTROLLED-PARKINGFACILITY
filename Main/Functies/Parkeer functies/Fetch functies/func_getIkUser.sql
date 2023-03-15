use VOICE_CONTROLLED_PARKINGFACILITY
go

create or alter function func_getIkUser(
) returns varchar(10)
begin
	declare @result varchar(10)
	select top 1 @result = value from string_split(trim( leading 'USOFT\' from SUSER_NAME()), '.')
	exec LOG..stp_log 'func_getIkUser', 'func', @contents= 'Successful return.';
	return @result;
end
go

