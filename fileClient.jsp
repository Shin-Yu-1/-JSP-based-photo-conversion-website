<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form name='fileForm' method='post' enctype='multipart/form-data' action ='fileServer.jsp'>
	<p> �̸� : <input type='text' name='name'>
	<p> ���� : <input type='text' name='subject'>
	<p> ���� : <input type='file' name='filename'>
	<p> <input type='submit' value='��������'>
</form>
</body>
</html>