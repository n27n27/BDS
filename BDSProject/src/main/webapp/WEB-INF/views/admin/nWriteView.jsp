<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>BDS</title>
	<link href="../css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="../css/base.css">
	<script src="http://code.jquery.com/jquery.js"></script>
	<script src="https://cdn.ckeditor.com/4.15.1/standard/ckeditor.js"></script>
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
		
		a, a:link, a:visited, a:hover{
		text-decoration:none;
		color:black;
		}
		
		.write28 {
			float:right;
			display:block;			
		}
		
		#middle{
			width:90%;
			margin:auto;
		}
	</style>
	<script>
		function form_check(){
			
		}
	</script>		
</head>
<body>
	<div id=wrap>
		<div id=header>
			<div id="write27" >
				<a href='../guest/main'><img src='../img/home.png' width=20px>BDS</a>
			</div>
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
	 	<div id='middle'>	 	
	 		<form action="./nWrite" id="reg_frm" method="post" enctype=multipart/form-data>
	 			<input type="hidden" name="nname" value="${id }">
	 			 
				<table class="table">					
		    		<tr>
		      			<th scope="row" width ="10%">공지제목</th>
		      			<td><input type="text" id="ntitle" name="ntitle" size = "100%"></td>
		      		</tr>
		      		<tr>
		      			<th scope="row" width="10%">파일첨부</th>
		      			<td>
		      				<input type="file" id="file" name="file" class=btn>
		      			</td>
		      		</tr>	      				      	
			    	<tr>
		    			<th scope="row" width ="10%">내용</th>
		      			<td>
		      				<textarea name="ncontent" id="ncontent" rows="10" style="width:100%"></textarea>		      				
		      				<script>								
								var ckeditor_config = {		
								resize_enaleb : false,		
								enterMode : CKEDITOR.ENTER_BR,		
								shiftEnterMode : CKEDITOR.ENTER_P,		
								filebrowserUploadUrl : "${pageContext.request.contextPath}/ckUpload"		
								};		
										
								CKEDITOR.replace('ncontent', ckeditor_config);		
							</script>		
		      			</td>     
		    		</tr>
		    	</table>
    			<div class="write28">
					<input type="submit" class="btn btn-dark" value="공지글등록">
					<button type="button" onclick="location.href = './manager';" class="btn btn-dark">돌아가기</button>
				</div>	
    		</form>    		
	 	</div>
	 	<br><br><hr>
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