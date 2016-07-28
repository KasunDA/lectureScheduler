<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<h1>Hello world!</h1>
	
		<P>  The time on the server is ${serverTime}. </P>
		
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<%
			Calendar cal = Calendar.getInstance();
			
			int year1 = cal.get(Calendar.YEAR);
			int month1 = cal.get(Calendar.MONTH);
			int date1 = cal.get(Calendar.DATE);
			
			out.println(year1 +" , " +  month1 + " , " + date1);
	%>
	
		<hr/>
		
		${year1}, ${month1}, ${date1} <br/>
		
		<hr/>
		
		<%=year1%>, <%=month1%>, <%=date1%>