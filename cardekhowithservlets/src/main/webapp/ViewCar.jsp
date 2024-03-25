<%@page import="java.util.List"%>
<%@page import="com.jspiders.cardekhowithservlets.object.Car"%>
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
	color:whitesmoke;
}

table {
	margin-top: 10px;
	font-weight: bold;
	text-align:center;
}

table th {
	background-color: rgba(231, 192, 140, 0.7);
	padding:10px;
}
td{
color:white;
padding:8px;
background-color: rgba(231, 192, 140, 0.2);
}
</style>
</head>
<body>
	<%
	List<Car> cars = (List<Car>) request.getAttribute("cars");
	if (cars != null && cars.size() > 0) {
	%>
	<div align="center">
		<h1>View All Cars</h1>
		<table cellpadding="15px" border="1px solid">
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

</body>
</html>