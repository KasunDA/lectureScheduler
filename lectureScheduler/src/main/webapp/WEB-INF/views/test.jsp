<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:forEach var="head" items="${headerValues}">
	<p> param: <c:out value="${head.key}"/>
	<p> values:
		<c:forEach var="val" items="${head.value}">
			<c:out value="${val}"/>
		</c:forEach>
</c:forEach>

</body>
</html>