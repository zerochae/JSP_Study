<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	request.setCharacterEncoding("UTF-8");
%>
</head>
<body>
	<table border="1" style="width: 700px">
		<tr>
			<td colspan="2" style="text-align: center">
				<h2>학생 정보</h2>
			</td>
		</tr>

		<tr>
			<td style="width: 100px">이름</td>
			<td><%=request.getParameter("studentName")%></td>
		</tr>
		<tr>
			<td>성별</td>
			<td><%=request.getParameter("gender")%></td>
		</tr>
		<tr>
			<td>전공</td>
			<td><%=request.getParameter("major")%></td>
		</tr>
		<tr>
			<td>취미</td>
			<td>
<%
	String values[] = request.getParameterValues("hobby");
	// 요청 파라미터 이름이 pet인 파라미터의 값을 배열로 구하라
	if(values != null){
		for(int i =0; i < values.length; i++){ %>
				<%= values[i] %>
<%			
		}
	}
%>
			</td>
		</tr>
	</table>

</body>
</html>