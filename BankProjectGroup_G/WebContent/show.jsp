<%@ page import="com.bean.Customer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
body {
 background-image: url("images/fondo22.jpg");
}
h1 {
	color: blue;
}
h2{color: Sienna}
h3 {
	color: brown;
}
table,th,td {
	border: 1px solid blue;
	 border-collapse: collapse; 
}

th,td {
	padding: 10px;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Show</title>
</head>
<body>
<%@include file="Header.jsp" %>

<h2 align="center">Customer Details</h2>
<form action="Controller" method="post">
<center>
<table border=2>
<tr><td colspan="2">CustomerID</td><td colspan="2">SSNID</td><td colspan="2">Name</td><td colspan="2">Age</td><td colspan="2">Address</td></tr>
<%Customer c2=(Customer) request.getAttribute("customer");%>
<tr><td colspan="2"><%=c2.getCustid()%></td>
<td colspan="2"><%=c2.getSsnid()%></td>
<td colspan="2"><%=c2.getName()%></td>
<td colspan="2"><%=c2.getAge()%></td>
<td colspan="2"><%=c2.getAddress()%></td></tr>
</table><br><br>
<a href="Controller?action=menu"style="font-size: 25px; text-decoration: underline;">Executive Home Page</a>
</center>
</form><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<div>
			<center><h3 style="background: lightblue">
				<b>Copyright @ Group_G</b>
			</h3></center>
		</div>
		
</body>
</html>