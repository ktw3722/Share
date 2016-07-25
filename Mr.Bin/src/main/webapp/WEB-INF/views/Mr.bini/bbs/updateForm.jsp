<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="bbs.*" %>
<jsp:useBean id="dao" class="bbs.BbsDAO"/>
<%
String root = request.getContextPath();
int bbsno=Integer.parseInt(request.getParameter("bbsno"));
BbsDTO dto=dao.read(bbsno);
String col=request.getParameter("col");
String word=request.getParameter("word");
String nowPage=request.getParameter("nowPage");
String mname=(String)session.getAttribute("mname");
%>
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<link rel="stylesheet" href="<%=root %>/css/skin.css">
<link rel="stylesheet" href="<%=root %>/css/loginbar.css">
<script type="text/javascript" src="<%=request.getContextPath() %>/ckeditor/ckeditor.js"></script>
 <script type="text/JavaScript">
   window.onload=function(){
     CKEDITOR.replace('content');  // <TEXTAREA>태그 id 값
  };
 </script>
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
<div class=article_skin>
<FORM name='frm' method='POST' action='updateProc.jsp'>
<input type="hidden" name="bbsno" value=<%=bbsno%>>
<input type="hidden" name="col" value=<%=col%>>
<input type="hidden" name="word" value=<%=word%>>
<input type="hidden" name="nowPage" value=<%=nowPage%>>
<input type="hidden" name="wname" value=<%=dto.getWname()%>>
<DIV align="left" style="color: #3366cc;font-weight: bold;">게시판</DIV>
  <table>
     <TR>
      <TH colspan="2"><input style="border:none;border:1px solid #d8d8d8;width:900px;height: 35px" type="text" name="title" value="<%=dto.getTitle() %>" maxlength="33"></TH>
    </TR>
     <TR align="left">
      <TD style="font-size: 13px;color: #b2b2b2;font-weight: 400" colspan="2">
      	&emsp;작성명&nbsp;: <%=dto.getWname() %> &emsp;
     	조회수&nbsp;: <%=dto.getViewcnt()%>&emsp;
     	등록일&nbsp;: <%=dto.getWdate() %>
      </TD>
    </TR>
    <TR>
      <TH style="height:10px"></TH>
    </TR>
    <TR align="left">
      <TD></TD>
    <TR>
      <TD colspan="2"><textarea style="width: 900px;height: 500px" name="content" rows='10' cols='40' placeholder="content" maxlength="1333"><%=dto.getContent() %></textarea></TD>
    </TR>
       <TR>
      <TH style="width: 60px">비밀번호:</TH>
      <TD><input style="border:none;border:1px solid #d8d8d8;width:840px;height: 35px" type="password" name="passwd" placeholder="1234" maxlength="15"></TD>
    </TR>
  </TABLE>
  <br>
  <DIV class='bottom'>
    <input id="button" type='submit' value='전송'>&emsp;
    <input id="button" type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>
</div>
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 