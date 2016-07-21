
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="memo.memoDAO" />


<%@ include file="./ssi.jsp"%>

<%
	String root = request.getContextPath();
	int memono = Integer.parseInt(request.getParameter("memono"));
	String nowPage=request.getParameter("nowPage");
	String col=request.getParameter("col");
	String word=request.getParameter("word");
	memoVO vo = dao.read(memono);
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=root %>/css/skin.css">
<link rel="stylesheet" href="<%=root %>/css/loginbar.css">
<script type="text/javascript" src="<%=request.getContextPath() %>/ckeditor/ckeditor.js"></script>
 <script type="text/JavaScript">
   window.onload=function(){
     CKEDITOR.replace('content');  // <TEXTAREA>태그 id 값
  };
 </script>
</head>
<body>
<jsp:include page="/menu/top.jsp"/>
<div class='article_skin'>
<DIV align="left" style="color: #3366cc;font-weight: bold;">메모장 수정</DIV>


	<form name="frm" method="POST" action="./updateProc.jsp">

		<input type='hidden' name='memono' size='30' value='<%=memono%>'>
		<input type='hidden' name='col' size='30' value='<%=col%>'>
		<input type='hidden' name='word' size='30' value='<%=word%>'>
		<input type='hidden' name='nowPage' size='30' value='<%=nowPage%>'>
		<table>
			<TR>
      			<TH colspan="2"><input style="border:none;border:1px solid #d8d8d8;width:900px;height: 35px" 
      			type="text" name="title" value="<%=vo.getTitle() %>" maxlength="33"></TH>
    		</TR>

			<TR>
      			<TD colspan="2"><textarea style="width: 900px;height: 500px" name="content" rows='10' cols='40' placeholder="content" maxlength="1333"><%=vo.getContent() %></textarea></TD>
    		</TR>
		</table>
		<br>
		<div class="bottom">
			<input id="button" type="submit" value="전송">
		</div>
	</form>
</div>
<jsp:include page="/menu/bottom.jsp"/>
</body>
</html>


