USE PV_319_DDL;
GO

CREATE TABLE Exams
(
	grade		TINYINT			NULL,
	student		INT			NOT NULL
	CONSTRAINT FK_Exams_Students FOREIGN KEY REFERENCES Students(student_id),
	lesson		BIGINT	NOT NULL
	CONSTRAINT FK_Exams_Schedule FOREIGN KEY REFERENCES Schedule(lesson_id)
);