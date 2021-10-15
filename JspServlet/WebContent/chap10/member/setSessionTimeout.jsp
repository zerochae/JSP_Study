<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//세션의 유효 시간을 설정(초)
	session.setMaxInactiveInterval(60 * 60);
%>
	<script type="text/javascript">
		alert("유효 시간을 1시간으로 설정함")
		history.go(-1);
	</script>