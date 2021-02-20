<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>BDS</title>
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
<link rel="stylesheet" href="./css/base.css">
	<style>	
		    	
    	.swiper-container {    		
    		width: 100%;
      		height: 500px;
      		
    	}
    	
    	.swiper-slide {
    		overflow:hidden;
    			
    		font-size: 18px;
    		background: #fff;
    		/* Center slide text vertically */
    		display: -webkit-box;
    		display: -ms-flexbox;
    		display: -webkit-flex;
    		display: flex;
    		-webkit-box-pack: center;
    		-ms-flex-pack: center;
    		-webkit-justify-content: center;
    		justify-content: center;
    		-webkit-box-align: center;
    		-ms-flex-align: center;
    		-webkit-align-items: center;
    		align-items: center;
    	}
    	
		div ul li{			
			font-size:1.0em;
			font-align:left;							
		}
	</style>	
</head>
<body>
	<div id=wrap>
		<div id=header>
			<div id="write27" ><a href='main'><img src='./img/home.png' width=20px>BDS</a></div>
			<div class="write27">
				<div class=menu1><a href="./first">Intro</a></div>
				<c:set var="hid" value="<%= (String)session.getAttribute(\"id\") %>" />
				<c:choose>
					<c:when test = "${hid == null }">
						<div class=menu1><a href=''>Login</a></div>							
					</c:when>
					<c:otherwise>
						<div class=menu1>${hid} 님</div>
						<div class=menu1><a href="">LogOut</a></div>
					</c:otherwise>
				</c:choose>		
				<div class=menu1><a href="./rBoard">문의</a></div>
				<div class=menu1><a href="">샘플</a></div>
			</div>
	 	</div><br><br>
	 	<hr>
	 	<div class="swiper-container">
    		<div class="swiper-wrapper">
      			<div class="swiper-slide"><img src="./img/Rplot.png" />
	      			<ul>
	      				<li>R</li>
	      				<li>구글맵 산점도</li>
	      				<li>국립공원 표시</li>
	      			</ul>
	      		</div>
      			<div class="swiper-slide">
      				<img src="./img/Rplot01.png" />
      				<ul>
	      				<li>R</li>
	      				<li>데이터 출처: 한국복지패널데이터</li>
	      				<li>연령대별, 성별간 남여급여</li>	      				
	      				<li>2015년 자료</li>
	      			</ul>
	      		</div>
	      		<div class="swiper-slide">
      				<img src="./img/python1.png" width=450px;/>
      				<ul>
	      				<li>python</li>
	      				<li>wordcloud</li>	      				
	      				<li>2021년 문재인 대통령 신년사</li>
	      			</ul>
	      		</div>
	      		<div class="swiper-slide">
      				<img src="./img/python2.png" width=450px;/>
      				<ul>
	      				<li>python</li>
	      				<li>selenium - 웹 크롤링</li>	      				
	      				<li>2019년 KBO 구장별 관객수</li>
	      			</ul>
	      		</div>
	      		<div class="swiper-slide">
      				<img src="./img/hadoop.png" width=700px; />
      				<ul>
	      				<li>Hadoop</li>
	      				<li>대용량데이터</li>	      				
	      				<li>분산시스템 구축</li>
	      				<li>Big Data 처리</li>	      				
	      			</ul>
	      		</div>      			
    		</div>
    		<!-- Add Pagination -->
     		<br>
    		<div class="swiper-pagination"></div>
  		</div>
  		<!-- Swiper JS -->
  		<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
  		<!-- Initialize Swiper -->
  		<script>
  			var swiper = new Swiper('.swiper-container', {
  				pagination: {
  					el: '.swiper-pagination',
  					},
  				});
  		</script>
	 	<hr>
	 	<div id="footer">
	 		<address>03189 서울 종로구 삼일대로17길 51
				 &emsp; TEL : 02-2222-2222
				 &emsp; h.p : 010-5503-2731
			</address>
			<cite>&copy; since 2021 BDS Co. All Rights Reserved.</cite>
		</div>
	</div>
</body>
</html>