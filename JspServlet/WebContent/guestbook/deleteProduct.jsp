<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%


	String productId = request.getParameter("id");

	


Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

try{
	conn = DriverManager.getConnection("jdbc:apache:commons:dbcp:ddit");
	String sql = "select * from product where p_id = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, productId);
	rs = pstmt.executeQuery();
	
	// id에 해당하는 상품이 있을때만 update 처리
	if(rs.next()){
		
		// 1) 요청 파라미터 중에서 이미지 파일이 있으면 실행
		
		if(fileName!=null){
			sql = " UPDATE PRODUCT "
				+" SET P_NAME = ?,      "
				+"P_UNITPRICE= ?,     "
				+"P_DESCRIPTION= ?,   "
				+"P_CATEGORY= ?,      "
				+"P_MANUFACTURER= ?,  "
				+"P_UNITSINSTOCK= ?,  "
				+"P_CONDITION= ?,     "
				+"P_FILENAME= ?      "
				+"WHERE P_ID=? ";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1,name          );
			pstmt.setString(2,unitPrice     );
			pstmt.setString(3,description   );
			pstmt.setString(4,category      );
			pstmt.setString(5,manufacturer  );
			pstmt.setString(6,unitsInStock  );
			pstmt.setString(7,condition     );
			pstmt.setString(8,filename      );
			pstmt.setString(9,productId     );
			pstmt.executeUpdate();
			
		} else { // 2) 요청 파라미터 중에서 이미지 파일이 없으면 실행
			
			sql = " UPDATE PRODUCT "
					+" SET P_NAME = ?,      "
					+"P_UNITPRICE= ?,     "
					+"P_DESCRIPTION= ?,   "
					+"P_CATEGORY= ?,      "
					+"P_MANUFACTURER= ?,  "
					+"P_UNITSINSTOCK= ?,  "
					+"P_CONDITION= ?    "
					+"WHERE P_ID=? ";
		
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1,name          );
			pstmt.setString(2,unitPrice     );
			pstmt.setString(3,description   );
			pstmt.setString(4,category      );
			pstmt.setString(5,manufacturer  );
			pstmt.setString(6,unitsInStock  );
			pstmt.setString(7,condition     );
			pstmt.setString(8,productId     );
			pstmt.executeUpdate();

			
		} // end if


	}
	


} catch (SQLException e){
	out.print(e.getMessage());	
} finally {
	JdbcUtil.close(rs);
	JdbcUtil.close(pstmt);
	JdbcUtil.close(conn);
}

%>