<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("utf-8"); 
String root = request.getContextPath();
%> 
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title>아이디 중복확인</title> 

<link rel="stylesheet" href="<%=root %>/css/skin.css">
<link rel="stylesheet" href="<%=root %>/css/loginbar.css">
</head> 

<body style="overflow-y:hidden">
<div class='article_skin'>
<DIV>  
<FORM name='frm' method='POST' action='./id_proc.jsp'>
<div style="font-size: 20px;font-weight: bold;">사용하실 ID를 입력해주세요</div><br>
<center>
  <TABLE class='table'>
    <TR>
      <TH>아이디 : </TH>
      <TD><input type="text" name="id" size='20' style="border:none;border:1px solid #d8d8d8;width:313px;height: 30px;border-radius:3px"></TD>
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