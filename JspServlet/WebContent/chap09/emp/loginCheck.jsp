<%@page import="kr.or.ddit.chap08.util.Cookies"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<%

	Cookies cookies = new Cookies(request);

%>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		if (cookies.exists("a001")) {
	%>
	아이디 "<%=cookies.getValue("a001")%>"로 로그인한 상태
	<%
		} else {
	%>
	로그인하지 않은 상태
	<%
		}
	%>
	


</body>
</html>