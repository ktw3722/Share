<%@ page contentType="text/html; charset=UTF-8" %> 
<% 
request.setCharacterEncoding("utf-8"); 
String root = request.getContextPath();
%> 
<jsp:useBean id="dao" class="member.MemberDAO"/>
<jsp:useBean id="dto" class="member.MemberDTO"/>
<jsp:setProperty property="*" name="dto"/>
 <% int cnt=dao.update(dto);%>
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
<div class='article_skin'>
<DIV align="center" style="color: #3366cc;font-weight: bold;font-size: 25px">정보 수정</DIV><br>
 
<div class="content">
<%
if(cnt==1){
   out.print("<div style='font-size:30px'>정보수정을 했습니다.</div>");
}else{
   out.print("<div style='font-size:30px'>정보수정을 실패했습니다.</div>");
}
 
%>
</div>
 
<% if(cnt==1){ %>  
<br>
<DIV class='bottom'>
  <input id='button' type='button' value='정보확인' 
  onclick="location.href='read.jsp?id=<%=dto.getId()%>'">
</DIV>
<%}else{ %>
<br>
 <DIV class='bottom'>
  <input id='button' type='button' value='다시시도' 
  onclick="history.back()">
</DIV>
<%} %>
</div>
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" />
</body>
<!-- *********************************************** -->
</html> 