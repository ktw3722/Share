<%@ page contentType="text/html; charset=UTF-8" %> 
<% 
request.setCharacterEncoding("utf-8"); 
String root = request.getContextPath();
String col=(String)request.getParameter("col");
String word=(String)request.getParameter("word");
String nowPage=(String)request.getParameter("nowPage");
%> 
<jsp:useBean id="dao" class="bbs.BbsDAO"/>
<jsp:useBean id="dto" class="bbs.BbsDTO"/>
<jsp:setProperty property="*" name="dto"/>

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title>
<script type="text/javascript">
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
<DIV class="content">
<%
      dao.addAnsnum(dto.getGrpno(), dto.getAnsnum());
	int cnt=dao.reply(dto);
	if(cnt==1){
		out.print("<div style='font-size:30px'>답변을 등록했습니다</div>");
%>
<br>
<DIV class='bottom'>
      <input id="button" type='button' value='목록' onclick="listB()">
    </DIV>
<%
	}else{
		out.print("<div style='font-size:30px'>답변등록을 실패 했습니다</div>");
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