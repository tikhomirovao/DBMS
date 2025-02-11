USE PV_319_Import;
GO

SELECT
				[�������������]			= FORMATMESSAGE(N'%s %s %s',last_name, first_name, middle_name),
				[���������� ���������]	= COUNT(discipline_name)
FROM			Teachers,Disciplines,TeachersDisciplinesRelation
WHERE			teacher		= teacher_id
AND				discipline	= discipline_id
GROUP BY		last_name, first_name, middle_name
;