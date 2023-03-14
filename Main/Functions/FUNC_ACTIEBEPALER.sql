USE [VOICE_CONTROLLED_PARKINGFACILITY]
GO 

CREATE OR ALTER FUNCTION FUNC_ActieBepaler
(
	@Stam VARCHAR(10)
)

RETURNS VARCHAR(50)
AS
BEGIN
	DECLARE @Actie VARCHAR(50)

	IF EXISTS (SELECT * FROM ZWAKKEWW WHERE Stam = @Stam)
	BEGIN
		SELECT @Actie = Actie FROM ZWAKKEWW WHERE Stam = @Stam
	END

	ELSE IF EXISTS (SELECT * FROM STERKEWW WHERE Stam = @Stam)
	BEGIN
		SELECT @Actie = Actie FROM STERKEWW WHERE Stam = @Stam
	END
	ELSE
		RAISERROR (50005,1,1)

	RETURN @Actie

END