USE PV_319_Import;
GO

PRINT(dbo.GetLearningDaysFor(N'PV_319'))
--EXEC sp_GetLearningDaysFor N'PV_319';

SELECT
	group_name							AS N'������',
	dbo.GetLearningDaysFor(group_name)	AS N'������� ���'
FROM Groups
;