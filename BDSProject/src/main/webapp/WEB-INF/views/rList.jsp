<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<link rel="stylesheet" href="./css/base.css">
<title>BDS</title>
	<style>		
		
		table{
			border-collapse: collapse;
			text-align:left;
			width : 90%;
			margin : auto;
		}			
		
		td{
			border-bottom: 1px solid;
			height:50px;
		}
		
		#set, #searchForm{
			text-align:center;
		}
		
		.right1{
			float:right;
		}	
		
		a, a:link, a:visited, a:hover{
			text-decoration:none;
			color:black;
		}
		.badge{
			padding: 2;
			font-size:1.0em;			
		}
		
	</style>	
</head>
<body>
	<div id=wrap>
		<div id=header>
			<div id="write27" ><a href='main'><img src='./img/home.png' width=20px>BDS</a></div>
			<div class="write27">
				<div class=menu1><a href="./first">Intro</a></div>
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
				<div class=menu1><a href="./rBoard">문의</a></div>
				<div class=menu1><a href="">샘플</a></div>
			</div>
	 	</div><br><br>
	 	<hr>
	 	<div id='middle'>
	 		<table>
	 			<tr>
	 				<th width=10%>번호</th>
					<th width=40%>제목</th>
					<th width=15%>작성자</th>
					<th width=15%>작성일</th>
					<th width=10%>조회수</th>
					<th width=10%>파일</th>
				</tr>
				<c:forEach items="${contents }" begin="0" end="2" var = "dto">
					<tr>
	 				<th width=10%>번호</th>
					<th width=40%>제목</th>
					<th width=15%>작성자</th>
					<th width=15%>작성일</th>
					<th width=10%>조회수</th>
					<th width=10%>파일</th>
				</tr>
				</c:forEach>
				<c:forEach items="${contents }" var = "dto">
				<c:choose>
					<c:when test="${dto.rsecret != 0 }">
						<tr>
							<td>${dto.rnum }</td>
							<td>
							<c:choose>
								<c:when test="${dto.rindent != 0}">
									<c:forEach begin="1" end="${dto.rindent }">&nbsp;</c:forEach>
									[답변]<a href="./rContent?rnum=${dto.rnum }">${dto.rtitle }</a>
								</c:when>
								<c:otherwise>
									<a href="./rContent?rnum=${dto.rnum }">${dto.rtitle }</a>									
								</c:otherwise>
							</c:choose>
							</td>
							<td>${dto.rname }</td>
							<td>${dto.rdate }</td>
							<td>${dto.rhit }</td>
							<td>
							<c:choose>
								<c:when test="${dto.rfroot != null }">																 
									<a href="./download?filename=${dto.rfroot}"><img width=20px src="./img/file.png"></a>
								</c:when>
								<c:otherwise>								
								</c:otherwise>
							</c:choose>
							</td>
						</tr>
					</c:when>
					<c:otherwise>
						<tr>
							<td>${dto.rnum }</td>
							<td>
							<c:choose>
								<c:when test="${dto.rindent != 0}">
									<c:forEach begin="1" end="${dto.rindent }">&nbsp;</c:forEach>
									[답변]<img src='./img/lock.png' width=20px>비밀글입니다.
								</c:when>
								<c:otherwise>
									<img src='./img/lock.png' width=20px>비밀글입니다.									
								</c:otherwise>
							</c:choose>
							</td>
							<td>***</td>
							<td>${dto.rdate }</td>
							<td>${dto.rhit }</td>
							<td></td>
						</tr>
					</c:otherwise>				
				</c:choose>
				</c:forEach>
				<tr id="set">
					<td colspan="6">
						<c:choose>
							<c:when test="${(page.curPage - 1) < 1 }">
								<span class="badge badge-info">&lt;&lt;</span>
							</c:when>
							<c:otherwise>
								<a href="rBoard?page=1"><span class="badge badge-info">&lt;&lt;</span></a>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${(page.curPage - 1) < 1 }">
								<span class="badge badge-info">&lt;</span>
							</c:when>
							<c:otherwise>
								<a href="rBoard?page=${page.curPage - 1}"><span class="badge badge-info">&lt;</span></a>
							</c:otherwise>
						</c:choose>
						
						<c:forEach var="each" begin="${page.startPage }" end="${page.endPage }" step="1">
							<c:choose>
								<c:when test="${page.curPage == each }">
									<span class="badge badge-info">${each}</span>
								</c:when>
								<c:otherwise>
									<a href="rBoard?page=${each}"><span class="badge badge-info">${each}</span></a> 
								</c:otherwise>
							</c:choose>							
						</c:forEach>
						<c:choose>
							<c:when test="${(page.curPage + 1) > page.totalPage}">
								<span class="badge badge-info">&gt;</span>
							</c:when>
							<c:otherwise>
								<a href="rBoard?page=${page.curPage + 1 }"><span class="badge badge-info">&gt;</span></a>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${page.curPage == page.totalPage}">
								<span class="badge badge-info">&gt;&gt;</span>
							</c:when>
							<c:otherwise>
								<a href="rBoard?page=${page.totalPage}"><span class="badge badge-info">&gt;&gt;</span></a>
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
			</table>			
			<br>
	<!-- 검색기능은 관리자만 볼 수 있게 설정 -->
	<c:set var="hid" value="<%= (String)session.getAttribute(\"id\") %>" />
		<c:choose>
			<c:when test = "${hid == null }">
			</c:when>
			<c:otherwise>
				<form action="fSearch.fo" name="searchFrom" id="searchForm" method="post">
					<div class="search">
						<select name="searchCondition" id="searchCondition">
							<option value="title">제목</option>
							<option value="contents">내용</option>
							<option value="writer">작성자</option>
							<option value="title_contents">제목+내용</option>
						</select>
						<input type="text" name="searchKeyword" id="searchKeyword" value="" class="schKwd" title="검색어를 입력해 주세요"  placeholder="검색어를 입력해 주세요" />
						<input type="button" onclick="form_check()" class="btn btn-dark" value="검색">
					</div>
				</form>
			</c:otherwise>
		</c:choose>	
	<div class="right1">		
		<button type="button" onclick="location.href = './rWrite';" class="btn btn-dark">글쓰기</button>
	</div>
	<br>
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