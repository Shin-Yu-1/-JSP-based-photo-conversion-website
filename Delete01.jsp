<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
<title></title>
</head>
<body>
<%
	String mem_id = (String) session.getAttribute("mem_id");
	String mem_pass = (String) session.getAttribute("mem_pass");
	
	if (mem_id == null || mem_pass == null){
		response.sendRedirect("04-02_err_Session_Client.jsp");
	}
%>
			<div id="wrapper">
				<!-- Header -->
					<header id="header">
                        <div >
                            <div class="logo">
                                <a href="04-02_Session_Client.jsp"><span class="icon fa-diamond"></span></a>
                            </div>
                        </div>
                        <div class="content">
                            <h2 class="major"></h2>
                                <form method="post" action="Delete01_process.jsp">
                                    <input type="text" name="mem_id" placeholder="ID를 입력해주세요" id="mem_id" />
                                    <br>
                                    <input type="text" name="mem_pass" id="mem_pass"placeholder="비밀번호를 입력해주세요" />
                                    
                                    <ul class="actions">
                                        <li><input type="submit" value="Delete" class="special" /></li>
                                        <li><input type="reset" value="Reset" /></li>
                                    </ul>
                                </form>
                            </div>   
                    </header>
                        
                            



		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

</body>
</html>