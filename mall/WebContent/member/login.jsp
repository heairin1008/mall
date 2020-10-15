<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
</head>
<script>
	$(document).ready(function(){
		console.log("ready");
		$("#searchBtn").click(function(){
			console.log("click");
			if($("#productName").val() == ""){
				alert("상품을 입력해주세요.");
				$("#productName").focus(); //상품 입력 창으로 커서를 이동
				return;
			}
			$("#productForm").submit();
		});
	});
	
	$(document).ready(function(){
		console.log("ready");
		$("#loginBtn").click(function(){
			console.log("click");
			if($("#memberEmail").val() == ""){
				alert("이메일을 입력해주세요");
				$("#memberEmail").focus();
				return;
			}else if($("#memberPw").val() == ""){
				alert("비밀번호를 확인해주세요");
				$("#memberPw").focus();
				return;
			}
			$("#loginForm").submit();
		});
	});
</script>
<body>
<%
	// 로그인 상태면 인덱스로
	if(session.getAttribute("loginMemberEmail") != null){
		response.sendRedirect(request.getContextPath()+"/index.jsp");
		return;
	}
%>
<div class="container">
	<div class="row" style="margin : 10px;"> <!-- 헤더 goodee shop / 검색바 -->
		<div class="col-sm-4 font-weight-bold"><h2><a class="text-dark"  style="text-decoration : none;" href="<%=request.getContextPath()%>/index.jsp">Goodee Shop</a></h2></div>
		<div class="col">
			<form method="post" action="<%=request.getContextPath()%>/product/searchProduct.jsp" id="productForm">
				<table>
					<tr>
						<td width="400px">
							<input class="form-control" type="text" name="productName" id="productName">
						</td>
						<td width="100px">
							<button class="btn btn-info" type="button" id="searchBtn">검색</button>	
						</td>
					</tr>
				</table>	
			</form>
		</div>
		<div class="col-sm-3">
		<%
			if(session.getAttribute("loginMemberEmail") == null){
		%>
				<a class="text-dark" href="<%=request.getContextPath()%>/member/login.jsp"><i class='fas fa-user' style='font-size: 36px'></i></a>
		<%
			}else{
		%>
			<a class="text-dark" href="<%=request.getContextPath()%>/orders/myOrdersList.jsp"><i class='fas fa-user' style='font-size: 36px'></i></a>
		<%
			}
		%>	
		</div>
	</div>
	<div> <!-- 로그인/회원가입 메뉴바 -->
		<nav class="navbar navbar-expand-sm bg-dark">
			<ul class="navbar-nav mr-auto"></ul>
		<% 
			if(session.getAttribute("loginMemberEmail") == null){
		%>
				<!-- 로그아웃 상태 -->
				<ul class="navbar-nav mr-right">
					<li class="nav-iten"><a class="nav-link btn btn-primary brn-sm" href="<%=request.getContextPath()%>/member/login.jsp">로그인</a></li>
					&nbsp;
					<li class="nav-iten"><a class="nav-link btn btn-light btn-sm" href="<%=request.getContextPath()%>/member/signup.jsp">회원가입</a></li>
				</ul>
		<%
			}else{
		%>
				<!-- 로그인 상태 -->
				<ul class="navbar-nav mr-right">
					<li class="nav-iten"><a class="nav-link btn btn-danger btn-sm" href="<%=request.getContextPath()%>/member/logoutAction.jsp">로그아웃</a></li>
					&nbsp;
					<li class="nav-iten"><a class="nav-link btn btn-light btn-sm" href="<%=request.getContextPath()%>/member/memberOne.jsp">회원정보</a></li>
				</ul>
		<%
			}
		
		%>
	</div>
	
	<!-- 로그인 테이블 -->
	<div class="jumbotron">	
		<h1>로그인</h1>
	</div>
	<form method="post" action="<%=request.getContextPath()%>/member/loginAction.jsp" id="loginForm">
		<table class="table table-bordered form-group">
			<tr>
				<td>member_email</td>
				<td><input class="form-control" type="text" name="memberEmail" id="memberEmail"></td>
			</tr>
			<tr>
				<td>member_pw</td>
				<td><input class="form-control" type="password" name="memberPw" id="memberPw"></td>
			</tr>
		</table>
		<div style="text-align:center;">
		<button class="btn btn-info"type="button" id="loginBtn">로그인</button>
		</div>
	</form>
</div>
</body>
</html>