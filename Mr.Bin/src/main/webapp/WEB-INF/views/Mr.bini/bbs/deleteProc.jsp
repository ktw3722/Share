<%@ page contentType="text/html; charset=UTF-8" %> 
<jsp:useBean id="dao" class="bbs.BbsDAO"/>
<%
request.setCharacterEncoding("utf-8");
int bbsno=Integer.parseInt(request.getParameter("bbsno"));
String passwd=request.getParameter("passwd");
String col=request.getParameter("col");
String word=request.getParameter("word");
String nowPage=request.getParameter("nowPage");
int cnt = dao.checkPasswd(bbsno, passwd);
String root = request.getContextPath();
%>
 
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
 <%if(cnt==1){
	 dao.delete(bbsno);
	 %> 
<div class=article_skin>
	<div style='font-size:30px'>글을 삭제하였습니다</div>
		 <br>
  	<DIV>
    	<input id="button" type='button' value='목록' onclick="listB()">
  	</div>
</div>
<%}else{%>
  <div class=article_skin>
	 <div style='font-size:30px'>패스워드 오류입니다</div>
<br>
  <DIV>
    <input id="button" type='button' value='다시실행' onclick="history.back()">
  </DIV>
</div>
 <% }%>

 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 