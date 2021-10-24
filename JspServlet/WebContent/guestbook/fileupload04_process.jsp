<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>fileupload04_process.jsp</title>
</head>
<body>

	<%
		String path = "C:\\Users\\zeroc\\git\\JSP_Study\\JspServlet\\WebContent\\images";
		DiskFileUpload upload = new DiskFileUpload();
		
		
		upload.setSizeMax(1_000_000);
		
		upload.setSizeThreshold(4096);
		
		upload.setRepositoryPath(path);
		
		List items = upload.parseRequest(request);
		
		Iterator params = items.iterator();
		
		while(params.hasNext()){
			FileItem item = (FileItem)params.next();
			if(item.isFormField()){
				String name = item.getFieldName();
				String value = item.getString("utf-8");
				out.print(name + "=" + value);
			} else {
				String fileFieldName = item.getFieldName();
				
				String fileName = item.getName();
				String contentType = item.getContentType();
				System.out.println(fileName);
				fileName = fileName.substring(fileName.lastIndexOf("\\")+1);
				System.out.println(fileName);
				long fileSize = item.getSize();
				
				File file = new File(path + "/" + fileName);
				item.write(file);
			}
		}
		
	%>


</body>
</html>