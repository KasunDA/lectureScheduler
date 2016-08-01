<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    request.setCharacterEncoding("UTF-8");
     
    //클라이언트에서 넘어온 정보 받기
    String strYear = request.getParameter("year");
    String strMonth = request.getParameter("month");
     
    //현재 컴퓨터 시스템의 날짜 구하기
    Calendar cal = Calendar.getInstance();
    int year = cal.get(Calendar.YEAR);
    int month = cal.get(Calendar.MONTH)+1; //클라이언트에서 넘겨준 값이 없을때 표시하는 값
    
     
    if(strYear != null)
    	year = Integer.parseInt(strYear);
    if(strMonth != null)
    	month = Integer.parseInt(strMonth);
     
    cal.set(year, month-1, 1);
    year = cal.get(Calendar.YEAR);
    month = cal.get(Calendar.MONTH)+1;
     
    // 1일은 무슨 요일?
    int week = cal.get(Calendar.DAY_OF_WEEK);
     
    // 달의 마지막 날짜는?
    int endDay = cal.getActualMaximum(Calendar.DATE);

    out.println("year : " + year + ", month : " + month);
%>

	<table class="table">
		<caption>
			<a href=""> ◀ </a> <%=year%>年<%=month%>月 <a href=""> ▶ </a>
		</caption>
		
		<tr height="25" bgcolor="#e4e4e4">
			<td>SUN</td>
			<td>MON</td>
			<td>TUE</td>
			<td>WED</td>
			<td>THU</td>
			<td>FRI</td>
			<td>SAT</td>
		</tr>
		
<%
	int line = 0;		// 앞의 공백처리
	out.print("<tr bgcolor='#ffffff' height='25'>");
	for(int i = 1; i < week; i++){
		out.print("<td> </td>");
		line++;
	}
	
	String bgcol;
	for(int i = 1; i <= endDay; i++){
		bgcol = line == 0 ? "red" : (line == 6 ? "blue" : "black");
		out.print("<td align='center' style='color:" + bgcol + ";'>");
		out.print(i);
		out.print("</td>");
		line++;
		
		if(line == 7 && i != endDay){
			out.print("</tr><tr height='25' bgcolor='#ffffff'>");
			line = 0;
		}
	}
	

	while(line > 0 && line < 7){
		out.print("<td> </td>");
		line++;
	}
	out.print("</tr>");

%>
	</table>