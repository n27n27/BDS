<%@page import="javax.servlet.http.HttpSession" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>    
<!Doctype html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" href="../css/base.css">
    <style>
    	#container { width: 600px; height:500px; margin:10px auto; padding: 10px; border: 10px solid #277FCC; }
    	
	</style>
    <script src="http://code.jquery.com/jquery.js"></script>
  <title>회원가입</title>
	
</head>

 <body>
 	<div id=wrap>
		<div id=header>
			<div id="write27" ><img src='../img/home.png' width=20px>BDS</div>
			<div class="write27">
				<div class=menu1><a href="./first">Intro</a></div>
				<sec:authorize access="isAuthenticated()">
					<c:redirect url="./main"/>
				</sec:authorize>
				<sec:authorize access="!isAuthenticated()">
					<div class=menu1><a href="../security/clogin">Login</a></div>
				</sec:authorize>									
				<div class=menu1><a href="./rBoard">문의</a></div>
				<div class=menu1><a href="./sList">샘플</a></div>
			</div>
	 	</div><br><br>
	 	<hr>
	 	
 		<div class="col-md-8 order-md-1">
          <h4 class="mb-3">회원 정보</h4>
          <c:url var="registerdo" value="./register.do" />
          <form action="${registerdo}" oninput='upw_check.setCustomValidity(upw_check.value != upw.value ? "비밀번호가 일치하지 않습니다" : "")' >
            <div class="row">
              <div class="col-md-4 mb-4">
              <label for="uid">아이디</label>
              <div class="input-group">
                <input type="text" class="form-control" pattern="[A-Za-z0-9]{4,8}" id="uid" name="uid" placeholder="4~12자리 영문+숫자" required>
              </div>
              </div>
              <div class="col-md-4 mb-4">
              <label for="upw">비밀번호</label>
              <div class="input-group">
                <input type="password" class="form-control" pattern="[A-Za-z0-9]{4,12}" id="upw" name="upw" placeholder="4~12자리 영문+숫자" required>
              </div>
              </div>
              <div class="col-md-4 mb-4">
              	<label for="upw_check">비밀번호 확인</label>
              		<div class="input-group">
                		<input type="password" class="form-control" id="upw_check" name="upw_check" placeholder="비밀번호와 동일" required>
              		</div>
              </div>
              <div class="col-md-4 mb-2">
              	<label for="name">이름</label>
                <input type="text" class="form-control" id="uname" name="uname" pattern="[가-힣]{2,5}" placeholder="한글 2~5글자" value="" required>
              </div>   
            <div class="col-md-4 mb-4">
               <label for="pNum">휴대전화</label><br/>
     			<input type="tel" class="form-control" id="upnum" name="upnum" pattern="^\d{2,3}-\d{3,4}-\d{4}$" placeholder="ex) 010-1234-5678" required >
			</div>
			<div class="col-md-5 mb-4">
              <label for="uaddr">주소</label>
              <input type="text" class="form-control" id="uaddr" name="uaddr" placeholder="ex) 서울시 종로구" required>
            </div>
            <div class="col-md-5 mb-4">
              <label for="uemail">Email <span class="text-muted">(선택사항)</span></label>
              <input type="text" class="form-control" id="uemail" name="uemail" placeholder="you@example.com">
            </div>
			<hr class="mb-4"><br/>
            <div>
            <button class="btn btn-primary btn-lg" type="submit">회원가입 완료하기</button>
          	</div>
          	</div>
          </form>
		  </div>
		</div>
 		<hr/>
	    <div id="footer">
	 		<address>03189 서울 종로구 삼일대로17길 51
				 &emsp; TEL : 02-2222-2222
				 &emsp; h.p : 010-5503-2731
			</address>
			<cite>&copy; since 2021 BDS Co. All Rights Reserved.</cite>
		</div>	
	</div>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	<script src="../assets/js/vendor/holder.min.js"></script>	
</body>
</html>
