<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8"); 
String root = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<link rel="stylesheet" href="<%=root %>/css/skin.css">
<link rel="stylesheet" href="<%=root %>/css/loginbar.css">
</head>
<body>
<jsp:include page="/menu/top.jsp"/>
<div class='article_skin'>
<div >
<img src="menu/images/images.jpg" width="500px"; height="300px"><br>
<div>이번 년도는 어디로 피서를 갈까?</div>
</div> 
</div>
<jsp:include page="/menu/bottom.jsp"/>
</body>
</html> 