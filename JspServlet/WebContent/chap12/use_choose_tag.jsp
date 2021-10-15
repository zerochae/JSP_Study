<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>choose 태그</title>
</head>
<body>

<!-- 

==(eq)
!=(ne)
<(lt)
>(gt)
<=(le)
>=(ge)

 -->

	<ul>
		<c:choose>
			<c:when test="${param.name == 'admin' }"><li>관리자</li></c:when>
			<c:when test="${param.name == 'stud' }"><li>학생</li></c:when>
			<c:when test="${param.name == 'prof' }"><li>교수</li></c:when>
			<c:otherwise>나그네</c:otherwise>
		</c:choose>
	</ul>

</body>
</html>