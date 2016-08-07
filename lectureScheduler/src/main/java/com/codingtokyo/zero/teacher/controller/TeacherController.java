package com.codingtokyo.zero.teacher.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.codingtokyo.zero.teacher.domain.Teacher;
import com.codingtokyo.zero.teacher.service.TeacherService;

@Controller
@RequestMapping("/teacher")
public class TeacherController {
	
	@Autowired
	TeacherService service;
	
	// 모든 강사 리스트 출력
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView viewTeacherInfo(){
		
		List<Map<String, String>> teacherList = service.displayTeacherList();
		ModelAndView mv = new ModelAndView("teacher/viewTeacher", "teacherList", teacherList);
		return mv;
	}
	
	// 선택한 강사의 정보 출력
	@RequestMapping(value = "/find/{teacherID}", method= RequestMethod.GET)
	public ModelAndView findTeacherInfo(@PathVariable String teacherID){
		
		Teacher teacher = service.findTeacherInfoById(teacherID);
		ModelAndView mv = new ModelAndView("teacher/modifyTeacher", "teacher", teacher);
		return mv;
	}
	
	// 강사 등록
	@RequestMapping(value ="/add", method = RequestMethod.POST)
	public ModelAndView addTeacherInfo(@ModelAttribute Teacher teacher){
		
		ModelAndView mv = new ModelAndView("redirect:/teacher/list");
		service.insertTeacherInfo(teacher);
		return mv;
	}
	
	// 강사 정보 수정
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public ModelAndView modifyTeacherInfo(@ModelAttribute Teacher teacher){
		
		ModelAndView mv = new ModelAndView("redirect:/teacher/list");
		service.modifyTeacherInfo(teacher);
		return mv;
	}
	
	// 강사 정보 삭제
	@RequestMapping(value = "/delete/{teacherID}", method = RequestMethod.POST)
	public ModelAndView deleteTeacherInfo(@PathVariable String teacherID){
		
		ModelAndView mv = new ModelAndView("redirect:/teacher/list");
		service.deleteTeacherInfo(teacherID);
		return mv;
	}
	
	// 등록할 이메일 중복 검사
	@RequestMapping(value = "/chkMail", method = RequestMethod.GET)
	public @ResponseBody int checkMail(@RequestParam String eMail){
		
		return service.checkMail(eMail);
	}
	
	// 편집창 이메일 중복 검사
	@RequestMapping(value = "/chkMail", method = RequestMethod.POST)
	public @ResponseBody String modifyCheckMail(@RequestParam("teacherID") String teacherID, @RequestParam("eMail") String eMail){
		
		return service.isUseMail(teacherID, eMail);
	}
	
}
