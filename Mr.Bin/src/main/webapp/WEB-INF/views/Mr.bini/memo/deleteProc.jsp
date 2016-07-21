<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="./ssi.jsp" %>
<jsp:useBean id="dao" class="memo.memoDAO"/>


<%
request.setCharacterEncoding("utf-8");
String root = request.getContextPath();
int memono = Integer.parseInt(request.getParameter("memono"));
String nowPage=request.getParameter("nowPage");
String col=request.getParameter("col");
String word=request.getParameter("word");
cnt=dao.delete(memono);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<link rel="stylesheet" href="<%=root %>/css/skin.css">
<link rel="stylesheet" href="<%=root %>/css/loginbar.css">
</head>
<body>
<jsp:include page="/menu/top.jsp"/>
<div class='article_skin' style="margin-top: 100px">
	<DIV class="content">
		<%
  if (cnt == 1){
    out.println("<div style='font-size:30px'>메모를 삭제 했습니다.</div>");
  }else{
    out.println("<div style='font-size:30px'>메모 삭제에 실패했습니다.</div>");
  }
  %>
		<br> <input id='button' type='button' value='목록'
			onclick="location.href='./list.jsp'">
	</DIV>
</div>
<jsp:include page="/menu/bottom.jsp"/>
</body>
</html>