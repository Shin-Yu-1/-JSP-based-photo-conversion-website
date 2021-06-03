<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
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
								<form method="post" name="member_p" action="Insert01_process.jsp" onsubmit='return join()' >
									<div class="field half first">
										<input type="text" name="mem_id" placeholder="ID를 입력해주세요"id="mem_id" />
									</div>
									<div class="field half">
										<input class='id-btn' type="submit" value="중복확인" onclick="javascript_:document.member_p.action='join-server2.jsp';" />
									</div>
									
									<div class="field half first">
										<input type="text" name="mem_pass" id="mem_pass"placeholder="비밀번호를 입력해주세요" />
									</div>
									<div class="field half">
										<input type="text" name="mem_pass2" id="mem_pass2"placeholder="비밀번호를 입력해주세요" />
									</div>
									
									<div class="field half first m">
										<input type="text" name="mem_mail" id="mem_mail"placeholder="e-mail 앞 부분만 입력해주세요" />
									</div>
									<div class="field half m">
										<input type="text" name="mem_mail2" id="mem_mail2"placeholder="e-mail @ 이후 부분만 입력해주세요." />
									</div>
									
									<div class="field half first">
										<input type="text" name="mem_name" id="mem_name" placeholder="이름을 입력해주세요" />
									</div>
									<div class="field half">
										<label >  </label>
									</div>
									<div class="field">
										<label >  </label>
									</div>
									
									<ul class="actions">
										<li><input type="submit" value="SIGN UP" class="special" /></li>
										<li><input type="reset" value="Reset" /></li>
									</ul>
								</form>
							<div class="inner"></div>
						</div>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

</body>
</html>