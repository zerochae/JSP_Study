<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<%
	request.setCharacterEncoding("utf-8");

String memberId = request.getParameter("memberID");
String name = request.getParameter("name");
String password = request.getParameter("password");
String email = request.getParameter("email");

int insertCount = 0;

Class.forName("oracle.jdbc.driver.OracleDriver");

Connection conn = null;
Statement stmt = null;
PreparedStatement pstmt = null;

try {

	String jdbcDriver = "jdbc:oracle:thin:@localhost:1521/xe";
	String dbUser = "c##jspexam";
	String dbPass = "java";

	// 	String query = "insert into MEMBER(MEMBERID,PASSWORD,NAME,EMAIL) values" 
	// 				+ "('" + memberId + "','" + password + "','" + name
	// 				+ "','" + email+"')";

	String query = "insert into member(MEMBERID, PASSWORD, NAME, EMAIL) VALUES (?,?,?,?)";

	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);

	pstmt = conn.prepareStatement(query);

	pstmt.setString(1, memberId);
	pstmt.setString(2, password);
	pstmt.setString(3, name);
	pstmt.setString(4, email);

	pstmt.executeUpdate();

	// 	stmt = conn.createStatement();
	// 	insertCount = stmt.executeUpdate(query);

} catch (Exception e) {
	e.printStackTrace();
} finally {
	if (pstmt != null)
		try {
	pstmt.close();
		} catch (SQLException e) {
		}
	if (conn != null)
		try {
	conn.close();
		} catch (SQLException e) {
		}
}
%>

<html>
<head>
<title>Insert</title>
</head>
<body>

	<script type="text/javascript">
		location.href = "../viewMemberList.jsp"
	</script>

</body>
</html>