<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="/ELFunctions"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/skin.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/loginbar.css">

<script type="text/javascript">
function read(imgno){
	var url = "./read.jsp";
	url = url+"?imgno=" + imgno;	
	loction.href = url;
}
</script>
</head>
<body>
	<jsp:include page="/menu/top.jsp" flush="false" />
<div class='article_skin'>
<DIV align="left" style="color: #3366cc;font-weight: bold;margin-left: 30px">이미지 목록</DIV>
	<br>

	<div class="search" align="center">
		<FORM method='POST' action='./list.jsp'>
			<select name="col">
				<option value="wname"
				<c:if test="${col=='wname'}">selected</c:if>>작성자</option>
				<option value="title"
				<c:if test="${col=='title'}">selected</c:if>>제목</option>
				<option value="content"
				<c:if test="${col=='content'}">selected</c:if>>내용</option>
				<option value="total"
				<c:if test="${col=='total'}">selected</c:if>>전체출력</option>
			</select> 
			<input type="search" name="word" value="${word}"> 
			<input id="button" type="submit" value="검색">
		</form>
	</div>
	<br>
	<TABLE  style="width: 700px;margin-left: auto; margin-right: auto;"  >
		<tr>
			<th></th>
			<TH style="width: 10%">imgno</TH>
			<TH style="width: 20%">제목</TH>
			<TH style="width: 10%">작성자</TH>
			<TH style="width: 30%">내용</TH>
			<TH style="width: 50%">이미지파일명</TH>
			
		</tr>
<c:forEach items="${list}" var="dto">
<c:set var="rcount" value="${util:rcount(dto.imgno,rdao)}"></c:set>
		<TR>
			<TD  style="text-align: center;vertical-align: middle;">
			<Img src='${pageContext.request.contextPath}/Mr.bini/img/storage/${dto.filename}' width="120px"></TD>
			<TD style="text-align: center ;vertical-align: middle">${dto.imgno}</TD>
			<TD style="text-align: center ;vertical-align: middle; font-weight: bolder;">
                <a style="text-decoration:none" onmouseover="this.style.color='#44a2ff'"
				onmouseout="this.style.color='black'" href='./read.jsp?imgno=${dto.imgno}&nowPage=${nowPage}&col=${col}&word=${word}'>

	<c:forEach begin="1" end="${dto.indent}">
	&nbsp;&nbsp;
	</c:forEach>
	<c:if test="${dto.indent>0}">
	[답변]${dto.title}
	</c:if>
	<c:if test="${rcount>0}">(${rcount})</c:if></a>
			</TD>
			<TD style="text-align: center ;vertical-align: middle">${dto.wname}</TD>
			<TD style="text-align: center ;vertical-align: middle">${dto.content}</TD>
			<TD style="text-align: center ;vertical-align: middle">${dto.filename}</TD>
		</TR>
</c:forEach>
	</TABLE>
	<BR>
	<DIV class='bottom'>
		${paging}
		<br>
		<center><input style="border:none;border:1px solid #d8d8d8;border-radius:7px ;background-color:#ffffff;color:#6c6c6c;font-weight:bold; width: 70px; height: 35px"
		 type='button' value='등록' onclick="location.href = './createForm.jsp'"></center>
	</DIV>
	</div>
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
<!-- *********************************************** -->
</html>
