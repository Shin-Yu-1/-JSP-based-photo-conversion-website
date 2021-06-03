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
	// (2) JSP���� �迭 ó��
	int[][]  inImage = new int[inH][inW]; // �޸� �Ҵ�
	// ���� --> �޸�
	for (int i=0; i<inH; i++) {
		for (int k=0; k<inW; k++) {
			inImage[i][k] = inFs.read();
		}
	}
	inFs.close();
	
	int[][] outImage = null;
	switch (algo) {
	case "1" :   // �����ϱ�
		// ���� �˰��� :  out = 255 - in
		// (�߿�!) ��¿����� ũ�� ���� --> �˰��� ����
		outH = inH;
		outW = inW;
		// �޸� �Ҵ�
		outImage = new int[outH][outW];
		// ��¥ ����ó�� �˰���
		for(int i=0; i<inH; i++)
			for (int k=0; k<inW; k++) {
				outImage[i][k] = 255 - inImage[i][k];
			}
		break;
	case "2" :   // ����ϱ�
		// ���ϱ� �˰��� :  out = in + ��  (����!�����÷�)
		// (�߿�!) ��¿����� ũ�� ���� --> �˰��� ����
		outH = inH;
		outW = inW;
		// �޸� �Ҵ�
		outImage = new int[outH][outW];
		// ��¥ ����ó�� �˰���
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
	case "3" :	// ��ó��
		outH = inH;
		outW = inW;

		// (3) �˰��� �����ϱ�
		// (�߿�!) ��� ������ ũ�� ���� --> �˰��� ����
		//�޸� �Ҵ�
		outImage = new int[outH][outW];

		// mask
		double[][] mask = {{1.0/9.0,1.0/9.0,1.0/9.0},{1.0/9.0,1.0/9.0,1.0/9.0},{1.0/9.0,1.0/9.0,1.0/9.0}};

		// �ӽ� �Է� �迭 
		int tempInput[][] = new int[inH+2][inW+2];

		// �ӽ� �Է� �迭 �ʱ�ȭ
		for(int i=0; i<inH+2; i++){
			for(int k=0; k<inW+2; k++){
				tempInput[i][k] = 127;
				}
			}
		// �Է� �迭 --> �ӽ� �Է�
		for(int i=0; i<inH; i++){
			for(int k=0; k<inW; k++){
				tempInput[i+1][k+1] = inImage[i][k];
	}
		}
		//ȸ�� ���� �˰���
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
	case "4" :	//������
		outH = inH;
		outW = inW;

		// (3) �˰��� �����ϱ�
		// (�߿�!) ��� ������ ũ�� ���� --> �˰��� ����
		//�޸� �Ҵ�
		
		for(int i=0; i<outH; i++)
			outImage = new int[outH][outW];
		// mask
		double[][] mask2 = {{-1.0, 0.0, 0.0},
							{0.0, 0.0, 0.0},
							{0.0, 0.0, 1.0}};

		// �ӽ� �Է� �迭 
		int temp[][] = new int[inH+2][inW+2];

		// �ӽ� �Է� �迭 �ʱ�ȭ
		for(int i=0; i<inH+2; i++){
			for(int k=0; k<inW+2; k++){
				temp[i][k] += 127;
				}
			}
		// �Է� �迭 --> �ӽ� �Է�
		for(int i=0; i<inH; i++){
			for(int k=0; k<inW; k++){
				temp[i+1][k+1] = inImage[i][k];
				}
		}
		//ȸ�� ���� �˰���
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
	case "5" :	//ȸ�� �����
        int degree = Integer.parseInt(parameter);;
        double radian = degree*Math.PI/180.0;
		double value = Math.sin(radian) + Math.cos(radian);
	    //outW = (int)(inH*value);
	    //outH = (int)(inH*value);
	    outW = inW;
	    outH = inH;
	    outImage = new int[outH][outW];
        // ***** ��¥ ����ó�� �˰��� ****
        radian = -radian;
		
        // ����
        // xd = cos * xs - sin * ys;
        // yd = sin * xs + cos * ys;
        int xd, yd, xs, ys;

        //�߾Ӱ� ���ϱ�
        int cx = inH / 2;
        int cy = inW / 2;
        
        for(int i=0; i<outH; i++) {
            for (int k=0; k<outW; k++) {
                xs = i;
                ys = k;
                xd = (int)(Math.cos(radian)*(xs-cy) - Math.sin(radian)*(ys-cy) + cx);
                yd = (int)(Math.sin(radian)*(xs-cy) + Math.cos(radian)*(ys-cy) + cx);
                
                // ȸ�� ������ ��ġ�� ��¿����� ���� �ȿ� �ִ�?
                if ((0<=xd && xd<inH ) && (0<=yd && yd<inW)){
                    outImage[xs][ys] = inImage[xd][yd];
                    }
                else{
                	outImage[xs][ys] = 255;
                }
                }
        }
		break;
	case "6" :	// �¿����
		outH = inH;
		outW = inW;
		
		//�޸� �Ҵ�
		outImage = new int[outH][outW];
		
		for (int i=0; i<inH; i++){
			for(int k=0; k<inW; k++){
				outImage[i][k] = inImage[i][inW-1-k];
				}
			}
		break;
	case "7" :	// ���Ϲ���
		outH = inH;
		outW = inW;
		
		//�޸� �Ҵ�
		outImage = new int[outH][outW];
		
		for (int i=0; i<inH; i++){
			for(int k=0; k<inW; k++){
				outImage[i][k] = inImage[inH-1-i][k];
				}
			}
		break;
	case "8" :	// ������׷� �׷���
		// *** ������׷� ����
		// ������׷� �迭 ����
		int[] histo = new int[256]; // ȭ�Ұ� 0 ~ 255
		
		for(int i=0; i<256; i++) // ������׷� �迭 0(����)���� �ʱ�ȭ
			histo[i] = 0;
		
		for(int i=0; i<inH; i++) {
			for(int k=0; k<inW; k++) {
				int value1 = inImage[i][k]; 
	            histo[value1]++; // inImage�迭���� ȭ�Ұ����� ���� �˾Ƴ��� histo�迭�� ����
	         }
	      }
		
		// *** ������׷� ����ȭ
		int max = 0; // �ִ밪: ���� ���� �������� ����
		int min = inW*inH; // �ּҰ�: ���� ū �������� ����
		for(int i=0; i<256; i++) {
			if(histo[i] < min)
				min = histo[i];
			if(histo[i] > max)
				max = histo[i];
			}
		int dif = max - min;
		// ������׷�(����ȭ) �迭 ����
		int[] normalHisto = new int[256];
		for(int i=0; i<256; i++)
			normalHisto[i] = (histo[i] - min)*255/dif; // ����ȭ�� ����
	      
	      // *** ������׷� �̹����� ���
	      // ��� �迭 �غ�
	      outW = 256;
	      outH = 256;
	      outImage = new int[outH][outW];
	      for (int i = 0; i < outH; i++) {
	    	  for (int k = 0; k < outW; k++) {
	    		  outImage[i][k] = 255; // ��� �迭 255(���)���� �ʱ�ȭ
	    		  }
	    	  }
	      // ������׷� ������ŭ 0(������)���� �� �ֱ�
	      for (int i = 0; i < outH; i++) {
	    	  for (int k = 0; k < normalHisto[i]; k++) {
	    		  outImage[255 - k][i] = 0;
	    		  }
	    	  }
	      break;
	      
	}
	
	// (4) ����� ���Ϸ� ����
	File outFp;
	FileOutputStream outFs;
	String outFname = "out_" + filename ;
	outFp = new File("C:/Out/"+outFname);
	outFs = new FileOutputStream(outFp.getPath());
	// �޸� --> ����
	for (int i=0; i<outH; i++) {
		for (int k=0; k<outW; k++) {
			outFs.write(outImage[i][k]);
		}
	}
	outFs.close();
	
	// out.println("c:/Out/out_" + filename + " ó����~");
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