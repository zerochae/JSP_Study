<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("UTF-8");
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style type="text/css">
#error
{
	color : red;
	font-size:10px;	
}
</style>
<%
	//request스코프에 담긴 오류메시지 얻어오기.
	String errMsg = (String)request.getParameter("errMsg");
	if(errMsg == null){
		errMsg = "";
	}
%>
<body>
<form method="post" action="loginOk.jsp">
	아이디 <input type="text" name="id"> <br>
	비밀번호 <input type="password" name=pwd> <br>
	<div id="error"><%=errMsg %></div>
	<input type="submit" value="로그인">
	</form>
</body>
</html>