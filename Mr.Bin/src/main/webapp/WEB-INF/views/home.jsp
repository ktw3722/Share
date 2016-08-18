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
<div class='article_skin'>
<div >
<img src="${pageContext.request.contextPath}/image/images.jpg" width="500px"; height="300px"><br>
<div>이번 년도는 어디로 피서를 갈까?</div>
</div> 
</div>
</body>
</html> 