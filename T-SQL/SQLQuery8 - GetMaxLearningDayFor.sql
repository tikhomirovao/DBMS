USE PV_319_Import;
GO

ALTER FUNCTION GetMaxLearningDayFor(@group NVARCHAR(10))RETURNS TINYINT
--ALTER PROCEDURE sp_GetMaxLearningDayFor @group NVARCHAR(10)
AS 
BEGIN
	DECLARE 
	@weekdays	AS TINYINT = (SELECT weekdays FROM Groups WHERE group_name = @group),
	@day		AS TINYINT = 6;
	WHILE @day >= 0
	BEGIN
		IF (@weekdays & POWER(2,@day)) != 0
		BEGIN
--			RETURN @day;
--			PRINT 'Next';
--			PRINT @day
			BREAK;
	END
--	PRINT @day;
	SET @day -= 1;
	END
	RETURN @day;
END