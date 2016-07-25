<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="utility.*" %>
<jsp:useBean id="dao" class="img.ImgDAO"></jsp:useBean>
<jsp:useBean id="dto" class="img.ImgDTO"></jsp:useBean>

<% request.setCharacterEncoding("utf-8");
String root = request.getContextPath();
//업로드 폴더와 임시폴더 설정
String upDir=application.getRealPath("./Mr.bini/img/storage");
String tempDir = application.getRealPath("./Mr.bini/img/temp");
//업로드 처리 모듈객체 생성
UploadSave upload = new UploadSave(request,-1,-1,tempDir);   //생성자가 매개변수값이 있는 생성자는 usebean을 사용하지못함. 
//모듈객체를 이용해서 보내는 파라메터값과 파일받음
FileItem fileItem = upload.getFileItem("filename");
int size = (int)fileItem.getSize();
String filename = null;
if(size>0){
    filename = UploadSave.saveFile(fileItem, upDir);
}
String passwd=upload.getParameter("passwd");
String wname=UploadSave.encode(upload.getParameter("wname"));
String title=UploadSave.encode(upload.getParameter("title"));
String content=UploadSave.encode(upload.getParameter("content"));
int grpno=Integer.parseInt(upload.getParameter("grpno"));
int indent=Integer.parseInt(upload.getParameter("indent"));
int ansnum=Integer.parseInt(upload.getParameter("ansnum"));

dto.setFilename(filename);
dto.setPasswd(passwd);
dto.setWname(wname);
dto.setTitle(title);
dto.setContent(content);
dto.setGrpno(grpno);
dto.setIndent(indent);
dto.setAnsnum(ansnum);


%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답변프록페이지닷!</title>
<script type="text/javascript">
function listB(){
	var url="list.jsp";
	
	location.href=url;
}
</script>

<link rel="stylesheet" href="<%=root %>/css/skin.css">
<link rel="stylesheet" href="<%=root %>/css/loginbar.css">
</head>
<!-- *********************************************** -->
<body>
	<jsp:include page="/menu/top.jsp" flush="false" />
	<!-- *********************************************** -->
<div class='article_skin'>
	<DIV class="content">
		<%
dao.addAnsnum(dto.getGrpno(), dto.getAnsnum());
int cnt= dao.reply(dto);
if(cnt==1){
	out.print("<div style='font-size:30px'>답변을 등록했습니다.</div>");


%>

		<DIV class='bottom'>
			<br><input id='button'type='button' value='목록' onclick="listB()">
		</DIV>
		<%
}else{
	out.print("<div style='font-size:30px'>답변을 등록을 실패하였습니다.</div>");
	%>

		<DIV class='bottom'>
			<br><input id='button'type='button' value='다시 시도' onclick="history.back();">
			<input id='button'type='button' value='목록' onclick="listB()">
		</DIV>
		<%} %>
	</div>

</div>

	<!-- *********************************************** -->
	<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
<!-- *********************************************** -->
</html>
