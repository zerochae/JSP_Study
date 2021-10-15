<%@page import="kr.or.ddit.chap10.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%

request.setCharacterEncoding("utf-8");

MemberVO memberVo = new MemberVO();

memberVo.setMemId(request.getParameter("memId"));
memberVo.setMemPass(request.getParameter("memPass"));
memberVo.setMemName(request.getParameter("memName"));
memberVo.setMemRegno1(request.getParameter("memRegno1"));
memberVo.setMemRegno2(request.getParameter("memRegno2"));
memberVo.setMemZip(request.getParameter("memZip"));
memberVo.setMemAdd1(request.getParameter("memAdd1"));
memberVo.setMemAdd2(request.getParameter("memAdd2"));
memberVo.setMemBir(request.getParameter("memBir"));
memberVo.setMemHometel(request.getParameter("memHometel"));
memberVo.setMemMail(request.getParameter("memMail"));


session.setAttribute("memberVo", memberVo);

%>


<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%=memberVo.getMemName() %>님 , 회원가입 오키요 ㅋㅋ

<a href="./memberByPage.jsp">마이페이지</a>

</body>
</html>