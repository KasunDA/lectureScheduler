<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>




<h1>RESULT</h1>
<c:forEach var="schedule" items="${scheduleList}">
	<p>scheduleID : ${schedule.id}</p>
	<p>year : ${schedule.year }</p>
	<p>month : ${schedule.month }</p>
	<p>day : ${schedule.day }</p>
	<p>teacherName : ${schedule.teacherName }</p>
	<p>lectureName : ${schedule.lectureName }</p>
</c:forEach>

<hr />

<table border="0" cellspacing="1" cellpadding="1" style="background-color: #FFFFFF;">

	<thead>
		<tr bgcolor="#CECECE">
			<td width='100px'>
				<div align="center">
					<font color="red">일</font>
				</div>
			</td>

			<td width='100px'>
				<div align="center">월</div>
			</td>

			<td width='100px'>
				<div align="center">화</div>
			</td>

			<td width='100px'>
				<div align="center">수</div>
			</td>

			<td width='100px'>
				<div align="center">목</div>
			</td>

			<td width='100px'>
				<div align="center">금</div>
			</td>

			<td width='100px'>
				<div align="center">
					<font color="#529dbc">토</font>
				</div>
			</td>
		</tr>
	</thead>

	<tbody>
		<tr>
			<!-- 처음 빈공란 표시 -->
			<c:set var="i" value="0"></c:set>

			<c:forEach begin="1" end="${current.week-1}" var="blank">
				<td style="background-color: white;">&nbsp;</td>
				<c:set var="i" value="${blank}"></c:set>
				<!-- newline -->
			</c:forEach>

			<c:forEach begin="1" end="${current.endDay}" var="currentDay">
				<td valign='top' align='left' height='92px' style="background-color: #F3F9D7;" nowrap>
					 ${currentDay}
				</td>

				<c:set var="i" value="${i+1}" />
				<c:choose>
					<c:when test="${i==7}">
						<c:if test="${currentDay<= current.endDay}">
							<tr>
						</c:if>
						<c:set var="i" value="0"></c:set>
					</c:when>
				</c:choose>
			</c:forEach>

			<c:forEach begin="0" end="7">
				<td>&nbsp;</td>
			</c:forEach>
		</tr>
	</tbody>
</table>



