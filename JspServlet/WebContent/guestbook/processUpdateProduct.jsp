<%@page import="jdbc.JdbcUtil"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<%

	//cos.jar 사용하여 파일 처리
	
	String filename = "";
	String realFolder = "C:\\Users\\zeroc\\git\\JSP_Study\\JspServlet\\WebContent\\images";
	
	// 인코딩 타입
	String encType = "UTF-8";
	
	// 최대 업로드도리 파일의 크기 5MB
	int maxSize = 5 * 1024 * 1024;
	
	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
	
	String productId    = multi.getParameter("productId");
	String name         = multi.getParameter("name");
	String unitPrice    = multi.getParameter("unitPrice");
	String description  = multi.getParameter("description");
	String manufacturer = multi.getParameter("manufacturer");
	String category     = multi.getParameter("category");
	String unitsInStock = multi.getParameter("unitsInStock");
	String condition    = multi.getParameter("condition ");
	
	
	// udpate 시 setInt() 메소드를 위해 int형으로 casting
	int price = Integer.parseInt(unitPrice);
	int stock = Integer.parseInt(unitsInStock);
	
	// 업로드가 완료된 첨부파일의 이름 정보 추출
	Enumeration files = multi.getFileNames();
	String fname = (String)files.nextElement();
	// 업로드된 파일의 실제 파일명을 가져옴
	String fileName = multi.getFilesystemName(fname);
	
	// Database 테이블로 update
		
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
		
		response.sendRedirect("editProduct.jsp?edit=update");
		
		
%>
