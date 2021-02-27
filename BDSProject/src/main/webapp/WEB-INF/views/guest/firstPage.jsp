<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>BDS</title>
	<style>
				.dropdown {
			position: relative;
		 	display: inline-block
		}
				
		.uname {
			padding: 16px;
		}
			
		.hide {
			display:none;
			padding: 2px 16px;
			font-size:20px;
			position: absolute;
			z-index:100;
		}
				
		.hide a {
			color:white;
			padding: 5px;
			text-decoration:none;
			display:block;
		}
				
		.dropdown:hover .hide {
			display:block;
			color:white;
			text-decoration:none;
		}	
		#content{
			text-align :center;
			font-size : 5em;
			font-weight:bold;		
		 	color: yellow;
		 	text-decoration: none;
		 	transition: 1s;
			}
		#content:hover { text-shadow: 0 0 .1em, 0 0 .3em; }
		
		#content1{
			text-align :center;
			font-size : 3em;
			font-weight:bold;
		 	color: yellow;
		 	text-decoration: none;
		 	transition: 1s;
			}
			
		#content1:hover { text-shadow: 0 0 .1em, 0 0 .3em; }
		
		body{		
			background-image : url('../img/ccc.png');
			background-repeat: no-repeat;
			background-size: cover;
			opacity: 0.8;
		}
		
		#header{
			width:95%;
			display:inline-block;
		}
		
		#left{
			width:60%;height:100px;
			padding:10px;		
		}	
		
		ul li:nth-child(1){
			font-family:"Franklin Gothic Medium", "Arial Narrow", "Arial", "sans-serif";
			font-size:2.0em;					
		}
		
		#content2{
				text-align:center;							
		}
		
		#footer{
			text-align:center;
			color:white;
		}	
		
		img{
			display:block;
			margin : auto;
		}
		
		div ul li{
			width:13%;height:60px;
			line-height:55px;
			list-style:none;
			float:right;
			border:1px solid #cccccc;
			text-align:center;
			font-size:1em;
			color:#ffffff;
			font-weight:bold;
			/* Permalink - use to edit and share this gradient: https://colorzilla.com/gradient-editor/#1e5799+0,7db9e8+100&1+0,0+100;Blue+to+Transparent */
			background: -moz-linear-gradient(top,  rgba(30,87,153,1) 0%, rgba(125,185,232,0) 100%); /* FF3.6-15 */
			background: -webkit-linear-gradient(top,  rgba(30,87,153,1) 0%,rgba(125,185,232,0) 100%); /* Chrome10-25,Safari5.1-6 */
			background: linear-gradient(to bottom,  rgba(30,87,153,1) 0%,rgba(125,185,232,0) 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
			filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#1e5799', endColorstr='#007db9e8',GradientType=0 ); /* IE6-9 */		
		}
		
		div ul li > a{
			font-size:1em;
			color:#ffffff;
		}
		#content2 > a{
			font-family:"Franklin Gothic Medium", "Arial Narrow", "Arial", "sans-serif";
			font-size:2.0em;
			color:yellow;		
			font-weight:bold;
		}
		
		a{
			text-decoration:none;
			color:white;		
		}	
	</style>
</head>
<body>
	<div id=header>
		<span id=right>
			<ul>			
				<c:set var="auth" value="<%= (String)session.getAttribute(\"usrauth\") %>" />
				<c:set var="id" value="<%= (String)session.getAttribute(\"usrid\") %>" />
				
				<li>
					<c:choose>
						<c:when test = "${id == null }">
							<a href="../security/clogin">LogIn</a>							
						</c:when>
						<c:otherwise>
						
						
						<c:choose>
							<c:when test = "${auth eq 'ROLE_ADMIN' }">
							<div class="menu1 dropdown">
								<a class="uname" href="../admin/manager">[관리자]님</a>	
								<div class="hide">
									<a href="./myinfo">내 정보</a>
									<a href="../logout">로그아웃</a>
								</div>
							</div>	
							</c:when>
							<c:otherwise>
								<div class="menu1 dropdown">
									<a class="uname" href="./myinfo">[${id }]님</a>
										<div class="hide">
											<a href="./myinfo">내 정보</a>
											<a href="../logout">로그아웃</a>
										</div>
									</div>
							</c:otherwise>
						</c:choose>
																		
						</c:otherwise>
					</c:choose>
				</li>						
				<li><a href='./rBoard'>요청게시판</a></li>
				<li><a href="./sList">샘플게시판</a></li>
				<li><a href='./main'>HOME</a></li>				
			</ul>
		</span>	 
	 </div>
	 <hr>
	 <div id =wrap>
	 	<div id =content>BDS </div><br>
	 	<div id = content1>
			 Big Data Science 세계를 이끌어갑니다
		</div><br>
		<div id =content3><img src="../img/ab.png" alt="My Image"></div><br>		
		<div id =content2><a href='./main'>You can experience Data World.</a></div>
	</div>
	<hr>
	<div id="footer">	
		<address>
			<a href="http://kko.to/Ht8jvZKYH">03189 서울 종로구 삼일대로17길 51</a>			
				 &emsp; TEL : 02-2222-2222
				 &emsp; h.p : 010-5503-2731
		</address>
		<cite>&copy; since 2021 BDS Co. All Rights Reserved.</cite>
	</div>	
</body>
</html>