<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>

<%
	Connection conn = null; // JSP�� DB�� �����ϴ� ����
	
	String url = "jdbc:mysql://localhost:3306/proj_db";
	String user = "root"; //�ǹ������� ����ϸ� �� �� -> ��ŷ ���� ������ ����
	String password = "1234";
	
	Class.forName("com.mysql.jdbc.Driver"); // mysql ---- .jar file //���⼭ ������ ���� ���� �� ��ġ �Ӽ��� �� ������ ���ɼ�
	
	conn = DriverManager.getConnection(url, user, password);
	
//	out.println("����");
%>
