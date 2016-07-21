<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="bbs.*,java.util.*,utility.*"%>
<jsp:useBean id="dao" class="bbs.BbsDAO" />
<jsp:useBean id="rdao" class="bbs.ReplyDAO" />
<%
	String id = Utility.nullCheck((String) session.getAttribute("id"));
	String root = request.getContextPath();
	int bbsno = Integer.parseInt(request.getParameter("bbsno"));
	String col = (String) request.getParameter("col");
	String word = (String) request.getParameter("word");
	int nowPage = Integer.parseInt(request.getParameter("nowPage"));
	dao.increaseViewcnt(bbsno);
	BbsDTO dto = dao.read(bbsno);
	String content = dto.getContent();
	content = content.replaceAll("\r\n", "<br>");
	boolean flag = dao.refnumCheck(bbsno);

	/* 댓글 관련  시작 */
	String url = "read.jsp";
	int nPage = 1; //시작 페이지 번호는 1부터 

	if (request.getParameter("nPage") != null) {
		nPage = Integer.parseInt(request.getParameter("nPage"));
	}
	int recordPerPage = 3; // 한페이지당 출력할 레코드 갯수

	int sno = ((nPage - 1) * recordPerPage) + 1; // 
	int eno = nPage * recordPerPage;

	Map map = new HashMap();
	map.put("sno", sno);
	map.put("eno", eno);
	map.put("bbsno", bbsno);

	List<ReplyDTO> list = rdao.list(map);

	int total = rdao.total(bbsno);
	int imgno=0;
	String paging = Utility.paging(total, nPage, recordPerPage, url, bbsno,imgno, nowPage, col, word);

	/* 댓글 관련 끝 */
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript">
function rcheck(tarea) {
	if ('<%=id%>' == "") {
		if (confirm("로그인후 댓글를 쓰세요")) {
			var url = "../member/loginForm.jsp";
			url = url + "?bbsno=<%=bbsno%>";
			url = url + "&nowPage=<%=nowPage%>";
			url = url + "&nPage=<%=nPage%>";
			url = url + "&col=<%=col%>";
			url = url + "&word=<%=word%>";
			url = url + "&flag=../bbs/read.jsp";
			location.href = url;
		} else {
			tarea.blur();
		}
	}
}

function input(f) {
	if ('<%=id%>' == "") {
		if (confirm("로그인후 댓글를 쓰세요")) {
			var url = "../member/loginForm.jsp";
			url = url + "?bbsno=<%=bbsno%>";
			url = url + "&nowPage=<%=nowPage%>";
			url = url + "&nPage=<%=nPage%>";
			url = url + "&col=<%=col%>";
			url = url + "&word=<%=word%>";
			url = url + "&flag=../bbs/read.jsp";
			location.href = url;
			return false;
		} else {

			return false;
		}
	} else if (f.content.value == "") {
		alert("댓글 내용을 입력하세요.");
		f.content.focus();
		return false;
	}
}
function rupdate(rnum, rcontent) {
	var f = document.rform;
	f.content.value = rcontent;
	f.rnum.value = rnum;
	f.rsubmit.value = "수정";
	f.action = "./rupdateProc.jsp"
}
function rdelete(rnum) {
	if (confirm("정말삭제 하겠습니까?")) {
		var url = "./rdeleteProc.jsp";
		url = url + "?rnum=" + rnum;
		url = url + "&bbsno=<%=bbsno%>";
		url = url + "&nowPage=<%=nowPage%>";
		url = url + "&nPage=<%=nPage%>";
		url = url + "&col=<%=col%>";
		url = url + "&word=<%=word%>";
		location.href = url;
	}
}
// 댓글 스크립트 끝
function deleteM(flagg){
	if(flagg==true){
		alert("답글이 있으므로 삭제할 수 없습니다.")
		return false;
	}else{
	var url="./deleteForm.jsp"
	url+="?bbsno=<%=bbsno%>";
	url+="&col=<%=col%>";
	url+="&word=<%=word%>";
	url+="&nowPage=<%=nowPage%>";
	
	confirm("삭제하면 복구할 수 없습니다")
			location.href=url;}
}

