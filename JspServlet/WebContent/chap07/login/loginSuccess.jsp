<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
Map<String,Object> member =  (Map<String,Object>)session.getAttribute("member");
%>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 성공</title>
</head>
<body>

<%=member.get("memName")%>(<%=member.get("memId")%>)님 환영합니다.

</body>
</html>