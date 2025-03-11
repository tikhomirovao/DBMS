USE PV_319_Import;
SET DATEFIRST 1;
GO

ALTER PROCEDURE sp_AddAllHolidaysFor @year AS SMALLINT
AS
BEGIN
	EXEC sp_AddHolidays @year, N'����������%';
	EXEC sp_AddHolidays @year, N'23%';
	EXEC sp_AddHolidays	@year, N'8%';
	EXEC sp_AddHolidays	@year, N'���%';
	EXEC sp_AddHolidays	@year, N'���%';
	EXEC sp_AddHolidays	@year, N'���%';
	EXEC sp_AddHolidays	@year, N'����%';
END