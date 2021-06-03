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

   ResultSet rs = null;
   Statement stmt = conn.createStatement(); // 쿼리 명령문

   String sql = "SELECT mem_id FROM member ";
   sql += "WHERE mem_id = '" + mem_id + "';";

   // out.println(sql);

   rs = stmt.executeQuery(sql);

   if(rs.next()) {
%>
   <script>
      alert("이미 사용 중인 아이디입니다.");
      history.go(-1);
   </script>
<%
   }
   else {
%>
   <script>
      alert("사용 가능한 아이디입니다.");
      history.go(-1);
   </script>
<%   
   }
      
   stmt.close();
   conn.close();
%>
</body>
</html>