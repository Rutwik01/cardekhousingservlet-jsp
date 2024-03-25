<%@page import="com.jspiders.cardekhowithservlets.object.Car"%>
<%@page import="java.util.List"%>
<%@page import="com.jspiders.cardekhowithservlets.jdbc.CarJDBC"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:include page="structure.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
h1 {
	margin-top: 100px;
	color: whitesmoke;
}

#h1 {
	margin: 10px;
}

h2 {
	color: whitesmoke;
}

table {
	margin: 10px;
	font-weight: bold;
	text-align: center;
}

table th {
	background-color: rgba(231, 192, 140, 0.7);
	padding: 10px;
}

td {
	color: white;
	padding: 8px;
	background-color: rgba(231, 192, 140, 0.2);
}

form {
	height: 300px;
	width: 300px;
	background-color: rgba(232, 140, 20, 0.21);
}
#form1 {
	height: 100px;
	width: 400px;
	background-color: rgba(232, 140, 20, 0.21);
	margin-bottom: 10px;
}
input {
	height: 25px;
	width: 180px;
	outline: none;
	border: none;
}

input[type="submit"] {
	width: 100px;
	height: 30px;
	background-color: burlywood;
	margin-top: -10px;
	color: whitesmoke;
	font-weight: bold;
	margin-bottom:25px;
}

input[type="submit"]:hover {
	background-color: rgba(231, 192, 140, 0.5);
}
#button{
margin-bottom:70px;
margin-top:-20px;
}
#details{
margin-bottom: 35px;
}
#message{
	font-size:20px;
	color:white;
	text-align:center;
	margin-top:45px;
	margin-bottom:60px;
}
</style>
</head>
<body>
	<div align="center">
		<%
		List<Car> cars = CarJDBC.viewCars();
		if (cars != null && cars.size() > 0) {
		%>
		<div align="center">
			<h1>View All Cars</h1>
			<table border="1px solid">
				<tr>
					<th>Id</th>
					<th>Name</th>
					<th>Brand</th>
					<th>Price</th>
					<th>Fuel Type</th>
					<th>Colour</th>
				</tr>
				<%
				for (Car car : cars) {
				%>
				<tr>
					<td><%=car.getId()%></td>
					<td><%=car.getName()%></td>
					<td><%=car.getBrand()%></td>
					<td><%=car.getPrice()%></td>
					<td><%=car.getFuelType()%></td>
					<td><%=car.getColour()%></td>
				</tr>
				<%
				}
				%>
			</table>
		</div>
		<%
		} else {
		%>
		<div align="center">
			<h4>No cars available</h4>
		</div>
		<%
		}
		%>

		<h1 id="h1">Edit Car Details</h1>

		<form id="form1" action="edit_car" method="post">
			<table border=1px solid>
				<tr>
					<td>Enter Car Id to edit details :</td>
					<td><input type="text" name="id" required></td>
				</tr>
			</table>
			<input type="submit" value="Edit Car">
		</form>
	</div>

	<%
	List<Car> car = (List<Car>) request.getAttribute("cars");
	if (car != null && car.size() > 0) {
	%>
	<div align="center">
		<h1 id="h1">Available Car Details</h1>
		<table border="1px solid">
			<tr>
				<th>Id</th>
				<th>Name</th>
				<th>Brand</th>
				<th>Price</th>
				<th>Fuel Type</th>
				<th>Colour</th>
			</tr>
			<%
			for (Car car1 : car) {
			%>
			<tr>
				<td><%=car1.getId()%></td>
				<td><%=car1.getName()%></td>
				<td><%=car1.getBrand()%></td>
				<td><%=car1.getPrice()%></td>
				<td><%=car1.getFuelType()%></td>
				<td><%=car1.getColour()%></td>
			</tr>
			<%
			}
			%>
		</table>
	</div>
	<div align="center">
		<h2>Update Car Details</h2>
		<form action="edit_car" method="post">
			<table id="details" border=1px solid>
				<%
				for (Car car1 : car) {
				%>
				<tr>
					<td>Id</td>

					<td><input readonly="readonly" name="id"
						value="<%=car1.getId()%>"></td>

				</tr>
				<tr>
					<td>Name</td>
					<td><input type="text" name="name" value="<%=car1.getName()%>"></td>
				</tr>
				<tr>
					<td>Brand</td>
					<td><input type="text" name="brand"
						value="<%=car1.getBrand()%>"></td>
				</tr>
				<tr>
					<td>Price</td>
					<td><input type="text" name="price"
						value="<%=car1.getPrice()%>"></td>
				</tr>
				<tr>
					<td>Fuel Type</td>
					<td><input type="text" name="fuelType"
						value="<%=car1.getFuelType()%>"></td>
				</tr>
				<tr>
					<td>Colour</td>
					<td><input type="text" name="colour"
						value="<%=car1.getColour()%>"></td>
				</tr>
				<%
				}
				%>
			</table>
			<input id="button" type="submit" value="Update Car">
		</form>
	</div>

	<div  name="message" align="center">

		<%!String message;%>
		<%
		message = (String) request.getAttribute("message");
		%>
		<%
		if (message != null) {
		%>
		<h4 id="message"><%=message%></h4>
		<%
		}
		%>
		<%
		} else if(request.getMethod().equalsIgnoreCase("POST")) {
		%>
		<h4 id="message">Cars not found</h4>
		<%
		}
		%>
	</div>

</body>
</html>