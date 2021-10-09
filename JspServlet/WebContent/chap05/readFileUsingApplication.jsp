<%@page import="java.io.IOException"%>
<%@page import="java.io.InputStreamReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>application 기본 객체 사용하여 자원 읽기</title>
</head>
<body>
<%
   // readFileUsingApplication.jsp
   // 상대경로
   String resourcePath = "/chap05/message/notice.txt"; 
%>
자원의 실제 경로 : <br/>
<%=application.getRealPath(resourcePath) %> <!-- 중요!!!!!! -->
<br/>
------------------------------------------------------<br/>
<%=resourcePath %>의 내용<br/>
------------------------------------------------------<br/>
<%
   char[] buff = new char[128];
   int len = -1;
   // application 객체를 통해 파일 읽기. 상대경로.
   try(InputStreamReader fr = new InputStreamReader(application.getResourceAsStream(resourcePath), "utf-8")) {
      // notice.txt로부터 읽어온 데이터를 out 기본 객체를 사용하여 웹 브라우저에 출력함
      while ((len = fr.read(buff)) != -1) {
         out.print(new String(buff, 0, len));
      }
   } catch(IOException ex) {
      out.println("예외 발생 : " + ex.getMessage());
   }
%> 
</body>
</html> 