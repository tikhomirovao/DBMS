USE PV_319_Import
GO

SELECT
			discipline_name		AS		N'����������',
			COUNT(teacher_id)	AS		N'���������� ��������������'
FROM		Teachers,Disciplines,TeachersDisciplinesRelation
WHERE		teacher		= teacher_id
AND			discipline	= discipline_id
GROUP BY	discipline_name
;

SELECT
			discipline_name			AS N'����������',
			FORMATMESSAGE(N'%s,%s,%s', last_name, first_name, middle_name)	AS N'�������������'

FROM		Teachers,Disciplines,TeachersDisciplinesRelation
WHERE		teacher		= teacher_id
AND			discipline  = discipline_id
ORDER BY	discipline_name
;