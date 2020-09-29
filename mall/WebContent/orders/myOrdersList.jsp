<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myOrdersList</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
</head>
<body>
<%
	String memberEmail = request.getParameter("memberEmail");
	OrdersDao ordersDao = new OrdersDao();
	ArrayList<Orders> list = ordersDao.selectOrdersListByEmail(session.getAttribute("loginMemberEmail").toString());
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
		<h1>주문 내역</h1>
	</div>
	<table class="table table-bordered">
		<thead>
			<tr>
				<th>product_id</th>
				<th>orders_amount</th>
				<th>orders_price</th>
				<th>orders_date</th>
				<th>orders_state</th>
			</tr>
		</thead>
		<tbody>
			<%
				for(Orders o : list){
			%>
					<tr>
						<td><%=o.getProductId()%></td>
						<td><%=o.getOrdersAmount()%>개</td>
						<td><%=o.getOrdersPrice()%>원</td>
						<td><%=o.getOrdersDate()%></td>
						<td><%=o.getOrdersState()%></td>
					</tr>
			<%
				}
			%>
		</tbody>
	</table>
</div>
</body>
</html>