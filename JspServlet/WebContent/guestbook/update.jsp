<%@page import="kr.or.ddit.guestbook.service.UpdateMessageService"%>
<%@page import="kr.or.ddit.guestbook.service.DeleteMessageService"%>
<%@page import="kr.or.ddit.guestbook.service.GetPasswordService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

	<h4>방명록 수정</h4>

	<%
		request.setCharacterEncoding("utf-8");

	String pw = request.getParameter("password");

	int cnt = -1;
	%>


	<jsp:useBean id="message"
		class="kr.or.ddit.guestbook.vo.GuestbookMessageVO">
		<jsp:setProperty name="message" property="*" />
	</jsp:useBean>

	<%
		GetPasswordService getPw = GetPasswordService.getInstance();

	String result = getPw.getPw(message.getMessageId());

	if (!result.equals(pw)) {
	%>
	<p>비밀번호가 일치하지 않습니다.</p>
	<%
		} else {

	UpdateMessageService ums = UpdateMessageService.getInstance();
	cnt = (ums.update(message));
	if (cnt == 1) {
	%>
	<p>방명록을 수정 하였습니다.</p>
	<%
		} else {
	%>
	<p>방명록 수정 실패!!!</p>
	<%
		}
	}
	%>
	<a href="list.jsp">[목록보기]</a>
	<script type="text/javascript">
			
			window.setInterval( () =>{ 
			location.href="/guestbook/list.jsp"
			});
		</script>
</body>
</html>