function listB(){
	var url="./list.jsp"
	url+='?col=<%=col%>';
	url+='&word=<%=word%>';
	url+="&nowPage=<%=nowPage%>";
			location.href=url;
}
function updateB(){
	var url="./updateForm.jsp"
	url+="?col=<%=col%>";
	url+="&word=<%=word%>";
	url+="&bbsno=<%=bbsno%>";
	url+="&nowPage=<%=nowPage%>";
	location.href=url;
} 
function replyB(){
	var url="./replyForm.jsp"
	url+="?col=<%=col%>";
	url+="&word=<%=word%>";
	url+="&bbsno=<%=bbsno%>";
	url+="&nowPage=<%=nowPage%>";

		location.href = url;
	}
</script>
<link rel="stylesheet" href="<%=root%>/css/skin.css">
<link rel="stylesheet" href="<%=root%>/css/loginbar.css">
</head>
<!-- *********************************************** -->
<body>
	<jsp:include page="/menu/top.jsp" flush="false" />
	<!-- *********************************************** -->
	<div class='article_skin'>
		<DIV align="left" style="color: #3366cc; font-weight: bold;">게시판</DIV>

		<TABLE style="margin-left: auto; margin-right: auto">
			<TR>
				<TH align="left" colspan='3' style="font-size: 35px; color: #484848"><%=dto.getTitle()%></TH>
			</TR>
			<TR align="left">
				<TD style="font-size: 13px; color: #b2b2b2; font-weight: 400"
					colspan="2">&emsp;작성자&nbsp;: <%=dto.getWname()%> &emsp;
					조회수&nbsp;: <%=dto.getViewcnt()%>&emsp; 등록일&nbsp;: <%=dto.getWdate()%>
				</TD>
				<td style="width: 300px"><a style="color: #0000aa"
					href="javascript:listB()">목록</a>&ensp; <a
					href="javascript:updateB()">수정</a>&ensp; <a
					href="javascript:deleteM(<%=flag%>)">삭제</a>&ensp; <a
					href="javascript:replyB()">답변</a></td>
			</TR>
			<tr>
				<td><br> <br></td>
			</tr>
			<TR>
				<TD style="width: 5px;"></TD>
				<TD colspan='2'
					style="text-align: left; width: 500px; font-size: 14px;"><%=content%></TD>
			</TR>
		</TABLE>
		<br>
		<br>
		<%
			int rcount = rdao.rcount(dto.getBbsno());
		%>
		<div style="text-align: left; font-weight: bold;">
			댓글 갯수(<%=rcount%>)
		</div>
		<%
			for (int i = 0; i < list.size(); i++) {
				ReplyDTO rdto = list.get(i);
		%>
		<br>
		<table style="width: 800px">
			<tr>
				<td style="text-align: left;"><%=rdto.getId()%> <%=rdto.getRegdate()%></td>
				<td style="text-align: right;">
					<%
						if (id.equals(rdto.getId())) {
					%> <a
					href="javascript:rupdate('<%=rdto.getRnum()%>','<%=rdto.getContent()%>')">수정</a>|
					<a href="javascript:rdelete('<%=rdto.getRnum()%>')">삭제</a>
 <%
 	}
 %>
				</td>
			</tr>
			<tr>
				<td style="text-align: left;" colspan='2'><%=rdto.getContent()%></td>
			</tr>
			<tr>
				<td style="height: 5px" colspan='2'></td>
			</tr>
		</table>
		<%
			}
		%>
		<div class="rcreate"
			style="background-color: #f2f2f2; text-align: center; padding: 30px; border-radius: 10px">
			<form name="rform" action="./rcreateProc.jsp" method="post"
				onsubmit="return input(this)">
				<textarea rows="5" cols="100" name="content" onclick="rcheck(this)"></textarea>
				<br>
				<br>
				<div style="text-align: right;">
					<input id='white' type="submit" name="rsubmit" value="등록">
				</div>
				<input type="hidden" name="bbsno" value="<%=bbsno%>"> <input
					type="hidden" name="id" value="<%=id%>"> <input
					type="hidden" name="nowPage" value="<%=nowPage%>"> <input
					type="hidden" name="nPage" value="<%=nPage%>"> <input
					type="hidden" name="col" value="<%=col%>"> <input
					type="hidden" name="word" value="<%=word%>"> <input
					type="hidden" name="rnum" value="0">
			</form>
		</div>
		<br>
		<div class="bottom">
			<%=paging%>
		</div>
	</div>


	<!-- *********************************************** -->
	<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
<!-- *********************************************** -->
</html>