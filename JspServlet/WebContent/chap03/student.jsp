<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 정보 입력</title>
</head>
<body>

	<form action="./studentProc.jsp" method="post">
		<table border="1" style="width:700px">
			<tr>
			<td colspan="2" style="text-align: center">
			<h2>학생 정보</h2>
			</td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input name="studentName" type="text" size="10"></td>
			</tr>

			<tr>
				<td>성별</td>
				<td><input type="radio" name="gender" value="여자"> <label for="female">여자</label> 
				<input type="radio" name="gender" value="남자"> <label for="male">남자</label>
				</td>
			</tr>
			<tr>
				<td>전공</td>
				<td><select name="major">
						<option value="체육학과">체육학과</option>
						<option value="정보공학과">정보공학과</option>
						<option value="유아교육학과">유아교육학과</option>
						<option value="항공소프트웨어공학과">항공소프트웨어공학과</option>
						<option value="전자공학과">전자공학과</option> 
						<option value="식품영양학과">식품영양학과</option>
						<option value="보건행정학과">보건행정학과</option>
				</select></td>
			</tr>
			<tr>
				<td>취미</td>
				<td><input type="checkbox" name="hobby" value="수영">수영
					<input type="checkbox" name="hobby" value="여행">여행 
					<input type="checkbox" name="hobby" value="독서">독서 
					<input type="checkbox" name="hobby" value="영화감상">영화감상</td>
			</tr>
		<tr>
		<td colspan="2" style="text-align: center;">
			<input type="submit" value="회원 정보 보내기">
			<input type="reset" value="다시 쓰기">
		</td>
		</tr>
		</table>
	</form>

</body>
</html>