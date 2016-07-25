<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:useBean id="dao" class="member.MemberDAO"/>
<%
request.setCharacterEncoding("utf-8"); 
String root = request.getContextPath();
String mname=request.getParameter("mname");
String email=request.getParameter("email");
String id=dao.idFind(mname, email);

%>
 
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 

<link rel="stylesheet" href="<%=root %>/css/skin.css">
<link rel="stylesheet" href="<%=root %>/css/loginbar.css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
<div class='article_skin' style="margin-top: 100px">
<DIV align="center" style="color: #3366cc;font-weight: bold;font-size: 25px">아이디 찾기</DIV><br>

<%
if(id!=""){
	out.print("<div style='font-size:18px'>당신의 아이디는 "+id+"입니다.</div>");
%>
<br>
<DIV class='bottom'>
  <input id='button' type='button' value='로그인' onclick="location.href='./loginForm.jsp'">
</DIV>
</div>
 <%}else{out.print("<div style='font-size:18px'>회원정보가 없습니다.</div>"); %>
<br>
<DIV class='bottom'>
<input id='button' type='button' value='다시시도' onclick="history.back()">
</DIV>

</div>
<%} %>
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 