package com.codingtokyo.zero.teacher.domain;

public class Teacher {
	
	private int id;
	private String teacherName;
	private String eMail;
	private int lecture_id;

	public Teacher() {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTeacherName() {
		return teacherName;
	}

	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}

	public String geteMail() {
		return eMail;
	}

	public void seteMail(String eMail) {
		this.eMail = eMail;
	}

	public int getLecture_id() {
		return lecture_id;
	}

	public void setLecture_id(int lecture_id) {
		this.lecture_id = lecture_id;
	}

	@Override
	public String toString() {
		return "Teacher [id=" + id + ", teacherName=" + teacherName + ", eMail=" + eMail + ", lecture_id=" + lecture_id
				+ "]";
	}
	
}
