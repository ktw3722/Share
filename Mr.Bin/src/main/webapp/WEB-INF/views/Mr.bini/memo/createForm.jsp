<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
    request.setCharacterEncoding("utf-8"); 
    String root = request.getContextPath();
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=root %>/css/skin.css">
<link rel="stylesheet" href="<%=root %>/css/loginbar.css">
<script type="text/javascript">
function input(f){
	if(f.title.value == ""){
		alert("제목을 입력해주세요");
		f.title.focus();		
		return false;
	}

	if(f.content.value==""){
		alert("내용을 써주세요");
		f.content.focus();
		return false;
		
	}
}
</script>
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
	<DIV align="left" style="color: #3366cc;font-weight: bold;">메모장</DIV>

	
	<form name="frm" method="POST" action="./createProc.jsp" onsubmit="return input(this)">
		<table>
			<TR>
      			<TH colspan="2"><input style="border:none;border:1px solid #d8d8d8;width:900px;height: 35px" 
      			type="text" name="title" maxlength="33" placeholder="title"></TH>
    		</TR>
			<TR>
      			<TD colspan="2"><textarea style="width: 900px;height: 500px" name="content" rows='10' cols='40' placeholder="content" maxlength="1333"></textarea></TD>
    		</TR>
		</table>
		<br>
		<div class="bottom"><input id='button' type = "submit" value="전송"></div>
	</form>
</div>
<jsp:include page="/menu/bottom.jsp"/>
</body>
</html>