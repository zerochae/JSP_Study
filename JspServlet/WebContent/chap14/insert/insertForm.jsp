<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>InsertForm</title>
</head>
<script type="text/javascript">
	function fn_chk() {
		var frm = document.getElementById("frm");
		var id = frm.memberID.value;
		var password = frm.password.value;
		var name = frm.name.value;
		var email = frm.email.value;

		alert("id :" + id + "," + "password :" + password + "," + "name :"
				+ name + "," + "email :" + email);

		if (id == "") {
			alert("아이디 입력하셈");
			return false;
		} else if (password == "") {
			alert("비번 입력하셈");
			return false;
		} else if (name == "") {
			alert("네임 입력하셈");
			return false;
		} else if (email == "") {
			alert("메일 입력하셈");
			return false;
		}

		return true;
	}
</script>
<body>
	<form method="post" action="/chap14/insert/insert.jsp" id="frm"
		onsubmit="return fn_chk()">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" size="10" name="memberID"></td>
				<td>비밀번호</td>
				<td><input type="text" size="10" name="password"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" size="10" name="name"></td>
				<td>이메일</td>
				<td><input type="text" size="10" name="email"></td>
			</tr>
			<tr>
				<td colspan="4"><input type="submit" value="삽입"></td>
			</tr>
		</table>
	</form>

</body>
</html>