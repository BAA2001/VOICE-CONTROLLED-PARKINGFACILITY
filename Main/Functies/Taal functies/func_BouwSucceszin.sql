USE [VOICE_CONTROLLED_PARKINGFACILITY];
GO

CREATE OR ALTER FUNCTION func_BouwSucceszin
(
	@zin VARCHAR(100)
)

RETURNS VARCHAR(100)
AS

BEGIN
	DECLARE @Bestuurder VARCHAR(30) = (SELECT dbo.func_LeesBestuurder(@Zin))
	DECLARE @Kenteken VARCHAR(10) = (SELECT dbo.func_LeesKenteken(@Zin))
	DECLARE @Plek VARCHAR(10) = (SELECT pl.ParkeerSpot FROM [PARKEERLOCATIE] pl WHERE pl.FK_Kenteken = @Kenteken)
	DECLARE @TotaalBedrag DEC(9,2) = (SELECT tg.FK_facturering FROM [TRANSACTIE_GESCHIEDENIS] tg JOIN [CHECK-IN_OUT] c ON c.ID = tg.FK_ID WHERE c.FK_Kenteken = @Kenteken)

	DECLARE @Stam VARCHAR(30) = (SELECT dbo.func_Stammaker(dbo.func_LeesWerkwoord(@Zin)))
	DECLARE @Infinitief VARCHAR(30) = (SELECT zww.Infinitief FROM ZwakkeWW zww WHERE zww.Stam = @Stam)
			DECLARE @ZonderEn VARCHAR(30) = (SELECT LEFT(@Infinitief, LEN(@Infinitief)-2))
			DECLARE @Spelling CHAR(1) = IIF
				(RIGHT(@ZonderEn, 1) IN ('t', 'x', 'k', 'f', 's', 'ch', 'p'),
				't', -- Als laatste letter voorkomt in 't x kofschip, dan wordt @spelling: t
				'd') -- Anders wordt @spelling: d


	--Woordvolgorde bij de actie 'parkeren'
	IF (SELECT dbo.FUNC_ActieBepaler(@Stam)) = 'parkeren'
	BEGIN
		IF EXISTS(SELECT '' FROM SterkeWW sww WHERE sww.Stam = @Stam) 
		BEGIN
			SELECT @Zin = CONCAT_WS(
					' '
			,		(UPPER(LEFT(@Bestuurder, 1)) + SUBSTRING(@Bestuurder, 2, LEN(@Bestuurder)))
			,		(SELECT sww.hulpwerkwoord FROM SterkeWW sww WHERE sww.Stam = @Stam)
			,		'zijn auto met kenteken'
			,		@kenteken
			,		'op plek'
			,		@Plek
			,		(SELECT sww.vd FROM SterkeWW sww WHERE sww.Stam = @Stam)
					) + '.'
		END

		ELSE IF EXISTS(SELECT '' FROM ZwakkeWW zww WHERE zww.Stam = @Stam)
		BEGIN		
			SELECT @Zin = CONCAT_WS(
					' '
			,		(SELECT UPPER(LEFT(@Bestuurder, 1)) + SUBSTRING(@Bestuurder, 2, LEN(@Bestuurder)))
			,		(SELECT zww.hulpwerkwoord FROM ZwakkeWW zww WHERE zww.Stam = @Stam)
			,		'zijn auto met kenteken'
			,		@kenteken
			,		'op plek'
			,		@Plek
			,		(CONCAT('ge', @Stam, @Spelling))
					) + '.'
		END
	END

	--Woordvolgorde bij de actie 'verlaten'
	ELSE 	IF (SELECT dbo.FUNC_ActieBepaler(@Stam)) = 'verlaten'
	BEGIN
		IF EXISTS(SELECT '' FROM SterkeWW sww WHERE sww.Stam = @Stam) 
		BEGIN
			SELECT @Zin = CONCAT_WS(
					' '
			,		(UPPER(LEFT(@Bestuurder, 1)) + SUBSTRING(@Bestuurder, 2, LEN(@Bestuurder)))
			,		'heeft'
			,		'voor zijn auto met kenteken'
			,		@Kenteken
			,		FORMAT(@TotaalBedrag, 'C', 'nl-NL')
			,		'betaald en'
			,		(SELECT sww.hulpwerkwoord FROM SterkeWW sww WHERE sww.Stam = @Stam)
			,		'de parkeergarage'
			,		(SELECT sww.vd FROM SterkeWW sww WHERE sww.Stam = @Stam)
					) + '.'
		END

		ELSE IF EXISTS(SELECT '' FROM ZwakkeWW zww WHERE zww.Stam = @Stam)
		BEGIN
			SELECT @Zin = CONCAT_WS(
					' '
			,		(SELECT UPPER(LEFT(@Bestuurder, 1)) + SUBSTRING(@Bestuurder, 2, LEN(@Bestuurder)))
			,		'heeft'
			,		'voor zijn auto met kenteken'
			,		@Kenteken
			,		(FORMAT(@TotaalBedrag, 'C', 'nl-NL'))
			,		'betaald en'
			,		(SELECT zww.hulpwerkwoord FROM ZwakkeWW zww WHERE zww.Stam = @Stam)
			,		'de parkeergarage'
			,		(CONCAT('ge', @Stam, @Spelling))
					) + '.'
		END
	END

	RETURN @Zin
END