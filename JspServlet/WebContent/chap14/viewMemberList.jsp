<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록</title>
</head>
<body>
	<h2>회원목록</h2>
	<table border="1" width="100%">
		<tr>
			<th>이름</th>
			<th>아이디</th>
			<th>이메일</th>
		</tr>


		<%
			//1. JDBC드라이버 로딩
		Class.forName("oracle.jdbc.driver.OracleDriver");

		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		try {
			String jdbcDriver = "jdbc:oracle:thin:@localhost:1521/xe";
			String dbUser = "c##jspexam";
			String dbPass = "java";

			String query = "select * from MEMBER order by MEMBERID";

			//2. 데이터베이스 커넥션
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			//3. Statement 생성
			stmt = conn.createStatement();
			//4. 쿼리 실행
			rs = stmt.executeQuery(query);
			//5. 쿼리 실행 결과 출력
			while (rs.next()) {

				String name = rs.getString("NAME");
				String memberId = rs.getString("MEMBERID");
		%>
		<tr>
			<td><a
				href="/chap14/viewMember.jsp?memberId=<%=memberId%>&name=<%=name%>"><%=rs.getString("NAME")%></a></td>
			<td><%=rs.getString("MEMBERID")%></td>
			<td><%=rs.getString("EMAIL")%></td>
		</tr>
		<%
			}

		} catch (SQLException ex) {
		out.println(ex.getMessage());
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

	</table>
	<input type="button" value="등록" onclick="javascript:location.href='/chap14/insert/insertForm.jsp';">

</body>
</html>