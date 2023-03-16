USE VOICE_CONTROLLED_PARKINGFACILITY;
GO

CREATE OR ALTER FUNCTION func_BerekenTotaal (
	@TotaalTijd int
,	@PrijsPerUur DECIMAL(9,2)
)	RETURNS DECIMAL(9,2)

BEGIN
	DECLARE @TotaalSchade DECIMAL(9,2)
	SET @TotaalSchade = @TotaalTijd * @PrijsPerUur
	return @TotaalSchade;
END
GO

