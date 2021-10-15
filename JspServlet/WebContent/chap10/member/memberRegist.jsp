<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 등록</title>
</head>
<body>

<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<link rel="stylesheet" href="/css/jquery-ui.css">
<script src="/js/jquery-3.6.0.js"></script>
<script src="/js/jquery-ui.js"></script>
<script type="text/javascript">

$(function(){
	$('#datepicker').datepicker();
});

// 다음 우편번호 검색
function openHomeSearch(){
	new daum.Postcode({
		oncomplete:function(data){
			$('[name=zipcode]').val(data.zonecode);
			$('[name=addr1]').val(data.address);
			$('[name=addr2]').val(data.buildingName);
		}
	}).open();
}

</script>

	<form action="./memberRegistOk.jsp" method="post">
	  아이디 : <input type="text" name="memId" value="a001"/> <br>
	  비밀번호 : <input type="password" name="memPass" value="asdfasdf"/> <br>
	  이름 : <input type="text" name="memName" value="김은대"/> <br>
	  주민번호1 : <input type="text" name="memRegno1" value="1234"/> <br>
 	  주민번호2 : <input type="text" name="memRegno2" value="1234"/> <br>
	  생일 : <input type="text" name="memBir" id="datepicker" value="2021/10/13"/> <br>
	  우편번호 : <input type="text" name="zipcode" value="1234"/>
	 <button type="button" onclick="openHomeSearch()">검색</button> 
	 <br>
	  주소1 : <input type="text" name="addr1" value="대전"/> <br>
	  주소2 : <input type="text" name="addr2" value="대흥동"/> <br>
	  전화번호 : <input type="text" name="memHometel" value="1234"/> <br>
	  메일 : <input type="text" name="memMail" value="1234"/> <br>
	 <input type="submit" value="확인">&nbsp;<input type="reset" value="취소"/>
	</form>

</body>
</html>