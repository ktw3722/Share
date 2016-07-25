<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); 
String mname=(String)session.getAttribute("mname");
String id=(String)session.getAttribute("id");
String root = request.getContextPath();
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
	function input(f) {
		if (f.wname.value == "") {
			alert("이름을 입력하세요");
			f.wname.focus();
			return false;
		}

		if (f.title.value == "") {
			alert("제목을 입력하세요");
			f.title.focus();
			return false;
		}

		if (f.content.value == "") {
			alert("내용을 입력하세요");
			f.content.focus();
			return false;
		}
		if (f.filename.value == "") {
			alert("이미지를 올려주세요");
			f.filename.focus();
			return false;
		}
		var file = frm.filename.value;
		var fileExt = file.substring(file.lastIndexOf('.') + 1); //파일의 확장자를 구합니다.
		if(fileExt!=="jpg"&&"png"&&"gif"&&"jpeg"&&"bmp"){
			alert("JPG,JPEG,GIF,PNG,BMP파일로 올려주세요");
		 return false;
		}
		if (f.passwd.value == "") {
			alert("비밀번호를 입력하세요");
			f.passwd.focus();
			return false;
		}
		
		f.submit(); 
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=root %>/css/skin.css">
<link rel="stylesheet" href="<%=root %>/css/loginbar.css">
</head>
<body>
	<jsp:include page="/menu/top.jsp" />
	<%if(id==null){%>
<div class='article_skin'>
<img alt="로그인해주세요" src="<%=root%>/image/로그인해주세요.png"><br>
<font size="30">로그인해주세요!</font><br>
<input id='button' type="button" style="font-size:20px;width: 100px;height: 50px" value="로그인" onclick="location.href='<%=root%>/Mr.bini/member/loginForm.jsp'">
</div>
<%}else{%>
<div class='article_skin'>
	<form name="frm" action="createProc.jsp" method="post" 
	 	  enctype="multipart/form-data"
		  onsubmit="return input(this)">
		  <input type="hidden" name="wname" value="<%=mname %>">
		<DIV align="left" style="color: #3366cc;font-weight: bold;">이미지 게시판</DIV>
		<table>
		 <TR>
      		<TH colspan="2"><input style="border:none;border:1px solid #d8d8d8;width:900px;height: 35px" type="text" name="title" placeholder="title" maxlength="33"></TH>
   		 </TR>
   		 <TR>
      		<TH style="height:10px"></TH>
    	</TR>
    	 <TR align="left">
      		<TD style="font-size: 13px;color: #b2b2b2;font-weight: 400" colspan="2">
      			&emsp;작성명&nbsp;: <%=mname %> &emsp;
     		</TD>
    	</TR>
    	<TR>
      		<TH style="height:10px"></TH>
   		</TR>
		<TR>
      		<TD colspan="2"><textarea style="width: 900px;height: 500px" name="content" rows='10' cols='40' placeholder="content" maxlength="1333"></textarea></TD>
    	</TR>
		<TR>
      		<TH style="width: 90px;text-align: right;">이미지 업로드:</TH>
      		<TD><input style="width:815px;height: 35px;" type="file" name="filename"></TD>
    	</TR>
		<TR>
      		<TH style="width: 90px;text-align: right;">비밀 번호:</TH>
      		<TD><input style="border:none;border:1px solid #d8d8d8;width:815px;height: 35px" type="password" name="passwd"  maxlength="15"></TD>
    	</TR>
		</table>
<br>
		<div class="bottom">
			<input id='button' type="submit" value="등록">&emsp;&emsp;
			<input id='button' type="button" value="목록" onclick="location.href='list.jsp'">
		</div>
	</form>
	</div>
	<%} %>
	<jsp:include page="/menu/bottom.jsp" />
</body>
</html>