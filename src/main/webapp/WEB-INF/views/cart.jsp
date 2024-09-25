<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Cart</title>
<link rel="stylesheet" href="css/main.css?v=3" type="text/css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
</head>
<body>

	<div class="container mt-25">
		<h1 class="text-success">Your cart</h1>
		<hr />
		<table class="table table-striped table-bordered">
			<tr>
				<th class="text-center">Quantity</th>
				<th class="text-center">Description</th>
				<th class="text-center">Price</th>
				<th class="text-center">Amount</th>
				<th></th>
			</tr>

			<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
			<c:forEach var="item" items="${cart.items}">
				<tr>
					<td class="text-center">
						<form action="cart" method="post"
							class="d-flex justify-content-center gap-2">
							<input type="hidden" name="productCode"
								value="${item.product.code}"> <input type=text
								name="quantity" value="${item.quantity}" id="quantity"
								class="input-group-text"> <input type="submit"
								value="Update" class="btn btn-primary">
						</form>
					</td>
					<td class="text-center">${item.product.description}</td>
					<td class="text-center">${item.product.priceCurrencyFormat}</td>
					<td class="text-center">${item.totalCurrencyFormat}</td>
					<td class="text-center"><a class="btn btn-primary"
						href="cart?productCode=${item.product.code}&amp;quantity=0">Remove
							Item</a></td>
				</tr>
			</c:forEach>
		</table>

		<p>
			<b>To change the quantity</b>, enter the new quantity and click on
			the Update button.
		</p>

		<form action="" method="post" class="mb-3">
			<input type="hidden" name="action" value="shop"> <input
				type="submit" value="Continue Shopping" class="btn btn-primary">
		</form>

		<form action="checkout" method="get">
			<input type="hidden" name="action" value="checkout"> <input
				type="submit" value="Checkout" class="btn btn-primary">
		</form>
	</div>

</body>
</html>