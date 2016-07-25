<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./ssi.jsp"%>
<jsp:useBean id="dao" class="memo.memoDAO" />

<%
String root = request.getContextPath();
	int memono = Integer.parseInt(request.getParameter("memono"));
	String nowPage=request.getParameter("nowPage");
	String col=request.getParameter("col");
	String word=request.getParameter("word");
	dao.upViewcnt(memono);//조회수 증가
	memoVO vo=dao.read(memono);//한건의 레코드 가져오기
	
	String content= vo.getContent().replaceAll("\r\n","<br>");
	String wdate=vo.getWdate().substring(0,10);
	
	
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
<link rel="stylesheet" href="<%=root %>/css/skin.css">
<link rel="stylesheet" href="<%=root %>/css/loginbar.css">


<script type="text/javascript">
function updateM(){
	var url = "updateForm.jsp";
	url += "?memono=<%=memono%>";
	url = url + "&nowPage=<%=nowPage%>";
	url = url + "&col=<%=col%>";
	url = url + "&word=<%=word%>";
	
	location.href = url;
	//혼파망...-_-);
}

function deleteM(){
	var url = "deleteForm.jsp";
	url += "?memono=<%=memono%>";
	url = url + "&nowPage=<%=nowPage%>";
	url = url + "&col=<%=col%>";
	url = url + "&word=<%=word%>";
	location.href = url;
}
function listM(){
	var url = "list.jsp";
	url = url + "?nowPage=<%=nowPage%>";
	url = url + "&col=<%=col%>";
	url = url + "&word=<%=word%>";
	location.href = url;
}

</script>

</head>
<body>
	<jsp:include page="/menu/top.jsp" />
	<div class='article_skin'>
	<DIV align="left" style="color: #3366cc; font-weight: bold;">메모장</DIV>


	<table>
		<TR>
			<TH align="left" colspan='2' style="font-size: 35px; color: #484848"><%=vo.getTitle() %></TH>
		</TR>
		<TR align="left">
			<TD style="font-size: 13px; color: #b2b2b2; font-weight: 400"
				colspan="2">조회수&nbsp;: <%=vo.getViewcnt()%>&emsp; 등록일&nbsp;: <%=vo.getWdate() %>
			</TD>
			<td><a style="color: #0000aa" href="javascript:listM()">목록</a>&ensp;
				<a href="javascript:updateM()">수정</a>&ensp; 
				<a href="javascript:deleteM()">삭제</a>&ensp;
		</TR>
		<tr>
			<td><br>
			<br></td>
		</tr>
		<TR>
			<TD style="width: 5px;"></TD>
			<TD style="width: 500px; font-size: 14px;text-align: left;"><%=content%></TD>
		</TR>

	</table>
	



	</div>

	<jsp:include page="/menu/bottom.jsp" />
</body>
</html>

