<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="util" uri="/ELFunctions" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript">
function read(bbsno){
	var url="read.jsp";
	url+="?bbsno="+bbsno;
	url+="&col=${col}";
	url+="&word=${word}";
	url+="&nowPage=${nowPage}";
	
	location.href=url;
}

</script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/skin.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/loginbar.css">
</head>
<!-- *********************************************** -->
<body>
	<jsp:include page="/menu/top.jsp" flush="false" />
	<!-- *********************************************** -->
	<div class=article_skin>
	<div style="box-shadow:0 0 1em gray;padding:40px">
<DIV align="left" style="color: #3366cc;font-weight: bold;margin-left: 35px">게시판</DIV><br>
	<div class="search">
	<form method="post" action="./list.jsp">
		<select name="col">
			<option value="title"<c:if test="${col=='title'}">selected</c:if>>제목</option>
			<option value="wname"<c:if test="${col=='wname'}">selected</c:if>>성명</option>
			<option value="content"<c:if test="${col=='content'}">selected</c:if>>내용</option>
			<option value="total"<c:if test="${col=='total'}">selected</c:if>>전체출력</option>
		</select>
	<input type="search" name="word" value="${word}">
	<input id=button type="submit" value="검색">
	</form>
	</div>
	<br>
	<TABLE style=" width: 600px ;margin-left: auto; margin-right: auto">
		<c:choose>		
		<c:when test="${empty list}">
		<tr>
			<td colspan="8" align="center">등록된 글이 없습니다.</td>
		</tr>
		</c:when>
		<c:otherwise>
		<c:forEach items="${list}" var="dto">
		<c:set var="rcount" value="${util:rcount(dto.bbsno,rdao) }"/>
		<tr>
			<td rowspan="3" >&emsp;&emsp;${dto.bbsno}&emsp;&emsp;</td>
			<th colspan="3" align="left" style="width: 520px">
			<a onmouseover="this.style.color='#44a2ff'"
				onmouseout="this.style.color='black'"
				style="font-size: 30px; text-decoration: none"
				href="javascript:read('${dto.bbsno}')"> 
				
					<c:forEach begin="1" end="${dto.indent}">
					&nbsp;&nbsp;
					</c:forEach>
					<c:if test="${dto.indent}>0">[답변]${dto.title}</c:if>
					<c:if test="${rcount>0}">(${rcount})</c:if>		
			</a>
			      <c:if test="${util:newImg(fn:substring(dto.wdate,0,10))}">
			      <img src="../../menu/images/new.gif">
			      </c:if>
			</th>
		</tr>
		<tr>
			<td colspan="3" style="width:520px" align="left">
			<c:set var="content" value="${dto.content}" ></c:set>	
				<%
				String tempchangeString=(String)pageContext.getAttribute("content");
				String changeString=(String)pageContext.getAttribute("content");				
				
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
		</tr>
		<tr>
			<TD style="color: #ff9900;width: 200px" align="left">작성자 : ${dto.wname}</TD>
			<TD style="width: 150px" align="left">작성일 : ${fn:substring(dto.wdate,0,10)}</TD>
			<TD align="left">조회수 : ${dto.viewcnt}</TD>
		</tr>
		<tr><td><br></td></tr>
		</c:forEach>
		</c:otherwise>
		</c:choose>

	</TABLE>

	<DIV class='bottom' align="center">
		${paging}
	</div>
	</DIV>
		<br> <input type='button' value='등록'
			onclick="location.href='createForm.jsp'" style="border:none;border:1px solid #d8d8d8;border-radius:7px ;background-color:#ffffff;color:#6c6c6c;font-weight:bold; ;width: 70px; height: 35px">
	</div>

	<!-- *********************************************** -->
	<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
<!-- *********************************************** -->
</html>
