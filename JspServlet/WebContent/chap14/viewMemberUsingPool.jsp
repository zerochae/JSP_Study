<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>ViewMemberUsingPool</title>
</head>
<body>

	<h2>Member 테이블의 내용</h2>
	<table border="1">
		<tr>
			<th>이름</th>
			<th>아이디</th>
			<th>이메일</th>
		</tr>
		<%
			Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		try {

			String jdbcDriver = "jdbc:apache:commons:dbcp:ddit";
			String query = "select * from member order by memberid";
			conn = DriverManager.getConnection(jdbcDriver);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);

			while (rs.next()) {
		%>

		<tr>
			<td><%=rs.getString("NAME")%></td>
			<td><%=rs.getString("MEMBERID")%></td>
			<td><%=rs.getString("EMAIL")%></td>
		</tr>

		<%
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) try {rs.close();} catch(SQLException e){};
			if(stmt != null) try {stmt.close();} catch(SQLException e){};
			if(conn != null) try {conn.close();} catch(SQLException e){};
		}
		%>
	</table>

</body>
</html>