<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("utf-8"); 
String mname=(String)session.getAttribute("mname");
String id=(String)session.getAttribute("id");
String root = request.getContextPath();
%> 
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
 
<link rel="stylesheet" href="<%=root %>/css/skin.css">
<link rel="stylesheet" href="<%=root %>/css/loginbar.css">
<script type="text/javascript" src="<%=request.getContextPath() %>/ckeditor/ckeditor.js"></script>
 <script type="text/JavaScript">
   window.onload=function(){
     CKEDITOR.replace('content');  // <TEXTAREA>태그 id 값
  };
 </script>
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
<div class=article_skin>
 
<FORM name='frm' method='POST' action='createProc.jsp'>
<DIV align="left" style="color: #3366cc;font-weight: bold;">게시판</DIV>
<input type="hidden" name="wname" value="<%=mname%>">
  <TABLE >
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
      <TH style="width: 60px">비밀번호:</TH>
      <TD><input style="border:none;border:1px solid #d8d8d8;width:840px;height: 35px" type="password" name="passwd"  maxlength="15"></TD>
    </TR>
  </TABLE>
  <br>
  <DIV class='bottom'>
    <input id="button" type='submit' value='전송'>
    <input id="button" type='button' value='취소' onclick="history.back()">
  </DIV>
  
</FORM>
</div>
 <%} %>
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 