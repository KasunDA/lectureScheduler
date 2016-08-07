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

	@Override
	public int checkMail(String eMail) {
		return mapper.checkMail(eMail);
	}

	@Override
	public String isUseMail(String teacherID, String eMail) {
		
		// 입력한 메일이 사용할 수 있는지 없는지에 대한 내용을 담은 변수
		String isUseMail = "true";

		String[] usedMailList = mapper.isUseMail(teacherID);

		for(int i = 0; i < usedMailList.length; i++){
			System.out.println(usedMailList[i]);
			if(eMail.equals(usedMailList[i])){
				isUseMail = "false";
			}
		}
		return isUseMail;
	}


}
