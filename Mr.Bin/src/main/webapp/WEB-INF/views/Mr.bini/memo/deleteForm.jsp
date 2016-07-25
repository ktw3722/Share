<%@ page contentType="text/html; charset=UTF-8"%>

<% request.setCharacterEncoding("utf-8"); %>

<%
String root = request.getContextPath();
int memono = Integer.parseInt(request.getParameter("memono"));
String nowPage=request.getParameter("nowPage");
String col=request.getParameter("col");
String word=request.getParameter("word");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<link rel="stylesheet" href="<%=root %>/css/skin.css">
<link rel="stylesheet" href="<%=root %>/css/loginbar.css">
<script type="text/javascript">
function listM(){
	var url = "list.jsp";
	url = url + "?nowPage=<%=nowPage%>";
	url = url + "&col=<%=col%>";
	url = url + "&word=<%=word%>";
	location.href = url;
}
</script>
</head>
<body>
<jsp:include page="/menu/top.jsp"/>
<div class='article_skin'>
<DIV style="font-size: 30px; margin-top: 100px">삭제 확인</DIV><br>

	<Form name='frm' method='POST' action='./deleteProc.jsp'>
		<input type='hidden' name='memono' size='30' value='<%=memono %>'>

		<DIV class="content" style='font-size:20px'>
			삭제를 하면 복구 될 수 없습니다.<br>
			 삭제하시려면 삭제 처리 버튼을 클릭하세요.<br>
			 취소는 '목록' 버튼을 누르세요. <br>
			<br> <input id='button' type='submit' value='삭제 처리'> 
				 <input id='button' type='button' value='목록' onclick="listM()">
		</DIV>
	</Form>
</div>
<jsp:include page="/menu/bottom.jsp"/>
</body>
</html>
