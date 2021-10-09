<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1-10까지의 합</title>
</head>
<body>

<%
	int sum = 0;
	for (int i =1; i<= 10; i++){
		sum += i;
	}
%>

1부터 10까지의 합은 <%=sum %>입니당 ㅋㅋ

<br>

<%
	// 한 개 이상의 스크립트릿 코드 블록을 포함할 수 있음
	int sum2 = 0;
	for (int i =11; i<= 20; i++){
		sum2 += i;
	}
%>

<%

int a = 2;
int b = 4;
int result = 0;
int count = 0;
while(count != 99){
count++;
result = a + b;
b *= 3;
}


%>

11부터 20까지의 합은 <%=sum2 %>입니당 ㅋㅋ

<%=result %>

</body>
</html>