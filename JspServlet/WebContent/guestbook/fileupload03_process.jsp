<%@page import="java.util.UUID"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%!
private String getFolder(){
   SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
   Date date = new Date();
   String str = sdf.format(date);
   return str.replace("-",File.separator);
}
%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

<!-- 
	Commons-FileUpload를 이용한 파일 업로드
	: 파일 업로드 패키지. 서버의 메모리상에서 파일 처리
	http://commons.apache.org/downloads
	1) commons-fileupload.jar
	2) commons-io.jar

 -->

<%
	String fileUploadPath = "C:\\Users\\zeroc\\git\\JSP_Study\\JspServlet\\WebContent\\images";
	// 파일 업로드를 위해 DiskFileUpload 클래스 생성
	DiskFileUpload upload = new DiskFileUpload();
	// 요청 파라미터를 전달받도록 DiskFileUpload 객체 타입으로 생성
	List items = upload.parseRequest(request);
	// 요청 파라미터가 없을때까지 반복
	Iterator params = items.iterator();
	
	File uploadPath = new File(fileUploadPath,getFolder());
	out.print("upload path : " + uploadPath);
	if(uploadPath.exists() == false){
		uploadPath.mkdir();
	}
	
	while(params.hasNext()){
		FileItem fileItem = (FileItem)params.next();

			if(!fileItem.isFormField()){
			String fileName = fileItem.getName();
			fileName = fileName.substring(fileName.lastIndexOf("\\") + 1);
			
			UUID uuid = UUID.randomUUID();
			fileName = uuid.toString()+ "_" + fileName;
			
// 			File file = new File(fileUploadPath + "/" + fileName);
			File file = new File(uploadPath,fileName);
			//서버의 저장 경로에 파일을 저장
			fileItem.write(file);
		}
	}
	
%>

</body>
</html>