<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>NavBar</title>
</head>
<style>
* {
	padding: 0px;
	margin: 0px;
	box-sizing: border-box;
}
#nav {
	height: 10vh;
	width: 100%;
	margin: 10px 0px;
	background-color: brown;
	display: flex;
	align-items: center;
	justify-content: center;
	top:0px;
	position:fixed;
	
}

#nav ul {
	background: brown;
	padding: 10px;
}

#nav ul li {
	display: inline-block;
	margin: 20px;
}

#nav ul li a {
	text-decoration: none;
	padding: 15px;
	border: white dashed;
	color: blue;
	background-color: burlywood;
}
</style>
<body>
	<div id="nav">
		<ul>
			<li><a href="http://localhost:8080/cardekhowithservlets/home.jsp">Home</a></li>
			<li><a href="http://localhost:8080/cardekhowithservlets/AddCar.jsp">Add Car</a></li>
			<li><a href="http://localhost:8080/cardekhowithservlets/view_cars">View Cars</a></li>
			<li><a href="">Search Car</a></li>
			<li><a href="http://localhost:8080/cardekhowithservlets/EditCar.jsp">Edit Car</a></li>
			<li><a href="http://localhost:8080/cardekhowithservlets/RemoveCar.jsp">Remove Car</a></li>
		</ul>
	</div>
</body>
</html>