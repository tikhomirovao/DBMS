USE PV_319_DDL;
GO

CREATE TABLE Grades
(
	present		BIT			NULL,
	grade_1		TINYINT		NULL,
	grade_2		TINYINT		NULL,
	student		INT		NOT NULL
	CONSTRAINT FK_Grades_Students FOREIGN KEY REFERENCES Students(student_id),
	lesson		BIGINT	NOT NULL
	CONSTRAINT FK_Grades_Schedule FOREIGN KEY REFERENCES Schedule(lesson_id)
);