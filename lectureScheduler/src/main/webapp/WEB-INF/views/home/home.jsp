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
		
		<%=year1%>, <%=month1%>, <%=date1%> <br/>
		
		<hr/>
	
		<h3>Modal Test</h3>
 <!-- Button to trigger modal -->
<a href="#myModal" role="button" class="btn" data-toggle="modal">Launch demo modal</a>

<!-- Modal -->
<div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    <h3 id="myModalLabel">Modal header</h3>
  </div>
  <div class="modal-body">
    <p>One fine body... <a href="http://google.com" target="_blank">Go to Google with this Anchor</a></p>
  </div>
  <div class="modal-footer">
    <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
    <button class="btn btn-primary">Save changes</button>
  </div>
</div>