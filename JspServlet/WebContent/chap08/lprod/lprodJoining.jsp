<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="lprod" scope="request" class="kr.or.ddit.chap08.LprodVO"/>
<jsp:setProperty name="lprod" property="*" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:getProperty property="lprodId" name="lprod"/> <br>
<jsp:getProperty property="lprodGu" name="lprod"/> <br>
<jsp:getProperty property="lprodNm" name="lprod"/> <br>

</body>
</html>