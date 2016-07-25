<%@ page contentType="text/html; charset=UTF-8" %> 
<%
int bbsno=Integer.parseInt(request.getParameter("bbsno"));
String col=request.getParameter("col");
String word=request.getParameter("word");
String nowPage=request.getParameter("nowPage");
String root = request.getContextPath();
%>
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<link rel="stylesheet" href="<%=root %>/css/skin.css">
<link rel="stylesheet" href="<%=root %>/css/loginbar.css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
<div class=article_skin>
<FORM name='frm' method='POST' action='./deleteProc.jsp' >
<input type="hidden" name="bbsno" value=<%=bbsno%>>
<input type="hidden" name="col" value=<%=col%>>
<input type="hidden" name="word" value=<%=word%>>
<input type="hidden" name="nowPage" value=<%=nowPage%>>
  <TABLE style="margin: 200px auto;">
    <TR>
      <TH>비밀번호</TH>
      <TD><input style="border:none;border:1px solid #d8d8d8;width:300px;height: 35px" type="password" name="passwd" ></TD>	  
    </TR>
    <tr><td style="height: 30px"></td></tr>
    <tr>
    <td colspan="2" style="text-align: center;"><input id="button" type='submit' value='전송'>&emsp;
	  <input id="button" type='button' value='취소' onclick="history.back()"></td>
    </tr>
  </TABLE>
</FORM>
</div>
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 