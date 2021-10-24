<%@page import="kr.or.ddit.guestbook.service.MessageListView"%>
<%@page import="kr.or.ddit.guestbook.vo.GuestbookMessageVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.guestbook.service.GetMessageListService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String pageNumberStr = request.getParameter("page");
int pageNumber = 1;
if (pageNumberStr != null) {
	pageNumber = Integer.parseInt(pageNumberStr);
}
GetMessageListService messageListService = GetMessageListService.getInstance();
// messageListService.getMessageList(pageNumber);
MessageListView list = messageListService.getMessageList(pageNumber);
%>
<c:set var="viewData" value="<%=list%>" scope="page" />
<!DOCTYPE html>
<html>
<head>
<title>방명록 메시지 목록</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
</head>
<body>

	<script type="text/javascript" src="../js/list.js"></script>

	<!-- 
		[수정]
		1. 클릭 시 상단의 폼에 정보가 입력되고 "메시지 남기기" 버튼이 hidden, "확인" 및 "취소" 버튼이 block
		2. "확인" 클릭 시 해당 정보가 업데이트되는데, 비밀번호가 일치해야 함
		3. "취소" 클릭 시 현재 페이지의 목록으로 이동
		
		
		[삭제]
		1. 클릭 시 비밀번호를 입력하는 요소가 block 입력한 비밀번호가 일치하면 delete처리
		2. delete 완료 후 현재 페이지의 목록으로 되돌아감
 -->
	<div class="container my-5" style="max-width: 1200px; background: #eee;border-radius: 45px; padding:10px">

		<div class="container my-5">

			<div class="form-group insert" id="insert-form">
				<h4 class="text-center mb-5">방명록 작성</h4>
				<form action="/guestbook/writeMessage.jsp" method="post"
					style="display: inline;">
					<div style="display: flex;">
						<div style="width: 100%; float: left">
							이름 <input class="form-control" type="text" name="guestName"
								placeholder="이름을 입력해주세요" required style="" />
						</div>
						<div style="clear: both; float: none"></div>
						<div style="float: right; width: 100%">
							비밀번호 <input style="" class="form-control" placeholder="*******"
								type="password" name="password" required />

						</div>

					</div>
					<br> 메시지
					<textarea rows="3" cols="30" name="message" class="form-control"
						required></textarea>
					<br> <input id="msgBtn" type="submit" value="메시지 남기기"
						action="" class="btn btn-success">
				</form>
			</div>

			<div class="form-group update" id="update-form" style="display: none">
				<h4 class="text-center mb-5">방명록 수정</h4>
				<form action="/guestbook/update.jsp?msgNo=  " method="post">

					<div style="display: flex;">
						<div style="width: 100%; float: left">
							이름 <input class="form-control" type="text" name="guestName"
								id="update-gName" placeholder="이름을 입력해주세요" required style="" />
						</div>
						<div style="clear: both; float: none"></div>
						<div style="float: right; width: 100%">
							비밀번호 <input style="" class="form-control" placeholder="*******"
								type="password" name="password" required />
						</div>
					</div>
					<br> 메시지
					<textarea rows="3" cols="30" name="message" class="form-control"
						id="update-msg" id="update-msg" required></textarea>
					<br>
					<!-- 비밀번호 -->
					<input class="form-control" type="text" name="messageId"
						id="update-msgNo" required style="display: none" />
					<!--  -->
					<div id="BtnBox1" style="display: none">
						<input type="submit" value="확인" class="btn btn-primary"> <input
							type="reset" value="취소" class="btn btn-danger"
							onclick="location.href='list.jsp'">
					</div>
				</form>
			</div>

		</div>

		<div class="container my-5">

			<div style="clear: both;"></div>
			<table class="table table-striped text-center">

				<thead>
					<tr>
						<td style="width: 50px">번호</td>
						<td style="width: 200px">손님 이름</td>
						<td style="width: 500px">메시지</td>
						<td style="width: 450px"></td>
					</tr>
				</thead>
				<c:forEach var="message" items="${viewData.messagelist}">
					<tbody>
						<tr>
							<td id="msgId${message.messageId}">${message.messageId}</td>
							<td id="gName${message.messageId}">${message.guestName}</td>
							<td style="" id="msg${message.messageId}">${message.message}</td>
							<td>
								<div id="BtnBox2${message.messageId}" style="display: block;"
									class="update-Btn-Box">
									<button id="updateBtn${message.messageId}"
										class="btn btn-primary" onclick="update(${message.messageId})">수정</button>
									<button id="deleteBtn${message.messageId}"
										class="btn btn-danger delete-Btn"
										onclick="del(${message.messageId})">삭제</button>
								</div>
								<div id="del-box${message.messageId}"
									data-id="${message.messageId}"
									style="display: none; float: right">
									<form method="post" class="form-group"
										action="/guestbook/delete.jsp?msgNo=${message.messageId}">
										<input class="btn btn-primary" type="submit" value="확인">
										<input type="reset" class="btn btn-danger"
											onclick="location.href='list.jsp'" value="취소" /> <input
											class="form-control" type="password" name="password"
											id="password" placeholder="password"
											style="max-width: 136px; max-height: 38px; display: inline; margin-right: 5px">
									</form>
								</div>
							</td>
						</tr>
					</tbody>
				</c:forEach>
			</table>

			<div class="container text-center">
				<c:forEach var="pageNum" begin="1" end="${viewData.pageTotalCount}">
					<a style="text-decoration: none;color:black" href="list.jsp?page=${pageNum}">[${pageNum}]</a> &nbsp;
			</c:forEach>
			</div>

			<div class="mt-5"></div>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>