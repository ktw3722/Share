<%@ page contentType="text/html; charset=UTF-8" %> 
<jsp:useBean id="dao" class="img.ImgDAO" />
<%  
request.setCharacterEncoding("utf-8");
String root = request.getContextPath();
String imgno=request.getParameter("imgno");
String oldfile = request.getParameter("oldfile");

%>  
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 

<link rel="stylesheet" href="<%=root %>/css/skin.css">
<link rel="stylesheet" href="<%=root %>/css/loginbar.css">eet" type="text/css">
</head> 
<!-- *********************************************** -->
<body leftmargin="0" topmargin="0">
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
<div class='article_skin'>
<DIV align="center" style="color: #3366cc;font-weight: bold;">이미지 삭제</DIV>
 <br>
<FORM name='frm' method='POST' action='./deleteProc.jsp'>
  <input type="hidden" name="imgno" value="<%=imgno%>">
   <input type="hidden" name="oldfile" value="<%=oldfile%>">
  
  <div>
  비밀번호 : <input style="border:none;border:1px solid #d8d8d8;width:350px;height: 35px" type="password" name="passwd"  maxlength="15">

  
  </div>
  <br>
  <DIV>
  
    <input id='button' type='submit' value='삭제'>
    <input id='button' type='button' value='취소' onclick="history.back()">
     
  </DIV>
</FORM>
</div>
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
 