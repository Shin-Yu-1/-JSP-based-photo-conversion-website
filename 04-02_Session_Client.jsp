<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title></title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="assets/css/main.css" />
	<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
	
<!-- 템플릿 가져온 사이트 : http://webjangi.com/design/sampleDownload?cid=33 -->

<script>
function loginchk() {
    var regx = /^[a-zA-Z0-9]*$/;
    
    var id = document.getElementById("mem_id").value;
    var pw = document.getElementById("mem_pass").value;
    
    if(id.length == 0 || id == null) {
       alert("아이디를 입력해주세요.");
       return false;
    }
    if(pw.length == 0 || pw == null) {
       alert("비밀번호를 입력해주세요.");
       return false;
    }
 
    
    if (!regx.test(id)){
       alert("아이디는 영어, 숫자만 입력가능합니다.");
       return false;
    }
    document.form.submit();
 }
 </script>
</head>
<body>
		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Header -->
					<header id="header">
						<div class="logo">
							<span class="icon fa-diamond"></span>
						</div>
						<div class="content">
							<div class="inner">
								<h1>JSP 기반의 사진변환 서비스</h1>
								<p><form method="post" action="04-02_Session_Server.jsp" onsubmit='return loginchk()' class="login-form">
									<p> 아이디 : <input type="text" class="text-field" name="mem_id" placeholder="ID" id='mem_id'>
									<p> 암호 : <input type="password" name="mem_pass" placeholder="PASSWORD" class="text-field" id='mem_pass'>
									<p> <input type="submit" value="LOGIN" class="submit-btn">
									<input type="button" value="Sign Up"  onclick='window.open("Insert01.jsp")'class="submit-btn">
									<p class="copyright">Forget your <a href="Select01.jsp">ID</a>/<a href="Select02.jsp">PW</a>?</p>
								</form></p>
							</div>
						</div>
						<nav>
							<ul>
								<li><a href="https://shin-yu.tistory.com/62">BLOG</a></li>
								<li><a href="https://www.youtube.com/channel/UCkOsam2wX0Gc5urCZCjNZXA">YOUTUBE</a></li>
								<li><a href="https://www.facebook.com/profile.php?id=100015564993124">INSTAGRAM</a></li>
								<li><a href="https://www.facebook.com/people/%25EB%25B0%2595%25EC%259E%25AC%25EA%25B2%25BD/100015564993124/">FACEBOOK</a></li>
								<!--<li><a href="#elements">Elements</a></li>-->
							</ul>
						</nav>
					</header>



				<!-- Footer -->
					<footer id="footer">
						<p class="copyright">&copy; Untitled. Design: <a href="https://html5up.net">HTML5 UP</a>.</p>
					</footer>

			</div>

		<!-- BG -->
			<div id="bg"></div>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>
</body>
</html>