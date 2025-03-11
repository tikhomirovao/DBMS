USE PV_319_Import;
GO

CREATE FUNCTION GetHolidaysStartDate(@holiday NVARCHAR(150), @year SMALLINT)RETURNS DATE
BEGIN
	DECLARE @month	AS	TINYINT	=	(SELECT [month] FROM Holidays WHERE holiday_name LIKE @holiday);
	DECLARE @day	AS	TINYINT	=	(SELECT [day]	FROM Holidays WHERE holiday_name LIKE @holiday);
	DECLARE @start_date	AS	DATE=
	(
	CASE
	WHEN	@holiday	LIKE N'����������%'	THEN dbo.GetNewYearHolidaysStartDate(@year)
	WHEN	@holiday	LIKE N'������%'	THEN dbo.GetSummerHolidaysStart(@year)
	WHEN	@month!=0 AND @day!=0		THEN DATEFROMPARTS(@year, @month,@day)
	END
	)
	RETURN @start_date;
	--SET @start_date = DATEFROMPARTS(@year,(SELECT))
END