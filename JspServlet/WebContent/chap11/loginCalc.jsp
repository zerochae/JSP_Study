<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="/js/jquery-3.6.0.js"></script>
<script type="text/javascript">
  $(function(){
	 $('#btnIn').on('click',function(){
		window.open("/chap10/member/memberRegist.jsp","oWin","width=700,height=700"); 
 	});
  });
  
</script>
<body>
<button id="btnIn">로그인 및 회원 가입</button>


<h2> EL 논리 연산</h2>
 

<c:if  test="${sessionScope.MemberVo.memId == 'a001'}">관리자</c:if>

<c:if test="${sessionScope.MemberVo.memId != 'a001'}">사용자</c:if>

<c:if test="${sessionScope.MemberVo.memId != null}">나그네</c:if>
</body>
</html>