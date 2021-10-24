<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<%@ include file="menu.jsp"%>
	<%!String greeting = "웹 쇼핑몰에 오신 것을 환영합니다";
	String tagline = "Welcome to Web Market!";%>

	<div class="jumbotron">
		<div class="text-center">
			<h3><%=tagline%></h3>
			<%
			//5초 마다 새로고침
			response.setIntHeader("Refresh", 5);
			Date day = new Date();
			String am_pm;
			int hour = day.getHours();
			int minute = day.getMinutes();
			int second = day.getSeconds();
			if (hour / 12 == 0) {
				am_pm = "AM";
			} else {
				am_pm = "PM";
				hour = hour - 12;
			}

			String CT = hour + " : " + minute + " : " + second +" "+ am_pm;
			out.print(" 현재 접속 시간  " + CT + "\n");
			%>
		</div>

	</div>

	<%@ include file="footer.jsp"%>

</body>
</html>