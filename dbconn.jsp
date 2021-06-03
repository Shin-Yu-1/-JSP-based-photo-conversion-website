<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>

<%
	Connection conn = null; // JSP와 DB를 연결하는 교량
	
	String url = "jdbc:mysql://localhost:3306/proj_db";
	String user = "root"; //실무에서는 사용하면 안 됨 -> 해킹 당할 위험이 높음
	String password = "1234";
	
	Class.forName("com.mysql.jdbc.Driver"); // mysql ---- .jar file //여기서 오류가 제일 많이 남 설치 속성이 잘 못됐을 가능성
	
	conn = DriverManager.getConnection(url, user, password);
	
//	out.println("성공");
%>
