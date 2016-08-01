package com.codingtokyo.zero.teacher.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.codingtokyo.zero.teacher.domain.Teacher;
import com.codingtokyo.zero.teacher.mapper.TeacherMapper;

@Service("teacherService")
public class TeacherServiceImpl implements TeacherService {
	
	@Resource(name = "teacherMapper")
	TeacherMapper mapper;


	@Override
	public List<Map<String, String>> displayTeacherList() {
		List<Map<String, String>> teacherList = mapper.selectList();
		return teacherList;
	}

	@Override
	public Teacher findTeacherInfoById(String id) {
		Teacher teacher = mapper.selectOne(id);
		return teacher;
	}
	
	@Override
	public void insertTeacherInfo(Teacher teacher) {
		mapper.insert(teacher);
	}

	@Override
	public void modifyTeacherInfo(Teacher teacher) {
		mapper.modify(teacher);
	}

	@Override
	public void deleteTeacherInfo(String id) {
		mapper.delete(id);
	}


}
