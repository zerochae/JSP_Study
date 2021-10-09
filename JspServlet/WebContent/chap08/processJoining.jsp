<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
	request.setCharacterEncoding("UTF-8");
%>
<!-- 

jsp:userBean : 액션태그

 -->
 
 <!-- MemberInfo클래스를 인서트너스하여 memberInfo 객체를 생성함 -->
<jsp:useBean id="memberInfo" class="kr.or.ddit.chap08.MemberInfo"></jsp:useBean>
<!-- jsp:setProperty 액션 태그 => property : 파라미터목록의 이름과 memberInfo객체의 필드와 매핑하여 set함 -->
<jsp:setProperty name="memberInfo" property="*" />
<!-- memberInfo 자바빈 객체의 password 프로퍼티 값을 ememberInfo.getId()값과 동일하게 지정함 -->
<!-- 아래와 동일한 코드입니다!!!!!!!!!!!!!!!!!!!!! -->
<%
// 	memberInfo.setId(request.getParameter("id"));
// 	memberInfo.setPassword(request.getParameter("password"));
// 	memberInfo.setName(request.getParameter("name"));
// 	memberInfo.setEmail(request.getParameter("email"));

%>
<!-- ========================================= -->
<jsp:setProperty name="memberInfo" property="password"
	value="<%=memberInfo.getId()%>" />


<html>
<head>
<meta charset="UTF-8">
<title>가입</title>
</head>
<body>

	<table border="1" cellpadding="0" cellspacing="0">
		<tr>
			<td >아이디</td>
			<td><jsp:getProperty name="memberInfo" property="id"/></td>
			<td >비밀번호</td>
			<td><jsp:getProperty name="memberInfo" property="password"/></td>
		</tr>
		<tr>
			<td >이름</td>
			<td><jsp:getProperty name="memberInfo" property="name"/></td>
			<td >이메일</td>
			<td><jsp:getProperty name="memberInfo" property="email"/></td>
		</tr>
	</table>
</body>
</html>