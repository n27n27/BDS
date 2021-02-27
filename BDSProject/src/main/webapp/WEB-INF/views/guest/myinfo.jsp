<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="../css/bootstrap.min.css" rel="stylesheet">
     <script src="http://code.jquery.com/jquery.js"></script>
    <link href="../css/base.css" rel="stylesheet">
	<title>BDS</title>
	<style>			
		html, body {
      		position: relative;
      		height: 100%;
    	}
				
		#wrap{
			width:90%;
		}
		
		#header{
			font-size:1.5em;
			margin: 10px auto;
			padding: 10px auto;
		}
				
		.write27 {
			text-shadow:5px 8px 10px black;
			float:right;
		}
				
		.wrap27 {			
			width:90%;
			margin: 0 auto;
		}		
					 
		#write27 {
			float:left;			
		}				
		
		#wrap {
			width:90%;
			margin: 0 auto;
		}		
		
		.menu1{
			display:inline-block;
			margin: 0 10px;			
		}
	
		#footer{
			text-align:center;		
		}
				
		#middle{
			width:90%;
			margin:auto;
			text-align:center;
		}
		
		a{
		text-decoration:none;
		color:black;
		}
		
		table a{
		text-decoration:none;
		color:black;
		}
	</style>		
</head>
<body>
	<div id=wrap>
		<div id=header>
			<div id="write27" ><a href='./main'><img src='../img/home.png' width=20px>BDS</a></div>
			<div class="write27">
				<div class=menu1><a href="../guest/firstPage">Intro</a></div>
				<c:set var="auth" value="<%= (String)session.getAttribute(\"usrauth\") %>" />
				<c:set var="id" value="<%= (String)session.getAttribute(\"usrid\") %>" />
				<c:choose>
					<c:when test = "${auth == null }">
						<div class=menu1><a href='../security/clogin'>Login</a></div>							
					</c:when>
					<c:otherwise>
					<div class=menu1>
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
					</div>						
					</c:otherwise>
				</c:choose>		
				<div class=menu1><a href="./rBoard">문의</a></div>
				<div class=menu1><a href="./sList">샘플</a></div>
			</div>
	 	</div><br><br>
	 	<hr>
	 	<div id="middle">
	 	<br><br>
	 		<table class="table table-bordered">
	 			<thead class="thead-dark">
	 			<tr>
	 				<th scope="col" width="45%">나의 요청</th>
	 				<th scope="col" width="45%">개인정보 관리</th>
	 			</tr>
	 			</thead>
	 			<tbody>
	 				<tr>
	 					<td>미처리건수 : ${rpro1 + rpro2 + rpro3} / 처리완료 : ${rpro4}</td>
	 					<td><a href="./myinfoModify?usrid=${id}">내 정보 수정</a></td>
	 				</tr>
	 				<tr>
	 					<td>
	 						<a href="">[확인전]:${rpro1}</a> /
	 						<a href="">[확인]:${rpro2}</a> /
	 						<a href="">[처리중]:${rpro3}</a>
	 					</td>
	 					<td></td>
	 				</tr>
	 				<tr>
	 					<td></td>
	 					<td></td>
	 				</tr>
	 				</tbody>
	 			</table>
	 		
	 	</div>
	 	<br><br>
	 	<hr>
	 	<div id="footer">
	 		<address><a href="http://kko.to/Ht8jvZKYH">03189 서울 종로구 삼일대로17길 51</a>
				 &emsp; TEL : 02-2222-2222
				 &emsp; h.p : 010-5503-2731
			</address>
			<cite>&copy; since 2021 BDS Co. All Rights Reserved.</cite>
		</div>
	</div>
</body>
</html>