package com.codingtokyo.zero.teacher.mapper;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.codingtokyo.zero.teacher.domain.Teacher;

@Repository("teacherMapper")
public interface TeacherMapper {


	// 등록된 모든 강사정보 출력
	List<Map<String, String>> selectList();

	// 선택한 강사 정보 출력
	Teacher selectOne(String id);

	// 강사 등록
	void insert(Teacher teacher);

	// 강사 정보 수정
	void modify(Teacher teacher);

	// 강사 정보 삭제
	void delete(String id);

	// 메일 중복 검사
	int checkMail(String eMail);

	// 강사 편집시 메일 중복 검사
	String[] isUseMail(String teacherID);

}
