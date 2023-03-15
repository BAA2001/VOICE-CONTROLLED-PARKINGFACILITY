USE [VOICE_CONTROLLED_PARKINGFACILITY];
GO

CREATE OR ALTER FUNCTION func_BouwSucceszin
(
	@Bestuurder VARCHAR(30)
,	@Stam VARCHAR(30)
,	@Kenteken VARCHAR(10)
)

RETURNS VARCHAR(100)
AS

BEGIN
	DECLARE @Zin VARCHAR(100)

	IF EXISTS(SELECT '' FROM SterkeWW sww WHERE sww.Stam = @Stam) 
	BEGIN
		SELECT @Zin = CONCAT_WS(
				' '
		,		(SELECT UPPER(LEFT(@Bestuurder, 1)) + SUBSTRING(@Bestuurder, 2, LEN(@Bestuurder)))
		,		(SELECT sww.hulpwerkwoord FROM SterkeWW sww WHERE sww.Stam = @Stam)
		,		(SELECT sww.vd FROM SterkeWW sww WHERE sww.Stam = @Stam)
				) + '.';
	END

	ELSE IF EXISTS(SELECT '' FROM ZwakkeWW zww WHERE zww.Stam = @Stam)
	BEGIN
		DECLARE @Infinitief VARCHAR(30) = (SELECT zww.Infinitief FROM ZwakkeWW zww WHERE zww.Stam = @Stam)
		DECLARE @ZonderEn VARCHAR(30) = (SELECT LEFT(@Infinitief, LEN(@Infinitief)-2))
		DECLARE @Spelling CHAR(1) = IIF
			(RIGHT(@ZonderEn, 1) IN ('t', 'x', 'k', 'f', 's', 'ch', 'p'),
			't', -- Als laatste letter voorkomt in 't x kofschip, dan wordt @spelling: t
			'd') -- Anders wordt @spelling: d
		
		SELECT @Zin = CONCAT_WS(
				' '
		,		(SELECT UPPER(LEFT(@Bestuurder, 1)) + SUBSTRING(@Bestuurder, 2, LEN(@Bestuurder)))
		,		(SELECT zww.hulpwerkwoord FROM ZwakkeWW zww WHERE zww.Stam = @Stam)
		,		CONCAT('ge', @Stam, @Spelling)
				) + '.';
	END

	RETURN @Zin
END