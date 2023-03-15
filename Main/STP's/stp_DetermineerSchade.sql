USE VOICE_CONTROLLED_PARKINGFACILITY;
GO

CREATE or ALTER PROCEDURE stp_DetermineerSchade
	@plate VARCHAR(10)

AS
BEGIN

	DECLARE @TotaalTijd DECIMAL(9,2)
	SET @TotaalTijd = (
		SELECT SUM(DATEDIFF(HOUR, CheckIn,CheckOut))
		FROM [CHECK-IN_OUT]
		WHERE FK_Kenteken = @plate
		)

	DECLARE @PrijsPerUur DECIMAL(9,2)
	SET @PrijsPerUur = (SELECT PrijsPerUur FROM [UURPRIJS])

	EXEC func_BerekenTotaal @TotaalTijd, @PrijsPerUur

END	