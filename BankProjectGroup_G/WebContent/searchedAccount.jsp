<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<title>Searched Account</title>
</head>
<%!Account acnt=null ;%>
<%acnt=(Account)request.getAttribute("acc"); %>
<body>
<%@include file="Header.jsp" %>

<form><br><br>
<center>
<table border=2>
<tr><td>Account Number</td>
<td><input type="text" value="<%=acnt.getAccount_id()%>" readonly="readonly" name="deletacc" ></td></tr>
<tr><td>Customer Id</td>
<td><input type="text" value="<%=acnt.getCustomer_id()%>" readonly="readonly" name="cucid"></td></tr>
<tr><td>Account Type</td>
<td><input type="text" value="<%=acnt.getAccount_type()%>"  readonly="readonly" name="cucid"></td></tr>
<tr><td>Account Balance</td>
<td><input type="text" value="(&#x20B9)<%=acnt.getBalance()%>"  readonly="readonly" name="cucid"></td></tr>
<tr><td>Creation Date(YYYY-MM-DD)</td>
<td><input type="text" value="<%=acnt.getCR_data()%>"  disabled="disabled" name="mess"></td></tr>
<tr><td>Last Customer Update(YYYY-MM-DD)</td>
<td><input type="text" value="<%=acnt.getCR_last() %>" disabled="disabled" name="date"></td></tr>
<tr><td colspan="2" align="center">
<input type="submit" name="submit" value="Delete" Search" style="font-size:12pt;color:white;background-color:green;height:30px; width:100px;">
<input type="hidden" name="action" value="delete">
</td>
</tr>
</table></center></form><br><br><br><br><br>
<div>
			<center><h3 style="background: lightblue">
				<b>Copyright @ Group_G</b>
			</h3></center>
		</div>
		
</body>
</html>