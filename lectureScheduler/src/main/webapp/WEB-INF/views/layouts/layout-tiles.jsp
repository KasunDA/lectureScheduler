<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>
<html>

<head>
	<t:insertAttribute name="header"/>
</head>
<body class="pt10">
<div class="container">
	<t:insertAttribute name="menu"/>
	
	<hr/>
	
	<t:insertAttribute name="content"/>
	
	<hr/>
	
	<t:insertAttribute name="footer"/>
</div>
</body>

</html>