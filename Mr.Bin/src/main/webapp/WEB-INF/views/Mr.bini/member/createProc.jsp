<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="utility.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<jsp:useBean id="dao" class="member.MemberDAO" />
<jsp:useBean id="dto" class="member.MemberDTO" />
<% 
request.setCharacterEncoding("utf-8");
String root = request.getContextPath();
    //업로드 폴더와 임시폴더 설정
    String upDir=application.getRealPath("/Mr.bini/member/storage");
    String tempDir = application.getRealPath("/Mr.bini/member/temp");
    //업로드 처리 모듈객체 생성
    UploadSave upload = 
    new UploadSave(request,-1,-1,tempDir);   //생성자가 매개변수값이 있는 생성자는 usebean을 사용하지못함. 
    //모듈객체를 이용해서 보내는 파라메터값과 파일받음
    FileItem fileItem = upload.getFileItem("fname");
    int size = (int)fileItem.getSize();
    String fname = null;
    if(size>0){
        fname = UploadSave.saveFile(fileItem, upDir);
    }else{
        fname = "member.jpg";
    }
    
    String id = upload.getParameter("id");
    String passwd = upload.getParameter("passwd");
    String tel = upload.getParameter("tel");
    String email = upload.getParameter("email");
    String zipcode = upload.getParameter("zipcode");
    String job = upload.getParameter("job");
    //한글인코딩 추가
    String mname = UploadSave.encode(upload.getParameter("mname"));
    String address1 = UploadSave.encode(upload.getParameter("address1"));
    String address2 = UploadSave.encode(upload.getParameter("address2"));
      
    //받은 파라메터와 파일을 DTO 객체 담고DAO의 
    //create()로 디비저장
 
    dto.setId(id);
    dto.setPasswd(passwd);
    dto.setTel(tel);
    dto.setEmail(email);
    dto.setZipcode(zipcode);
    dto.setJob(job);
    dto.setMname(mname);
    dto.setAddress1(address1);
    dto.setAddress2(address2);
    dto.setFname(fname);
    
    int cnt = dao.create(dto);
    
%> 
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 

<link rel="stylesheet" href="<%=root %>/css/skin.css">
<link rel="stylesheet" href="<%=root %>/css/loginbar.css">
</head> 
<body leftmargin="0" topmargin="0">
<!-- *********************************************** -->
<jsp:include page="/menu/top.jsp" />
<!-- *********************************************** -->
<div class='article_skin'>
<DIV class="title">회원가입 처리</DIV>
 
<DIV class="content">
<%
if(cnt==1){
   out.print("<div style='font-size:30px'>회원가입을 했습니다.<div>");
 
}else{
   out.print("<div style='font-size:30px'>회원가입을 실패했습니다.</div>");
 
}
 
%>
</DIV>
<% if(cnt==1){ %>
<DIV class='bottom'>
  <input id='button' type='button' value='로그인' onclick="location.href='loginForm.jsp'">
  <input id='button' type='button' value='홈' onclick="location.href='<%=root%>/index.jsp'">
</DIV>
<%}else{ %>
 <DIV class='bottom'>
  <input id='button' type='button' value='다시시도' onclick="history.back()">
  <input id='button' type='button' value='홈' onclick="location.href='<%=root%>/index.jsp'">
</DIV>
<%} %>
</div>
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" />
</body>
<!-- *********************************************** -->
</html> 