<%@ page contentType="text/html; charset=UTF-8" %> 
<%
request.setCharacterEncoding("utf-8");
String id=request.getParameter("id");
String root = request.getContextPath();
%> 
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title>
<script type="text/javascript">
	function input(f){
		if(f.passwd.value==""){
			alert("비밀번호를 써주세요")
			f.passwd.focus();
			return false;
		}
		if(f.repasswd.value==""){
			alert("비밀번호를 한번더 써주세요")
			f.repasswd.focus();
			return false;
		}
		if(f.passwd.value!==f.repasswd.value){
			alert("비밀번호가 같은지 확인해주세요")
			f.repasswd.value="";
			f.repasswd.focus();
			return false;
		}
}
</script>
<link rel="stylesheet" href="<%=root %>/css/skin.css">
<link rel="stylesheet" href="<%=root %>/css/loginbar.css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
<div class='article_skin'>
<DIV align="center" style="color: #3366cc;font-weight: bold;font-size: 30px">비밀번호 변경</DIV><br>
<FORM name='frm' 
      method='POST' 
	  action='./updatePwProc.jsp'
	  onsubmit="return input(this)">
 <input type="hidden" name='id' value='<%=id %>'>

  <TABLE style="margin-left: 180px">
    <TR>
      <TH align="left">*패  스  워  드 : </TH>
      <TD><input type="password" name="passwd" size="15" style="border:none;border:1px solid #d8d8d8;width:240px;height: 30px;border-radius:3px"></TD>
    </TR>
       <TR>
      <TH align="left">*패스워드 확인 : </TH>
      <TD><input type="password" name="repasswd" size="15" style="border:none;border:1px solid #d8d8d8;width:240px;height: 30px;border-radius:3px"></TD>
    </TR>
  </TABLE>

  <br>
  <DIV>
    <input id='button'type='submit' value='패스워드 수정'style="width: 130px">
  </DIV>
</FORM>
</div>
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 