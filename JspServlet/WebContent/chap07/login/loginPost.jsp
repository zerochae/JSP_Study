<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%!Map<String, Object> getMember(String memId, String memPwd) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (memId.equals("a001") && memPwd.equals("java")) {
			map.put("memId", "a001");
			map.put("memName", "개똥이");
			map.put("memGubun", "관리자");
		} else {
			return null;
		}
		return map;
	}%>
<%
	// memId = a001 & memPwd = 1234

	String memId = request.getParameter("memId");
	String memPwd = request.getParameter("memPwd");
	
	Map<String, Object> member = getMember(memId, memPwd);
	
	if (member == null) {
		response.sendRedirect("/chap07/login/login.jsp?message=error");
	} else { // 로그인 성공
	// session 객체의 이름 member에 map을 넣음 
	session.setAttribute("member", member);
%>
<jsp:forward page="/chap07/login/loginSuccess.jsp"></jsp:forward>
<%
	}
%>