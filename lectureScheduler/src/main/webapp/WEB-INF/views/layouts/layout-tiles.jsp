<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>

<head>
	<t:insertAttribute name="header"/>
</head>
<body>
<div class="container content">
	<t:insertAttribute name="menu"/>
	
	<div class="container">
		<t:insertAttribute name="content"/>
	</div>
	
	<t:insertAttribute name="footer"/>
</div>
</body>

</html>