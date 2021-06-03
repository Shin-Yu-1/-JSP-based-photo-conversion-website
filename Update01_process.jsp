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
	String mem_name = request.getParameter("mem_name");
	String mem_id = request.getParameter("mem_id");
	String mem_pass = request.getParameter("mem_pass"); //변경 전 비밀번호
	String mem_pass2 = request.getParameter("mem_pass2"); //변경 후 비밀번호
	String mem_pass3 = request.getParameter("mem_pass3"); // 변경 후 비밀번호 재확인
	String mem_mail = request.getParameter("mem_mail");
	String mem_mail2 = request.getParameter("mem_mail2");

	
	

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
		      alert("아이디를 입력해주세요..");
		      history.go(-1);
		   </script>
		<%
		}
	else if(!mem_id.equals(m_id)){
		%>
		   <script>
		      alert("아이디가 틀렸습니다.");
		      history.go(-1);
		   </script>
		<%
	}
	else if(mem_name==""||mem_name==null){
		%>
		   <script>
		      alert("이름을 입력해주세요.");
		      history.go(-1);
		   </script>
		<%
	}
	else if(mem_pass==""||mem_pass==null){
		%>
		   <script>
		      alert("비밀번호를 입력해주세요..");
		      history.go(-1);
		   </script>
		<%
	}
	else if(!mem_pass.equals(m_pass)){
		%>
		   <script>
		      alert("등록된 비밀번호와 다릅니다.");
		      history.go(-1);
		   </script>
		<%
	}
	else if(mem_pass2==""||mem_pass2==null){
		%>
		   <script>
		      alert("비밀번호를 입력해주세요..");
		      history.go(-1);
		   </script>
		<%
	}
	else if(mem_pass3==""||mem_pass3==null){
		%>
		   <script>
		      alert("비밀번호를 입력해주세요..");
		      history.go(-1);
		   </script>
		<%
	}
	else if(!mem_pass2.equals(mem_pass3)){
		%>
		   <script>
		      alert("비밀번호가 다릅니다. 다시 입력해주세요.");
		      history.go(-1);
		   </script>
		<%
	}
	else if(mem_mail==""||mem_mail==null){
		%>
		   <script>
		      alert("메일을 입력해주세요.");
		      history.go(-1);
		   </script>
		<%
	}
	else if(!mem_mail2.contains(".")){
		%>
		   <script>
		      alert("메일을 올바르게 입력해주세요.\n 예) naver.com");
		      history.go(-1);
		   </script>
		<%
	}
	else if(mem_mail2==""||mem_mail2==null){
		%>
		   <script>
		      alert("메일을 입력해주세요.");
		      history.go(-1);
		   </script>
		<%
	}
	else {  // 쿼리 명령문
		// UPDATE member  SET  mem_name='kkkk', mem_pass='kkkk'  
		//		WHERE mem_id = 'cccc';
		String sql = "UPDATE member  SET  mem_pass='";
		sql += mem_pass2  + "', mem_mail='" + mem_mail + "', mem_mail2='" + mem_mail2 + "' ";
		sql += "WHERE mem_id = '" + mem_id + "'";

		stmt.executeUpdate(sql);
		response.sendRedirect("04-01-1_Photo_Client.jsp");
	}
	stmt.close();
	conn.close();
	%>
	

</body>
</html>