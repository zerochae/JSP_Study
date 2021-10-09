<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파라미터 출력</title>
</head>
<body>


<!-- name 파라미터가 없어서 오류가 발생 -->
<%try{ %>
name 파라미터 값 : <%=request.getParameter("name").toUpperCase()%>
<%}catch(Exception e){%>
name 파라미터가 없습니다.
<%}%>
</body>
</html>