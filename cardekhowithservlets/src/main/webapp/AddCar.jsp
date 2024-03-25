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
	padding: 10px;
}

td {
	color: white;
	padding: 8px;
}

form {
	height: 300px;
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

	<div id="form" align="center">
		<h1>Add Car Details</h1>
		<form action="add_car" method="post">
			<table>
				<tr>
					<td>Id</td>
					<td><input type="text" name="id" required></td>
				</tr>
				<tr>
					<td>Name</td>
					<td><input type="text" name="name" required></td>
				</tr>
				<tr>
					<td>Brand</td>
					<td><input type="text" name="brand" required></td>
				</tr>
				<tr>
					<td>Price</td>
					<td><input type="text" name="price" required></td>
				</tr>
				<tr>
					<td>Fuel Type</td>
					<td><input type="text" name="fuelType" required></td>
				</tr>
				<tr>
					<td>Colour</td>
					<td><input type="text" name="colour" required></td>
				</tr>
			</table>
			<br>
			<input type="submit" value="Add Car">
		</form>
	</div>
	<div id="message" name="message" align="center">
		<%!String message;%>
		<%
		message = (String) request.getAttribute("message");
		%>
		<%
		if (message != null) {
		%>
		<h4><%=message%></h4>
		<%
		}
		%>
	</div>

</body>
</html>