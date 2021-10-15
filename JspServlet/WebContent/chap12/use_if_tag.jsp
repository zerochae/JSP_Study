<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>JSTL의 if태그 연습 </title>
</head>
<body>

	<c:if test="${param.name == 'ddit' }">
	name 파라미터 값은 ${param.name} 입니다. <br>
	</c:if>
	
	<!-- 
	
	* scope : 영역
	- page, request, session, application
	
	 -->
	 
	 <%

	 String name = request.getParameter("name");
	 
	 %>
	
<%-- 	<c:set var="ddit" value="<%=name%>" scope="request"/> --%>
	<c:set var="ddit" value="${param.name}" scope="request"/>
	
	<c:if test="${param.name == ddit }">
	name 파라미터 값은 ${ddit} 입니다. 
	</c:if>

</body>
</html>