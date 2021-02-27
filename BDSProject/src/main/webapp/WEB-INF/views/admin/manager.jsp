<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<link rel="stylesheet" href="../css/base.css">
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
			<div id="write27" ><a href='../guest/main'><img src='../img/home.png' width=20px>BDS</a></div>
			<div class="write27">
				<div class=menu1><a href="../guest/first">Intro</a></div>
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
								<a class="uname" href="./manager">[관리자]님</a>	
								<div class="hide">
									<a href="../guest/myinfo">내 정보</a>
									<a href="../logout">로그아웃</a>
								</div>
							</div>	
							</c:when>
							<c:otherwise>
								<div class="menu1 dropdown">
									<a class="uname" href="../guest/myinfo">[${id }]님</a>
										<div class="hide">
											<a href="../guest/myinfo">내 정보</a>
											<a href="../logout">로그아웃</a>
										</div>
									</div>
							</c:otherwise>
						</c:choose>						
					</div>						
					</c:otherwise>
				</c:choose>		
				<div class=menu1><a href="../guest/rBoard">문의</a></div>
				<div class=menu1><a href="../guest/sList">샘플</a></div>
			</div>
	 	</div><br><br>
	 	<hr>
	 	<div id="middle">
	 	<br><br>
	 		<table class="table table-bordered">
	 			<thead class="thead-dark">
	 			<tr>
	 				<th scope="col" width="30%">문의관리</th>
	 				<th scope="col" width="30%">회원관리</th>
	 				<th scope="col" width="30%">게시판관리</th>
	 			</tr>
	 			</thead>
	 			<tbody>
	 				<tr>
	 					<td>미처리건수 : <%=session.getAttribute("rCount") %></td>
	 					<td><a href="./userList">전체회원 조회</a></td>
	 					<td><a href="./nWriteView">공지글쓰기</a></td>
	 				</tr>
	 				<tr>
	 					<td><a href="./nList">미처리리스트</a></td>
	 					<td><a href="#">개별 회원 조회</a></td>
	 					<td><a href="./nList1">공지리스트</a></td>
	 				</tr>
	 				<tr>
	 					<td></td>
	 					<td><a href="#">회원 강제 탈퇴</a></td>
	 					<td><a href="#">게시글 삭제</a></td>
	 				</tr>
	 				<tr>
	 					<td></td>
	 					<td><a href="#">회원 로그인 정지</a></td>
	 					<td></td>
	 				</tr>
	 				</tbody>
	 			</table>
	 		<!--  <ul>
	 			<li></li>
	 			<li>미처리문의개수 : <%=session.getAttribute("rCount") %></li>
	 			<li><a href="./nList">미처리리스트</a></li>
	 			<li></li>
	 			<li></li>
	 			<li><a href="#">회원 검색</a></li>
	 			<li></li>
	 			<li></li>
	 			<li></li>	 				 			
	 		</ul>
	 		(기간 정해) 게시글 가장 많이 올린 사람
			(기간 정해) 댓글 가장 많이 단 사람
			-->	 		
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