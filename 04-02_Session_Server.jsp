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
	String mem_id = request.getParameter("mem_id");
	String mem_pass = request.getParameter("mem_pass");
	
	if(mem_id == null || mem_pass == null) {
		response.sendRedirect("04-02_Session_Client.jsp");
	}

	ResultSet rs = null;
	Statement stmt = conn.createStatement();

	String sql = "SELECT mem_pass FROM member WHERE mem_id='";
	sql += mem_id+"'";
	rs = stmt.executeQuery(sql);
		
	String mem_pass2="";
	while(rs.next()){
		mem_pass2 = rs.getString("mem_pass");
	}
	//로그인 완료창
	if(mem_pass.equals(mem_pass2)) {
		session.setAttribute("mem_id",mem_id);
		session.setAttribute("mem_pass", mem_pass);
		response.sendRedirect("04-01-1_Photo_Client.jsp");
	}
	else {
	      %>
	      <script>
	      alert("가입하지 않은 아이디이거나, 잘못된 비밀번호입니다.");
	      history.go(-1); </script>
	      <%
		   }
	stmt.close();
	conn.close();	
%>
</body>
</html>