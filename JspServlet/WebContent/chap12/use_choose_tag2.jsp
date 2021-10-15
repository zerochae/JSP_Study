<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("utf-8");
%>
<html>
<head>
<title>choose 태그</title>
<c:if test="${param.start == 'y'}">
	<script type="text/javascript" src="use_choose_tag2.js"></script>
</c:if>
</head>
<body>

	<!-- 

	야구, 배구, 농구 => 스포츠
	검은태양, 오징어게임 => 드라마보기
	그외 에는 => 몰라!

 --> 

	당신의 취미는 

	<c:choose>
		<c:when
			test="${param.like eq '야구' || param.like eq '배구' || param.like eq '농구'}">스포츠</c:when>
		<c:when test="${param.like eq '검은태양' || param.like eq '오징어게임'}">드라마</c:when>
		<c:otherwise>몰라요</c:otherwise>
	</c:choose>





</body>
</html>