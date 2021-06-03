<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%
	MultipartRequest multi = new MultipartRequest(request, "C:\\upload",
			5*1024*1024, "utf-8", new DefaultFileRenamePolicy());
	
	String tmp;
	Enumeration params = multi.getParameterNames();
	tmp = (String) params.nextElement();
	String name = multi.getParameter(tmp);
	tmp = (String) params.nextElement();
	String subject = multi.getParameter(tmp);
	
	out.println("이름 : "+name+"<br>");
	out.println("제목 : "+subject+"<br>");
	
	Enumeration files = multi.getFileNames();
	tmp = (String) files.nextElement();
	String filename = multi.getFilesystemName(tmp);
	
	out.println("업로드 파일명 : " + filename + "<br>");
	
%>

</body>
</html>