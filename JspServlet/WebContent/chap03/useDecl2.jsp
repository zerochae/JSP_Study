<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!
	public int add(int a, int b){
	int c = a+b;
	return c;
}

	public int subtract(int a, int b){
		int c = a -b;
		return c;
	}
%>
<html>
<head>
<meta charset="UTF-8">
<title>선언부를 사용한 두 정수값의 곱</title>
</head>
<body>

<%
	int value1 = 3;
	int value2 = 9;
	
	int addResult = add(value1, value2);
	int subtractResult = subtract(value1, value2);
%>

<%= value1 %> + <%= value2 %> = <%= addResult %> <Br>
<%= value1 %> - <%= value2 %> = <%= subtractResult %>

</body>
</html>