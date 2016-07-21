<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="utility.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<jsp:useBean id="dao" class="member.MemberDAO" />
<jsp:useBean id="dto" class="member.MemberDTO" />
<%  request.setCharacterEncoding("utf-8"); 
String root = request.getContextPath();
//업로드 폴더및 임시폴더 설정
String upDir = application.getRealPath("/Mr.bini/member/storage");
String tempDir = application.getRealPath("/Mr.bini/member/temp");
String fname = null;
 
//업로드 처리 모듈 생성
UploadSave upload = new UploadSave(request,-1,-1,tempDir);
//보내지는 파라메터값(id,oldfile)를 받는다
String id=upload.getParameter("id");
String oldfile = UploadSave.encode(upload.getParameter("oldfile"));
 
//보내지는 변경할 사진을 받는다. 
FileItem fileItem = upload.getFileItem("fname");
int size=(int) fileItem.getSize();
if(size>0){//변경할 사진이 업로드 됨
   if(oldfile!=null && !oldfile.equals("member.jpg"))
    Utility.deleteFile(upDir,oldfile);//웹서버에 존재하는 변경전 파일 삭제
   fname = UploadSave.saveFile(fileItem, upDir);
}
 
//dao의 updateFile() 사진이름을 변경
int cnt = dao.updateFile(id, fname,oldfile);
 
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
<DIV align="center" style="color: #3366cc;font-weight: bold;font-size: 25px">사진 변경</DIV><br>
 
<DIV class="content">
<%
if(cnt==1){
   out.print("<div style='font-size:30px'>사진을 변경했습니다.</div>");
}else{
   out.print("<div style='font-size:30px'>사진변경를 실패했습니다.</div>");
}

%>
<br>
</DIV>
<% if(cnt==1){ %>
<DIV class='bottom'>
  <input id='button' type='button' value='나의정보' onclick="location.href='read.jsp?id=<%=id%>'">
</DIV>
<%}else{ %>
 <DIV class='bottom'>
  <input id='button' type='button' value='다시시도' onclick="history.back()">
</DIV>
<%} %>
</div>
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp"/>
</body>
<!-- *********************************************** -->
</html> 