package com.codingtokyo.zero.schedule.service;

import java.util.List;
import java.util.Map;

public interface ScheduleService {

	// 현재를 기준으로 스케줄 출력
	List<Map<String, String>> displayScheduleList();

}
