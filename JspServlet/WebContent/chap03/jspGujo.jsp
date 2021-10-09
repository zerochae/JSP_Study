<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 
    * 디렉티브
    1) page(***) : 문서의 타입, 캐릭터셋, 인코딩, 출력 버퍼의 크기를 설정
    2) taglib(**) : 태그라이브러리 지정. c,fmt, fn...
    3) include(*) : 다른 문서를 포함
    
    
    * text/html <- MIME 타입
      text/xml
      application/json
     -->
 
 	
 <%!
 	//선언부(Declartion) : 메서드
 	int add(int p_a, int p_b){
	 return p_a + p_b;
 }
 %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 구조</title>
</head>
<body>
<!-- 스크립트 요소? 스크립트릿, 표현식, 선언부 -->
 <%
 	// 스크립트릿(ScriptLet) : 자바 코드 실행
 	String bookTitle = "JSP 프로그래밍";
 	String author = "이준석";
 	int result = add(3,5);
 %>
 <!-- 표현식(Expression) : 값을 출력 -->
 <b> <%=bookTitle%></b>(<%=author%>)입니다.
 <b> <%=result%></b>
</body>
</html>