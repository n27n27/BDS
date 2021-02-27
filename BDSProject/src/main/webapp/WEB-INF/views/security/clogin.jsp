<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!Doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">    
    <script src="http://code.jquery.com/jquery.js"></script>
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>            
    <link rel="stylesheet" href="../css/base.css">
    <style>
    	.login-btn{ font-weight: bold; border-radius: 3px;} 
	    .reg-btn{ font-weight: bold; border-radius: 3px; }	    	    
	    .input { border-radius: 3px;}
	  	#container{
	  		width:85%;
	  		text-align:center;
	  		margin:auto;
	  		overflow:hidden;
	  	} 
	  	.normalLogin{
	  		border-right:1px solid black;
	  		padding:5px;	  		
	  		width:45%;
	  		float:left;
	  	} 
	  	.snsLogin{
	  		padding:5px;	  		
	  		width:45%;
	  		float:left;
	  	}
	  	
	  	ul{
	  		list-style:none;
	  		padding:0px;
	  		margin:3px;
	  	}
	  	
	  	ul > li {
	  		display:block;
	  		margin:0px auto;
	  		padding:0px;
	  		text-align:center;
	  	}	  	
    </style>
    <title>로그인</title>
	
</head>
 <body>
 	<div id=wrap>
 		<div id=header>
 			<div id="write27" ><a href='../guest/main'><img src='../img/home.png' width=20px>BDS</a></div>								
			<div class="write27">
				<div class=menu1><a href="../guest/first">Intro</a></div>
					<!-- <sec:authorize access="isAuthenticated()">
						<c:redirect url="../guest/main"/>
					</sec:authorize>-->
				<div class=menu1><a href="../guest/rBoard">문의</a></div>
				<div class=menu1><a href="../guest/sList">샘플</a></div>
			</div>
	 	</div><br><br>
	 	<hr>
 		<br><br>
 		<div id="container">
 			<c:url var="loginUrl" value="../security/j_spring_security_check" />
 			<div class="normalLogin">
 				<form action="${loginUrl}" id="login_form" method="POST">
 					<h2>로그인</h2><br/>
			      	<label for="usrid">ID:</label>&nbsp;&nbsp;
			      	<input type="text" class="input" name="usrid" size=15 maxlength=12 placeholder="아이디" required autofocus><br/>
			      	<label for="usrpw">PW:</label>
			      	<input type="password" class="input" name="usrpw" size=15 maxlength=15 placeholder="비밀번호" required autofocus><br/><br/>
			      	<br>
			      	<div id="buttons">
			      		<input type="submit" id="login-btn" class="login-btn" value="로그인">
			      		<button type="button" id="reg-btn" class="reg-btn" onclick="location.href='../guest/register'">회원가입</button>
			      	</div>
			     </form>
		      </div>
		      
		      <div class="snsLogin">
		      	 <h2>sns 로그인</h2>
	      	 	 <ul>
	      	 	 	<li>
	      				<a id="custom-login-btn" href="javascript:loginWithKakao()">
	      					<img src="//mud-kage.kakao.com/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg" width="300" height="50"/>
  						</a>
  					</li>   							      	
	      			<li>
	      				<a id="naverIdLogin_loginButton" href="#" role="button">
	      					<img src="https://static.nid.naver.com/oauth/big_g.PNG" width="300" height="50">
	      				</a>
	      			</li>
	 	     	</ul>
		      </div>
		</div>
		<br/>
		<br>
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
