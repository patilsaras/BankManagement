<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.bean.*" %>
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
<title>View</title>
</head>
<body bgcolor="Khaki">
<%@include file="Header1.jsp" %>

<form action="Controller" method="post">
<% Account a=(Account)request.getAttribute("obj"); %>
<center>
<table>


<tr><td>Customer ID:<%=a.getCustomer_id() %></td></tr>
<tr><td> Account ID:<%=a.getAccount_id() %></td></tr>
<tr><td> Account type :<%=a.getAccount_type() %></td></tr>
<tr><td> Balance :(&#x20B9)<%=a.getBalance() %></td></tr>
<tr><td> Creation Date (YYYY-MM-DD) :<%=a.getCR_data()%></td></tr>
<tr><td> Last Updated (YYYY-MM-DD) :<%=a.getCR_last() %></td></tr>
</table>

<br><br><br>
<table>
<tr><td><a href="Controller?action=Deposit&acc=<%=a.getAccount_id()%>">Deposit  </a></td>
<td><a href="Controller?action=Withdraw&acc=<%=a.getAccount_id()%>">Withdraw  </a></td>
<td><a href="Controller?action=Transfer&sacc=<%=a.getAccount_id()%>">Transfer</a></td></tr>
</table>
</center>
<br><br><br><br><br><br><br>
<div>
			<center><h3 style="background: lightblue">
				<b>Copyright @ Group_G</b>
			</h3></center>
		</div>
<input type="hidden" name="action" value="hidden2">

</form>
		
</body>
</html>