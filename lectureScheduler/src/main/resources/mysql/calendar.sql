-- DB NAME : lecture_schedule
DROP TABLE IF EXISTS schedule;
CREATE TABLE schedule(
	id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
	year varchar(4) NOT NULL,
	month VARCHAR(2) NOT NULL,
	day VARCHAR(2) NOT NULL,
	teacher_id TINYINT UNSIGNED,
	PRIMARY KEY(id),
	CONSTRAINT teacher_idfk
		FOREIGN KEY(teacher_id) REFERENCES teacher(id)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

INSERT INTO schedule (year, month, day, teacher_id) VALUES ('2016', '8', '7', 7);