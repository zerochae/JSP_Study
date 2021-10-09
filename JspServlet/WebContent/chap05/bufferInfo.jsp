<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page buffer="8kb" autoFlush="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>버퍼 정보</title>
</head>
<body>

<%
for(int i =0; i<100000; i++){
	out.print("개똥이");
}
%>

버퍼 크기 : <%= out.getBufferSize() %><br>
남은 크기 : <%= out.getRemaining() %>  <br>
auto flush : <%= out.isAutoFlush() %>



</body>
</html>