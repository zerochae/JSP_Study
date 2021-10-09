<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>현재 시간</title>
</head>
<body>

	<%
		//request 기본 객체는 makeTime.jsp에서 전달해준 객체와 같은 것임
	//makeTime.jsp와 viewTime.jsp는 하나의 request 기본 객체를 공유함
	//왜냐하면, request 기본 객체는 한 번의 요청에 대해 유효하게 동작하므로..
	Calendar cal = (Calendar) request.getAttribute("time");
	%>

	현재 시간은 <%=cal.get(Calendar.HOUR)%>시 <%=cal.get(Calendar.MINUTE)%>분 <%=cal.get(Calendar.SECOND)%>초 입니다.

</body>
</html>