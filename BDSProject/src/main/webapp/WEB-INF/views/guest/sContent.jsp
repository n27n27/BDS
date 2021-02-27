<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
 	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <script src="http://code.jquery.com/jquery.js"></script>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/base.css" rel="stylesheet">
	<title>BDS</title>	
	<style>
		th{	width:2%;}
	</style>
</head>
<body>
	<c:set var="id" value="<%= (String)session.getAttribute(\"usrid\") %>" />
	<c:set var="auth" value="<%= (String)session.getAttribute(\"usrauth\") %>" />
	<div id=wrap>
		<div id=header>
			<div id="write27" ><a href='./main'><img src='../img/home.png' width=20px>BDS</a></div>
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
	 	<div id='middle'>
			<table class="table">
				<tr>
					<th scope="row"> 제목 </th>
					<td width="20%"> ${dto.stitle}</td>
					
				</tr>
				<tr>
					<th scope="row">조회수</th>
      				<td width="20%">${dto.shit }</td>
				</tr>
				<tr>	
					<td colspan="2"> 
						${dto.scontent}
					</td>
				</tr>
			</table>
		</div>
		<div>
			<input type="button" value="목록" onClick="location.href='./sList'" class="btn btn-dark">
    		<c:if test="${auth eq 'ROLE_ADMIN' }">
    			<input type="button" value="수정" onClick="location.href='../admin/sModify?snum=${dto.snum}'"class="btn btn-dark">
    			<input type="button" value="삭제" onClick="location.href='../admin/sdelete?snum=${dto.snum}'"class="btn btn-dark">
    		</c:if>	
				
    	</div>	
	 	
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