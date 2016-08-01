package com.codingtokyo.zero.teacher.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.codingtokyo.zero.teacher.domain.Teacher;
import com.codingtokyo.zero.teacher.service.TeacherService;

@Controller
@RequestMapping("/teacher")
public class TeacherController {
	
	@Autowired
	TeacherService teacherService;
	
	// 모든 강사 리스트 출력
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView viewTeacherInfo(){
		
		List<Map<String, String>> teacherList = teacherService.displayTeacherList();
		ModelAndView mv = new ModelAndView("teacher/teacher", "teacherList", teacherList);
		return mv;
		
	}
	
	// 선택한 강사의 정보 출력
	@RequestMapping(value = "/find/{teacherID}", method= RequestMethod.GET)
	public ModelAndView findTeacherInfo(@PathVariable String teacherID){
		System.out.println("선택한 강사의 정보 출력 // teacherID : " + teacherID);
		Teacher teacher = teacherService.findTeacherInfoById(teacherID);
		System.out.println(teacher.toString());
		ModelAndView mv = new ModelAndView("teacher/teacher", "teacherInfo", teacher);
		return mv;
		
	}
	
	// 강사 등록
	@RequestMapping(value ="/add", method = RequestMethod.POST)
	public ModelAndView addTeacherInfo(@ModelAttribute Teacher teacher){
		
		ModelAndView mv = new ModelAndView("redirect:/teacher/list");
		teacherService.insertTeacherInfo(teacher);
		return mv;
		
	}
	
	// 강사 정보 수정
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public ModelAndView modifyTeacherInfo(@ModelAttribute Teacher teacher){
		System.out.println("modify ------" + teacher.toString());
		ModelAndView mv = new ModelAndView("redirect:/teacher/list");
		teacherService.modifyTeacherInfo(teacher);
		return mv;
	}
	
	// 강사 정보 삭제
	@RequestMapping(value = "/delete/{teacherID}", method = RequestMethod.POST)
	public ModelAndView deleteTeacherInfo(@PathVariable String teacherID){
		System.out.println("modify ------   , teacherID" + teacherID);
		ModelAndView mv = new ModelAndView("redrect:/teacher/list");
		teacherService.deleteTeacherInfo(teacherID);
		return mv;
	}
	
}
