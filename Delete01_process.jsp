<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
	
	ResultSet rs = null;
	Statement stmt = conn.createStatement();

	String sql1 = "SELECT mem_id, mem_pass FROM member WHERE mem_id = '";
	sql1 += mem_id+"'";
	rs = stmt.executeQuery(sql1);
	
	String m_id = "";
	String m_pass = "";
	
	while(rs.next()){
		m_id = rs.getString("mem_id");
		m_pass = rs.getString("mem_pass");
	}
	if(mem_id==""||mem_id==null){
		%>
		   <script>
		      alert("���̵� �Է����ּ���..");
		      history.go(-1);
		   </script>
		<%
		}
	else if(!mem_id.equals(m_id)){
		%>
		   <script>
		      alert("���̵� Ʋ�Ƚ��ϴ�.");
		      history.go(-1);
		   </script>
		<%
	}
	else if(mem_pass==""||mem_pass==null){
		%>
		   <script>
		      alert("��й�ȣ�� �Է����ּ���..");
		      history.go(-1);
		   </script>
		<%
	}
	else if(!mem_pass.equals(m_pass)){
		%>
		   <script>
		      alert("��ϵ� ��й�ȣ�� �ٸ��ϴ�.");
		      history.go(-1);
		   </script>
		<%
	}
	else {  // ���� ��ɹ�
		// DELETE FROM member  
		//		WHERE mem_id = 'cccc';
		String sql = "DELETE FROM member WHERE mem_id = '";
		sql += mem_id + "'";
		
		stmt.executeUpdate(sql);
		response.sendRedirect("04-02_Session_Client.jsp");
	
	}
	stmt.close();
	conn.close();
	session.invalidate();
	
	%>
	

</body>
</html>