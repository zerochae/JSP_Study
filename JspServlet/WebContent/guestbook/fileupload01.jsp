<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

<!-- 

http://www.servlets.com/cos/
오픈 라이브러리 cos.jar

MultipartRequest는 웹 페이지에서 서버로 업로드 되는 파일 자체만 다루는 클래스
웹 브라우저가 전송한 multipart/form-data 유형과 POST 방식의 요청 파라미터 등을 분석 후 일반 데이터와 파일 데이터를 구분하여 파일 데이터에 접근.
한글 인코딩 값을 얻기 쉽고, 서버의 파일 저장 폴더에 동일한 파일명이 있으면 파일명을 자동으로 변경

 -->

<form action="fileupload01_process.jsp" name="fileForm" method="post" enctype="multipart/form-data">

<p>이름 : <input type="text" name="name"> </p>
<p>제목 : <input type="text" name="subject"> </p>
<p>파일 : <input type="file" name="filename"> </p>
<p> <input type="submit" value="파일 올리기"> </p>

</form>

</body>
</html>