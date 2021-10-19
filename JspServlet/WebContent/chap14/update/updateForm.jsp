<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>이름 변경폼</title>
</head>
<body>
	<form action="/chap14/update/update.jsp" method="post">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="memberID" size="10" value="${param.memberId}"></td>
				<td>이름</td>
				<td><input type="text" name="name" size="10" value="${param.name}"></td>
			</tr>
			<tr>
				<td colspan="4"><input type="submit" value="변경"></td>
			</tr>
		</table>
	</form>

</body>
</html>