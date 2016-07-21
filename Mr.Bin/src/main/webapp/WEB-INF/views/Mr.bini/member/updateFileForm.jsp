<%@ page contentType="text/html; charset=UTF-8" %> 
<% 
request.setCharacterEncoding("utf-8");
String root = request.getContextPath();
String id=request.getParameter("id");
String oldfile=request.getParameter("oldfile");
 
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
<body leftmargin="0" topmargin="0">
<jsp:include page="/menu/top.jsp" />
<!-- *********************************************** -->
<div class='article_skin'>
<DIV  style="color: #3366cc;font-weight: bold;font-size: 30px;margin-left: 80px">사진수정</DIV>
 
<FORM name='frm' 
 method='POST' 
 action='./updateFileProc.jsp'
 enctype="multipart/form-data">
 
  <input type="hidden" name="id" value="<%=id %>"/> 
  <input type="hidden" name="oldfile" value="<%=oldfile %>"/>
   <center>
  <TABLE>
    <TR>
      <TH style="padding: 0 20px">원본파일</TH>
      <TD>
       <img src="./storage/<%=oldfile%>" width="500px"><br>
      	 원본파일명:<%=oldfile %>
      </TD>
    </TR>
    <TR>
      <TH>변경파일</TH>
      <TD>
       <input type="file" name="fname" value="<%=oldfile %>">
      </TD>
    </TR>
  </TABLE>
  </center>
  <br>
  <DIV class='bottom'>
    <input id='button'type='submit' value='변경'>
    <input id='button'type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>
 
</div>
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" />
</body>
<!-- *********************************************** -->
</html> 