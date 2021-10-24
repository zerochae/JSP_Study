<%@page import="kr.or.ddit.guestbook.service.WriteMessageService"%>
<%@page import="kr.or.ddit.guestbook.vo.GuestbookMessageVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>방명록에 메시지를 남김</title>
</head>
<body>

	<%
		request.setCharacterEncoding("utf-8");
	%>

	<jsp:useBean id="message"
		class="kr.or.ddit.guestbook.vo.GuestbookMessageVO">
		<jsp:setProperty name="message" property="*" />
	</jsp:useBean>

	<%
		// GuestbookMessageVO message = new GuestbookMessageVO();
	// int messageId = request.getParameter("messageId") == null ? 0 : Integer.parseInt(request.getParameter("messageId"));
	// message.setMessageId(messageId);
	// message.setGuestName(request.getParameter("guestName"));
	// message.setPassword(request.getParameter("password"));
	// message.setMessage(request.getParameter("message"));

	// out.print("message : " + message.toString());

	WriteMessageService writeService = WriteMessageService.getInstance();
	if (writeService.write(message) > 0) {
	%>
	<p>방명록에 메시지를 남겼습니다</p>
	<%
		} else {
	%>
	<p>실패함</p>
	<%
		}
	%>
	<a href="list.jsp">[목록보기]</a>
	<script type="text/javascript">
			window.setInterval( ()=> {
			location.href="/guestbook/list.jsp"
			});
		</script>
</body>
</html>