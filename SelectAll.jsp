<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%@ include file="dbconn.jsp" %>

<%
	ResultSet rs = null;
	Statement stmt = conn.createStatement();
	
	String sql = "SELECT * FROM member";
	rs =stmt.executeQuery(sql);
	
	while(rs.next()) {
		String mem_id = rs.getString("mem_id");
		String mem_name = rs.getString("mem_name");
		String mem_pass = rs.getString("mem_pass");	
		out.println(mem_id + "   " + mem_name + "   " + mem_pass +"<br>");
	}	
	stmt.close();
	conn.close();
			
	
%>

</body>
</html>