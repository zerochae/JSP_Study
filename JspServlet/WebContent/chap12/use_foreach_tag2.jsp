<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>foreach 연습</title>
</head>
<body>

	<!-- 

배열, List, Map, Collection, Iterator, Enumration

var : 변수
begin : 시작 인ㄷ게스
end : 종료 인덱스

-->

	<%-- <c:forEach var="i" begin="1" end="100" step="1" varStatus="stat"> --%>
	<%-- 	${i}&nbsp;${stat.index}&nbsp;${stat.count} --%>
	<%-- </c:forEach> --%>

	<!--  1부터 100까지의 합 -->
	<%-- <c:forEach var="j" begin="1" end="100"> --%>
	<%-- <c:set var="sum" value="${sum+j}"/> --%>
	<%-- </c:forEach> --%>

	<%-- 결과 : ${sum} --%>

	<!-- 구구단 -->

<%-- 	<c:forEach var="num" begin="2" end="9"> --%>
<%-- 		<h2>구구단 ${num}단</h2> --%>
<%-- 		<c:forEach var="i" begin="1" end="9"> --%>
<%-- 			<c:set var="result" value=" ${ num * i }" /> --%>
<%-- 				${num} * ${i} = ${result} <br> --%>
<%-- 		</c:forEach> --%>
<%-- 	</c:forEach> --%>
	
<%-- 	<% --%>
<!--  	Map<String,Object> map = new HashMap<String,Object>(); 
 	map.put("memId","a001"); 
  	map.put("memName","미역은대"); 
	map.put("today",new java.util.Date()); -->
<%-- 	%> --%>
	<c:set var="intArray" value="<%=new int[]{1,2,3,4,5}%>"/> 	
<%-- 	<c:set var="data" value="<%=map%>"/> --%>
<%-- 	<c:forEach  items="${data}" varStatus="stat"> --%>
<%-- 		${stat.count}&nbsp;${data.memId}&nbsp;${data.memName}&nbsp;${data.today}<br> --%>
<%-- 	</c:forEach> --%>

<!-- 
items..
배열, Map, Collection (ex : List), Iterator, Enumeration
 -->
	<h2>int형 배열</h2>
	<c:forEach var="i" items="${intArray}" varStatus="stat" begin="2" end="4">
		${stat.index} : ${stat.count } : ${i} <br>
	</c:forEach>
</body>
</html>