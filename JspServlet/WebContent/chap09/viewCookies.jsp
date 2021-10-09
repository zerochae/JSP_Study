<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키 목록</title>
</head>
<body>
	쿠키 목록 <br>
	
<% Cookie[] cookies = request.getCookies(); %>
	<%	if (cookies != null && cookies.length > 0) { %>
	<%		for (int i = 0; i < cookies.length; i++) { %>
				<%= cookies[i].getName() %> = <%= URLDecoder.decode(cookies[i].getValue(), "utf-8") %>
						<br>
			<% }  %>
	<%	} else { %>
	쿠키가 존재하지 않습니다.
<% } %>
<br>
<a href="/chap09/modifyCookie.jsp">쿠키값 변경</a>
<a href="/chap09/deleteCookie.jsp">쿠키값 삭제</a>
<a href="/chap09/makeCookie.jsp">쿠기값 생성</a>
</body>
</html>