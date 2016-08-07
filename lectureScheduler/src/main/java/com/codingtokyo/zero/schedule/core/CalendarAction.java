package com.codingtokyo.zero.schedule.core;

import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.chainsaw.Main;

public class CalendarAction {
	
	public static void main(String[] args) {
		
		int[] calendarDay;
		int count;
		
		int year;
		int month;
		int day;
		
		calendarDay = new int [42];
		count = 0;
		
		Calendar calendar = Calendar.getInstance();
		year = calendar.get(Calendar.YEAR);
		month = calendar.get(Calendar.MONTH);
		day = calendar.get(Calendar.DATE);
		
		System.out.println("YEAR : " + year + ", MONTH : " + month + ", DAY : " + day);
		
		count = setDateArray(year, month, day, calendarDay, count);
		System.out.println("Count : " + count);
		System.out.println("--------------------------------------------------------------");
		
		int weekCount = count / 7;
		
		for (int i = 0 ; i < weekCount ; i++){
		      for (int j = i * 7 ; j < i * 7 + 7 ; j++){
		        if (calendarDay[j] > 35){
		          System.out.print(calendarDay[j] - 35 + " ");
		        }else{
		          System.out.print(calendarDay[j] + " ");
		        }
		      }

		      System.out.println();
		    }
		
		System.out.println("-----------------------------------------------------------------");
		
		for (int i : calendarDay) {
			System.out.print(i + " ");
		}
	}

	private static int setDateArray(int year, int month, int day, int[] calendarDay, int count) {
		
		Calendar calendar = Calendar.getInstance();
		
		calendar.set(year, month, 1);
		int startWeek = calendar.get(Calendar.DAY_OF_WEEK);
		System.out.println("startWeek : " + startWeek);
		
		calendar.set(year, month, 0);
		int beforeMonthLastDay = calendar.get(Calendar.DATE);
		System.out.println("beforeMonthLastDay : " + beforeMonthLastDay);
		
		calendar.set(year, month + 1, 0);
		int thisMonthLastDay = calendar.get(Calendar.DATE);
		System.out.println("thisMonthLastDay : " + thisMonthLastDay);
		
		for(int i = startWeek - 2; i >= 0; i--){
			calendarDay[count++] = beforeMonthLastDay - i + 35;
		}
		
		for(int i = 1; i <= thisMonthLastDay; i++){
			calendarDay[count++] = i;
		}
		
		int nextMonthDay = 1;
		while(count % 7 != 0){
			calendarDay[count++] = nextMonthDay++;
		}
		
		return count;
	}
	
}
