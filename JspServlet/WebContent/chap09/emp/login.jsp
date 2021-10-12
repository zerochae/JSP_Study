<%@page import="kr.or.ddit.chap08.util.Cookies"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%

	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String result = "로그인 실패";
	if(id.equals("a001")&&password.equals("java")){
		response.addCookie(Cookies.createCookie("AUTH", id,-1));
		result = "로그인 성공";
	}

%>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 결과</title>
</head>
<body>

<%=result %>

</body>
</html>