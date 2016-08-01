-- DB NAME : lecture_schedule
DROP TABLE IF EXISTS lecture;
CREATE TABLE lecture(
	id TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
	lectureName VARCHAR(30) NOT NULL,
	PRIMARY KEY (id)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

INSERT INTO lecture (lectureName) VALUES ('HTML');
INSERT INTO lecture (lectureName) VALUES ('CSS');
INSERT INTO lecture (lectureName) VALUES ('Javascript');
INSERT INTO lecture (lectureName) VALUES ('JAVA');
INSERT INTO lecture (lectureName) VALUES ('PHP');
