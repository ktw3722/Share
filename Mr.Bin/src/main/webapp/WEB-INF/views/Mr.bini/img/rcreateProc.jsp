<%request.setCharacterEncoding("UTF-8");%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="rdao" class="img.ImgReplyDAO"/>
    <jsp:useBean id="rdto" class="img.ImgReplyDTO"/>
    <jsp:setProperty property="*" name="rdto"/>   
<%
int nowPage=Integer.parseInt(request.getParameter("nowPage"));
String col=(String)request.getParameter("col");
String word=(String)request.getParameter("word");
int imgno=Integer.parseInt(request.getParameter("imgno"));
if(rdao.create(rdto)){
%>
<script type="text/javascript">
var url="./read.jsp";
url+="?imgno=<%=imgno%>";
url+="&col=<%=col%>";
url+="&word=<%=word%>";
url+="&nowPage=<%=nowPage%>";
		location.href=url;
</script>
<%
}else{
	out.print("댓글생성 오류");
}
%>
