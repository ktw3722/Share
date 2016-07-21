<%@ page contentType="text/html; charset=UTF-8" %> 
<jsp:useBean id="dao" class="member.MemberDAO"/>
<%@ page import="utility.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<% 
request.setCharacterEncoding("utf-8"); 
String root = request.getContextPath();
String email=request.getParameter("email");
int cnt=dao.duplicateEmail(email); 

%> 

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title>E-mail 중복확인</title>
<script type="text/javascript">
function use(){
	opener.frm.eclick.value+=1;
	opener.frm.email.value='<%=email%>';
	self.close();
}
</script>

</style> 
<link rel="stylesheet" href="<%=root %>/css/skin.css">
<link rel="stylesheet" href="<%=root %>/css/loginbar.css">
</head> 

<body style="overflow-y:hidden">

<div class='article_skin'>
 <div>
<%if(cnt==1){%>
 입력하신 E-mail '<%=email%>'은 이미 생성된 E-mail 입니다.<br><br>
<input id='button' type="button" value='다시시도' onclick="location.href='email_form.jsp'">
<%}else{%>
	입력하신 E-mail '<%=email%>'은 사용가능한 E-mail 입니다.<br><br>
	<input id='button' type='button' value='사용' onclick='use()'>
<%}%> 
   </div>
</div>
</body>

</html> 