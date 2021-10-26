<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="/js/validation.js"></script>
<title>/guestbook/addProduct.jsp</title>
</head>
<body>
<!--  
fmt:bundle => 태그 몸체에서 사용할 리소스 번들을 지정함
fmt:message => 메세지를 출력
fmt:setBundle => 특정 메세지 번들을 사용할 수 있도록 코딩함

위치 : src/bundle/message.properties 및 src/bundle/message_en.properties
-->
<fmt:setLocale value='<%=request.getParameter("language")%>'/>
<fmt:bundle basename="bundle.message">
<jsp:include page="menu.jsp"></jsp:include>
<div class="jumbotron">
   <div class="container">
      <h1 class="display-3"><fmt:message key="title"></fmt:message></h1>
   </div>
</div>
<div class="container">   
   <div class="text-right">
      <a href="?language=ko">Korean</a>&nbsp;
      <a href="?language=en">English</a>
   </div>
   <form name="newProduct" action="processAddProduct.jsp" class="form-horizontal" method="post" enctype="multipart/form-data">
      <div class="form-group row">
         <label class="col-sm-2"><fmt:message key="productId"></fmt:message></label>
         <div class="col-sm-3">
            <input type="text" name="productId" id="productId" class="form-control">
         </div>
      </div>
      <div class="form-group row">
         <label class="col-sm-2"><fmt:message key="pname"></fmt:message></label>
         <div class="col-sm-3">
            <input type="text" name="name" id="name" class="form-control">
         </div>
      </div>
      <div class="form-group row">
         <label class="col-sm-2"><fmt:message key="unitPrice"></fmt:message></label>
         <div class="col-sm-3">
            <input type="text" name="unitPrice" id="unitPrice" class="form-control">
         </div>
      </div>
      <div class="form-group row">
         <label class="col-sm-2"><fmt:message key="description"></fmt:message></label>
         <div class="col-sm-3">
            <textarea name="description" cols="50" rows="2" class="form-control"></textarea>
         </div>
      </div>
      <div class="form-group row">
         <label class="col-sm-2"><fmt:message key="manufacturer"></fmt:message></label>
         <div class="col-sm-3">
            <input type="text" name="manufacturer" class="form-control">
         </div>
      </div>
      <div class="form-group row">
         <label class="col-sm-2"><fmt:message key="category"></fmt:message></label>
         <div class="col-sm-3">
            <input type="text" name="category" class="form-control">
         </div>
      </div>
      <div class="form-group row">
         <label class="col-sm-2"><fmt:message key="unitsInStock"></fmt:message></label>
         <div class="col-sm-3">
            <input type="text" name="unitsInStock" id="unitsInStock" class="form-control">
         </div>
      </div>
      <div class="form-group row">
         <label class="col-sm-2"><fmt:message key="condition"></fmt:message></label>
         <div class="col-sm-3">
            <input type="radio" name="condition" value="New"><fmt:message key="condition_New"></fmt:message>
            <input type="radio" name="condition" value="Old"><fmt:message key="condition_Old"></fmt:message>
            <input type="radio" name="condition" value="Refurbished"><fmt:message key="condition_Refurbished"></fmt:message>
         </div>
      </div>
      <div class="form-group row">
         <label class="col-sm-2"><fmt:message key="productImage"></fmt:message></label>
         <div class="col-sm-5">
            <input type="file" name="productImage" class="form-control">
         </div>
      </div>
      <div class="form-group row">
         <div class="col-sm-offset-2 col-sm-10">
            <input type="submit" class="btn btn-primary" value="<fmt:message key="button"/>" onclick="CheckAddProduct()">
         </div>
      </div>
   </form>
</div>
</fmt:bundle>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>