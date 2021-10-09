<%@page import="java.net.URL"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.InputStreamReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>application 기본 객체 사용하여 자원 읽기2</title>
</head>
<body>
<%
   /*
   		URL url = application.getResource(resourcePath);
		InputStream is = url.openStream();
		위와 아래는 결국 같음
		InputStream is = application.getResourceAsStream(resourcePath);
   */
   String resourcePath = "/chap05/message/notice.txt"; 
%>
<%

   char[] buff = new char[128];
   int len = -1;
   // application 객체를 통해 파일 읽기. 상대경로.
   URL url = application.getResource(resourcePath);
   try(InputStreamReader fr = new InputStreamReader(url.openStream(), "utf-8")) {
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