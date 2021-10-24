<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/guestbook/fileupload03.jsp</title>
</head>
<body>
<!-- 
Commons-fileUpload 패키지는 서버의 메모리상에서 파일 처리가 가능하도록 지원함
 -->
 <form action="fileupload03_process.jsp" method="post" enctype="multipart/form-data">
    <a>파일 : <input type="file" name="filename" /></a>
    <p><input type="submit" value="파일 올리기" /></p>
 </form>

</body>
</html>