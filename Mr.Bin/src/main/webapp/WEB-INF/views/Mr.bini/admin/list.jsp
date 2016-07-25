<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="member.*,java.util.*,utility.*" %>
<jsp:useBean id="dao" class="member.MemberDAO"/>
 
<% request.setCharacterEncoding("utf-8");
String root=request.getContextPath();
String grade=Utility.nullCheck((String)session.getAttribute("grade"));
String id=Utility.nullCheck((String)session.getAttribute("id"));

   //검색관련
   String col = Utility.nullCheck(request.getParameter("col"));
   String word = Utility.nullCheck(request.getParameter("word"));
 
   if(col.equals("total"))word="";
   
   //paging 관련
   int nowPage =1; //현재페이지
   int recordPerPage = 5; //한페이지당 보여줄 레코드 갯수
   if(request.getParameter("nowPage")!=null){
  nowPage = Integer.parseInt(request.getParameter("nowPage"));
   }
   
   int sno = ((nowPage -1) * recordPerPage) +1;    
   int eno =  nowPage * recordPerPage;
   
   Map map = new HashMap();
   map.put("col", col);
   map.put("word", word);
   map.put("sno", sno);
   map.put("eno", eno);
   
   int total = dao.total(col,word);
   
   String paging = new Paging().paging2(total, nowPage, recordPerPage, col, word);
   
%> 
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 


 
<link rel="stylesheet" href="<%=root %>/css/skin.css">
<link rel="stylesheet" href="<%=root %>/css/loginbar.css">
 
</head> 
<body> 

<jsp:include page="/menu/top.jsp"/>
 <%if(!(id.equals("admin"))){%>
	 <script>location.href="<%=root%>/Mr.bini/member/loginForm.jsp";</script>
 <%}else{%>
<div class='article_skin'>
<div style="box-shadow:0 0 1em gray;padding:40px">
<DIV align="left" style="color: #3366cc;font-weight: bold;margin-left: 30px">회원목록</DIV><br>
 
<DIV class="content"> 
 
<FORM method="POST" action="./list.jsp">
<select name="col">
<option value="mname"
<%if(col.equals("mname")) out.print("selected='selected'"); %>
>성명</option>
<option value="email"
   <%if(col.equals("email")) out.print("selected='selected'"); %> 
>이메일</option>
<option value="id"
   <%if(col.equals("id")) out.print("selected='selected'"); %> 
>아이디</option>
<option value="total"
   <%if(col.equals("total")) out.print("selected='selected'"); %> 
>전체출력</option>
</select>
<input type="search" name="word" value="<%=word %>">
<input id='button'type="submit" value="검색" />
</FORM>
</DIV>
 <br>
<% 
List<MemberDTO> list = dao.list(map);
 
for(int i=0; i < list.size(); i++){ 
  MemberDTO dto = list.get(i);   
   
%> 
 
<TABLE align='center' width='70%'> 
  
  <TR> 
    <TD rowspan='5' width='20%' align="center">
     <%if(dto.getFname()==null){
    	 dto.setFname("member.jpg");
      }%>
    <IMG src='<%=root %>/Mr.bini/member/storage/<%=dto.getFname() %>' width='100%'></TD> 
    <TH width='20%'>아이디</TH> 
    <TD width='60%'><A onmouseover="this.style.color='#44a2ff'"
				onmouseout="this.style.color='black'"
				style="font-size:17px;font-weight:bold ;text-decoration: none"
				href='<%=root %>/Mr.bini/member/read.jsp?id=<%=dto.getId() %>'><%=dto.getId() %></A></TD>
  </TR>
   
  <TR> 
    <TH>성명</TH> 
    <TD><%=dto.getMname() %></TD> 
  </TR> 
  <TR> 
    <TH>전화번호</TH> 
    <TD><%=dto.getTel() %></TD> 
  </TR> 
  <TR> 
    <TH>이메일</TH> 
    <TD><%=dto.getEmail() %></TD> 
  </TR> 
  <TR> 
    <TH>주소</TH> 
    <TD><%=dto.getAddress1() %> 
    
        <% if (dto.getAddress2() != null){
             out.print(dto.getAddress2());
           } 
        %>
        
    </TD> 
  </TR> 
 
</TABLE> 
<BR> 
<% 
} 
%> 
 
<DIV class="bottom"> 
<%=paging %>
</DIV> 
</div>
 <%} %>
 </div>
<jsp:include page="/menu/bottom.jsp"/>
</body> 
</html> 