use ART_GALLERY
go


-- Versions
CREATE PROCEDURE createVersions AS
BEGIN

	CREATE TABLE Versions(Vid Int PRIMARY KEY)

	insert into Versions values(1)
	insert into Versions values(2)
	insert into Versions values(3)
	insert into Versions values(4)
	insert into Versions values(5)
	insert into Versions values(6)
	insert into Versions values(7)
END
GO


CREATE PROCEDURE main @version int AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @nextVersion varchar(50)
	DECLARE @currentVersion int
	SET @currentVersion = (SELECT top 1  Vid from Versions)

	if @version < 0 or @version > 7
	BEGIN
		print('Invalid number')
		return 2
	END

	WHILE @currentVersion < @version
	BEGIN
		SET @currentVersion = @currentVersion + 1
		SET @nextVersion = 'version_up_' + CONVERT(varchar(3), @currentVersion)
		EXECUTE @nextVersion
	END

	WHILE @currentVersion > 1
	BEGIN
		SET @currentVersion = @currentVersion - 1
		SET @nextVersion = 'version_down_' + CONVERT(varchar(3), @currentVersion)
		EXECUTE @nextVersion
	END

	TRUNCATE TABLE Versions
	insert into Versions values(@version)
END
go

EXEC main 6

EXEC version_up_1
EXEC version_down_1
EXEC version_up_2
EXEC version_down_2
EXEC version_up_3
EXEC version_down_3
EXEC version_up_4
EXEC version_down_4
EXEC version_up_5
EXEC version_down_5
EXEC version_up_6
EXEC version_down_6
EXEC version_up_7
EXEC version_down_7

EXEC createVersions

DROP PROCEDURE main 
