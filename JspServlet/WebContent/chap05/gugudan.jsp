<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String danStr =	request.getParameter("dan") == null ? "2" : request.getParameter("dan");
int danInt = Integer.parseInt(danStr);
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	function fn_chg(getObj){
			console.log(getObj.value);
			var varDan = getObj.value;
			location.href="gugudan.jsp?dan="+varDan;
	}

</script>
</head>
<body>

<!-- 선택박스가 변경되면 gugudan.jsp?dan=3  -->
<!-- request.getParameter("dan")  -->
<select id="sel" name="sel" onchange="fn_chg(this)">
	<%for(int dan=2; dan<=9; dan++){ %>
		<option value="<%=dan%>">
			<%if(dan == danInt){%>
			<%out.print("selected='selected'");%>
			<%}%>
		<%=dan%>단</option>
	<%}%>
</select>
<br>
<table border="1" style="width:30%;">
<% for(int j=1; j<=9; j++){%>
	<tr>
		<td>
		<%out.print(danInt + "X" + j + "=" + (danInt * j));%>
		</td>
	</tr>
	<%}%>	
</table>

</body>
</html>