<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.io.*" %>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="javax.imageio.*"%>
<%@ page import="java.awt.image.*"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
</head>
<body>
			<div id="wrapper">

				<!-- Header -->
					<header id="header">
						<div class="logo">
							<a href="04-01-1_Photo_Client.jsp"><span class="icon fa-diamond"></span></a>
					</header>
    
						<div class="content">
							<h2 class="major"></h2>
<%
	MultipartRequest multi = new MultipartRequest(request, "c:\\upload", 
			5*1024*1024, "utf-8", new DefaultFileRenamePolicy());
	
	String tmp;
	Enumeration params = multi.getParameterNames();
	tmp = (String) params.nextElement();
	String algo = multi.getParameter(tmp);
	tmp = (String) params.nextElement();
	String parameter = multi.getParameter(tmp);

	Enumeration files = multi.getFileNames();
	tmp = (String) files.nextElement();
	String filename = multi.getFilesystemName(tmp);
	
			
	int inW, inH,outW=0, outH=0;
	
	File inFp;
	FileInputStream inFs;
	inFp = new File("C:/Upload/" + filename);
	
	// 칼라 이미지 처리
	BufferedImage cImage = ImageIO.read(inFp);
	inW = cImage.getHeight();
	inH = cImage.getWidth();
	// (2) JSP에서 배열 처리
	int[][][]  inImage = new int[3][inH][inW]; // 메모리 할당
	// 파일 --> 메모리
	for (int i=0; i<inH; i++) {
		for (int k=0; k<inW; k++) {
			int rgb = cImage.getRGB(i,k);
			inImage[0][i][k] = (rgb >> 16) & 0xFF; // Red
			inImage[1][i][k] = (rgb >> 8) & 0xFF; // Green
			inImage[2][i][k] = (rgb ) & 0xFF; // Blue
		}
	}

	
	
	int[][][] outImage = null;
	int R, G, B;
	int RGB;
	switch (algo) {
	case "1" :   // 반전하기
		// 반전 알고리즘 :  out = 255 - in
		// (중요!) 출력영상의 크기 결정 --> 알고리즘에 의존
		outH = inH;
		outW = inW;
		// 메모리 할당
		outImage = new int[3][outH][outW];
		// 진짜 영상처리 알고리즘
		for (int rgb=0; rgb<3; rgb++)
			for(int i=0; i<inH; i++)
				for (int k=0; k<inW; k++) {
					outImage[rgb][i][k] = 255 - inImage[rgb][i][k];
				}
		break;
	case "2" :   // 밝게하기
		// 더하기 알고리즘 :  out = in + 값  (주의!오버플로)
		// (중요!) 출력영상의 크기 결정 --> 알고리즘에 의존
		outH = inH;
		outW = inW;
		// 메모리 할당
		outImage = new int[3][outH][outW];
		// 진짜 영상처리 알고리즘
		for (int rgb=0; rgb<3; rgb++)
			for(int i=0; i<inH; i++)
				for (int k=0; k<inW; k++) {
					int value = inImage[rgb][i][k] + Integer.parseInt(parameter);
					if (value > 255)
						 value = 255;
					if (value < 0)
						value = 0;
					outImage[rgb][i][k] = value;				
				}
		break;
	case "3" : //그레이스케일
		// 더하기 알고리즘 :  out = in + 값  (주의!오버플로)
		// (중요!) 출력영상의 크기 결정 --> 알고리즘에 의존
		outH = inH;
		outW = inW;
		// 메모리 할당
		outImage = new int[3][outH][outW];
		// 진짜 영상처리 알고리즘
		//RGB값 초기화
		R=0;
		G=0;
		B=0;
		RGB=0;
		for (int i=0; i<inH; i++){
			for (int k=0; k<inW; k++){
				R = inImage[0][i][k];
				G = inImage[1][i][k];
				B = inImage[2][i][k];
				
				RGB = (R+G+B)/3;
				
				outImage[0][i][k] = RGB;
				outImage[1][i][k] = RGB;
				outImage[2][i][k] = RGB;				
			}
		}
		break;
	case "4" : //흑백
		// 더하기 알고리즘 :  out = in + 값  (주의!오버플로)
		// (중요!) 출력영상의 크기 결정 --> 알고리즘에 의존
		outH = inH;
		outW = inW;
		R=0;
		G=0;
		B=0;
		// 메모리 할당
		outImage = new int[3][outH][outW];
		// 진짜 영상처리 알고리즘
		//RGB값 초기화
		
		RGB=0;
		int value=Integer.parseInt(parameter);
		for (int i=0; i<inH; i++){
			for (int k=0; k<inW; k++){
				R = inImage[0][i][k];
				G = inImage[1][i][k];
				B = inImage[2][i][k];
				
				RGB = (R+G+B)/3;
				if (RGB > value)
					RGB = 255;
				else
					RGB = 0;
				
				outImage[0][i][k] = RGB;
				outImage[1][i][k] = RGB;
				outImage[2][i][k] = RGB;				
			}
		}
		break;
	case "5" : //포스터라이징
		// 더하기 알고리즘 :  out = in + 값  (주의!오버플로)
		// (중요!) 출력영상의 크기 결정 --> 알고리즘에 의존
		outH = inH;
		outW = inW;
		// 메모리 할당
		outImage = new int[3][outH][outW];
		// 진짜 영상처리 알고리즘
		//RGB값 초기화
		R=0;
		G=0;
		B=0;
		for (int i=0; i<inH; i++)
			for (int k=0; k<inW; k++){
				R = inImage[0][i][k];
				G = inImage[1][i][k];
				B = inImage[2][i][k];
				
                if (R >= 219) {
                    R = 255;
                    }
                else if (R >= 183){
                	R = 218;
                    } 
                else if (R >= 181){
                	R = 182;
                    }
                else if (R >= 147){
                    R = 180;
                    }
                else if (R >= 111){
                	R = 146;
                    } 
                else if (R >= 75){
                	R = 110;
                    }
                else if (R >= 39){
                	R = 76;
                    }
                else R = 0;
				if (G >= 219) {
                    G = 255;
                    }
                else if (G >= 183){
                	G = 218;
                    } 
                else if (G >= 181){
                	G = 182;
                    }
                else if (G >= 147){
                    G = 180;
                    }
                else if (G >= 111){
                	G = 146;
                    } 
                else if (G >= 75){
                	G = 110;
                    }
                else if (G >= 39){
                	G = 76;
                    }
                else R = 0;       
				if (B >= 219) {
                    B = 255;
                    }
                else if (B >= 183){
                	B = 218;
                    } 
                else if (B >= 181){
                	B = 182;
                    }
                else if (B >= 147){
                    B = 180;
                    }
                else if (B >= 111){
                	B = 146;
                    } 
                else if (B >= 75){
                	B = 110;
                    }
                else if (B >= 39){
                	B = 76;
                    }
                else B = 0;
                
				outImage[0][i][k] = R;
				outImage[1][i][k] = G;
				outImage[2][i][k] = B;				
			}
		break;
	
		
	}
	
	// (4) 결과를 파일로 쓰기
	File outFp;
	FileOutputStream outFs;
	String outFname = "out_" + filename ;
	outFp = new File("C:/Out/"+outFname);
	
	// 칼라 이미지 저장
	BufferedImage outCImage = new BufferedImage(outH, outW,
			BufferedImage.TYPE_INT_RGB);
	
	outFs = new FileOutputStream(outFp.getPath());
	// 메모리 --> 버퍼이미지
	for (int i=0; i<outH; i++) {
		for (int k=0; k<outW; k++) {
			int r = outImage[0][i][k];
			int g = outImage[1][i][k];
			int b = outImage[2][i][k];
			int px = 0;
			px = px | (r << 16);
			px = px | (g << 8);
			px = px | (b);		
			outCImage.setRGB(i,k,px);
		}
	}
	ImageIO.write(outCImage,"jpg", outFp);
	
	// out.println("c:/Out/out_" + filename + " 처리됨~");
	out.println("<h1><a href='http://localhost:8080/JSP_Project/download.jsp?file="
	       +outFname+ "'>다운로드</a></h1>");
	
	
	
%>
						</div>
		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>
</body>
</html>