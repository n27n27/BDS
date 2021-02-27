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
	 		<br>
	 		<h2>회원리스트</h2>
	 		<br>
	 	 	<table class="table table-bordered">
	 	 		<thead>
	 	 		<tr>
	 	 			<th scope="col"></th>
	 	 			<th scope="col">ID</th>
	 	 			<th scope="col">이름</th>
	 	 			<th scope="col">전화번호</th>
	 	 			<th scope="col">주소</th>
	 	 			<th scope="col">e-mail</th>
	 	 		</tr>
	 	 		</thead>
	 	 		<tbody>
	 	 		<c:forEach items="${users }" var = "dto">
	 	 		<tr>
	 	 			<th scope="row">${dto.usrnum }</th>
	 	 			<td>${dto.usrid }</td>
	 	 			<td>${dto.usrname }</td>
	 	 			<td>${dto.usrpnum }</td>
	 	 			<td>${dto.usraddr }</td>
	 	 			<td>${dto.usremail}</td>
	 	 		</tr>
	 	 		</c:forEach>
	 	 		<tr id="set">
					<td colspan="6">
						<c:choose>
							<c:when test="${(page.curPage - 1) < 1 }">
								<span class="badge badge-info">&lt;&lt;</span>
							</c:when>
							<c:otherwise>
								<a href="./userList?page=1"><span class="badge badge-info">&lt;&lt;</span></a>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${(page.curPage - 1) < 1 }">
								<span class="badge badge-info">&lt;</span>
							</c:when>
							<c:otherwise>
								<a href="./userList?page=${page.curPage - 1}"><span class="badge badge-info">&lt;</span></a>
							</c:otherwise>
						</c:choose>
						
						<c:forEach var="each" begin="${page.startPage }" end="${page.endPage }" step="1">
							<c:choose>
								<c:when test="${page.curPage == each }">
									<span class="badge badge-info">${each}</span>
								</c:when>
								<c:otherwise>
									<a href="./userList?page=${each}"><span class="badge badge-info">${each}</span></a> 
								</c:otherwise>
							</c:choose>							
						</c:forEach>
						<c:choose>
							<c:when test="${(page.curPage + 1) > page.totalPage}">
								<span class="badge badge-info">&gt;</span>
							</c:when>
							<c:otherwise>
								<a href="./userList?page=${page.curPage + 1 }"><span class="badge badge-info">&gt;</span></a>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${page.curPage == page.totalPage}">
								<span class="badge badge-info">&gt;&gt;</span>
							</c:when>
							<c:otherwise>
								<a href="./userList?page=${page.totalPage}"><span class="badge badge-info">&gt;&gt;</span></a>
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
				</tbody>
			</table>
			<br>
			<div class="write28">				
				<button type="button" onclick="location.href = './manager';" class="btn btn-dark">돌아가기</button>
			</div>
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