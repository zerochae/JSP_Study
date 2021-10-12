<%@page import="kr.or.ddit.chap08.util.Cookies"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	Cookies cookies = new Cookies(request);
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

name 쿠키 = <%=cookies.getValue("name") %> <br>

<% if(cookies.exists("id")) { %>
id 쿠키 = <%=cookies.getValue("id") %> <br>
<%} %>
</body>
</html>