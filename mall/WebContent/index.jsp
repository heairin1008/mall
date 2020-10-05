<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*"%>
<%@ page import="vo.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
</head>
<%
	CategoryDao categoryDao = new CategoryDao();
	// 전체 카테고리 목록
	ArrayList<Category> categoryList1 = categoryDao.selectCategoryList();
	//추천 카테고리 목록
	ArrayList<Category> categoryList2 = categoryDao.selectCategoryCkList();
	
%>
<body>
<div class="container">
	<div class="row"  style="margin : 10px;"> <!-- 헤더 goodee shop / 검색바 -->
		<div class="col-sm-4 font-weight-bold"><h2><a class="text-dark"  style="text-decoration : none;" href="<%=request.getContextPath()%>/index.jsp">Goodee Shop</a></h2></div>
		<div class="col">
			<form method="post" action="<%=request.getContextPath()%>/product/searchProduct.jsp">
				<table>
					<tr>
						<td width="400px">
							<input class="form-control" type="text" name="productName">
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
					<li class="nov-item text-muted"><%=session.getAttribute("loginMemberEmail")%>님 환영합니다.</li>
					&nbsp;
					<li class="nav-iten"><a class="nav-link btn btn-danger btn-sm" href="<%=request.getContextPath()%>/member/logoutAction.jsp">로그아웃</a></li>
					&nbsp;
					<li class="nav-iten"><a class="nav-link btn btn-light btn-sm" href="<%=request.getContextPath()%>/member/memberOne.jsp">회원정보</a></li>
				</ul>
		<%
			}
		
		%>
	</div>
	
	<div><!-- 전체 카테고리 3 / 이미지 배너 9 -->
		<div class="row">
			<div class="col-sm-3">
					<!-- 전체카테고리 -->
					<%
						for(Category c : categoryList1){
					%>
							<a class="nav-link" href="<%=request.getContextPath()%>/product/productList.jsp?categoryId=<%=c.getCategoryId()%>"><button class="btn btn-secondary btn-block" value=<%=c.getCategoryId()%>><%=c.getCategoryName()%></button></a>
					<%
						}
					%>
			</div>
			<div class="col-sm-9">
				<img src="<%=request.getContextPath()%>/image/gu.jpg">
			</div>
		</div>
	</div>
	<!-- 추천 카테고리 이미지 링크 -->
	<div class="text-align : center" style="margin:5px;">
		<%
			for(Category c : categoryList2){
		%>
				<a class="col-sm-9" href="<%=request.getContextPath()%>/product/productList.jsp?categoryId=<%=c.getCategoryId()%>"><img src="<%=request.getContextPath()%>/image/<%=c.getCategoryPic()%>" class="rounded-circle" width="200" height="200"></a>
				&nbsp;
				&nbsp;
				&nbsp;
				&nbsp;
				&nbsp;
		<%
			}
		%>
	</div>
	
	<%
		Calendar today = Calendar.getInstance(); // new Calendar()
	%>
	<!-- 카테고리별 추천상품 -->
	<div>
	<table>
		<tr>
			<td><h3 class="font-weight-bold">오늘의 추천 상품</h3></td>
			<td>&nbsp;</td>
			<td><h5><span class="badge badge-pill badge-primary"><%=today.get(Calendar.YEAR)%>.<%=today.get(Calendar.MONTH)+1%>.<%=today.get(Calendar.DAY_OF_MONTH)%></span></h5></td>
		</tr>
	</table>
		
	</div>
	
	<div class="row">
	<table width="100%">
			<tr>		
		<%
			for(Category c : categoryList1){
		%>

				<td>
					<a href="<%=request.getContextPath()%>/product/productList.jsp?categoryId=<%=c.getCategoryId()%>" class="btn btn-secondary nav-link"><%=c.getCategoryName()%></a>
				</td>
				<td>&nbsp;</td>
		<%
			}
		%>
			</tr>		
	</table>
	</div>
	
	<%
		ProductDao productDao = new ProductDao();
		ArrayList<Product> productList = productDao.selectProductList();
	%>
	<!-- 상품 목록(6) -->
	<div style="margin: 10px;"></div>
	<table class="table table-border">
		<tr>
			<%
				int i = 0;
				for(Product p : productList){
					i=i+1;
			%>
					<td>
						<div class="card" style="width:300px">
	  						<img class="card-img-top" src="/mall-admin/image/<%=p.getProductPic()%>" alt="Card image">
	  						<div class="card-body">
								<h5 class="card-title font-weight-bold">
									<a class="text-dark" href="<%=request.getContextPath()%>/product/productOne.jsp?productId=<%=p.getProductId()%>"><%=p.getProductName()%></a>
								</h5>
								<p class="card-text font-weitght-bold"><%=p.getProductPrice()%></p>
					 		</div>
						</div>
					</td>
			<%
					if(i%3==0){
			%>
						</tr><tr>
			<%
					}
				}
			%>
		</tr>
	</table>
	
	<!-- 최근 공지 2개 출력 -->
	<%
		NoticeDao noticeDao = new NoticeDao();
		ArrayList<Notice> list = noticeDao.selectNoticeList();
	%>
	<div class="row">
		<div class="col-sm-2">
			<h4>공지사항</h4>
		</div>
		
		<div class="col-sm-10">
			<table style="text-align: left">
				<tbody>
					<tr>
						<td>
							<ul>
								<%
									for(Notice n : list){
								%>
									<li><a class="text-dark" href="<%=request.getContextPath()%>/notice/noticeOne.jsp?noticeId=<%=n.getNoticeId()%>"><%=n.getNoticeTitle()%></a></li>
								<%
									}
								%>
							</ul>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
</body>
</html>