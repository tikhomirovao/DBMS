USE PV_319_Import;
SET DATEFIRST 1;
GO

--SELECT * FROM DaysOFF;

EXEC sp_AddHolidays 2025, N'����%'

SELECT
		[����]		=	[date],
		[��������]	=	holiday_name
FROM	DaysOFF,Holidays
WHERE	holiday = holiday_id;