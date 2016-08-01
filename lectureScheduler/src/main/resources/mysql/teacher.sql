-- DB NAME : lecture_schedule
DROP TABLE IF EXISTS teacher;
CREATE TABLE teacher(
	id TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
	teacherName VARCHAR(30) NOT NULL,
	eMail VARCHAR(30) NOT NULL,
	lecture_id TINYINT UNSIGNED,
	PRIMARY KEY(id),
	CONSTRAINT lecture_idfk
		FOREIGN KEY(lecture_id) REFERENCES lecture(id)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

