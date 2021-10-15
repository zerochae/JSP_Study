<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<%

	String id = request.getParameter("id");
	String password = request.getParameter("password");

	if(id.equals("a001")&&password.equals("asdfasdf")){
		session.setAttribute("MEMBERID", id);
		session.setAttribute("PASSWORD" , password);
%>

<head>
<meta charset="UTF-8">
<title>login성공</title>
</head>
<body>

로그인에 성공했음 <br>
<a href="./setSessionTimeout.jsp">타임아웃설정</a> <br>
<a href="./sessionLoginCheck.jsp">로그인여부검사</a> <br>
<a href="./sessionLogout.jsp">로그아웃</a>

<%
	} else {
%>
<script>
		alert("로그인 실패");
		history.go(-1);
</script>
<% 
	} 
%>
</body>
</html>

