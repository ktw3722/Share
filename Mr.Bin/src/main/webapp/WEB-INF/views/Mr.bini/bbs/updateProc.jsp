<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("utf-8"); %> 
<jsp:useBean id="dao" class="bbs.BbsDAO"/>
<jsp:useBean id="dto" class="bbs.BbsDTO"/>
<jsp:setProperty property="*" name="dto"/>
<% 
String root = request.getContextPath();
String col=request.getParameter("col");
String word=request.getParameter("word");
String nowPage=request.getParameter("nowPage");
%>

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title>
<script type="text/javascript">
function read(){
	var url="read.jsp";
	url+="?bbsno=<%=dto.getBbsno()%>";
	url+="&col=<%=col%>";
	url+="&word=<%=word%>";
	url+="&nowPage=<%=nowPage%>";
	location.href=url;
}
function listB(){
	var url="list.jsp";
	url+="?col=<%=col%>";
	url+="&word=<%=word%>";
	url+="&nowPage=<%=nowPage%>";
	location.href=url;
}
</script>
<link rel="stylesheet" href="<%=root %>/css/skin.css">
<link rel="stylesheet" href="<%=root %>/css/loginbar.css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
<div class=article_skin>
<DIV class="content" style="margin-top: 100px">
<%
	int cnt=dao.checkPasswd(dto.getBbsno(), dto.getPasswd());
	if(cnt==1){
		dao.update(dto);
		out.print("<div style='font-size:30px'>글을 변경했습니다.</div>");
%>
<br>
<DIV class='bottom'>
      <input id="button" type='button' value='변경 확인' onclick="read()">
      <input id="button" type='button' value='목록' onclick="listB()">
    </DIV>
<%
	}else{
		out.print("<div style='font-size:30px'>패스워드 오류입니다.</div>");
%>
<br>
 <DIV class='bottom'>
      <input id="button" type='button' value='다시 시도' onclick="history.back();">       
      <input id="button" type='button' value='목록' onclick="listB()">
    </DIV>
    <%} %>
</DIV>
</div>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 