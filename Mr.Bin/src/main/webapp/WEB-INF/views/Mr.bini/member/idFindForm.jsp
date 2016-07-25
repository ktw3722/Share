<%@ page contentType="text/html; charset=UTF-8" %> 
<%
request.setCharacterEncoding("utf-8");
String root = request.getContextPath();
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
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
<div class='article_skin'>
<center>
<DIV align="center" style="color: #3366cc;font-weight: bold;font-size: 25px">아이디 찾기</DIV><br>
 
<FORM name='frm' method='POST' action='./idFindProc.jsp'>
  <TABLE class='table'>
    <TR>
      <TH>이름</TH>
      <TD><input type="text" name="mname" style="border:none;border:1px solid #d8d8d8;width:313px;height: 30px;border-radius:3px"></TD>
    </TR>
    <TH>e-mail</TH>
      <TD> <input type="text" name="email"style="border:none;border:1px solid #d8d8d8;width:313px;height: 30px;border-radius:3px"></TD>
    </TR>
  </TABLE>
  <br>
  <DIV class='bottom' align="center">
    <input id='button'type='submit' value='전송'>
  </DIV>
</FORM>
</center>
</div>
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 