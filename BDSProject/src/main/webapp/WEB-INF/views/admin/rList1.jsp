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
		
		#middle{
			width:90%;
			margin:auto;
			
		}
			
		h3{
			text-align:center;			
		}
		
		.write28 {
			float:right;
			display:block;			
		}
	</style>
	<script>
		function form_check()
		{
			if($("#searchKeyword").val().length == 0)
			{
				alert("검색어를 입력하세요");
				return;
			}
			
			searchForm.submit();
		}
	</script>	
</head>
<body>
<%
	Timestamp date = null;
	SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
	SimpleDateFormat sdf2 = new SimpleDateFormat("HH:mm");
%>
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
	 	<h3> 미처리 문의사항 리스트 (총 : <%=session.getAttribute("rCount") %> 건)</h3>
	 	<hr>
	 	<br>
	 		<table>
	 			<tr>
	 				<th width=10%>번호</th>
					<th width=40%>제목</th>
					<th width=15%>작성자</th>
					<th width=15%>작성일</th>
					<th width=10%>조회수</th>
					<th width=10%>파일</th>
				</tr>
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
				<tr>
					<td>${dto.rnum }</td>
					<td>
						<a href="./rContent1?rnum=${dto.rnum }">${dto.rtitle }</a>						
					</td>
					<td>${dto.rname }</td>
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
					
				</c:forEach>
				<tr id="set">
					<td colspan="6">
						<c:choose>
							<c:when test="${(page.curPage - 1) < 1 }">
								<span class="badge badge-info">&lt;&lt;</span>
							</c:when>
							<c:otherwise>
								<a href="./nList?page=1"><span class="badge badge-info">&lt;&lt;</span></a>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${(page.curPage - 1) < 1 }">
								<span class="badge badge-info">&lt;</span>
							</c:when>
							<c:otherwise>
								<a href="./nList?page=${page.curPage - 1}"><span class="badge badge-info">&lt;</span></a>
							</c:otherwise>
						</c:choose>
						
						<c:forEach var="each" begin="${page.startPage }" end="${page.endPage }" step="1">
							<c:choose>
								<c:when test="${page.curPage == each }">
									<span class="badge badge-info">${each}</span>
								</c:when>
								<c:otherwise>
									<a href="./nList?page=${each}"><span class="badge badge-info">${each}</span></a> 
								</c:otherwise>
							</c:choose>							
						</c:forEach>
						<c:choose>
							<c:when test="${(page.curPage + 1) > page.totalPage}">
								<span class="badge badge-info">&gt;</span>
							</c:when>
							<c:otherwise>
								<a href="./nList?page=${page.curPage + 1 }"><span class="badge badge-info">&gt;</span></a>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${page.curPage == page.totalPage}">
								<span class="badge badge-info">&gt;&gt;</span>
							</c:when>
							<c:otherwise>
								<a href="./nList?page=${page.totalPage}"><span class="badge badge-info">&gt;&gt;</span></a>
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
			</table>			
			<br>
				
	
			<div class="write28">				
				<button type="button" onclick="location.href = './manager';" class="btn btn-dark">돌아가기</button>
			</div>	
		<br>
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