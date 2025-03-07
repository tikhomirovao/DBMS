﻿USE	PV_319_Import;
GO

SET DATEFIRST 1;

DECLARE @group					AS INT				= (SELECT group_id			FROM Groups					WHERE group_name = N'PV_319');
DECLARE @group_name				AS NVARCHAR(150)	= (SELECT group_name		FROM Groups,Schedule		WHERE group_id = @group);
DECLARE @discipline				AS SMALLINT			= (SELECT discipline_id		FROM Disciplines			WHERE discipline_name LIKE N'Объектно-ориентированное программирование%');
DECLARE @discipline_name		AS NVARCHAR(150)	= (SELECT discipline_name	FROM Disciplines,Schedule	WHERE discipline_id = @discipline);
DECLARE @teacher				AS SMALLINT			= (SELECT teacher_id		FROM Teachers				WHERE first_name = N'Олег');
DECLARE @teacher_name			AS NVARCHAR(150)	= (SELECT first_name		FROM Teachers,Schedule		WHERE teacher_id = @teacher); 
DECLARE @start_date				AS DATE				= N'2024-06-01';
DECLARE @date					AS DATE				= @start_date;
DECLARE @number_of_lessons		AS TINYINT			= (SELECT number_of_lessons FROM Disciplines			WHERE discipline_id = @discipline);
DECLARE @lesson					AS TINYINT			= 1;
DECLARE @time					AS TIME(0)			= N'18:30';
--DECLARE @date_now				AS DATE				= N'2024-06-08'

WHILE(@lesson <= @number_of_lessons)
BEGIN
		PRINT(@group_name);
		PRINT(@discipline_name);
		PRINT(@date);
		PRINT(DATENAME(WEEKDAY, @date));
		PRINT(@lesson);
		PRINT(@time);

		IF NOT EXISTS(SELECT * FROM Schedule WHERE [group]=@group AND discipline=@discipline AND [date]=@date AND [time]=@time)
		BEGIN
			INSERT Schedule
					([group], discipline , teacher, [date], [time], spent)
			VALUES	(@group, @discipline, @teacher, @date, @time, IIF(@date < GETDATE(), 1, 0));
		END
--IIF(condition,value_1,value_2);
		SET @lesson = @lesson + 1;

		PRINT(@lesson);
		PRINT(DATEADD(MINUTE, 95, @time));
		IF NOT EXISTS(SELECT * FROM Schedule WHERE [group]=@group AND discipline=@discipline AND [date]=@date AND [time]=DATEADD(MINUTE,95,@time))
		BEGIN
			INSERT Schedule
						([group], discipline , teacher, [date], [time], spent)
			VALUES	(@group, @discipline, @teacher, @date, DATEADD(MINUTE, 95, @time), IIF(@date < GETDATE(), 1, 0));
		END
		SET @lesson = @lesson + 1;
		PRINT(@teacher_name);
		IF(@date < GETDATE())
		BEGIN
			PRINT N'Проведено'
		END
		IF(@date > GETDATE())
		BEGIN
			PRINT N'Запланировано'
		END
		IF(@date = GETDATE())
		BEGIN
			PRINT N'Занятие сегодня'
		END
		PRINT('-------------------------------');
		IF(DATEPART(WEEKDAY, @date) = 6)
		BEGIN
			SET @date = DATEADD(DAY, 3, @date);
		END
		ELSE
		BEGIN
			SET @date = DATEADD(DAY, 2, @date);
		END
END
--INSERT Schedule
--			([group], discipline, teacher, [date], [time], spent)
--VALUES
--			(319,		1,			1,		N'2023-11-23',N'18:30',	1);
SELECT * FROM Schedule;