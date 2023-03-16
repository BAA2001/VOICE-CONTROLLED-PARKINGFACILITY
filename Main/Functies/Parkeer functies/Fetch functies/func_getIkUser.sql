use VOICE_CONTROLLED_PARKINGFACILITY
go

create or alter function func_getIkUser(
) returns varchar(10)
begin
	declare @result varchar(20)
	select @result = SUSER_NAME();
	select top 1 @result = value from string_split(trim( leading 'USOFT\' from @result ), '.');
	return @result;
end
go

