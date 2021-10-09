<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클라이언트 및 서버 정보</title>
</head>
<body>

<!-- 
<request 기본 객체>
1. 웹 브라우저(IE, 크롬, 파이어폭스, 오페라..)가 웹 서버에 전송한 요청 관련 정보 제공
2. 요청 파라미터, 요청 헤더, 전송한 쿠키를 읽기 기능

* http://localhost:8090/chap03/requestInfo.jsp
1. localhost : request.getServerName()
2. 8090 : request.getServerPort()
3. /chp03/requestInfo.jsp : request.getRequestURI()
4. 
 -->

클라이언트IP = <%= request.getRemoteAddr() %> <br>
요청정보길이 = <%= request.getContentLength() %> <br>
요청정보 인코딩 = <%= request.getCharacterEncoding() %> <br>
요청정보 컨텐츠타입 = <%=request.getProtocol() %> <br>
요청정보 전송방식 = <%= request.getMethod() %> <br>
요청 URI = <%=request.getRequestURI() %> <br>
컨텍스트 경로 = <%= request.getContextPath() %> <br>
서버이름 = <%= request.getServerName() %> <br>
서버포트 = <%= request.getServerPort() %>

</body>
</html>