<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("utf-8"); 
String root = request.getContextPath();
%> 
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title>E-mail 중복확인</title> 

<link rel="stylesheet" href="<%=root %>/css/skin.css">
<link rel="stylesheet" href="<%=root %>/css/loginbar.css">
</head> 

<body style="overflow-y:hidden">
<div class='article_skin'>
 
<DIV>  
<FORM name='frm' method='POST' action='./email_proc.jsp'>
<link href="../../css/loginbar.css" rel="Stylesheet" type="text/css">
<div style="font-size: 20px;font-weight: bold;">사용하실 E-mail을 입력해주세요</div><br>
<center>
  <TABLE class='table'>
    <TR>
      <TH>E-mail : </TH>
      <TD><input type="text" name="email" size='20'style="border:none;border:1px solid #d8d8d8;width:313px;height: 30px;border-radius:3px"></TD>
    </TR>
  </TABLE>
  </center>
  <br>
  <DIV>
    <input id='button' type='submit' value='중복확인'>
    <input id='button' type='button' value='취소' onclick="window.close()">
  </DIV>
</FORM>
 </DIV>
 
</div>
</body>

</html> 