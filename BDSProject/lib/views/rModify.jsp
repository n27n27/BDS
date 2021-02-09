<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="./css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="./css/base.css">
<script src="http://code.jquery.com/jquery.js"></script>
<script src="https://cdn.ckeditor.com/4.15.1/standard/ckeditor.js"></script>
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
		
		a, a:link, a:visited, a:hover{
		text-decoration:none;
		color:black;
		}
		
		.pm1{		
			text-align:center;
		}
		
				
		#middle{
			width:85%;
			margin:auto;
		}
		
	</style>		
</head>
<body>
	<div id=wrap>
		<div id=header>
			<div id="write27" ><a href='main'><img src='./img/home.png' width=20px>BDS</a></div>
			<div class="write27">
				<c:set var="hid" value="<%= (String)session.getAttribute(\"id\") %>" />
				<c:choose>
					<c:when test = "${hid == null }">
						<div class=menu1><a href=''>Login</a></div>							
					</c:when>
					<c:otherwise>
						<div class=menu1>${hid} 님</div>
						<div class=menu1><a href="">LogOut</a></div>
					</c:otherwise>
				</c:choose>		
				<div class=menu1><a href="rBoard">문의</a></div>
				<div class=menu1><a href="">샘플</a></div>
			</div>
	 	</div><br><br>
	 	<hr>
	 	<div id='middle'>
		 	<form action="./rModifyOk" method="post">
		 		<input type="hidden" name="rnum" value="${dto.rnum }">		 		
		 		<table class="table">
					<tr>
	      				<th scope="row" width ="10%">작성자</th>
	      				<td width="20%">${dto.rname }</td>
	      					      			
		      		</tr>
		      		<tr>
		      			<th scope="row" width ="10%">비밀번호</th>
		      			<td>
		      				<input type="password" id="rpwd" name="rpwd" size = "20%">
		      				&nbsp;
		      				<input type='radio' name="choice" value='1'> 공개
		      				<input type='radio' name="choice" value='0' checked> 비공개
		      			</td>	
	      			</tr>    	
	    			<tr>
	      				<th scope="row" width ="10%">등록일</th>
	      				<td>${dto.rdate}</td>
	      				<th scope="row" width ="10%">파일첨부</th>
		      			<td>
		      				<input type="file" id="rfroot" name="rfroot" class=btn >      				
		      			</td>
	      				<c:choose>
							<c:when test = "${dto.rfroot != null }">
								파일경로							
							</c:when>
							<c:otherwise>
								<td></td>	
							</c:otherwise>
						</c:choose>      			
	      			</tr>	    	
	    			<tr>
	    				<th scope="row" width ="10%">제목</th>
	      				<td width ="70%"><input type="text" name="rtitle" value="${dto.rtitle}" /></td>     
	    			</tr>
	    			<tr>
	    				<th scope="row">내용</th>      			     
	    			</tr>
	    			<tr>
	    				<td colspan="4" height = 300>
	    				<textarea name="rcontent" id="rcontent" rows="10" style="width:100%"></textarea>
	    					
		      				<script>
		                        CKEDITOR.replace('rcontent');
		                </script>	
	    				    			  				
	    				</td>      			     
	    			</tr>   
	    			
	    			
	    			
		      					
	    		</table>
	    		<div class=pm1>
	    			<input type="submit" value="수정" class="btn btn-dark">
	    			<input type="button" value="취소" onClick="location.href='/rBoard'"class="btn btn-dark">
	    		</div>
	    	</form>    	
	 	</div>
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