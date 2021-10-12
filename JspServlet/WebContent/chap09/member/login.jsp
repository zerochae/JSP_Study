<%@page import="kr.or.ddit.chap08.util.Cookies"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

String id = request.getParameter("id");
String password = request.getParameter("password");

if(id.equals(password)){
	
	response.addCookie(Cookies.createCookie("AUTH", id,-1));
	
}

%>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 성공</title>
</head>
<body>

로그인에 성공햇씁ㅋㅋ <br>

<a href="/chap09/member/loginCheck.jsp">로그인 췤</a>

</body>
</html>