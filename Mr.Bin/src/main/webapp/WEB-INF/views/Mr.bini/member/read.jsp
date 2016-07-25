<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="member.*,utility.*" %>
<jsp:useBean id="dao" class="member.MemberDAO"/>
<% 
request.setCharacterEncoding("utf-8");
String root = request.getContextPath();
    //관리자 회원목록에서 이름을 클릭하고 올때
String id = request.getParameter("id");
 
    //일반사용자가 로그인후 나의정보를 클릭하고 올때
    if(id==null){
        id = (String)session.getAttribute("id");
    }
    
    MemberDTO dto = dao.read(id);
%> 
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<link rel="stylesheet" href="<%=root %>/css/skin.css">
<link rel="stylesheet" href="<%=root %>/css/loginbar.css">
<script type="text/javascript">
function deleteM(id,oldfile){
if(confirm("정말탈퇴 하겠습니까?")){
var url = "deleteForm.jsp";
url = url +"?id="+id;
url = url +"&oldfile="+oldfile;
 
location.href=url;
 
}
 
}
function updateFile(id,oldfile){
var url ="updateFileForm.jsp"
url = url + "?id="+id;
url = url + "&oldfile="+oldfile;
 
location.href=url;
}
</script>
</head> 
<!-- *********************************************** -->
<body leftmargin="0" topmargin="0">
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
<div class='article_skin'>
<div style="box-shadow:0 0 1em gray;padding:40px">
 <center>
<DIV style="font-size: 20px;font-weight: bold;" align="center"><%=dto.getMname() %>의 회원정보</DIV><br>
  <TABLE>
  <tr>
  <td style="text-align:right"colspan="2">
  <a style="text-decoration: none; color: #0000aa" href="updateForm.jsp?id=<%=dto.getId()%>">│정보수정│</a>
  <a style="text-decoration: none; color: #0000aa" href="javascript:updateFile('<%=dto.getId()%>','<%=dto.getFname()%>')">사진수정│</a>
  <a style="text-decoration: none;color: #0000aa" href="updatePwForm.jsp?id=<%=dto.getId()%>"> 패스워드 변경│</a>
  <a style="text-decoration: none;color: #0000aa" href="javascript:deleteM('<%=dto.getId()%>','<%=dto.getFname()%>')"> 탈퇴│</a>
  <a style="text-decoration: none;color: #0000aa" href="<%=request.getContextPath() %>/download?dir=/Mr.bini/member/storage&filename=<%=dto.getFname()%>"> 다운로드│</a>
  </td>
  </tr>
    <TR>
      <TD colspan="2">
      <%if(dto.getFname()==null){
    	  dto.setFname("member.jpg");
      }%>
       <img src="<%=root %>/Mr.bini/member/storage/<%=dto.getFname()%>"width="500px">
      </TD>
    </TR>
    <tr><td style="height: 10px"></td></tr>
    <TR>
      <TH>아이디</TH>
      <TD ><%=dto.getId() %></TD>
    </TR>
    <tr> 
      <th>이름</th> 
      <td ><%=dto.getMname() %></td> 
    </tr> 
    <tr> 
      <th>전화번호</th> 
      <td ><%=dto.getTel() %></td> 
    </tr>           
    <tr>  
      <th>이메일</th> 
      <td ><%=dto.getEmail() %></td> 
    </tr> 
    <tr>  
      <th>우편번호</th> 
      <td ><%=dto.getZipcode() %></td> 
    </tr> 
    <tr>  
      <th>주소</th> 
      <td colspan="4"> 
        <%=dto.getAddress1() %> <br> 
        <%=Utility.nullCheck(dto.getAddress2()) %> 
      </td> 
    </tr>
    <tr>  
      <th>직업</th> 
      <td colspan="4"> 
       <%=Utility.getCodeValue(dto.getJob())%></td> 
    </tr> 
    <tr>  
      <th>가입날짜</th> 
      <td colspan="4"><%=dto.getMdate().subSequence(0, 10)%></td> 
    </tr> 
  </TABLE>
    </center>
    </div>
</div>
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 