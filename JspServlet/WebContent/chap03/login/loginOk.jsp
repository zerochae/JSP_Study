<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	if(id.equals("song") && pwd.equals("1234")){
		session.setAttribute("id",id);
		response.sendRedirect("../main.jsp");
	} else {
	//		1.sendRedirect
	String value = "아이디 또는 비밀번호가 일치하지 않아요";
	value = URLEncoder.encode(value,"UTF-8");
	response.sendRedirect("login.jsp?errMsg="+value);
		
	//		2.
	// 		request에 오류메시지 담기.
	// 		request.setAttribute("errMsg","아이디 또는 비밀번호가 일치하지 않아요");
	// 		RequestDispatcher rd= request.getRequestDispatcher("login.jsp");
	// 		rd.forward(request,response);
	}
%>

</body>
</html>