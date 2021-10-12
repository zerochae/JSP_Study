<%@page import="kr.or.ddit.chap08.util.Cookies"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%

	response.addCookie(Cookies.createCookie("AUTH","",0));
	

%>
<html>
<head>
<meta charset="UTF-8">
<title>로그아웃</title>
</head>
<body>

로그아웃하였습니다.
<a href = "/chap09/member/loginForm.jsp">로그인화면으로 ㄱㄱ</a>

</body>
</html>