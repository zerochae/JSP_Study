<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="member" scope="request"  class="kr.or.ddit.chap08.MemberInfo"></jsp:useBean>
<html>
<head>
<meta charset="UTF-8">
<title>인사말</title>
</head>
<body>

<!-- 

	jsp : useBean 액션 태그로 생성한 객체는 지정한 영역의 속성에 저장되어 같은 영역을 사용하는 JSP 페이지가 공유할 수 있음
	
	type : 지정한 영역에 이미 객체가 존재한다고 가정함 
		   request 기본객체의 member 속성에 이미 MemberInfo 객체가 존재한다고 가정함
		   없으면 class와는 달리 MemberInfo 클래스를 통해 객체를 자동생성해주지 않고
		   오류를 발생함

 -->

	<%= member.getName() %> (<%=member.getId() %>) 회원님. 하이 ㅋㅋ

</body>
</html>