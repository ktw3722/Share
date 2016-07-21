<%@ page contentType="text/html; charset=UTF-8"%>
<% request.setCharacterEncoding("utf-8");
String root=request.getContextPath();

String c_id = "";     // ID 저장 여부를 저장하는 변수, Y
String c_id_val = ""; // ID 값
 
Cookie[] cookies = request.getCookies(); 
Cookie cookie=null; 
 
if (cookies != null){ 
 for (int i = 0; i < cookies.length; i++) { 
   cookie = cookies[i]; 
 
   if (cookie.getName().equals("c_id")){ 
     c_id = cookie.getValue();     // Y 
   }else if(cookie.getName().equals("c_id_val")){ 
     c_id_val = cookie.getValue(); // user1... 
   } 
 } 
} 
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
	<jsp:include page="/menu/top.jsp" flush="false" />
	<!-- *********************************************** -->
<div class='article_skin'>
	<DIV class="title"></DIV>

	<FORM name='frm' method='POST' action='./loginProc.jsp' >
		<input type="hidden" name="flag" value="${param.flag}">
		<input type="hidden" name="imgflag" value="${param.imgflag}">
  		<input type="hidden" name="bbsno" value="${param.bbsno}">
  		<input type="hidden" name="imgno" value="${param.imgno}">
  		<input type="hidden" name="nowPage" value="${param.nowPage}">
  		<input type="hidden" name="nPage" value="${param.nPage}">
  		<input type="hidden" name="col" value="${param.col}">
  		<input type="hidden" name="word" value="${param.word}">
			<TABLE style="margin :220px auto;">
				<TR>
					<TH style="height: 40px">로&nbsp;&nbsp;그&nbsp;&nbsp;인 &nbsp;:</TH>
					<TD style="height: 40px;vertical-align: middle;" ><input type="text" name="id" autofocus value='<%=c_id_val%>' style="border:none;border:1px solid #d8d8d8;width:200px;height: 30px;border-radius:3px"></td>
					<TD style="height: 40px;vertical-align: middle;">	
						<% if (c_id.equals("Y")){  // id 저장 상태라면 %>
						<input type='checkbox' name='c_id' value='Y' checked='checked'>ID 저장
					<% }else{ %>
					<input type='checkbox' name='c_id' value='Y'> ID 저장
					<%} %>
					</TD>
					<td style="width: 10px";></td>
					<td rowspan='2'><input id="button" type='submit'
					style="color: white; width: 100px; height: 80px;background-color: #3399ff" value='로그인'></td>
				</TR>
				<TR>
					<TH style="height: 40px">비밀번호 &nbsp;:&nbsp;</TH>
					<TD style="height: 40px;vertical-align: middle;" ><input type="password" name="passwd" style="border:none;border:1px solid #d8d8d8;width:200px;height: 30px;border-radius:3px"></TD>
				</TR>
			</TABLE>
	</FORM>
</div>

	<!-- *********************************************** -->
	<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
<!-- *********************************************** -->
</html>

