<%@page import="java.util.Map"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
	request.setCharacterEncoding("UTF-8");
%>
<html>
<head>
<meta charset="UTF-8">
<title>요청 파라미터 출력</title>
</head>
<body>

<b>request.getParameter() 메서드 사용</b> <br>
name 파라미터 = <%=request.getParameter("name") %> <br>
<!-- 파라미터 중 name값이 "name" 인것을 찾아라!!! (name , address , pet 중) -->
address 파라미터 = <%=request.getParameter("address") %>
<!-- 파라미터 중 name값이 "address" 인것을 찾아라!!! (name , address , pet 중) -->

<p>

<b> request.getParameterValues() 메서드 사용</b> <br>
<%
	String values[] = request.getParameterValues("pet");
	// 요청 파라미터 이름이 pet인 파라미터의 값을 배열로 구하라
	if(values != null){
		for(int i =0; i < values.length; i++){ %>
				<%= values[i] %>
<%			
		}
	}
%>
<p>
<b> request.getParameterNames() 메서드 사용</b> <br>
<%
	// 요청 파라미터의 이름 목록을 구함
	Enumeration paramEnum = request.getParameterNames();
	while(paramEnum.hasMoreElements()){
		String name = (String)paramEnum.nextElement();%>
		<%= name %>
<%
	}
%>

<p>

<b>reqeust.getParameterMap() 메서드 사용</b> <br>

<%
	// 요청 파라미터의 맵을 구함. 맵은 <파라미터 이름, 값> 쌍으로 구성됨
	/*
	{"name","홍길동","address":"대전","pet":"dog cat pig"}
	*/
	Map parameterMap = request.getParameterMap();
	String nameParam[] = (String[])parameterMap.get("name");
	if(nameParam != null){%>
	name = <%=nameParam[0]%>
<%		
	}
%>

</body>
</html>