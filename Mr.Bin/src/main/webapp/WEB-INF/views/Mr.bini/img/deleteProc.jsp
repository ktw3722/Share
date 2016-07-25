<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="utility.*" %>
 
<jsp:useBean id="dao" class="img.ImgDAO" />
<%  //삭제위해 실경로설정
String upDir=application.getRealPath("/member/storage");
String root = request.getContextPath();
request.setCharacterEncoding("utf-8"); 
int imgno = Integer.parseInt(request.getParameter("imgno"));
String passwd = request.getParameter("passwd");
String oldfile = request.getParameter("oldfile");
 
int cnt =dao.passwdCheck(imgno, passwd);
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
<body leftmargin="0" topmargin="0">
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
<div class='article_skin'>
 
<div class="content">
<%
  if(cnt==1){
    	dao.delete(imgno);
    	out.print("<div style='font-size:30px'>이미지를 삭제했습니다</div>");
 
}else{
    out.print("<div style='font-size:30px'>이미지 삭제를 실패했습니다.</div>");
}
 
%>
<br>
</div>
<%if(cnt==1){%> 
<DIV class='bottom'>
  <input id='button' type='button' value='목록' onclick="location.href='list.jsp'">
</DIV>
<%}else{ %>
<DIV class='bottom'>
  <input id='button' type='button' value='다시시도' onclick="history.back()">
</DIV>
<%} %> 
</div>
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 