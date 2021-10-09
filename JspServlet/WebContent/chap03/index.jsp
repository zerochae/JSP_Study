<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String name = request.getParameter("name");
%>
<html>
<head>
<meta charset="UTF-8">
<title>3장 예제</title>
</head>
<body>

<!-- 
익스플로러
http://localhost:8090/chap03/index.jsp?name=%EC%B5%9C%EA%B0%80%ED%98%84
크롬
http://localhost:8090/chap03/index.jsp?name=최가현

크롬/파이어폭스 웹 브라우저는 UTF-8로 인코딩 된 주소 경로나 파라미터 값을 해당 문자로 변환해서 보여주지만
인터넷 익스플로러는 인코딩된 파라미터 값을 그대로 보여주기 때문
 -->

3장의 인덱스 페이지
<%=name %>
</body>
</html>