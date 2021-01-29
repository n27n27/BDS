<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="./css/bootstrap.min.css" rel="stylesheet">
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
		
		a{
		text-decoration:none;
		color:black;
		}
		
		.pM{
			margin:auto;
			text-align:center;
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
	 		<table class="table">
		<tr>
      		<th scope="row" width ="22%">작성자</th>
      		<td width="22%">${fcontent_view.bName }</td>
      		<th scope="row" width ="22%">조회수</th>
      		<td width="22%">${fcontent_view.bHit }</td>
      	</tr>    	
    		<tr>
      			<th scope="row" width ="10%">등록일</th>
      			<td>${fcontent_view.bDate}</td>
      			<th scope="row" width ="10%">첨부파일</th>
      			<td>${fcontent_view.bGood}</td>
      		</tr>	    	
    		<tr>
    			<th scope="row" width ="50%" colspan="2">제목</th>
      			<td width ="50%" colspan="2">${fcontent_view.bTitle}</td>     
    		</tr>
    		<tr>
    			<th scope="row" colspan="4">내용</th>      			     
    		</tr>
    		<tr>
    			<td colspan="4" height = 300>
    			${fcontent_view.bContent }    			  				
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
    					<input type="hidden" name="bNum" value="${fcontent_view.bNum }">
    					<input type="hidden" name="bId" value="${hid}">
    					<input type="hidden" name="cGroup" value="${comment.cGroup}">
    					<input type="hidden" name="cStep" value="${comment.cStep}">
    					<input type="hidden" name="cIndent" value="${comment.cIndent}">    					
    					
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
    	<form class="pM">
    		진행상황
    		&nbsp;
    		<input type="radio" name=process> 미확인
    		<input type="radio" name=process checked> 확인
    		<input type="radio" name=process> 처리중
    		<input type="radio" name=process> 완료
    		<input type="button" value="전송" class="btn-info">    		    		
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