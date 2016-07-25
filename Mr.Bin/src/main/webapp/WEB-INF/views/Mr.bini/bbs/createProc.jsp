<%@ page contentType="text/html; charset=UTF-8" %> 
<% 
request.setCharacterEncoding("utf-8"); 
String root = request.getContextPath();
%> 
 <jsp:useBean id="dao" class="bbs.BbsDAO"/>
  <jsp:useBean id="dto" class="bbs.BbsDTO"/>
<jsp:setProperty property="*" name="dto"/>
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
  <div class=article_skin>
<DIV class="content">
 <%
 int cnt=dao.create(dto);
if(cnt>0){
	out.print("<div style='font-size:30px'>글을 작성하였습니다</div>");
}else{
	out.print("<div style='font-size:30px'>글 작성을 실패하였습니다</div>");
}

%>

  <DIV class='bottom'>
    <input id="button" type='button' value='목록' onclick="location.href='list.jsp'">&emsp;
    <input id="button" type='button' value='다시등록' onclick="location.href='createForm.jsp'">
  </DIV>
 </DIV>
 </div>
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 