<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="java.sql.Timestamp"%>     
<%@ page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>시작 페이지</title>
	<link href="../css/bootstrap.min.css" rel="stylesheet">
	<script src="http://code.jquery.com/jquery.js"></script>
    <link href="../css/base.css" rel="stylesheet">
    <style>
   
		table{
			border-collapse: collapse;
			text-align:left;
			width : 90%;
			margin : auto;
		}			
		
		td{
			border-bottom: 1px solid black;
			height:50px;
		}
		#exp{
			width:90%;
			
		}
		.middle{
			width:90%;
			margin:auto;
		}
		
	</style>	
  	
    
 </head>

<body>
<%
	Timestamp date = null;
	SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
	SimpleDateFormat sdf2 = new SimpleDateFormat("HH:mm");
%>
	<div id=wrap>
		<div id=header>
			<div id="write27" ><a href='./main'><img src='../img/home.png' width=20px>BDS</a></div>
			<div class="write27">
				<div class=menu1><a href='./first'>Intro</a></div>
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
	 	
	 	
		
		<div class='middle'><h2><span id="exp">[샘플 게시판]</span></h2></div>
		<br>
		<br>
		<table>
				<tr>
					<th width= 15%>번호</th>
					<th width= 50%>제목</th>
					<th width= 20%>날짜</th>
					<th width= 15%>조회수</th>
				</tr>
						
				<c:forEach items="${contents}" var="dto">
				<c:set var="date" value="${dto.sdate }" />
<%					
	date = (Timestamp)pageContext.getAttribute("date");
	Timestamp now = new Timestamp(System.currentTimeMillis());
	
	String day1 = sdf1.format(date);
	String day2 = sdf1.format(now);
	String day3 = null;

	if(day1.equals(day2))
	{
		day3 = sdf2.format(date);
	}
	else
	{
		day3 = sdf1.format(date);
	}
%>				
				<tr>
					<td>${dto.snum}</td>
					<td>
						<a href="./sContent?snum=${dto.snum}">${dto.stitle}</a></td>
					<td><%= day3 %></td>
					<td>${dto.shit}</td>
				</tr>
				</c:forEach>
				<tr>
					<td colspan="5"><button class="btn btn-dark" onclick="location.href='../admin/sWrite'">글쓰기</button></td>
				</tr>
				
				
				</table><br/>
		</div>
		
		<hr>
	 	<div id="footer">
	 		<address><a href="http://kko.to/Ht8jvZKYH">03189 서울 종로구 삼일대로17길 51</a>
				 &emsp; TEL : 02-2222-2222
				 &emsp; h.p : 010-5503-2731
			</address>
			<cite>&copy; since 2021 BDS Co. All Rights Reserved.</cite>
		</div>
		
	<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
  
</body>
</html>