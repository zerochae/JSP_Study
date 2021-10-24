<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="/js/validation.js"></script>
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="menu.jsp" />

	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">Product</h1>
		</div>
	</div>

	<div class="container">
		<form action="processAddProduct.jsp" class="form-horizontal"
			method="post" name="newProduct">

			<div class="form-group row">
				<label class="col-sm-2"> Name </label><input type="text" name="productId"
					class="form-control" />
				
			</div>
			<div class="form-group row">
				<label class="col-sm-2"> Price </label><input type="text" name="productId"
					class="form-control" />
				
			</div>
			<div class="form-group row">
				<label class="col-sm-2"> Info</label> <textarea rows="50" cols="2" class="form-control"></textarea>
				
			</div>
			<div class="form-group row">
				<label class="col-sm-2"> Code</label> <input type="text" name="productId"
					class="form-control" />
			</div>
			<div class="form-group row">
				<label class="col-sm-2"> Brand</label> <input type="text" name="productId"
					class="form-control" />
			</div>
			<div class="form-group row">
				<label class="col-sm-2"> Category </label> <input type="text" name="productId"
					class="form-control" />
				
			</div>
			<div class="form-group row">
				<label class="col-sm-2"> Stock </label><input type="text" name="productId"
					class="form-control" />
			</div>
			<div class="form-group row">
				<label class="col-sm-2"> Condition </label>
				<input type="radio" name="condition" value="New"/> new
				<input type="radio" name="condition" value="Old"/> old 
				<input type="radio" name="condition" value="Refurbished"/> re
			</div>
			
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="submit" class="btn btn-primary" value="submit">
				</div>
			</div>

		</form>
	</div>

	<jsp:include page="footer.jsp" />

</body>
</html>