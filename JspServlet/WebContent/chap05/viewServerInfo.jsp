<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서버 정보 출력</title>
</head>
<body>

<h2> 서버 정보 </h2>

서버 정보 : <%= application.getServerInfo() %> <br>
서블릿 규약 메이저 버전 : <%= application.getMajorVersion() %> <br>
서블릿 규약 마이너 버전 : <%= application.getMinorVersion() %> <br>

<!-- 

서버 정보
서버 정보 : Apache Tomcat/8.5.70
서블릿 규약 메이저 버전 : 3
서블릿 규약 마이너 버전 : 1

==> 톰캣 8.5.37 버전이 서블릿 3.1 규약을 지원한다.

 -->

</body>
</html>