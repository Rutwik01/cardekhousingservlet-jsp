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
	height: 150px;
	width: 300px;
	background-color: rgba(232, 140, 20, 0.21);
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
		<h4>Car details unavailable</h4>
	</div>
	<%
	}
	%>
	<h1 id="h1">Remove Car</h1>
		<form action="remove_car" method="post">
			<table border=1px solid>
				<tr>
					<td>Enter Car Id to remove: </td>
					<td><input type="text" name="id" required></td>
				</tr>
			</table>
			<br>
			<input id="button" type="submit" value="Delete Car">
		</form>
	</div>
	<div id="message">
	<% String message=(String)request.getAttribute("message"); 
	if (message != null){
	%>
	<h4 align="center"><%= message %></h4>
	<% 	
	}
	%>
	</div>
	
</body>
</html>