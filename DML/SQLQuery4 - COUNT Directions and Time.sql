USE PV_319_Import
GO

SELECT			[����������� ��������]		= direction_name,
				[���������� �����]			= COUNT(direction_name)
FROM			Directions, Disciplines,DisciplinesDirectionsRelation
WHERE			direction = direction_id
GROUP BY		direction_name