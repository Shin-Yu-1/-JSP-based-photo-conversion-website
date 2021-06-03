<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.io.*" %>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
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
	long fLen = inFp.length();
	inH = inW = (int)Math.sqrt(fLen);	
	inFs = new FileInputStream(inFp.getPath());
	// (2) JSP에서 배열 처리
	int[][]  inImage = new int[inH][inW]; // 메모리 할당
	// 파일 --> 메모리
	for (int i=0; i<inH; i++) {
		for (int k=0; k<inW; k++) {
			inImage[i][k] = inFs.read();
		}
	}
	inFs.close();
	
	int[][] outImage = null;
	switch (algo) {
	case "1" :   // 반전하기
		// 반전 알고리즘 :  out = 255 - in
		// (중요!) 출력영상의 크기 결정 --> 알고리즘에 의존
		outH = inH;
		outW = inW;
		// 메모리 할당
		outImage = new int[outH][outW];
		// 진짜 영상처리 알고리즘
		for(int i=0; i<inH; i++)
			for (int k=0; k<inW; k++) {
				outImage[i][k] = 255 - inImage[i][k];
			}
		break;
	case "2" :   // 밝게하기
		// 더하기 알고리즘 :  out = in + 값  (주의!오버플로)
		// (중요!) 출력영상의 크기 결정 --> 알고리즘에 의존
		outH = inH;
		outW = inW;
		// 메모리 할당
		outImage = new int[outH][outW];
		// 진짜 영상처리 알고리즘
		for(int i=0; i<inH; i++)
			for (int k=0; k<inW; k++) {
				int value = inImage[i][k] + Integer.parseInt(parameter);
				if (value > 255)
					 value = 255;
				if (value < 0)
					value = 0;
				outImage[i][k] = value;				
			}
		break;
	case "3" :	// 블러처리
		outH = inH;
		outW = inW;

		// (3) 알고리즘 적용하기
		// (중요!) 출력 영상의 크기 결정 --> 알고리즘에 의존
		//메모리 할당
		outImage = new int[outH][outW];

		// mask
		double[][] mask = {{1.0/9.0,1.0/9.0,1.0/9.0},{1.0/9.0,1.0/9.0,1.0/9.0},{1.0/9.0,1.0/9.0,1.0/9.0}};

		// 임시 입력 배열 
		int tempInput[][] = new int[inH+2][inW+2];

		// 임시 입력 배열 초기화
		for(int i=0; i<inH+2; i++){
			for(int k=0; k<inW+2; k++){
				tempInput[i][k] = 127;
				}
			}
		// 입력 배열 --> 임시 입력
		for(int i=0; i<inH; i++){
			for(int k=0; k<inW; k++){
				tempInput[i+1][k+1] = inImage[i][k];
	}
		}
		//회전 연산 알고리즘
		for(int i=0; i<inH;i++){
			for(int k=0; k<inW;k++){
				double s=0;
				for(int m=0; m<3; m++){
					for(int n=0;n<3;n++){
						s += mask[m][n] * tempInput[i+m][k+n];
						}
					}
				outImage[i][k] = (int)s;
				}
			}
		for(int i=0; i<outH; i++){
			for(int k=0; k<outH; k++){
				if(outImage[i][k] > 255){
					outImage[i][k] = 255;
				}
				if(outImage[i][k] < 0){
					outImage[i][k] = 0;
				}
			}

		}
		break;
	case "4" :	//엠보싱
		outH = inH;
		outW = inW;

		// (3) 알고리즘 적용하기
		// (중요!) 출력 영상의 크기 결정 --> 알고리즘에 의존
		//메모리 할당
		
		for(int i=0; i<outH; i++)
			outImage = new int[outH][outW];
		// mask
		double[][] mask2 = {{-1.0, 0.0, 0.0},
							{0.0, 0.0, 0.0},
							{0.0, 0.0, 1.0}};

		// 임시 입력 배열 
		int temp[][] = new int[inH+2][inW+2];

		// 임시 입력 배열 초기화
		for(int i=0; i<inH+2; i++){
			for(int k=0; k<inW+2; k++){
				temp[i][k] += 127;
				}
			}
		// 입력 배열 --> 임시 입력
		for(int i=0; i<inH; i++){
			for(int k=0; k<inW; k++){
				temp[i+1][k+1] = inImage[i][k];
				}
		}
		//회전 연산 알고리즘
		for(int i=0; i<inH;i++){
			for(int k=0; k<inW;k++){
				double s=0;
				for(int m=0; m<3; m++){
					for(int n=0;n<3;n++){
						s += mask2[m][n] * temp[i+m][k+n];
						}
					}
				outImage[i][k] = (int)s;
				}
			}

		for(int i=0; i<outH; i++){
			for(int k=0; k<outH; k++){
				if(outImage[i][k] > 255){
					outImage[i][k] = 255;
				}
				if(outImage[i][k] < 0){
					outImage[i][k] = 0;
				}
			}
		}
		break;
	case "5" :	//회전 백워딩
        int degree = Integer.parseInt(parameter);;
        double radian = degree*Math.PI/180.0;
		double value = Math.sin(radian) + Math.cos(radian);
	    //outW = (int)(inH*value);
	    //outH = (int)(inH*value);
	    outW = inW;
	    outH = inH;
	    outImage = new int[outH][outW];
        // ***** 진짜 영상처리 알고리즘 ****
        radian = -radian;
		
        // 수식
        // xd = cos * xs - sin * ys;
        // yd = sin * xs + cos * ys;
        int xd, yd, xs, ys;

        //중앙값 구하기
        int cx = inH / 2;
        int cy = inW / 2;
        
        for(int i=0; i<outH; i++) {
            for (int k=0; k<outW; k++) {
                xs = i;
                ys = k;
                xd = (int)(Math.cos(radian)*(xs-cy) - Math.sin(radian)*(ys-cy) + cx);
                yd = (int)(Math.sin(radian)*(xs-cy) + Math.cos(radian)*(ys-cy) + cx);
                
                // 회전 이후의 위치가 출력영상의 범위 안에 있니?
                if ((0<=xd && xd<inH ) && (0<=yd && yd<inW)){
                    outImage[xs][ys] = inImage[xd][yd];
                    }
                else{
                	outImage[xs][ys] = 255;
                }
                }
        }
		break;
	case "6" :	// 좌우반전
		outH = inH;
		outW = inW;
		
		//메모리 할당
		outImage = new int[outH][outW];
		
		for (int i=0; i<inH; i++){
			for(int k=0; k<inW; k++){
				outImage[i][k] = inImage[i][inW-1-k];
				}
			}
		break;
	case "7" :	// 상하반전
		outH = inH;
		outW = inW;
		
		//메모리 할당
		outImage = new int[outH][outW];
		
		for (int i=0; i<inH; i++){
			for(int k=0; k<inW; k++){
				outImage[i][k] = inImage[inH-1-i][k];
				}
			}
		break;
	case "8" :	// 히스토그램 그래프
		// *** 히스토그램 생성
		// 히스토그램 배열 생성
		int[] histo = new int[256]; // 화소값 0 ~ 255
		
		for(int i=0; i<256; i++) // 히스토그램 배열 0(개수)으로 초기화
			histo[i] = 0;
		
		for(int i=0; i<inH; i++) {
			for(int k=0; k<inW; k++) {
				int value1 = inImage[i][k]; 
	            histo[value1]++; // inImage배열에서 화소값마다 개수 알아내서 histo배열에 저장
	         }
	      }
		
		// *** 히스토그램 정규화
		int max = 0; // 최대값: 가장 작은 개수부터 시작
		int min = inW*inH; // 최소값: 가장 큰 개수부터 시작
		for(int i=0; i<256; i++) {
			if(histo[i] < min)
				min = histo[i];
			if(histo[i] > max)
				max = histo[i];
			}
		int dif = max - min;
		// 히스토그램(정규화) 배열 생성
		int[] normalHisto = new int[256];
		for(int i=0; i<256; i++)
			normalHisto[i] = (histo[i] - min)*255/dif; // 정규화식 적용
	      
	      // *** 히스토그램 이미지로 출력
	      // 출력 배열 준비
	      outW = 256;
	      outH = 256;
	      outImage = new int[outH][outW];
	      for (int i = 0; i < outH; i++) {
	    	  for (int k = 0; k < outW; k++) {
	    		  outImage[i][k] = 255; // 출력 배열 255(흰색)으로 초기화
	    		  }
	    	  }
	      // 히스토그램 개수만큼 0(검정색)으로 값 넣기
	      for (int i = 0; i < outH; i++) {
	    	  for (int k = 0; k < normalHisto[i]; k++) {
	    		  outImage[255 - k][i] = 0;
	    		  }
	    	  }
	      break;
	      
	}
	
	// (4) 결과를 파일로 쓰기
	File outFp;
	FileOutputStream outFs;
	String outFname = "out_" + filename ;
	outFp = new File("C:/Out/"+outFname);
	outFs = new FileOutputStream(outFp.getPath());
	// 메모리 --> 파일
	for (int i=0; i<outH; i++) {
		for (int k=0; k<outW; k++) {
			outFs.write(outImage[i][k]);
		}
	}
	outFs.close();
	
	// out.println("c:/Out/out_" + filename + " 처리됨~");
	out.println("<h1><a href='http://localhost:8080/JSP_Project/download.jsp?file="
	       +outFname+ "'>DOWNLOAD</a></h1>");
	
	
	
%>
						</div>
		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>
</body>
</html>