<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*, img.*, utility.*,bbs.*"%>
<jsp:useBean id="dao" class="img.ImgDAO" />
<jsp:useBean id="rdao" class="img.ImgReplyDAO" />
<%
	request.setCharacterEncoding("utf-8");
	String id=Utility.nullCheck((String)session.getAttribute("id"));
	String root = request.getContextPath();
	int imgno = Integer.parseInt(request.getParameter("imgno"));
	String col = (String) request.getParameter("col");
	String word = (String) request.getParameter("word");
	int nowPage = Integer.parseInt(request.getParameter("nowPage"));
	List list = dao.imgRead(imgno);
	ImgDTO dto = dao.read(imgno);
	
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
	map.put("imgno", imgno);

	List<ImgReplyDTO> rlist = rdao.list(map);

	int total = rdao.total(imgno);
	int bbsno=0;
	String paging = Utility.paging(total, nPage, recordPerPage, url, bbsno ,imgno, nowPage, col, word);

	/* 댓글 관련 끝 */	
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<link rel="stylesheet" href="<%=root %>/css/skin.css">
<link rel="stylesheet" href="<%=root %>/css/loginbar.css">
<script type="text/javascript">
function rcheck(tarea) {
	if ('<%=id%>' == "") {
		if (confirm("로그인후 댓글를 쓰세요")) {
			var url = "../member/loginForm.jsp";
			url = url + "?imgno=<%=imgno%>";
			url = url + "&nowPage=<%=nowPage%>";
			url = url + "&nPage=<%=nPage%>";
			url = url + "&col=<%=col%>";
			url = url + "&word=<%=word%>";
			url = url + "&imgflag=../img/read.jsp";
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
			url = url + "?imgno=<%=imgno%>";
			url = url + "&nowPage=<%=nowPage%>";
			url = url + "&nPage=<%=nPage%>";
			url = url + "&col=<%=col%>";
			url = url + "&word=<%=word%>";
			url = url + "&imgflag=../bbs/read.jsp";
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
		url = url + "&imgno=<%=imgno%>";
		url = url + "&nowPage=<%=nowPage%>";
		url = url + "&nPage=<%=nPage%>";
		url = url + "&col=<%=col%>";
		url = url + "&word=<%=word%>";
		location.href = url;
	}
}
// 댓글 스크립트 끝
</script>
</head>
<!-- *********************************************** -->
<body>
	<jsp:include page="/menu/top.jsp" flush="false" />
	<!-- *********************************************** -->
<div class="article_skin">
	<TABLE style="margin-left: auto; margin-right: auto;">
	 	<TR>
     		 <TH align="left" colspan='5' style="font-size: 35px; color: #484848"><%=dto.getTitle() %></TH>
    	</TR>
    	<TR align="left">
     		 <TD style="font-size: 13px;color: #b2b2b2;font-weight: 400" colspan="2">
      			&emsp;작성자&nbsp;: <%=dto.getWname() %> &emsp;
      		</TD>
      		<td style=" width: 300px;text-align: right;" colspan="3">
      			<a style="color: #0000aa" href='list.jsp'>목록</a>&ensp;
      			<a href='updateForm.jsp?imgno=<%=dto.getImgno()%>&oldfile=<%=dto.getFilename()%>&col=<%=col%>&word=<%=word%>&nowPage=<%=nowPage%>'>수정</a>&ensp;
      			<a href='deleteForm.jsp?imgno=<%=dto.getImgno()%>&oldfile=<%=dto.getFilename()%>'>삭제</a>&ensp;
      			<a href='replyForm.jsp?imgno=<%=dto.getImgno()%>'>답변</a>
      		</td>
    	</TR>
    	<TR>
      <TD colspan='5' style="text-align:left;width: 500px;font-size:14px;">　내용 : <%=dto.getContent()%></TD>
    </TR>
    	<tr><td style="height: 30px"colspan="5"></td></tr>
		<TR>
			<TH colspan="5"><img src="./storage/<%=dto.getFilename()%>" width="300px" height ="300px"></TH>
		</TR>

		<TR>
			<%for(int i = 5; i < 7; i++){ %>
			<%if(list.get(i)!=null){ %>
			<TD style="text-align: center;"><A href='./read.jsp?imgno=<%=list.get(i-5)%>&col=<%=col%>&word=<%=word%>&nowPage=<%=nowPage%>'><img src="./storage/<%=list.get(i)%>" width="100px" height ="100px"><br><%=list.get(i)%></a></TD>
			<%}
			else{%>
			<TD ><img src="./storage/imgfornull.jpg" width="100px" height ="100px"></TD> 
			<%	}} %>
			
			<TD style="text-align: center;border-style: solid; border-width: 3px;  border-color: #3399ff;"><img src="./storage/<%=dto.getFilename()%>" width="100px" height ="100px"><br><%=dto.getFilename() %></TD>
			
			<%for(int i = 8; i < 10; i++){ %>
			<%if(list.get(i)!=null){ %>
			<TD style="text-align: center;"><A href='./read.jsp?imgno=<%=list.get(i-5)%>&col=<%=col%>&word=<%=word%>&nowPage=<%=nowPage%>'><img src="./storage/<%=list.get(i)%>" width="100px" height ="100px"><br><%=list.get(i)%></a></TD>
			<%} else {%>			
			<TD><img src="./storage/imgfornull.jpg" width="100px" height ="100px"></TD>
			<% }}%>
			



		</TR>
	</TABLE>
			<br><br>
	    <%int rcount=rdao.rcount(dto.getImgno());%>
		<div style="text-align: left;font-weight: bold;">댓글 갯수(<%=rcount %>)</div>
		<br>
		<%
			for (int i = 0; i < rlist.size(); i++) {
				ImgReplyDTO rdto = rlist.get(i);
		%>
		<table style="width: 800px ">
		<tr>
			<td style="text-align: left ;"><%=rdto.getId()%>　　　　<%=rdto.getRegdate()%></td>
			<td style="text-align: right;"><%if(id.equals(rdto.getId())){%>
					<a href="javascript:rupdate('<%=rdto.getRnum() %>','<%=rdto.getContent() %>')">수정</a>|
					<a href="javascript:rdelete('<%=rdto.getRnum() %>')">삭제</a>
			<%} %>
			</td>
		</tr>
		<tr>
		<td style="text-align: left ;"colspan='2'><%=rdto.getContent()%></td>
		</tr>
		<tr><td style="height: 5px" colspan='2'></td></tr>
		</table>
		<%}%>
		 <div class="rcreate" style="background-color: #f2f2f2;text-align: center;padding: 30px;border-radius:10px">
  <form name="rform" action="./rcreateProc.jsp" method="post" onsubmit="return input(this)">
  <textarea rows="5" cols="100" name="content" onclick="rcheck(this)" ></textarea>
  <br><br>
  <div style="text-align: right;">
  <input id='white' type="submit" name="rsubmit" value="등록">
  </div>
  <input type="hidden" name="imgno" value="<%=imgno%>">
  <input type="hidden" name="id" value="<%=id %>">
  <input type="hidden" name="nowPage" value="<%=nowPage%>">
  <input type="hidden" name="nPage" value="<%=nPage%>">
  <input type="hidden" name="col" value="<%=col%>">
  <input type="hidden" name="word" value="<%=word%>">
  <input type="hidden" name="rnum" value="0">
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