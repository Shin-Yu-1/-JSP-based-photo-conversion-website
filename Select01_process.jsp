<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%//@ page import="javax.swing.JOptionPane.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
<title>Insert title here</title>
</head>
<body>
			<div id="wrapper">

				<!-- Header -->
					<header id="header">
                            <div class="logo">
                                <a href="04-02_Session_Client.jsp"><span class="icon fa-diamond"></span></a>
                            </div>
						<div class="content">
							<h2 class="major"></h2>
							<%@ include file="dbconn.jsp" %>
							<%
							String mem_mail = request.getParameter("mem_mail");
							String mem_mail2 = request.getParameter("mem_mail2");
						
							String mem_email = mem_mail + "@" + mem_mail2;
							
							ResultSet rs = null;
							Statement stmt = conn.createStatement();
						
							String sql = "SELECT * FROM member WHERE mem_mail = '";
							sql += mem_mail+"' AND mem_mail2 = '" + mem_mail2 + "'";
							rs = stmt.executeQuery(sql);
						
							String mem_name = "";
							String mem_id = "";
							String mem_pass =  "";
							String mem_mail11 =  "";
							String mem_mail22 =  "";
							
							while(rs.next()){
								mem_name = rs.getString("mem_name");
								mem_id = rs.getString("mem_id");
								mem_pass = rs.getString("mem_pass");
								mem_mail11 = rs.getString("mem_mail");
								mem_mail22 = rs.getString("mem_mail2");
							}
							String mem_email2 = mem_mail11 + "@" + mem_mail22;
							if(mem_mail == "" || mem_mail == null){
								%>
								   <script>
								      alert("메일을 입력해주세요.");
								      history.go(-1);
								   </script>
								<%
							}
							else if(mem_mail2 == "" || mem_mail2 == null){
								%>
								   <script>
								      alert("메일을 올바르게 입력해주세요.\n 예) naver.com");
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
							else if(!mem_email.equals(mem_email2)){
							      %>
								   <script>
								      alert("가입된 정보가 없습니다.");
								      </script>
							      <%
							}
							else{
						
								
								out.println("id : " + mem_id +"\n");
						
								   }
						
							stmt.close();
							conn.close();
						%>
	<div class="inner"></div>
</div>
		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>
</body>
</html>