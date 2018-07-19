<%@page import="com.bean.Customer"%>
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
h3{color:brown}
table,th,td {
	border: 1px solid blue;
	 border-collapse: collapse; 
}

th,td {
	padding: 10px;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete ID</title>

</head>
<body bgcolor="pink">
<%@include file="Header.jsp" %>

<form action="Controller" method="post">
<% Customer cs= (Customer)request.getAttribute("search"); %>

<center>
<h2>Customer Details</h2>
<table >
<tr>
<td><b>SNN ID :</b></td>
<td><b><%=cs.getSsnid()%></b></td>
</tr>
<tr>
<td><b>CUSTOMER ID :</b></td>
<td><b><%=cs.getCustid()%></b></td>
</tr>
<tr>
<td><b> NAME :</b></td>
<td><b><%=cs.getName()%></b></td>
</tr>
<tr>
<td><b>AGE :</b></td>
<td><b><%=cs.getAge()%></b></td>
</tr>
<tr>
<td><b>ADDRESS :</b></td>
<td><b><%=cs.getAddress()%></b></td>
</tr>

<tr>
<td colspan="2">
<center><input type="submit" value="Confirm" style="font-size:12pt;color:white;background-color:green;height:30px; width:100px;"/></center></td></tr>

</table></center><br><br><br>

<input type="hidden" name="action" value="deleted"/>
<input type="hidden" name="ctid" value="<%=cs.getCustid()%>"/>
</form>

</body>
<br><br><br><br><br><br>
<div>
			<center><h3 style="background: lightblue">
				<b>Copyright @ Group_G</b>
			</h3></center>
		</div>
</html>