<%@page import="kr.or.ddit.guestbook.vo.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%

	String cartId = session.getId();
	
	

%>


<!DOCTYPE html>
<html>
<head>
<title>Cart</title>
</head>
<body>

<jsp:include page="menu.jsp"/>


	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">장바구니</h1>	
		</div>
	
		<div class="container">
			<div class="row">
				<table width="100%">
					<tr>
						<td align="left">
							<a href="./deleteCart.jsp?cartId=<%=cartId%>" class="btn btn-danger">삭제하기</a>
						</td>
						<td align="right">
							<a href="./shoppingCart.jsp?cartId=<%=cartId%>" class="btn btn-success">주문하기</a>
						</td>
					</tr>
				</table>
			</div>
			<div style="padding-top:50px">
				<table class="table table-hover">
					<tr>
						<td>상품</td>
						<td>가격</td>
						<td>수량</td>
						<td>소계</td>
						<td>비고</td>
					</tr>
					<%
					
					int sum = 0;
					//장바구니인 cartlist에 등록된 모든 상ㅍ무을 가져옴
					ArrayList<Product> cartList = (ArrayList<Product>)session.getAttribute("cartlist");
					
					if(cartList == null){
						cartList = new ArrayList<Product>();
					}
					
					for(int i =0; i<cartList.size(); i++){
						Product product = cartList.get(i);
						// 금액 = 상품의 가격 * 수량;
						int total = product.getUnitPrice() * product.getQuantity();
						sum += total;
					
					
					%>
					
					<tr>
						<td><%=product.getProductId()%> - <%=product.getPname()%></td>
						<td><%=product.getUnitPrice()%></td>
						<td><%=product.getQuantity() %></td>
						<td><%=total%></td>
						<td><a href="./removeCart.jsp?id=<%=product.getProductId()%>" class="badge badge-danger"> 삭제 </a></td>
					
					</tr>
					<%
					}
					%>
					
					<tr>
						<td></td>
						<td></td>
						<td>총액</td>
						<td><%=sum %></td>
						<td></td>
					
					</tr>
				</table>
				<a href="./products.jsp" class="btn btn-secondary">쇼핑계속하기&laquo;</a>
			</div>
			<hr>
		</div>
	</div>


<jsp:include page="footer.jsp"/>


</body>
</html>