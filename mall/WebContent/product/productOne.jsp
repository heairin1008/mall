<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>productOne</title>
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
		$("#ordersBtn").click(function(){
			console.log("click");
			if($("#ordersAddr").val() == ""){
				alert("주소를 입력해주세요.");
				$("#ordersAddr").focus(); //상품 입력 창으로 커서를 이동
				return;
			}
			$("#orderForm").submit();
		});
	});
</script>
<body>
<%
	int productId = Integer.parseInt(request.getParameter("productId"));
	ProductDao productDao = new ProductDao();
	Product product = productDao.selectProductOne(productId);
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
			if(session.getAttribute("loginMemberEmail") == null){ //로그인 상태가 아닐 경우 아이콘을 누르면 로그인 페이지로 넘어가기
		%>
				<a class="text-dark" href="<%=request.getContextPath()%>/member/login.jsp"><i class='fas fa-user' style='font-size: 36px'></i></a>	
		<%
			}else{ // 로그인 상태라면 주문내역으로 넘어가기
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
	
	<div class="jumbotron">
		<h1>상품 상세보기</h1>
	</div>
	<!-- 상품주문 테이블 -->
	<form method="post" action="<%=request.getContextPath()%>/orders/addOrdersAction.jsp" id="orderForm">
		<input type="hidden" value="<%=product.getProductId()%>" name="productId">
		<input type="hidden" value="<%=product.getProductPrice()%>" name="productPrice">
		<table class="table table-border form-group">
			<tr>
				<td>수량</td>
				<td>
					<select name="ordersAmount">
					<%
						for(int i=1; i<11; i++){
					%>
							<option value="<%=i%>"><%=i %></option>
					<%
						}
					%>
				</select>개
				</td>
			</tr>
			<tr>
				<td>배송주소</td>
				<td><input type="text" name="ordersAddr" id="ordersAddr"></td>
			</tr>
			<tr>
				<td colspan="2"><button class="btn btn-secondary" type="button" id="ordersBtn">주문</button></td>
			</tr>
		</table>
	</form>
	<!-- 상품 상세정보 테이블 -->
	<table class="table table-bordered">
		<tr>
			<td>product_id</td>
			<td><%=product.getProductId() %></td>
		</tr>
		<tr>
			<td>product_pic</td>
			<td><img src="/mall-admin/image/<%=product.getProductPic()%>"  width="200" height="200"></td>
		</tr>
		<tr>
			<td>product_name</td>
			<td><%=product.getProductName() %></td>
		</tr>
		<tr>
			<td>product_price</td>
			<td><%=product.getProductPrice() %></td>
		</tr>
		<tr>
			<td>product_content</td>
			<td><%=product.getProductContent() %></td>
		</tr>
		<tr>
			<td>product_soldout</td>
			<td><%=product.getProductSoldout() %></td>
		</tr>
	</table>
	
</div>
</body>
</html>