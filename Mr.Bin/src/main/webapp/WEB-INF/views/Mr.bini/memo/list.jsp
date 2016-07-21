<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file = "./ssi.jsp" %>
<%@ page import="utility.*"%>
<jsp:useBean id="dao" class="memo.memoDAO"/>
<%
request.setCharacterEncoding("utf-8");
String root = request.getContextPath();
int nowPage=1;
int recordPerPage=4;
if(request.getParameter("nowPage")!=null){
	nowPage=Integer.parseInt(request.getParameter("nowPage"));
}
int sno=((nowPage-1)*recordPerPage)+1;
int eno=nowPage*recordPerPage;
String col=Utility.nullCheck(request.getParameter("col"));
String word=Utility.nullCheck(request.getParameter("word"));

if(col.equals("total")) word="";

Map map =new HashMap();
map.put("sno",sno);
map.put("eno",eno);
map.put("col",col);
map.put("word",word);
List<memoVO> list=dao.list(map);

int total=dao.total(col,word);
%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=root %>/css/skin.css">
<link rel="stylesheet" href="<%=root %>/css/loginbar.css">
<script type="text/javascript">
	function read(memono){
		var url = "./read.jsp";
		url = url + "?memono=" + memono;
		url = url + "&nowPage=<%=nowPage%>";
		url = url + "&col=<%=col%>";
		url = url + "&word=<%=word%>";
		//띄어쓰기 주의 -_-) ? memo = (x) ?memo= (o)
		location.href = url; //자바스크립트에서 -get 방식- 링크 보내기
		
	}

</script>

</head>
<body>
<jsp:include page="/menu/top.jsp"/>
<div class='article_skin'>
<div style="box-shadow:0 0 1em gray;padding:40px">
<DIV align="left" style="color: #3366cc;font-weight: bold;margin-left: 30px">메모장</DIV>
	<br>
	<div class="search">
	<form method="post" action="./list.jsp">
		<select name="col">
			<option value="title"
			<%if(col.equals("title")) %> selected
			>제목</option>
			<option value="wdate"
			<%if(col.equals("wdate")) %> selected
			>날짜</option>
			<option value="hit"
			<%if(col.equals("hit")) %> selected
			>조회수</option>
			<option value="total"
			<%if(col.equals("total")) %> selected
			>전체출력</option>
		</select>
	<input type="search" name="word" value="<%=word%>">
	<input id='button' type="submit" value="검색">
	</form>
	</div>
<br>
	<Table style=" width: 600px">

		<%
			if (list.size()==0) {
		%>
		<TR>
			<TD colspan='4'>등록된 메모가 없습니다.</TD>
		</TR>
		<%
			} // end if
			else {
				for(int i=0; i<list.size();i++){
					memoVO vo=list.get(i);
		%>
		<TR>
			<Td rowspan="3" style="width: 50px"><%=vo.getMemono()%></Td>
			<Th colspan='2'align="left"><a onmouseover="this.style.color='#44a2ff'"
				onmouseout="this.style.color='black'"
				style="font-size: 30px; text-decoration: none"
				 href = "javascript:read('<%=vo.getMemono()%>')"><%=vo.getTitle()%></a>
			<%if(Utility.compareDay(vo.getWdate())) {%>
			<img src="../../menu/images/new.gif">
			<%}%>
			</Th>
		</TR>
		<TR>
			<td colspan="3" style="width:520px" align="left" >
				<%
				String tempchangeString=vo.getContent();
				String changeString=vo.getContent();				
				
				int ii=1;
				
				
				while(true){
					
					int c  = tempchangeString.indexOf("<");
					int comparec = tempchangeString.indexOf("<img alt=");
					int d = tempchangeString.indexOf(">");
					
					if(c==comparec && c!=-1){
						
						changeString="";
						changeString = changeString + tempchangeString.subSequence(0, c);
						changeString = changeString + "(이미지" + ii + ")";
						
						changeString = changeString + tempchangeString.subSequence(d+1, tempchangeString.length());
			
						tempchangeString = changeString;
						ii++;
					}
					if(c!=-1 && d!=-1 && c!=comparec){
						changeString="";
						changeString = changeString + tempchangeString.subSequence(0, c);
						
						changeString = changeString + tempchangeString.subSequence(d+1, tempchangeString.length());
					
						
						tempchangeString = changeString;}
					
					if(c==-1 && d==-1){
						break;
					}
						
					
				}
				
				if(changeString.length()<21){
					out.print(changeString);
				}else{
					out.print(changeString.substring(0, 20)+"....");
				}
				
				
				%>
			</td>
		</TR>
		<TR>
			<TD style="width: 25%">작성일 : <%=vo.getWdate()%></TD>
			<TD>조회수 : <%=vo.getViewcnt()%></TD>
		</TR>
		<TR><TD style="height: 30px"></TD></TR>
		<%
			} //for end

			} //if end
		%>
	</Table>
	<%=new Paging().paging2(total, nowPage, recordPerPage, col, word)%>
	</DIV>
<br>
		<input id='button' type="button" value='등록'
			onclick="location.href='./createForm.jsp'" style="border:none;border:1px solid #d8d8d8;border-radius:7px ;background-color:#ffffff;color:#6c6c6c;font-weight:bold; ;width: 70px; height: 35px">
</div>


<jsp:include page="/menu/bottom.jsp"/>
</body>
</html>