package com.codingtokyo.zero.schedule.controller;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.codingtokyo.zero.schedule.domain.Schedule;
import com.codingtokyo.zero.schedule.service.ScheduleService;

@Controller
@RequestMapping("/schedule")
public class ScheduleController {

	@Autowired
	ScheduleService service;
	
	@RequestMapping(value = "/viewSchedule", method = RequestMethod.GET)
	public ModelAndView viewSchedule(@ModelAttribute Schedule schedule){

		List<Map<String, String>> scheduleList = service.displayScheduleList();
		
	
		Calendar calendar = Calendar.getInstance();				// Calendar 객체 호출
		int year = calendar.get(Calendar.YEAR);					// 현재 년도
		int month = calendar.get(Calendar.MONTH) + 1;			// 현재 월
		
		
		calendar.set(year, month-1, 1);							// Setting
//		year = calendar.get(Calendar.YEAR);
//		month = calendar.get(Calendar.MONTH) + 1;
		
		int week = calendar.get(Calendar.DAY_OF_WEEK);			// 이 달의 몇째주
		int endDay = calendar.getActualMaximum(Calendar.DATE);	// 이 달의 마지막 날짜

		Map<String, Integer> calendarMap = new HashMap<String, Integer>();
		calendarMap.put("year", year);
		calendarMap.put("month", month);
		calendarMap.put("week", week);
		calendarMap.put("endDay", endDay);
		
		System.out.println("--- Number 4 ---");
		System.out.println(calendarMap.toString());
		
		ModelAndView mv = new ModelAndView("schedule/viewSchedule");
		mv.addObject("scheduleList", scheduleList);
		mv.addObject("current", calendarMap);
		
		System.out.println(mv.toString());
		return mv;
	}
}
