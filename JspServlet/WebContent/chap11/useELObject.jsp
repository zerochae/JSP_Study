<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%

	request.setAttribute("name","최범균");

%>


<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	 요청 URI : ${ pageContext.request.requestURI} <br>
	request의 name 속성 : ${requestScope.name } <br>
<!-- 	http://localhost:8090/chap11/useELObject.jsp?code=123 -->
	code 파라미터 : ${param.code} <!-- : 123 -->

</body>
</html>