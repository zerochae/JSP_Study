<%@page import="kr.or.ddit.chap14.IMemberVO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	// request.setCharacterEncoding("utf-8");

String memberId = request.getParameter("memberId");
out.print("memberId :" + memberId);
%>
<!DOCTYPE html>
<html>
<head>
<title>회원 상세 정보</title>
</head>
<%
	Class.forName("oracle.jdbc.driver.OracleDriver");

Connection conn = null;
Statement stmt = null;
ResultSet rs = null;

try {
	String jdbcDriver = "jdbc:oracle:thin:@localhost:1521/xe";
	String dbUser = "c##jspexam";
	String dbPass = "java";
	String query = "select * from member where memberid = '" + memberId + "'";

	Object arr[][] = new Object[5][5];

	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	stmt = conn.createStatement();
	rs = stmt.executeQuery(query);

	if (rs.next()) {
		IMemberVO imemberVo = new IMemberVO();
		imemberVo.setMemberid(memberId);
		imemberVo.setPassword(rs.getString("PASSWORD"));
		imemberVo.setName(rs.getString("NAME"));
		imemberVo.setEmail(rs.getString("EMAIL"));
%>
<c:set var="vo" value="<%=imemberVo%>" scope="page" />

<body>
	<table border="1">
		<tr>
			<th>아이디</th>
			<td>${vo.memberid}</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td>${vo.password}</td>
		</tr>
		<tr>
			<th>이름</th>
			<td>${vo.name}</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>${vo.email}</td>
		</tr>
		<tr>
			<td colspan="2" style="text-align: center">
				<button onclick="location.href='viewMemberList.jsp'">목록</button>
				<button onclick="location.href='update/updateForm.jsp?memberId=${vo.memberid}&name=${vo.name}'">수정</button>
			</td>
		</tr>

	</table>
	<%
		} else {

	out.print(memberId + "에 해당되는 회원정보가 없습니다.");
	}

	} catch (SQLException e) {
	e.printStackTrace();
	} finally {
	if (rs != null)
	try {
		rs.close();
	} catch (SQLException e) {
	}
	if (stmt != null)
	try {
		stmt.close();
	} catch (SQLException e) {
	}
	if (conn != null)
	try {
		conn.close();
	} catch (SQLException e) {
	}
	}
	%>

</body>
</html>
