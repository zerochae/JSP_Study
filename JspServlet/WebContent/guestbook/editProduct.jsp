<%@page import="jdbc.JdbcUtil"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<%
	String edit = request.getParameter("edit");
%>
<html>
<head>
<title>Insert title here</title>
<script type="text/javascript">

	function deleteConfirm(id){
		if(confirm("해당 상품을 삭제합니다") == true){
			location.href = "./deleteProduct.jsp?id="+id;
		} else {
			return;
		}
	}

</script>
</head>
<body>

	<jsp:include page="menu.jsp" />

	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 편집</h1>
		</div>
	</div>

	<div class="container">
		<div class="row" align=center>
		
			<%
			
				Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
			
				try{
					
					conn = DriverManager.getConnection("jdbc:apache:commons:dbcp:ddit");
					
					String sql = "select * from product order by p_id desc";
					
					pstmt = conn.prepareStatement(sql);
					
					rs = pstmt.executeQuery();
					
					while(rs.next()){
						
					
				
			%>
		
			<div class="col-md-4">
				<img alt="" src="/images/<%=rs.getString("P_FILENAME")%>" style=" width:100%; height: 240px">
				<h3><%=rs.getString("P_NAME")%></h3>
				<p><%=rs.getString("P_DESCRIPTION")%></p>
				<p> ₩ <%=rs.getString("P_UNITPRICE")%></p>
				<p>
					<c:if test="${param.edit == 'update'}">
					<a href="./updateProduct.jsp?id=<%=rs.getString("P_ID")%>" class="btn btn-success"
						role="button"> 수정 &raquo; </a>
					</c:if>
					<c:if test="${param.edit == 'delete'}">
					<a href="#" onclick="deleteConfirm('<%=rs.getString("P_ID")%>')" role="button" class="btn btn-danger">
						삭제 &raquo; </a>
					</c:if>
				</p>
			</div>
			
			
			<%
						};
			
					
					
					}catch(SQLException e){
						out.print(e.getMessage());
					} finally {
						JdbcUtil.close(rs);
						JdbcUtil.close(pstmt);
						JdbcUtil.close(conn);
					}
			
			%>
			
			
			
			
		
	</div>
</div>
	<jsp:include page="footer.jsp" />


</body>
</html>