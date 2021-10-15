<%@page import="kr.or.ddit.chap10.MemberVO"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>El과 표현식</title>
</head>
<body>

	<%
		// pageconext : pageC 
	pageContext.setAttribute("scores", new int[] { 90, 80, 70, 100 });
	%>

	${scores[2]}
	<br>
	<%
		List<String> list = new ArrayList<String>();

	list.add("스크류바");
	list.add("바밤바");
	list.add("옥동바");
	pageContext.setAttribute("list", list);
	%>

	${list[1]} 또는 ${pageScope.list[1]}
	<br>

	<%
		Map<String, Object> map = new HashMap<String, Object>();

	map.put("memId", "a001");
	map.put("memName", "김은대");
	map.put("memLike", "독서");
	pageContext.setAttribute("map", map);
	%>

	${map["memId"]}
	<br>
	
	<%
	
	MemberVO memberVo = new MemberVO();
	
	memberVo.setMemId("b001");
	memberVo.setMemName("이쁜이");
	
	pageContext.setAttribute("memberVo",memberVo);
	%>
	
	${pageScope.memberVo.memId } <br>
	${memberVo.memName } <br>


</body>
</html>