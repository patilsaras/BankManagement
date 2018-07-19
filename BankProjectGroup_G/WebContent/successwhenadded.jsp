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
h3{color: brown}
table,th,td {
	border: 1px solid blue;
	 border-collapse: collapse; 
}

th,td {
	padding: 10px;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Success when added</title>
</head>
<body bgcolor="Lavender">
<%@include file="Header.jsp" %>

<center>
<div>
<h1 style="color: green " style="font-size: 30px; text-decoration: underline"><%=request.getAttribute("message") %></h1>
<br><br>
<a href="Controller?action=menu" style="font-size: 30px; text-decoration: underline;">Executive Home Page</a>
</div>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

</center>

</body><br><br>
<div>
			<center><h3 style="background: lightblue">
				<b>Copyright @ Group_G</b>
			</h3></center>
		</div>
</html>