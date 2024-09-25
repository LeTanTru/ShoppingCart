<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Home</title>
    <link rel="stylesheet" href="css/main.css?v=2" type="text/css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
</head>
<body>

	<div class="container mt-25">
		<h1 class="text-success">CD list</h1>
		<hr />
		<table class="table table-striped table-bordered">
			<tr>
				<th>Description</th>
				<th class="text-center">Price</th>
				<th>&nbsp;</th>
			</tr>
			<tr>
				<td>86 (the band) - True Life Songs and Pictures</td>
				<td class="text-center">$14.95</td>
				<td class="text-center"><form action="cart" method="post">
						<input type="hidden" name="productCode" value="8601"> <input
							class="btn btn-primary" type="submit" value="Add To Cart">
					</form></td>
			</tr>
			<tr>
				<td>Paddlefoot - The first CD</td>
				<td class="text-center">$12.95</td>
				<td class="text-center"><form action="cart" method="post">
						<input type="hidden" name="productCode" value="pf01"> <input
							class="btn btn-primary" type="submit" value="Add To Cart">
					</form></td>
			</tr>
			<tr>
				<td>Paddlefoot - The second CD</td>
				<td class="text-center">$14.95</td>
				<td class="text-center"><form action="cart" method="post">
						<input type="hidden" name="productCode" value="pf02"> <input
							class="btn btn-primary" type="submit" value="Add To Cart">
					</form></td>
			</tr>
			<tr>
				<td>Joe Rut - Genuine Wood Grained Finish</td>
				<td class="text-center">$14.95</td>
				<td class="text-center"><form action="cart" method="post">
						<input type="hidden" name="productCode" value="jr01"> <input
							class="btn btn-primary" type="submit" value="Add To Cart">
					</form></td>
			</tr>
		</table>
	</div>

</body>
</html>