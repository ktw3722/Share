<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="utility.*" %> 
<jsp:useBean id="dao" class="member.MemberDAO"/>
<% 
request.setCharacterEncoding("utf-8");
String root = request.getContextPath();
String id = request.getParameter("id");
String passwd = request.getParameter("passwd");
String flag = Utility.nullCheck(request.getParameter("flag"));
String imgflag = Utility.nullCheck(request.getParameter("imgflag"));

int cnt = 0;
String grade = ""; //회원 등급
String mname="";
cnt = dao.loginCheck(id, passwd);

if(cnt==1){
	grade = dao.getGrade(id);
	mname = dao.getName(id);
	session.setAttribute("id", id);
	session.setAttribute("grade", grade);
	session.setAttribute("mname", mname);

    // ---------------------------------------------- 
    // Cookie 저장, Checkbox는 선택하지 않으면 null 임 
    // ---------------------------------------------- 
    Cookie cookie = null; 
       
    String c_id = request.getParameter("c_id"); // Y, 아이디 저장 여부 
       
    if (c_id != null){  // 처음에는 값이 없음으로 null 체크로 처리
      cookie = new Cookie("c_id", "Y");    // 아이디 저장 여부 쿠키 
      cookie.setMaxAge(120);               // 2 분 유지 
      response.addCookie(cookie);          // 쿠키 기록 
   
      cookie = new Cookie("c_id_val", id); // 아이디 값 저장 쿠키  
      cookie.setMaxAge(120);               // 2 분 유지 
      response.addCookie(cookie);          // 쿠키 기록  
         
    }else{ 
      cookie = new Cookie("c_id", "");     // 쿠키 삭제 
      cookie.setMaxAge(0); 
      response.addCookie(cookie); 
         
      cookie = new Cookie("c_id_val", ""); // 쿠키 삭제 
      cookie.setMaxAge(0); 
      response.addCookie(cookie); 
    } 
    // ---------------------------------------------
    if(!imgflag.equals("")){
		
 	%>			
	   <script type="text/javascript">
	   		var url = '<%=imgflag%>';
	   		url = url + '?imgno=<%=request.getParameter("imgno")%>';
	   		url = url + '&nowPage=<%=request.getParameter("nowPage")%>';
	   		url = url + '&nPage=<%=request.getParameter("nPage")%>';
	   		url = url + '&col=<%=request.getParameter("col")%>';
	   		url = url + '&word=<%=request.getParameter("word")%>';
	   		location.href= url;
	   </script>
<%		
    }else if(!flag.equals("")){
		
 	%>			
	   <script type="text/javascript">
	   		var url = '<%=flag%>';
	   		url = url + '?bbsno=<%=request.getParameter("bbsno")%>';
	   		url = url + '&nowPage=<%=request.getParameter("nowPage")%>';
	   		url = url + '&nPage=<%=request.getParameter("nPage")%>';
	   		url = url + '&col=<%=request.getParameter("col")%>';
	   		url = url + '&word=<%=request.getParameter("word")%>';
	   		location.href= url;
	   </script>
<%		
	}else{
		response.sendRedirect("../../index.jsp");
	}
  
}else{
    out.print("id와 passwd가 일치하지 않습니다.");    
}
%>