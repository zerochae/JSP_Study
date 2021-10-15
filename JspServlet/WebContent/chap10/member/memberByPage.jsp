<%@page import="kr.or.ddit.chap10.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%


	// 1.session에 memberVo 객체를 속성에 set함
	//	 session.setAttribute("memberVo",memberVo);
	// 2.session에 들어있는 memberVo 객체를 get
	MemberVO memberVo = (MemberVO)session.getAttribute("memberVo");

%>
<html>
<head>
<meta charset="UTF-8">
<title>myPage</title>
<script type="text/javascript" src="/js/jquery-3.6.0.js"></script>
<script type="text/javascript">

	$(function(){
		$("input[type='text']").attr("disabled","true");
		$("input[type='password']").attr("disabled","true");
		
		$('#btnEdit').on('click',function(){
			$("input[type='text']").removeAttr("disabled");
			$("input[type='password']").removeAttr("disabled");
		});
	});

</script>
</head>
<body>

	
	  아이디 : <input type="text" name="memId" value="<%=memberVo.getMemId()%>"/> <br>
	  비밀번호 : <input type="password" name="memPass" value="<%=memberVo.getMemPass()%>"/> <br>
	  이름 : <input type="text" name="memName" value="<%=memberVo.getMemName()%>"/> <br>
	  주민번호1 : <input type="text" name="memRegno1" value="<%=memberVo.getMemRegno1()%>"/> <br>
 	  주민번호2 : <input type="text" name="memRegno2" value="<%=memberVo.getMemRegno2()%>"/> <br>
	  생일 : <input type="text" name="memBir" id="datepicker" value="" value="<%=memberVo.getMemBir()%>"/> <br>
	  우편번호 : <input type="text" name="zipcode" value="<%=memberVo.getMemZip()%>"/> <br>
	  주소1 : <input type="text" name="addr1" value="<%=memberVo.getMemAdd1()%>"/> <br>
	  주소2 : <input type="text" name="addr2" value="<%=memberVo.getMemAdd2()%>"/> <br>
	  전화번호 : <input type="text" name="memHometel" value="<%=memberVo.getMemHometel()%>"/> <br>
	  메일 : <input type="text" name="memMail" value="<%=memberVo.getMemMail()%>"/> <br>
	 <button id="btnEdit">수정</button>
<!-- 	 <input type="submit" value="수정">&nbsp;<input type="reset" value="취소"/> -->

</body>
</html>