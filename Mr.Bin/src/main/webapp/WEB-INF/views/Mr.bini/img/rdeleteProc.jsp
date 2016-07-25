<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="rdao" class="img.ImgReplyDAO"/> 
<%
request.setCharacterEncoding("UTF-8");
int nowPage=Integer.parseInt(request.getParameter("nowPage"));
int nPage=Integer.parseInt(request.getParameter("nPage"));
int rnum=Integer.parseInt(request.getParameter("rnum"));
String col=(String)request.getParameter("col");
String word=(String)request.getParameter("word");
int imgno=Integer.parseInt(request.getParameter("imgno"));

int total = rdao.total(imgno);//댓글전체레코드값을 가져와서
int totalPage = (int)(Math.ceil((double)total/3)); // 전체 페이지  
if(rdao.delete(rnum)){
	if(nPage!=1&&nPage==totalPage&&total%3==1){//마지막페이지의 마지막레코드이면(3은 한페이지당보여줄 레코드 갯수)
		nPage=nPage-1;  //현재의 페이지값에서 1을 빼자 
	}
%>
<script type="text/javascript">
var url="./read.jsp";
url+="?imgno=<%=imgno%>";
url+="&col=<%=col%>";
url+="&word=<%=word%>";
url+="&nowPage=<%=nowPage%>";
url+="&nPage=<%=nPage%>";
		location.href=url;
</script>
<%
}else{
	out.print("댓글삭제 오류");
}
%>
