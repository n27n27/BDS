<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.sql.Timestamp"%>     
<%@ page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<link rel="stylesheet" href="../css/base.css">
<title>BDS</title>
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
		
		.noticeWrite, .noticeWrite a{
			color:red;
			font-weight:bold;			
		}
		
		#middle{
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
	 		<table>
	 			<tr>
	 				<th width=10%>번호</th>
					<th width=40%>제목</th>
					<th width=15%>작성자</th>
					<th width=15%>작성일</th>
					<th width=10%>조회수</th>
					<th width=10%>파일</th>
				</tr>
				<c:set value="${dto}"  var = "dto1" />
					<tr class="noticeWrite">
		 				<td><img src='../img/notice.jpg' width=20px></td>		 					
						<td><a href="./nContent?nnum=${dto1.nnum }">${dto1.ntitle }</a></td>
						<td>관리자</td>
						<td>2021-02-15</td>
						<td>${dto1.nhit }</td>
						<td></td>
					</tr>
				
				<c:forEach items="${ncontents}" begin="0" end="2" var = "dto">
				<c:set var="yyy" value="${dto.ndate}" />
<%
	date = (Timestamp)pageContext.getAttribute("yyy");
	String day10 = sdf1.format(date);
%>
					<tr class="noticeWrite">
		 				<td><img src='../img/notice.jpg' width=20px></td>		 					
						<td><a href="./nContent?nnum=${dto.nnum }">${dto.ntitle }</a></td>
						<td>관리자</td>
						<td><%=day10%></td>
						<td>${dto.nhit }</td>
						<td>
						<c:choose>
							<c:when test="${dto.nfroot != null }">																 
								<a href="./download?filename=${dto.nfroot}"><img width=20px src="../img/file.png"></a>
							</c:when>
							<c:otherwise>								
							</c:otherwise>
						</c:choose>
						</td>
					</tr>
				</c:forEach>
				<c:forEach items="${contents }" var = "dto">
				<c:set var="xxx" value="${dto.rdate }" />				
<%					
	date = (Timestamp)pageContext.getAttribute("xxx");
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
				<c:choose>
					<c:when test="${dto.rsecret != 0 || id == dto.rname || auth eq 'ROLE_ADMIN'}">
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
							<td>
								
								${dto.rname }	
							
							</td>
							
							
							
							
							<td><%=day3%></td>
							<td>${dto.rhit }</td>
							<td>
							<c:choose>
								<c:when test="${dto.rfroot != null }">																 
									<a href="./download?filename=${dto.rfroot}"><img width=20px src="../img/file.png"></a>
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
									[답변]<img src='../img/lock.png' width=20px>비밀글입니다.
								</c:when>
								<c:otherwise>
									<img src='../img/lock.png' width=20px>비밀글입니다.									
								</c:otherwise>
							</c:choose>
							</td>
							<td>***</td>
							<td><%= day3 %></td>
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
								<a href="./rBoard?page=1"><span class="badge badge-info">&lt;&lt;</span></a>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${(page.curPage - 1) < 1 }">
								<span class="badge badge-info">&lt;</span>
							</c:when>
							<c:otherwise>
								<a href="./rBoard?page=${page.curPage - 1}"><span class="badge badge-info">&lt;</span></a>
							</c:otherwise>
						</c:choose>
						
						<c:forEach var="each" begin="${page.startPage }" end="${page.endPage }" step="1">
							<c:choose>
								<c:when test="${page.curPage == each }">
									<span class="badge badge-info">${each}</span>
								</c:when>
								<c:otherwise>
									<a href="./rBoard?page=${each}"><span class="badge badge-info">${each}</span></a> 
								</c:otherwise>
							</c:choose>							
						</c:forEach>
						<c:choose>
							<c:when test="${(page.curPage + 1) > page.totalPage}">
								<span class="badge badge-info">&gt;</span>
							</c:when>
							<c:otherwise>
								<a href="./rBoard?page=${page.curPage + 1 }"><span class="badge badge-info">&gt;</span></a>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${page.curPage == page.totalPage}">
								<span class="badge badge-info">&gt;&gt;</span>
							</c:when>
							<c:otherwise>
								<a href="./rBoard?page=${page.totalPage}"><span class="badge badge-info">&gt;&gt;</span></a>
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
	<c:choose>
					<c:when test = "${id == null }">
													
					</c:when>
					<c:otherwise>
						<button type="button" onclick="location.href = './rWrite';" class="btn btn-dark">글쓰기</button>							
					</c:otherwise>
				</c:choose>	
			
		
	</div>
	<br>
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