<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Car Dekho - HOME</title>
<style type="text/css">
body {
	background-image: url(./car-3046424_1920\ copy.jpg);
	background-size: cover;
	background-position: center;
	background-repeat: no-repeat;
	background-attachment: fixed;
}

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
	top: 0px;
	position: fixed;
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
	color:white;
	text-decoration:none;
	padding:15px;
}

#nav ul li a:hover {
	border: white double;
	color: brown;
	background-color: burlywood;
}

#info {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 9.5vh;
	width: 100%;
	position: fixed;
	bottom: 0px;
	background-color: brown;
}

#info h3 {
	background-color: brown;
	color: whitesmoke;
}
</style>
</head>
<body>
	<div id="nav">
		<ul>
			<li><a
				href="http://localhost:8080/cardekhowithservlets/home.jsp">Home</a></li>
			<li><a
				href="http://localhost:8080/cardekhowithservlets/AddCar.jsp">Add
					Car</a></li>
			<li><a
				href="http://localhost:8080/cardekhowithservlets/view_cars">View
					Cars</a></li>
			<li><a
				href="http://localhost:8080/cardekhowithservlets/ShowCarByName.jsp">Search
					Car</a></li>
			<li><a
				href="http://localhost:8080/cardekhowithservlets/EditCar.jsp">Edit
					Car</a></li>
			<li><a
				href="http://localhost:8080/cardekhowithservlets/RemoveCar.jsp">Remove
					Car</a></li>
		</ul>
	</div>

	<div id="info">
		<h3>Navigate through the options</h3>
	</div>
</body>
</html>