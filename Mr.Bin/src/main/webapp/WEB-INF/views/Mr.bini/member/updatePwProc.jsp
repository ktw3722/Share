<%@ page contentType="text/html; charset=UTF-8" %> 
<jsp:useBean id="dao" class="member.MemberDAO"/>
<% 
request.setCharacterEncoding("utf-8"); 
String root = request.getContextPath();
String id=request.getParameter("id");
String passwd=request.getParameter("passwd");

int cnt = dao.updatePasswd(id, passwd);
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
<DIV align="center" style="color: #3366cc;font-weight: bold;font-size: 25px">패스워드 수정 처리</DIV><br>
 <div class="content">
<% 
  if(cnt == 1){ 
  %> 
   <div style='font-size:30px'> 패스워드를 변경했습니다.<br> 
    로그인해보세요~~~</div><br> 
    <input id='button' type='button' value='로그인' onclick="location.href='./loginForm.jsp'"> 
  <%  
  }else{ 
  %>     
    <div style='font-size:30px'>패스워드 변경에 실패 했습니다.</div><br>
    <input id='button' type='button' value='다시 시도' onclick="history.back();">
  <% 
  } 
  %> 
</DIV> 
</div>
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp"/> 
</body> 
<!-- *********************************************** --> 
</html> 
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 