<%@page import="kr.or.ddit.guestbook.service.GetMessageListService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
GetMessageListService messageListService = GetMessageListService.getInstance();
// messageListService.getMessageList(pageNumber);
%>
<!DOCTYPE html>
<html>
<head>
<title>방명록 메시지 목록</title>
</head>
<body>


	<form action="/guestbook/writeMessage.jsp" method="post">
		이름 : <input type="text" name="guestName" placeholder="이름을 입력해주세요" required /> <br> 
		비밀번호 : <input type="password" name="password" required /> <br> 
		메시지 :<textarea rows="3" cols="30" name="message" required></textarea> <br>
		<input type="submit" value="메시지 남기기">
	</form>

</body>
</html>