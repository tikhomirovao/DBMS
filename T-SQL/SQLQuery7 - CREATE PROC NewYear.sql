USE PV_319_Import
SET DATEFIRST 1;
GO

DECLARE @new_year_date		AS DATE			= DATEFROMPARTS(2025,01,01);
DECLARE @weekday			AS TINYINT		= DATEPART(WEEKDAY, @new_year_date);
DECLARE @start_date			AS DATE			= DATEADD(DAY, -@weekday+1, @new_year_date);
PRINT(@new_year_date);
PRINT(@weekday);
PRINT(@start_date);

--CREATE PROCEDURE sp_AddNewYearHolidaysFor
--	@year	AS SMALLINT
--BEGIN
--	DECLARE @start_date AS DATE = DATEADD()
--END