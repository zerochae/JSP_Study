<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//request객체에 들어있는 memberId 이름의 값을 가져와 id변수에 대입
	String id = request.getParameter("memberId"); 
	// memberId 파라미터의값이 madvirus인지 비교
	if(id != null && id.equals("madvirus")){
		// 알파벳과 숫자 그리고 몇몇 기호를 제외한 나머지 글자글을 URL에 포함시키려면 인코딩을 해줘야 함
		String value = "최가현";
		// ************
		value = URLEncoder.encode(value,"UTF-8");
		response.sendRedirect("/chap03/index.jsp?name="+value);
	} else {
%>
<html>
<head>
<title>로그인에 실패</title>
</head>
<body>
잘못된 아이디입니다.
</body>
</html>
<%
	}
%>