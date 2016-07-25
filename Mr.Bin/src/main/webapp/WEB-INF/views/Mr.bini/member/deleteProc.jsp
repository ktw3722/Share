<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="utility.*" %>
<jsp:useBean id="dao" class="member.MemberDAO"/>
<% 
request.setCharacterEncoding("utf-8");
String root = request.getContextPath();
String upDir=application.getRealPath("/Mr.bini/member/storage");
String id=request.getParameter("id");
String oldfile=request.getParameter("oldfile");

int cnt=dao.delete(id);
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
 
<div>
<%
if(cnt==1){
	out.print("<div style='font-size:30px'>탈퇴 되었습니다. 자동 로그아웃 됩니다.<div>");
	
	if(oldfile!=null && oldfile.equals("member.jpg")){
		Utility.deleteFile(upDir, oldfile);
	}
}else{
	out.print("<div style='font-size:30px'>탈퇴가 실패했습니다.</div>");
}
%>
</div>
  <%if(cnt==1){%> 
<DIV>
  <input id='button' type='button' value='홈' onclick="location.href='logout.jsp'">
</DIV>
<%}else{ %>
  <DIV>
    <input id='button' type='button' value='다시시도' onclick="history.back()">
  </DIV>
<%} %>
 
</div>
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 