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

	<h4>방명록 삭제</h4>

	<%
		request.setCharacterEncoding("utf-8");

	String msgNo = request.getParameter("msgNo");

	String pw = request.getParameter("password");

	int cnt = -1;
	%>

	<%-- <jsp:useBean id="message" class="kr.or.ddit.guestbook.vo.GuestbookMessageVO"> --%>
	<%-- 	<jsp:setProperty name="message" property="*"/> --%>
	<%-- </jsp:useBean> --%>

	<%
		GetPasswordService getPw = GetPasswordService.getInstance();

	String result = getPw.getPw(Integer.parseInt(msgNo));

	if (!result.equals(pw)) {
	%>
	<p>비밀번호가 일치하지 않습니다.</p>
	<%
		} else {

	DeleteMessageService dms = DeleteMessageService.getInstance();
	cnt = (dms.delete(Integer.parseInt(msgNo)));
	if (cnt == 1) {
	%>
	<p>방명록을 삭제 하였습니다.</p>
	<%
		} else {
	%>
	<p>방명록 삭제 실패!!!</p>
	<%
		}
	}
	%>
	<a href="list.jsp">[목록보기]</a>
	<script type="text/javascript">
		function home() {
			location.href = "/guestbook/list.jsp";
		};

		setTimeout(home, 3000);
	</script>
</body>
</html>