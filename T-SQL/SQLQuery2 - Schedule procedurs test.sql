﻿USE PV_319_Import;
GO

--EXEC sp_SetScheduleForStacionarGroup N'PV_319', N'%UML%', N'Ковтун', N'2024-08-10', N'18:30';
EXEC sp_ScheduleForStacionarGroup N'PD_321', N'%MS SQL Server%', N'Покидюк', N'2024-06-01', N'13:30';

EXEC sp_PrintScheduleForGroup N'PD_321';
--EXEC sp_PrintScheduleForGroupPeriod N'PV_319', '2024-06-01', '2024-07-01';

DECLARE @salary SMALLMONEY;
EXEC @salary = sp_CountTeachersMonthSalary N'Ковтун', 2024, 06;
PRINT (@salary);
--SELECT * FROM Schedule;