<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
<title>Insert title here</title>
</head>
<body>
	<%@ include file="dbconn.jsp" %>
	
	<%
	String mem_id = request.getParameter("mem_id");
	String mem_name = request.getParameter("mem_name");
	String mem_pass = request.getParameter("mem_pass");
	String mem_pass2 = request.getParameter("mem_pass2");
	String mem_mail = request.getParameter("mem_mail");
	String mem_mail2 = request.getParameter("mem_mail2");

	
	

	ResultSet rs = null;
	Statement stmt = conn.createStatement();

	String sql1 = "SELECT mem_id FROM member WHERE mem_id = '";
	sql1 += mem_id+"'";
	rs = stmt.executeQuery(sql1);
	
	if(mem_id==""||mem_id==null){
		%>
		   <script>
		      alert("���̵� �Է����ּ���..");
		      history.go(-1);
		   </script>
		<%
		}
	else if(mem_name==""||mem_name==null){
		%>
		   <script>
		      alert("�̸��� �Է����ּ���..");
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
	else if(mem_pass2==""||mem_pass2==null){
		%>
		   <script>
		      alert("��й�ȣ�� �Է����ּ���..");
		      history.go(-1);
		   </script>
		<%
	}
	else if(!mem_pass.equals(mem_pass2)){
		%>
		   <script>
		      alert("��й�ȣ�� �ٸ��ϴ�. �ٽ� �Է����ּ���.");
		      history.go(-1);
		   </script>
		<%
	}
	else if(mem_mail==""||mem_mail==null){
		%>
		   <script>
		      alert("������ �Է����ּ���.");
		      history.go(-1);
		   </script>
		<%
	}
	else if(!mem_mail2.contains(".")){
		%>
		   <script>
		      alert("������ �ùٸ��� �Է����ּ���.\n ��) naver.com");
		      history.go(-1);
		   </script>
		<%
	}
	else if(mem_mail2==""||mem_mail2==null){
		%>
		   <script>
		      alert("������ �Է����ּ���.");
		      history.go(-1);
		   </script>
		<%
	}
	else if(rs.next()) {
		%>
		   <script>
		      alert("�̹� ��� ���� ���̵��Դϴ�.");
		      history.go(-1);
		   </script>
		<%
	}
	else {
	      // INSERT INTO member(mem_id, mem_name, mem_pass)
		// 			VALUES ('hong', '�浿��', '1111' );
		String sql = "INSERT INTO member(mem_id, mem_name, mem_pass, mem_mail, mem_mail2) ";
		sql += "VALUES ('" + mem_id + "', '" + mem_name + "', '" + mem_pass + "', '";
		sql += mem_mail + "', '" + mem_mail2 + "' )";
		stmt.executeUpdate(sql);
		response.sendRedirect("04-02_login_Session_Client.jsp");
	}
	stmt.close();
	conn.close();
	

	%>
	

</body>
</html>