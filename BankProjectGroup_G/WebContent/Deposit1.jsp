<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.*"%>
<%@page import="com.bean.Account"%>
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
<title>Deposit 1</title>
</head>
<body>
<%@include file="Header1.jsp" %>

<form action="Controller" method="post" name="Deposit1" >
<%Account a=new Account(); %>
<%a=(Account)request.getAttribute("accObj");%>
<%double oldbalance=(Double)request.getAttribute("oldbal"); %>
<center>
			<h2>Balance Deposited successfully</h2>
<table align="center" border="1">
<tr>
<td><b>Account_id</b></td>
<td><b>Balance before deposit</b></td>
<td><b>Latest balance</b></td>
</tr>
<tr>

<td><b><%=a.getAccount_id()%></b></td>
<td><b>(&#x20B9)<%=oldbalance%></b></td>
<td><b>(&#x20B9)<%=a.getBalance()%></b></td>

</tr>
</table>
<br><br><br><br><br>

<div><center>
			<a href="Controller?action=menu1">Teller Home Page</a></center>
		</div>
		<div><br><br><br><br><br><br><br><br><br><br><br><br>
			<center><h3 style="background: lightblue">
				<b>Copyright @ Group_G</b>
			</h3></center>
		</div>
</center>
</form>

</body>
</html>