<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.bean.*" %>
    <%@page import="java.util.ArrayList" %>
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
<title>View 2</title>
</head>
<body bgcolor="Yellow">
<%@include file="Header1.jsp" %>

<script>  
function validateform(crcust)
{ 
var acid=document.crcust.id.value;
if(acid=="--Select--")
{
   alert("Please select an account");
   return false;  
}
}
</script>
<form action="Controller" method="post" name="crcust" onsubmit="return validateform(this)">
<%ArrayList<Account> a1=(ArrayList<Account>)request.getAttribute("obj1"); %>
<center>

<h2>Please Select Your Account</h2>
<table>
<tr><td><select name="id">
<option value="--Select--">--Select--</option>
<%for(Account a:a1){ %>
<option value="<%=a.getAccount_id() %>"><%=a.getAccount_id() %></option>
<%} %>
</select>
</td></tr>
</table>

<br><br>
<input type="submit" name="submit" value="Submit">
<input type="hidden" name="action" value="hidden3">

</center>

</form>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<div>
			<center><h3 style="background: lightblue">
				<b>Copyright @ Group_G</b>
			</h3></center>
		</div>
			
</body>
</html>