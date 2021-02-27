	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>BDS</title>
	<script src="https://cdn.ckeditor.com/4.16.0/standard/ckeditor.js"></script>
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
			min-width:40px;
		}
		#middle {
			width:90%;
			margin:auto;
		}
		textarea {
			rows:20;
			cols:100;
			height: 300px;
			margin: auto;
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
						<c:redirect url="../security/clogin"/>							
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
	 		
			<form action="../admin/sModifyOk" method="post"><!--  oninput='sContent.setCustomValidity(sContent.value != upw.value ? "비밀번호가 일치하지 않습니다" : "")'-->
				<input type="hidden" name="usrid" value=<sec:authentication property="name"/>>
				<input type="hidden" name="snum" value="${dto.snum }">
				<table>
					<tr>
						<td> 제목 </td>
						<td><input type="text" name="stitle" size="50" value="${dto.stitle }" required></td>
					</tr>
					<tr>
						<td> 내용 </td>
						<td></td>
					</tr>
					<tr>
						<td colspan="2"> 
							<textarea id="scontent" name="scontent" >${dto.scontent }</textarea>
	                        <script>
							 var ckeditor_config = {
							   height : 500,
							   resize_enabled : false,
							   enterMode : CKEDITOR.ENTER_BR,
							   shiftEnterMode : CKEDITOR.ENTER_P
							 };
							 
							 CKEDITOR.replace("scontent", ckeditor_config);
							 $("form").submit( function(e) {
	            				 var totalcontentlength = CKEDITOR.instances['sContent'].getData().replace(/<[^>]*>/gi, '').length;
	            				 if( !totalcontentlength ) {
	                				alert('내용을 입력해주세요');
	                				e.preventDefault();
	            				 }
        					 });
							</script>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type='submit' class="btn btn-dark" value="수정"> &nbsp;&nbsp;
							<button class="btn btn-dark" onclick="location.href='../guest/sList'">목록으로</button>
						</td>
					</tr>
				</table>
			</form>
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