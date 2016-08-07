package com.codingtokyo.zero.schedule.domain;

public class Schedule {

	private int id;				// 스케줄ID
	private String year;		// 년도			
	private String month;		// 월
	private String day;			// 일
	private int teacher_id;		// 강사 번호(ID)
	
	public Schedule() {
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public int getTeacher_id() {
		return teacher_id;
	}
	public void setTeacher_id(int teacher_id) {
		this.teacher_id = teacher_id;
	}
	
	@Override
	public String toString() {
		return "Schedule [id=" + id + ", year=" + year + ", month=" + month + ", day=" + day + ", teacher_id="
				+ teacher_id + "]";
	}
	
	
	
	
}
