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
	<p> 이름 : <input type='text' name='name'>
	<p> 제목 : <input type='text' name='subject'>
	<p> 파일 : <input type='file' name='filename'>
	<p> <input type='submit' value='파일전송'>
</form>
</body>
</html>