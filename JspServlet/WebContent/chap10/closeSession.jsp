<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<%
	session.invalidate();
%>

<head>
<meta charset="UTF-8">
<title>세션 종료</title>
</head>
<body>

세션을 종료하였습니다.
<a href="./sessionInfo.jsp">세션정보</a>
<a href="./getMemberInfo.jsp">회원정보</a>

</body>
</html>