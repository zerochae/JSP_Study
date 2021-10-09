<%@page import="java.io.IOException"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStreamReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>절대 경로 사용하여 자원 읽기</title>
</head>
<body>
<%
   char[] buff = new char[128];
   int len = -1; 
   // 절대경로로 설정
   String filePath = "C:\\workspace\\6.JspSpring\\JspServlet\\WebContent\\chap05\\message\\notice.txt";
   // try 리소스 문
   // try() => fr.close()를 생략해도 자동으로 close()가 됨
   // notice.txt로부터 내용을 읽어오는 스트림을 생성
   try(InputStreamReader fr = new InputStreamReader(new FileInputStream(filePath), "utf-8")) {
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