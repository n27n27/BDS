<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="../css/base.css">
<script src="http://code.jquery.com/jquery.js"></script>
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
		
		.pm{		
			text-align:center;
		}
		
		.pm1{
			border:solid 1px;
			padding:5px;
			display:inline-block;
		}
		
		#middle{
			width:85%;
			margin:auto;
		}		
		
		th{
			width:10%;
		}
	</style>
	<script>
		function form_check() {
			submit_ajax();
		}
		
		function submit_ajax(){
			$.ajax({
				url: "../guest/check",
				type: "post",
				dataType: "text",
				data: $("#check").serialize(),
				error:function (xhr, status, error){
					alert(error);
				},
				success: function (json){
					var results = eval(json);
					if(results[0].result=="ok")
					{
						alert(results[0].desc)	
					}
					else 
					{
						alert("전송실패")
					}
					
				}
			})
		}
		
	</script>		
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
	 	<div id='middle'>	 		
	 		<table class="table">
		<tr>
      		<th scope="row">작성자</th>
      		<td>${dto.rname }</td>
      		<th scope="row" width ="22%">조회수</th>
      		<td width="22%">${dto.rhit }</td>
      	</tr>    	
    		<tr>
      			<th scope="row" width ="10%">등록일</th>
      			<td>${dto.rdate}</td>
      			
      			<th scope="row" width ="10%">첨부파일</th>
      			<td>
      			<c:choose>
					<c:when test = "${dto.rfroot != null }">
						<a href="../guest/download?filename=${dto.rfroot}"><img width=20px src="../img/file.png"></a>							
					</c:when>
					<c:otherwise>							
					</c:otherwise>
				</c:choose>
				</td>      			
      		</tr>	    	
    		<tr>
    			<th scope="row" width ="50%" colspan="1">제목</th>
      			<td class="left" width ="50%" colspan="3">${dto.rtitle}</td>     
    		</tr>
    		<tr>
    			<th scope="row" colspan="4">내용</th>      			     
    		</tr>
    		<tr>
    			<td colspan="4" height = 300>
    			${dto.rcontent}    			  				
    			</td>      			     
    		</tr>   		
    	</table>
    	
    	<div class="pm">
    	<form id="check" class="pm1" onsubmit="form_check();">
    		<input type="hidden" name="rnum" value="${dto.rnum }"/>
    		진행상황
    		&nbsp;
    		<input type="radio" name=process value=1> 미확인
    		<input type="radio" name=process value=2 checked> 확인
    		<input type="radio" name=process value=3> 처리중
    		<input type="radio" name=process value=4> 완료
    		<input type="submit" value="전송" class="btn btn-dark">
    		&nbsp;&nbsp;    		    		    		    		
    	</form>    		
    		<input type="button" value="관리자메인" onClick="location.href='./manager'"class="btn btn-dark">
    		<input type="button" value="목록" onClick="location.href='./nList?page=<%= session.getAttribute("cpage")%>'"class="btn btn-dark">
    		<input type="button" value="답변" onClick="location.href='./replyView?rnum=${dto.rnum}'"class="btn btn-dark">
    		<input type="button" value="삭제" onClick="location.href='../guest/delete?rnum=${dto.rnum}'"class="btn btn-dark">
    	</div>
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