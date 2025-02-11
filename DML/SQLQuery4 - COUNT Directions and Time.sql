USE PV_319_Import
GO

SELECT			[Направление обучения]		= direction_name,
				[Количество часов]			= COUNT(direction_name)
FROM			Directions, Disciplines,DisciplinesDirectionsRelation
WHERE			direction = direction_id
GROUP BY		direction_name