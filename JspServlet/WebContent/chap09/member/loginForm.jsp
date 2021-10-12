<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인폼</title>
</head>
<body>

<form action="/chap09/member/login.jsp" method="post">

아이디 <input type="text" name="id" size="10" placeholder="id를 입력해주세요"/>
암호 <input type="password" name="password" size="10" placeholder="비밀번호를 입력하세요"/>
<input type="submit" value="로그인">
</form>
</body>
</html>