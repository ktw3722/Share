<%@ page contentType="text/html; charset=UTF-8" %> 
<jsp:useBean id="dao" class="member.MemberDAO"/>
<% 
request.setCharacterEncoding("utf-8"); 
String root = request.getContextPath();
String id=request.getParameter("id");
int cnt=dao.duplicateID(id);

%> 

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title>아이디 중복확인</title>
<script type="text/javascript">
function use(){
	opener.frm.click.value+=1;
	opener.frm.id.value='<%=id%>';
	self.close();
}
</script>

<link rel="stylesheet" href="<%=root %>/css/skin.css">
<link rel="stylesheet" href="<%=root %>/css/loginbar.css">
</head> 
<body style="overflow-y:hidden">
<div class='article_skin'>
 
 <div>
<%if(cnt==1){%>
  입력하신 아이디 '<%=id %>'는  이미 생성된 아이디 입니다.<br><br>
 <div><input id='button'type="button" value='다시시도' onclick="location.href='id_form.jsp'"></div>
	
<%}else{%>
입력하신 아이디 '<%=id %>'는 사용가능한 아이디 입니다.<br><br>
<input id='button' type='button' value='사용' onclick='use()'>
<%}%> 
   </div>


</div>
</body>

</html> 