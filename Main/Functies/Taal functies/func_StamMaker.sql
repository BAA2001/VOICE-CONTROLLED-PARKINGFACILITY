USE [VOICE_CONTROLLED_PARKINGFACILITY];
GO

CREATE OR ALTER FUNCTION func_StamMaker
(
	@Werkwoord VARCHAR(30)
)

RETURNS VARCHAR(30)
AS
BEGIN

	DECLARE @StamResult VARCHAR
	IF EXISTS(SELECT '' FROM SterkeWW sww WHERE sww.tt2ep = @Werkwoord)
	BEGIN
		SELECT @StamResult = sww.Stam FROM SterkeWW sww WHERE sww.tt2ep = @Werkwoord
	END
	
	ELSE IF
		NOT EXISTS(SELECT '' FROM ZwakkeWW zww WHERE zww.Stam = @Werkwoord)
		AND NOT EXISTS(SELECT '' FROM SterkeWW sww WHERE sww.Stam = @Werkwoord)
	BEGIN
		SELECT @StamResult = (LEFT(@Werkwoord, LEN(@Werkwoord) - 1))
	END

	RETURN @StamResult
END