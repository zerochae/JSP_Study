<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<!--  error500.jsp -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>500 에러 발생</title>
</head>
<body>
<strong> 잠시 서비스에 문제가 발생했습니다. </strong>
<br>
<br>

<img alt="" src="/images/500.jpg">

</body>
</html>

<!-- 
	만약 어레 페이지의 길이가 512 바이트보다 작다면,
	인터넷 익스플로러는 이 페이지가 출력하는 에러 페이지를 출력하지 않고
	자체적으로 제공하는 'HTTP 오류 메시지' 화면을 출력한다
	인터넷 익스플로러에서도 에러 페이지 내용을 올바르게 출력하려면
	응답 결과에 이 주석과 같은 내용을 포함시켜서
	에러 데이터가 512 바이트를 넘도록 해야 한다.
 -->