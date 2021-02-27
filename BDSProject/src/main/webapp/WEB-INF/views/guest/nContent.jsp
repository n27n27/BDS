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
		
</head>
<body>
	<div id=wrap>
		<div id=header>
			<div id="write27" ><a href='./main'><img src='../img/home.png' width=20px>BDS</a></div>
			<div class="write27">
				<div class=menu1><a href="./first">Intro</a></div>
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
      		<th scope="row">작성자</th>
      		<td>관리자</td>
      		<th scope="row" width ="22%">조회수</th>
      		<td width="22%">${dto.nhit }</td>
      	</tr>    	
    		<tr>
      			<th scope="row" width ="10%">등록일</th>
      			<td>${dto.ndate}</td>
      			
      			<th scope="row" width ="10%">첨부파일</th>
      			<td>
      			<c:choose>
					<c:when test = "${dto.nfroot != null }">
						<a href="./download?filename=${dto.nfroot}"><img width=20px src="../img/file.png"></a>							
					</c:when>
					<c:otherwise>							
					</c:otherwise>
				</c:choose>
				</td>      			
      		</tr>	    	
    		<tr>
    			<th scope="row" width ="50%" colspan="1">제목</th>
      			<td class="left" width ="50%" colspan="3">${dto.ntitle}</td>     
    		</tr>
    		<tr>
    			<th scope="row" colspan="4">내용</th>      			     
    		</tr>
    		<tr>
    			<td colspan="4" height = 300>
    			${dto.ncontent}    			  				
    			</td>      			     
    		</tr>   		
    	</table>
    	<table>
    	<c:if test = "${comments != null}">
    		<c:forEach var="comment" items="${comments }">
    			<tr id="qq">
    				<td width=10%>${comment.cId }</td>
    				<td width=70%>${comment.cContent }</td>
    				
					<td width=20%>
						<div>
							<form action="cReply.fo" method="post">
								<input type="hidden" name="bNum" value="${fcontent_view.bNum }">
    							<input type="hidden" name="bId" value="${hid}"> 
								<input type="hidden" name="cGroup" value="${comment.cGroup}">
	    						<input type="hidden" name="cStep" value="${comment.cStep}">
	    						<input type="hidden" name="cIndent" value="${comment.cIndent}">
																							
								
							</form>
							<c:if test="${comment.cId == hid }">
							<input type="button"  class="btn btn-secondary btn-sm" onclick="click1();" value="답변">
							<a href="#" class="btn btn-secondary btn-sm">수정</a>
							<a href="#" class="btn btn-secondary btn-sm">삭제</a>
							</c:if>
							
						</div>
					</td>   				
    			</tr>
    			
    		</c:forEach>    		
    		<c:if test="${hid != null }">
    			<form action ="fcWrite.fo" id="fComment" method="post">
    				<tr>    				
    					<input type="hidden" name="bNum" value="${fcontent_view.bNum }" />
    					<input type="hidden" name="bId" value="${hid}" />
    					<input type="hidden" name="cGroup" value="${comment.cGroup}" />
    					<input type="hidden" name="cStep" value="${comment.cStep}" />
    					<input type="hidden" name="cIndent" value="${comment.cIndent}" />    					
    					
    					<td>
    						${hid }
    					</td>
    					<td>
    						<input name="cContent" type="text" size=70% > 
    					</td>
    					<td>
    						<input type="submit" class="btn btn-dark" value="댓글등록">
    					</td>    				
    				</tr>
    			</form>	
    		</c:if>
    	</c:if>
    	</table>
    	<div class="pm">    	  		
    		<input type="button" value="목록" onClick="location.href='./rBoard'"class="btn btn-dark">    		
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