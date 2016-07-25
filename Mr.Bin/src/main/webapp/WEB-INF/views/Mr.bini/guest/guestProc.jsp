<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,guest.*,java.text.SimpleDateFormat"%>
<%  request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="dao" class="guest.GuestDAO" />
<jsp:useBean id="dto" class="guest.GuestDTO" />
<jsp:setProperty property="*" name="dto" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>방명록Proc.jsp</title>
</head>
<body>
<%
dao.create(dto.getContent(), dto.getMname(),dto.getWdate());
%>
<span style="font-weight: bold;"><%=dto.getMname() %></span>-<%=dto.getContent() %>(<%=dto.getWdate()%>)
</body>
</html>