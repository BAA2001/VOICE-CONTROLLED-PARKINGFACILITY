USE VOICE_CONTROLLED_PARKINGFACILITY;
GO

CREATE or ALTER PROCEDURE stp_maakTransactie
	@check_id VARCHAR(10)
AS
BEGIN

	DECLARE @TotaalTijd int
	SET @TotaalTijd = (
		SELECT (DATEDIFF(HOUR, CheckIn,CheckOut)) + 1
		FROM [CHECK-IN_OUT]
		WHERE ID = @check_id
		)

	DECLARE @PrijsPerUur DECIMAL(9,2)
	SET @PrijsPerUur = (SELECT PrijsPerUur FROM [UURPRIJS])

	declare @totaal decimal(9,2)
	set @totaal =  dbo.func_BerekenTotaal( @TotaalTijd, @PrijsPerUur)

	insert into [TRANSACTIE_GESCHIEDENIS] (FK_ID, FK_Facturering) values (@check_id, @totaal);
	return 0;
END	