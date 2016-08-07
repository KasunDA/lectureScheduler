package com.codingtokyo.zero.schedule.service;

import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.codingtokyo.zero.schedule.mapper.ScheduleMapper;

@Service("scheduleService")
public class ScheduleServiceImpl implements ScheduleService {

	@Resource(name = "scheduleMapper")
	ScheduleMapper mapper;

	@Override
	public List<Map<String, String>> displayScheduleList() {
		
		Calendar calendar = Calendar.getInstance();
		
		List<Map<String, String>> scheduleList = mapper.selectList();
		return scheduleList;
	}
}
