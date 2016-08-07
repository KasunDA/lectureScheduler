package com.codingtokyo.zero.teacher.service;

import java.util.List;
import java.util.Map;

import com.codingtokyo.zero.teacher.domain.Teacher;

public interface TeacherService {
	
	// 등록된 모든 강사정보 출력
	List<Map<String, String>> displayTeacherList();

	// 선택한 강사 정보 출력 
	Teacher findTeacherInfoById(String id);
	
	// 강사 등록
	void insertTeacherInfo(Teacher teacher);

	// 강사 정보 수정
	void modifyTeacherInfo(Teacher teacher);

	// 강사 정보 삭제
	void deleteTeacherInfo(String id);

	// 강사 등록시 메일 중복 검사
	int checkMail(String eMail);

	// 강사 편집시 메일 중복 검사
	String isUseMail(String teacherID, String eMail);

}
