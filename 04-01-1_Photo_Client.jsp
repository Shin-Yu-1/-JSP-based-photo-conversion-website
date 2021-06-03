<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
</head>
<body>
<%
	String mem_id = "";
	if(session.getAttribute("mem_id")==null)
	mem_id = (String) session.getAttribute("mem_id");
	String mem_pass = (String) session.getAttribute("mem_pass");
	
	if (mem_id == null || mem_pass == null){
		response.sendRedirect("04-02_err_Session_Client.jsp");
	}
%>
		<!-- Wrapper -->
			<div id="wrapper">
					<header id="header">
						<nav>
							<ul>
								<li><a href="#Example_C">Example</a></li>
								<li><a href="#Example_R">Example</a></li>
								<li><a href="#Color_Image">COLOR</a></li>
								<li><a href="#Raw_Image">RAW</a></li>
							</ul>
						</nav>
					</header>

				<!-- Main -->
					<div id="main">

						<!-- Intro -->
							<article id="Example_C">
								<h2 class="major">Example Color Image File</h2>
								<span class="image main"><img src="images/1.jpg" alt="" /></span>
								<span class="image main"><img src="images/2.jpg" alt="" /></span>
								<span class="image main"><img src="images/3.jpg" alt="" /></span>
								<span class="image main"><img src="images/4.jpg" alt="" /></span>
								<span class="image main"><img src="images/5.jpg" alt="" /></span>
							</article>

						<!-- Work -->
							<article id="Example_R">
								<h2 class="major">Example RAW Image File</h2>
								<span class="image main"><img src="images/raw_1.PNG" alt="" /></span>
								<span class="image main"><img src="images/raw_2.PNG" alt="" /></span>
								<span class="image main"><img src="images/raw_3.PNG" alt="" /></span>
								<span class="image main"><img src="images/raw_4.PNG" alt="" /></span>
								<span class="image main"><img src="images/raw_5.PNG" alt="" /></span>
								<span class="image main"><img src="images/raw_6.PNG" alt="" /></span>
								<span class="image main"><img src="images/raw_7.PNG" alt="" /></span>
								<span class="image main"><img src="images/raw_8.PNG" alt="" /></span>
							</article>

						<!-- Color_Image -->
							<article id="Color_Image">
								<h2 class="major">Color Image</h2>
								<span class="image main"></span>
								<form name='fileForm' method='post' enctype='multipart/form-data' action='05-01_Photo_Server.jsp'>
									<div class="field half first" alt="" >
									<input type='file' name='filename' >
									<p> <select name="algo" >
										<option value="">효과선택</option>
										<option value="1">반전처리</option>
										<option value="2">밝게하기</option>
										<option value="3">그레이스케일</option>
										<option value="4">흑백</option>
										<option value="5">포스터라이징</option>
									</select>
									<a> 0~255 입력 : <input type="text" value="0" name="parameter" ></a>
									<input type="submit" value="처리하기" >
								</div>
								</form>
							</article>

						<!-- Contact -->
							<article id="Raw_Image">
								<h2 class="major">RAW IMAGE</h2>
								<form name='fileForm' method='post' enctype='multipart/form-data' action='04-01-1_Photo_Server.jsp'>
								<input type='file' name='filename' class="submit-btn">
								<p> <select name="algo" style='displya:none'>
										<option value="">효과선택</option>
										<option value="1">반    전</option>
										<option value="2">밝    기</option>
										<option value="3">블    러</option>	
										<option value="4">엠 보 싱</option>
										<option value="5">회    전</option>
										<option value="6">좌우반전</option>
										<option value="7">상하반전</option>
										<option value="8">그 래 프</option>		
									</select>
									<a>0~255 입력 : <input type="text" value="0" name="parameter" class="text-field"></a>
									<input type="submit" value="처리하기" class="submit-btn">
								</form>

							</article>


					</div>

				<!-- Footer -->
					<footer id="footer">
						<p class="copyright"><a href="Update01.jsp">정보수정</a><a> \ </a><a href="logout.jsp">로그아웃</a>
						<p class="copyright">
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
