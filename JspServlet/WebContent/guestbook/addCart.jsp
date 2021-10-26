<%@page import="java.util.ArrayList"%>
<%@page import="kr.or.ddit.guestbook.vo.Product"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="jdbc.JdbcUtil"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   String id = request.getParameter("id");
   if (id == null || id.trim().equals("")) {
      // response 내장 객체를 통해 상품 목록으로 이동
      response.sendRedirect("products.jsp");
      // 밑의 구문은 더이상 실행하지 않음
      return;
   }
   
   Connection conn = null;
   PreparedStatement pstmt = null;
   ResultSet rs = null;
   
   try {
      conn = DriverManager.getConnection("jdbc:apache:commons:dbcp:ddit");
      String sql = "select * from product where P_ID = ?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, id);
      rs = pstmt.executeQuery();
      
      if (rs.next()) { // 1행이 존재하면
         // 기본생성자를 통한 객체 생성
         Product product = new Product();
      
         // id에 해당하는 상품정보를 select하여 Product 객체에 setting
         product.setProductId(rs.getString("P_ID"));
         product.setPname(rs.getString("P_NAME"));
         product.setUnitPrice(rs.getInt("P_UNITPRICE"));
         product.setDescription(rs.getString("P_DESCRIPTION"));
         product.setCategory(rs.getString("P_CATEGORY"));
         product.setManufacturer(rs.getString("P_MANUFACTURER"));
         product.setUnitsInStock(rs.getInt("P_UNITSINSTOCK"));
         product.setCondition(rs.getString("P_CONDITION"));
         product.setFilename(rs.getString("P_FILENAME"));
         
         // 상품을 세션에 담음 (장바구니에 담음)
         // 세션 속성 이름 cartlist(장바구니)의 세션 정보(장바구니에 등록된 데이터)를 얻어와
         // ArrayList 객체에 저장
         ArrayList<Product> list = (ArrayList<Product>) session.getAttribute("cartlist");
         // 만약 ArrayList 객체에 저장된 세션 정보가 없다면 ArrayList를 생성하고
         // 이를 세션 속성이름 cartlist의 속성 값으로 저장
         // 요청 파라미터 아이디(id)의 상품을 담은 장바구니를 초기화
         if (list == null) { // 장바구니에 담긴 상품이 없다면
            list = new ArrayList<Product>();
            // 장바구니 상품 수량을 1로 셋팅
            product.setQuantity(1);
            // 리스트에 상품정보 객체를 넣어줌
            list.add(product);
            // 장바구니에 session 내장 객쳉 setting 해줌 !!!! 중요
            session.setAttribute("cartlist", list);
         } else { // 장바구니에 상품들이 담겨있다면
            Product goodsQnt = new Product();
         	boolean chk = false;
            for (int i=0; i<list.size(); i++) {
               goodsQnt = list.get(i);
               // 요청 파라미터 아이디의 상품이 장바구니에 담긴 목록이면 해당 상품의 수량(quantity)을 1 증가
               if (goodsQnt.getProductId().equals(id)) {
                  int orderQuantity = goodsQnt.getQuantity() + 1;
                  goodsQnt.setQuantity(orderQuantity);
                  
                  chk = true;
               }
            }
            if(!chk){
            	product.setQuantity(1);
            	list.add(product);
            }
         }
         
      } else { // id에 해당하는 상품이 없다면
         response.sendRedirect("exceptionNoProductId.jsp");
      }
      
   } catch (SQLException e) {
      e.printStackTrace();
   } finally {
      JdbcUtil.close(rs);
      JdbcUtil.close(pstmt);
      JdbcUtil.close(conn);
   }
   response.sendRedirect("product.jsp?id="+id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
</head>
<body>

</body>
</html>