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
	
	out.println("�̸� : "+name+"<br>");
	out.println("���� : "+subject+"<br>");
	
	Enumeration files = multi.getFileNames();
	tmp = (String) files.nextElement();
	String filename = multi.getFilesystemName(tmp);
	
	out.println("���ε� ���ϸ� : " + filename + "<br>");
	
%>

</body>
</html>