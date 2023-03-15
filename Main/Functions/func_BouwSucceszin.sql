USE [VOICE_CONTROLLED_PARKINGFACILITY];
GO

CREATE OR ALTER FUNCTION func_BouwSucceszin
(
)

RETURNS VARCHAR(100)
AS

BEGIN
	DECLARE @Bestuurder VARCHAR(30) = (SELECT dbo.func_LeesBestuurder)
	DECLARE @Stam VARCHAR(30) = (SELECT dbo.func_LeesWerkwoord)
	DECLARE @Kenteken VARCHAR(10) = (SELECT dbo.func_LeesKenteken)
	
	DECLARE @Zin VARCHAR(100)
	DECLARE @Infinitief VARCHAR(30) = (SELECT zww.Infinitief FROM ZwakkeWW zww WHERE zww.Stam = @Stam)
			DECLARE @ZonderEn VARCHAR(30) = (SELECT LEFT(@Infinitief, LEN(@Infinitief)-2))
			DECLARE @Spelling CHAR(1) = IIF
				(RIGHT(@ZonderEn, 1) IN ('t', 'x', 'k', 'f', 's', 'ch', 'p'),
				't', -- Als laatste letter voorkomt in 't x kofschip, dan wordt @spelling: t
				'd') -- Anders wordt @spelling: d


	--Woordvolgorde bij de actie 'parkeren'
	IF ((SELECT sww.actie FROM SterkeWW sww WHERE sww.Stam = @Stam) = 'parkeren' OR (SELECT zww.actie FROM ZwakkeWW zww WHERE zww.Stam = @Stam) = 'parkeren') 
	BEGIN
		IF EXISTS(SELECT '' FROM SterkeWW sww WHERE sww.Stam = @Stam) 
		BEGIN
			SELECT @Zin = CONCAT_WS(
					' '
			,		(UPPER(LEFT(@Bestuurder, 1)) + SUBSTRING(@Bestuurder, 2, LEN(@Bestuurder)))
			,		(SELECT sww.hulpwerkwoord FROM SterkeWW sww WHERE sww.Stam = @Stam)
			,		(CONCAT('zijn auto met kenteken', @kenteken))
			,		(SELECT sww.vd FROM SterkeWW sww WHERE sww.Stam = @Stam)
					) + '.'
		END

		ELSE IF EXISTS(SELECT '' FROM ZwakkeWW zww WHERE zww.Stam = @Stam)
		BEGIN		
			SELECT @Zin = CONCAT_WS(
					' '
			,		(SELECT UPPER(LEFT(@Bestuurder, 1)) + SUBSTRING(@Bestuurder, 2, LEN(@Bestuurder)))
			,		(SELECT zww.hulpwerkwoord FROM ZwakkeWW zww WHERE zww.Stam = @Stam)
			,		(CONCAT('zijn auto met kenteken', @kenteken))
			,		(CONCAT('ge', @Stam, @Spelling))
					) + '.'
		END
	END

	--Woordvolgorde bij de actie 'verlaten'
	ELSE IF (SELECT sww.actie FROM SterkeWW sww WHERE sww.Stam = @Stam) = 'verlaten' OR (SELECT zww.actie FROM ZwakkeWW zww WHERE zww.Stam = @Stam) = 'verlaten'
	BEGIN
		IF EXISTS(SELECT '' FROM SterkeWW sww WHERE sww.Stam = @Stam) 
		BEGIN
			SELECT @Zin = CONCAT_WS(
					' '
			,		(UPPER(LEFT(@Bestuurder, 1)) + SUBSTRING(@Bestuurder, 2, LEN(@Bestuurder)))
			,		'heeft'
			,		FORMAT(98, 'C', 'nl-NL')
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
			,		(FORMAT(98, 'C', 'nl-NL'))
			,		'betaald en'
			,		(SELECT zww.hulpwerkwoord FROM ZwakkeWW zww WHERE zww.Stam = @Stam)
			,		'de parkeergarage'
			,		(CONCAT('ge', @Stam, @Spelling))
					) + '.'
		END
	END

	RETURN @Zin
END