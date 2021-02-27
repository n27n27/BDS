<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Insert title here</title>
	<script src="http://code.jquery.com/jquery.js"></script>
	<script src="./js/jquery-ui.min.js"></script>
	<link rel="canonical" href="https://superkts.com/jquery/@easingEffects" />
	<style>
		
		#wrap{
			width:90%;
			position:absolute;			
		}
		
		#first{
			width:100%;
			font-size:2.0em;
			position:absolute;			
			height:200px;	
		}
		
		#second{
			position:relative;
			top: 230px;
			width:100%;
			height:200px;
			font-size:1.5em;
		}
		
		#third{
			position:relative;
			top:180px;
			width:100%;
			font-size:1.5em;
		}
		
		#fourth{
			position:relative;
			top:180px;
			margin:auto;
			
		}
		#fifth{
			position:relative;
			top:200px;
			left:17%;			
			
		}
		
		
		ul{
			list-style:none;
			
		}		
		
		p{
			display:none;
		}
		.history1, .history2, .history3, .history4{			
			margin: 10px;
			border: 3px solid black;
			border-radius:10px;
			float:left;
			width:18%;
			text-align:center;
			height:200px;
			position:relative;
			display:none;
			
		}
		table{
			display:inline-block;
		}
		
		ul > li{
			text-align:left;
			margin:5px;
		}
		
		.css_test_51_btn span { 
		border:2px solid silver;
		cursor:pointer;
		display:inline-block;
		font-size:9pt;
		margin:2px 0;
		padding:0 4px;
		border-radius:5px;
		}		
		
		a, a:link, a:visited, a:hover{
		text-decoration:none;
		color:black;
		}	
	</style>
	<script>	
	
	$(document).ready(function(){
		$('.move').each(function(index){
			$(this).delay(index * 500).animate({
				left:'32%'					
			}, "slow")
		});
		
		$(".toggle").click(function () {
			$(this).nextAll().toggle("slow");
			
		});	
		
	})
		function j_test_51_drop1(v){
			$('.history1').stop().toggle(1000, v);
		}
	
		function j_test_51_drop2(v){
			$('.history2').stop().toggle(1000, v);
		}
		
		function j_test_51_drop3(v){
			$('.history3').stop().toggle(1000, v);
		}
		
		function j_test_51_drop4(v){
			$('.history4').stop().toggle(1000, v);
		}
		
	</script>
	</head>
<body>
	<div id=wrap>		
		<div id=first  class=move>	
			<h1 id=move class="toggle"><a href='./guest/first'>BDS</a> TEAM PROJECT</h1>
			<p> by 김준혁, 윤민구 </p>
		</div>
		<div id=second class=move>	
			<h1 class="toggle">1. Concept</h1>			
			<p>- 수업시간에 배운 모든 것을 활용<br>
			- 데이터 분석을 의뢰받아 처리해주는 홈페이지 제작<br>
			</p>
		</div>		
		<div id=third class=move>			
			<h1 class="toggle">2. Project History</h1>			
				<p><span onclick="j_test_51_drop1('linear')">⊙ 웹구현 언어 및 기술&nbsp;</span>
				   <span onclick="j_test_51_drop2('easeInOutCirc')">⊙ 사용한 DB - Oracle&nbsp;</span>
				   <span onclick="j_test_51_drop3('easeOutElastic')">⊙ 서버구축&nbsp;</span>
				   <span onclick="j_test_51_drop4('easeInOutBounce')">⊙ 데이터분석&nbsp;</span></p>			
		</div>		  
		<div id="fifth">
			<div class="history1">
				<h3>웹구현 언어 및 기술</h3>
				<ul>
					<li>- JAVA </li>
					<li>- SpringBoot</li>
					<li>- HTML5 & CSS3</li>
					<li>- Javascript & jQuery</li>
				</ul>
			</div>
			<div class="history2">
				<h3>사용한 DB - Oracle</h3>
				<ul>					
					<li>- 회원테이블</li>
					<li>- 문의테이블</li>
					<li>- 샘플테이블</li>
					<li>- 공지테이블</li>
				</ul>				
			</div>
			<div class="history3">
				<h3>서버구축</h3>
				<ul>
					<li>- AWS </li>
					<li>- Linux에 WAR 배포 </li>					
				</ul>
			</div>
			<div class="history4">
				<h3>데이터분석</h3>
				<ul>
					<li>- python(pandas, seaborn)</li>
					<li>- R</li>
					<li>- hadoop</li>
					<li>- spark</li>					
				</ul>
			</div>
		</div>
				
			
	</div>
	
</body>
</html>