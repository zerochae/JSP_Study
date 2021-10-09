<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%--
    
    <jsp:forward> 액션 태그를 실행하면 생성했던 출력 결과는 모두 제거된다.
    
     --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>from.jsp의 제목</title>
</head>
<body>

이 페이지는 from.jsp가 생성한 것입니다.

<!-- 
forward -> 파라미터를 넘길 수 있음 (request 객체와 response 객체를 가지고 있기 때문)
redirect -> 파라미터를 넘길 수 없어 (위가 없어!)
 -->

<jsp:forward page="/chap07/to/to.jsp"></jsp:forward>

</body>
</html>