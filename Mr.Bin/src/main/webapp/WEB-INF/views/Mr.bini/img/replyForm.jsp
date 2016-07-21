<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("utf-8"); %> 
<%@ page import="img.*" %>
<jsp:useBean id="dao" class="img.ImgDAO"></jsp:useBean>

<%
int imgno=Integer.parseInt(request.getParameter("imgno"));
String root = request.getContextPath();
String mname=(String)session.getAttribute("mname");
String id=(String)session.getAttribute("id");
String col=(String)request.getParameter("col");
String word=(String)request.getParameter("word");
String nowPage=(String)request.getParameter("nowPage");
ImgDTO dto=dao.readReply(imgno);
%>
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
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


<link rel="stylesheet" href="<%=root %>/css/skin.css">
<link rel="stylesheet" href="<%=root %>/css/loginbar.css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
<%if(id==null){%>
<div class=article_skin>
<img alt="로그인해주세요" src="<%=root%>/image/로그인해주세요.png"><br>
<font size="30">로그인해주세요!</font><br>
<input id="button" type="button" style="font-size:20px;width: 100px;height: 50px" value="로그인" onclick="location.href='<%=root%>/Mr.bini/member/loginForm.jsp'">
</div>
<%}else{%>
<div class='article_skin'>
<DIV align="left" style="color: #3366cc;font-weight: bold;">답변</DIV>

 
<FORM name='frm' method='POST' action='./replyProc.jsp' enctype="multipart/form-data"
  onsubmit="return input(this)">
<input type="hidden"	name="imgno"	value="<%=imgno %>">
<input type="hidden"	name="grpno"	value="<%=dto.getGrpno() %>">
<input type="hidden"	name="indent"	value="<%=dto.getIndent() %>">
<input type="hidden"	name="ansnum"	value="<%=dto.getAnsnum() %>">
<input type="hidden" 	name="col" 		value="<%=col%>">
<input type="hidden" 	name="word" 	value="<%=word%>">
<input type="hidden" 	name="nowPage" 	value="<%=nowPage%>">
<input type="hidden" 	name="wname" 	value="<%=mname%>">
  <TABLE class='table'>
    <TR>
      <TH colspan="2"><input style="border:none;border:1px solid #d8d8d8;width:900px;height: 35px" type="text" name="title" placeholder="title" maxlength="33"></TH>
    </TR>
    <TR align="left">
      <TD style="font-size: 13px;color: #b2b2b2;font-weight: 400" colspan="2">
      	&emsp;작성명&nbsp;: <%=mname %>
      </TD>
    </TR>
    <TR>
      <TD colspan="2"><textarea style="width: 900px;height: 500px" name="content" rows='10' cols='40' placeholder="content" maxlength="1333"></textarea></TD>
    </TR>
    <TR>
      <TH style="width: 90px;text-align: right;">이미지 업로드:</TH>
      <TD><input style="width:790px;height: 35px;" type="file" name="filename"></TD>
    </TR>
    <TR>
      <TH style="text-align: right;">비밀 번호:</TH>
      <TD><input style="border:none;border:1px solid #d8d8d8;width:790px;height: 35px" type="password" name="passwd" placeholder="1234" maxlength="15"></TD>
    </TR>
    
  </TABLE>
  
  <DIV class='bottom'>
    <input id='button' type='submit' value='전송'>
    <input id='button' type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>
</div>
 <%} %>
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
