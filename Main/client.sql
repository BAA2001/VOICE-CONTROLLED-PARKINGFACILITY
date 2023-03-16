use VOICE_CONTROLLED_PARKINGFACILITY
go

exec stp_applicatie 'Dashboard';

select * from [LOG].dbo.log_message

select * from [PARKEERLOCATIE] order by FK_Kenteken desc;
select * from [CHECK-IN_OUT] order by CheckIn desc;
select * from [TRANSACTIE_GESCHIEDENIS] order by FK_ID desc;