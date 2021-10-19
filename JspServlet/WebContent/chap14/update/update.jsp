<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<%

request.setCharacterEncoding("utf-8");

String memberID = request.getParameter("memberID");
String name = request.getParameter("name");

int updateCount = 0;

//jdbc 드라이버 로딩 (오라클 jdbc 드라이버는 오라클드라이버)
Class.forName("oracle.jdbc.driver.OracleDriver");

Connection conn = null;
Statement stmt = null;


try {
	
	String jdbcDriver = "jdbc:oracle:thin:@localhost:1521/xe";
	String dbUser = "c##jspexam";
	String dbPass = "java";
	
	String query = "update MEMBER set Name ='"+name+"'where MEMBERID ='"+memberID+"'";
	
	conn = DriverManager.getConnection(jdbcDriver,dbUser,dbPass);
	stmt = conn.createStatement();
	updateCount = stmt.executeUpdate(query);
} catch(Exception e){
	e.printStackTrace();
}finally{ 
	if (stmt != null) try {stmt.close();} catch(SQLException e){}
	if (conn != null) try {conn.close();} catch(SQLException e){}
}

%>


<html>
<head>
<title>update</title>
</head>
<body>

<script type="text/javascript">

location.href = "../viewMemberList.jsp"

</script>

</body>
</html>