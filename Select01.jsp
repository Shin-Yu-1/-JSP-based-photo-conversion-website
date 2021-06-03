<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
<title>Insert title here</title>
<title>Forget ID</title>
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
								<form method="post" name="member_p" action="Select01_process.jsp">
                                    <div class="field half first m">
										<input type="text" name="mem_mail" id="mem_mail"placeholder="e-mail 앞 부분만 입력해주세요" />
									</div>
									<div class="field half m">
										<input type="text" name="mem_mail2" id="mem_mail2"placeholder="e-mail @ 이후 부분만 입력해주세요." />
									</div>
									
									
									<ul class="actions">
										<li><input type="submit" value="SAVE" class="special" /></li>
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