<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="member"  scope="request" class="kr.or.ddit.chap08.MemberInfo"></jsp:useBean>

<!-- 
	jsp:useBean 액션 태그 => JSP 페이지에서 사용할 자바빈 객체를 지정할 때 사용함
	<scope => 영역>
	page(기본), request, session, application
	
	page의 경우 makeObject.jsp -> 요청 이동 -> useObject.jsp 시
	member객체가 전달되지 않음.
	
	page영역의 경우 JSP 페이지와 일대일로 연결된 영역이기 때문에 다른 JSP 페이지로 영역 공유가 되지 못하기 때문이고,
	request영역의 경우 하나의 요청에 포함된 JSP라면 영역이 공유가 되기 때문임
	
	page 영역 : 각 JSP 페이지 내에서 공유
	request 영역 : 하나의 요청 흐름에 속한 jsp 페이지 내에서 공유
	session 영역 : 하나의 웹브라우저에 속한 jsp 페이지 내에서 공유
	applicaiton 영역 : 하나의 웹 프로젝트에 속한 jsp 페이지 내에서 공유
 -->
<%
// 	MemberInfo member = new MemberInfo(); 
// 	request.setAttribute("member", member);
	member.setId("bhm"); 
	member.setName("봉현민");
%>

<jsp:forward page="/chap08/useObject.jsp"></jsp:forward>
