<%@page import="jdbc.JdbcUtil"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%

	request.setCharacterEncoding("UTF-8");


	String filename = "";
	// 웹 어플리케이션상의 절대 경로
	String realFolder = "C:\\Users\\zeroc\\git\\JSP_Study\\JspServlet\\WebContent\\images";
	
	String encType = "UTF-8";
	// 최대 업로드될 파일의 크기 5Mb
	
	int maxSize = 5 * 1024 * 1024;
	
	//업로드 처리 (cos.jar 패키지 사용)
	
	MultipartRequest multi = new MultipartRequest(request,realFolder,maxSize,encType, new DefaultFileRenamePolicy());
	
	String productId = multi.getParameter("productId");
	String name = multi.getParameter("name");
	String unitPrice = multi.getParameter("unitPrice");
	String description = multi.getParameter("description");
	String manufacturer = multi.getParameter("manufacturer");
	String category = multi.getParameter("category");
	String unitsInStock = multi.getParameter("unitsInStock");
	String condition = multi.getParameter("condition");
	
	Integer price;
	
	if(unitPrice.isEmpty()){
		price = 0;
	} else {
		price = Integer.valueOf(unitPrice);
	}
	
	long stock;
	
	if(unitsInStock.isEmpty()){
		stock = 0;
	} else {
		stock = Long.valueOf(unitsInStock);
	}
	//파라미터 목록에서 파일객체인 경우..
	Enumeration files = multi.getFileNames();
	//파일객체의 이름을 가져옴
	String fname = String.valueOf(files.nextElement());
	//파일객체의 이름에 해당되는 실제 파일명을 가져옴
	String fileName = multi.getFilesystemName(fname);
	
	//DB Insert 처리
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	try{
		
		conn = DriverManager.getConnection("jdbc:apache:commons:dbcp:ddit");
		
		String sql = "insert into product values(?,?,?,?,?,?,?,?,?)";
		
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1,productId);
		pstmt.setString(2,name);
		pstmt.setInt(3,price);
		pstmt.setString(4,description);
		pstmt.setString(5,category);
		pstmt.setString(6,manufacturer);
		pstmt.setLong(7,stock);
		pstmt.setString(8,condition);
		pstmt.setString(9,fileName);
		
		pstmt.executeUpdate();
		
	}catch(Exception e){
		e.printStackTrace();	
	}finally{
		JdbcUtil.close(pstmt);
		JdbcUtil.close(conn);
	}
	
	// 상품 목록으로 이동
	response.sendRedirect("products.jsp?rslt=ok");
%>

<script> 
// location.href="products/jsp?rslt=ok" 
</script>