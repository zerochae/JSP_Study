<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	/*
	
		request 기본 객체는 한 번의 요청 (maketime.jsp + viewTime.jsp)에 대해 유효하게 동작함
	
	*/
	Calendar cal = Calendar.getInstance();	
// 	String hour = String.valueOf(cal.get(Calendar.HOUR));
// 	String minute = String.valueOf(cal.get(Calendar.MINUTE));
// 	String second = String.valueOf(cal.get(Calendar.SECOND));
//  --> jsp:param일때 스트링으로 넘겨주는 것은 가능 
	request.setAttribute("time", cal);
%>

<jsp:forward page="/chap07/to/viewTime.jsp">
<%-- <jsp:param value="<%=cal %>" name="cal"/> --> 안됩니다 value에 들어갈 수 있는 파라미터는 스트링만 가능 --%> 
</jsp:forward>