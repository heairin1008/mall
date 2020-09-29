<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
</head>
<body>
<%
	// 로그인 상태면 인덱스로
	if(session.getAttribute("loginMemberEmail") != null){
		response.sendRedirect(request.getContextPath()+"/index.jsp");
		return;
	}
%>
<div class="container">
	<div class="row"> <!-- 헤더 goodee shop / 검색바 -->
		<div class="col-sm-4 font-weight-bold"><h2><a class="text-dark"  style="text-decoration : none;" href="<%=request.getContextPath()%>/index.jsp">Goodee Shop</a></h2></div>
		<div class="col">
			<form>
				<table>
					<tr>
						<td width="400px">
							<input class="form-control" type="text">
						</td>
						<td width="100px">
							<button class="btn btn-info" type="submit">검색</button>	
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
			
			<i class='fas fa-shopping-cart' style='font-size: 36px'></i>	
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
					<li class="nav-iten"><a class="nav-link btn btn-light btn-sm" href="">회원정보</a></li>
				</ul>
		<%
			}
		
		%>
	</div>
	
	<div class="jumbotron">	
		<h1>로그인</h1>
	</div>
	<form method="post" action="<%=request.getContextPath()%>/member/loginAction.jsp">
		<table class="table-bordered form-group" style="margin:auto; text-align:center;">
			<tr>
				<td>member_email</td>
				<td width="300px"><input class="form-control" type="text" name="memberEmail"></td>
			</tr>
			<tr>
				<td>member_pw</td>
				<td width="300px"><input class="form-control" type="password" name="memberPw"></td>
			</tr>
		</table>
		<div style="text-align:center;">
		<button class="btn btn-info"type="submit">로그인</button>
		</div>
	</form>
</div>
</body>
</html>