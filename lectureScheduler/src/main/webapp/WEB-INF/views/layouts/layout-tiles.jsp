<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>

<head>
	<t:insertAttribute name="header"/>
</head>
<body>
<div class="container">
	<t:insertAttribute name="menu"/>
	
	<hr/>
	
	<div class="container" style="width:auto; height:400px">
		<t:insertAttribute name="content"/>
	</div>
	
	<hr/>
	
	<t:insertAttribute name="footer"/>
</div>
</body>

</html>