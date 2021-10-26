<%@page import="jdbc.JdbcUtil"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="menu.jsp"/>

	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 목록</h1>
		</div>
	</div>
	
		<div class="container">
			<div class="row" align="center">
			
<%
	Connection conn = DriverManager.getConnection("jdbc:apache:commons:dbcp:ddit");
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try{
	String sql = "select * from product";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	while(rs.next()){
	
%>
				<div class="col-md-4">
					<img alt="" src="/images/<%=rs.getString("P_FILENAME")%>" style=" width:100%; height: 240px">
					<h3><%=rs.getString("P_NAME")%></h3>
					<p><%=rs.getString("P_DESCRIPTION")%></p>
					<p> ₩ <%=rs.getInt("P_UNITPRICE")%></p>
					<p><a href="./product.jsp?id=<%=rs.getString("P_ID")%>" class="btn btn-secondary" role="button">상세 정보 &raquo;</a></p>
				</div>
				
<%
		}
	}catch(SQLException e){
		out.print(e.getMessage());
	}finally{ 
		JdbcUtil.close(rs);
		JdbcUtil.close(pstmt);
		JdbcUtil.close(conn);
	}
%>
			</div>
		</div>
	

	<jsp:include page="footer.jsp"/>


</body>
</html>


