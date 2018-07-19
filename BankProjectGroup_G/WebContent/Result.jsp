<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.bean.Account" %>
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
<title>Result</title>
</head>
<body>


<%@include file="Header1.jsp" %>


<%String i=(String)request.getAttribute("message") ;%>
<center>
<div>
<h2><%= i%></h2>
<%Account a2=(Account)request.getAttribute("accObj1");%>
<%Account a3=(Account)request.getAttribute("accObj2");%>
<%double oldbals=(Double)request.getAttribute("olds");%>
<%double oldbald=(Double)request.getAttribute("oldd");%>
<center><h3>Source Account Details</h3>
<table border="1">
<tr>
<td><b>Source Account_id</b></td>
<td><b>Balance before Transfer</b></td>
<td><b>Balance After Transfer</b></td>
</tr>
<tr>
<td><b><%=a2.getAccount_id()%></b></td>
<td><b>(&#x20B9)<%=oldbals%></b></td>
<td><b>(&#x20B9)<%=a2.getBalance()%></b></td>
</tr>
</table>

<center><h3>Destination Account Details</h3>
<table border="1">
<tr>
<td><b>Destination Account_id</b></td>
<td><b>Balance before Transfer</b></td>
<td><b>Balance After Transfer</b></td>
</tr>
<tr>
<td><b><%=a3.getAccount_id()%></b></td>
<td><b>(&#x20B9)<%=oldbald%></b></td>
<td><b>(&#x20B9)<%=a3.getBalance()%></b></td>
</tr>
</table>
</center><br><br>

<a href="Controller?action=home1" style="font-size: 30px; text-decoration: underline;">Log Out</a><br>

<a href="Controller?action=menu1" style="font-size: 30px; text-decoration: underline;">Teller Home Page</a>
</center>
</div>
</center>
<div>
			<center><h3 style="background: lightblue">
				<b>Copyright @ Group_G</b>
			</h3></center>
		</div>
		
</body>
</html>