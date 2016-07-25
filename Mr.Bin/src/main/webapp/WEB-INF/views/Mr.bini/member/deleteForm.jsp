<%@ page contentType="text/html; charset=UTF-8" %> 
<jsp:useBean id="dao" class="member.MemberDAO"/>
<% 
request.setCharacterEncoding("utf-8");
String root = request.getContextPath();
String id=request.getParameter("id");//아이디를 삭제하려고
if(id==null){
	id=(String)session.getAttribute("id");
}
String oldfile=request.getParameter("oldfile");//삭제된 아이디의 사진을 삭제하려고 
if(oldfile==null){
	oldfile=dao.getFname(id);
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
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
<div class='article_skin'>
<DIV align="center" style="color: #3366cc;font-weight: bold;margin-top: 100px;font-size: 25px">회원탈퇴</DIV>
 <br>
<FORM name='frm' method='POST' action='./deleteProc.jsp'>
<input type="hidden" name="id" value="<%=id %>">
<input type="hidden" name="oldfile" value="<%=oldfile %>">
  <div style="font-size: 18px">
  탈퇴를 하시면 더이상 컨텐트를 제공받을 수 없습니다.<br>
  그래도 탈퇴를 원하시면 아래 탈퇴버튼을 클릭하세요.
  </div>
  <br>
  <DIV class='bottom'>
    <input id='button' type='submit' value='탈퇴'>
    <input id='button' type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>
</div>
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 