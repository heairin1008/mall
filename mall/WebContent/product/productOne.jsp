<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>productOne</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
</head>
<body>
<%
	int productId = Integer.parseInt(request.getParameter("productId"));
	ProductDao productDao = new ProductDao();
	Product product = productDao.selectProductOne(productId);
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
			<i class='fas fa-user' style='font-size: 36px'></i>
			<i class='fas fa-shopping-cart' style='font-size: 36px'></i>	
		</div>
	</div>
	
	<div class="jumbotron">
		<h1>상품 상세보기</h1>
	</div>
	<form method="post" action="<%=request.getContextPath()%>/orders/addOrdersAction.jsp">
		<input type="hidden" value="<%=product.getProductId()%>" name="productId">
		<input type="hidden" value="<%=product.getProductPrice()%>" name="productPrice">
		<div>
			수량 : 
			<select name="ordersAmount">
				<%
					for(int i=1; i<11; i++){
				%>
						<option value="<%=i%>"><%=i %></option>
				<%
					}
				%>
			</select>개
		</div>
		<div>
			배송주소 :
			<input type="text" name="ordersAddr">
		</div>
		<div><button class="btn btn-secondary" type="submit">주문</button></div>
	</form>
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