<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:useBean id="dao" class="member.MemberDAO"/>
<%
request.setCharacterEncoding("utf-8"); 
String root = request.getContextPath();
String id=request.getParameter("id");
String mname=request.getParameter("mname");
String passwd=dao.pwFind(id, mname);

%>
 
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<link rel="stylesheet" href="<%=root %>/css/skin.css">
<link rel="stylesheet" href="<%=root %>/css/loginbar.css">text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
<div class='article_skin'>
<DIV align="center" style="color: #3366cc;font-weight: bold;font-size: 25px">비밀번호 찾기</DIV><br>

<%
if(passwd!=""){
	out.print("<div style='font-size:18px'>당신의 비밀번호는 "+passwd+"입니다.</div>");
%>
<br>
<DIV>
  <input id='button'type='button' value='로그인' onclick="location.href='./loginForm.jsp'">
</DIV>
</div>
<div class='article_skin'>
 <%}else{out.print("<div style='font-size:18px'>회원정보가 없습니다.</div>"); %>
<DIV>
<br>
<input id='button' type='button' value='다시시도' onclick="history.back()">
</DIV>

<%} %>

</div>
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 