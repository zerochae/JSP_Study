<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>폼 생성</title>
</head>
<body>



<!--  name속성의 값은 입력요소의 이름이고 요청파라미터의 이름이다. -->

<form action="/chap03/viewParameter.jsp" method="post">
이름 : <input type="text" name="name" size="10"> <br>
<!-- name = "입력값" -->
주소 : <input type="text" name= "address" size="30"> <br>
<!-- address = "입력값" -->
좋아하는 동물 :
	<input type="checkbox" name="pet" value="dog">강아지
	<input type="checkbox" name="pet" value="cat">고양이
	<input type="checkbox" name="pet" value="pig">돼지
<br>
<input type="submit" value="전송">
<% 
// request객체는 JSP에서 기본으로 제공해주는 객체
// request , response, page ,session, applicaiton은 그 중에서도 중요해
request.setCharacterEncoding("UTF-8");
%>
</form>
</body>
</html>