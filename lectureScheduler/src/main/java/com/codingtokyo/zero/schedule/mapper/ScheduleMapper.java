package com.codingtokyo.zero.schedule.mapper;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository("scheduleMapper")
public interface ScheduleMapper {

	// 현재를 기준으로 스케줄 출력
	List<Map<String, String>> selectList();

}
