<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그 메시지 기록</title>
</head>
<body>

<% 
	// 웹 컨테이너(톰캣)가 사용하는 로그 파일에 로그 메시지 기록
	application.log("log message histoy");

	// JSP 페이지가 제공하는 log() 메소드를 이용
	log("로그 메시지 기록2");

%>

로그 메시지를 기록합니다.

</body>
</html>