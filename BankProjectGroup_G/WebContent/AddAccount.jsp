<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.bean.Customer"%>
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
table,th,td {
	border: 1px solid blue;
	 border-collapse: collapse; 
}
h3 {
	color: brown;
}
th,td {
	padding: 10px;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Account</title>
</head>
<body bgcolor="Lavender">
<%@include file="Header.jsp" %>

<script>  
function validateform(crcust)
{ 
var bal=document.crcust.bal.value;
var type=document.crcust.cuat.value;
if(type=="" || type==null)
{
	alert("Please select type");
	return false;
}
if(bal=="" || bal==null)
{
	alert("Please enter balance");
	return false;
}
if(!bal.match(/^[0-9]+$/))
{
	alert("Balance should be numeric");
	return false;
}
if(bal<=0)
{
	alert("Please enter valid balance");
	return false;
}
if(type=="saving")
{
	if(bal<500)
	{
	   alert("Minimum balance is 500");
 	  return false;  
	}
}
}
</script>



<form action="Controller" method="post" name="crcust" onsubmit="return validateform(this)">

<%long id=0;
id=(Long)request.getAttribute("custid11"); %>

 <center>
 
		<h2>Enter Account Details</h2>
<table border=2>
<tr><td>Customer Id</td>
<td><input type="text" value="<%=id%>"  name="cucid" readonly="readonly"></td></tr>
<tr><td>Account Type</td>
<td><select name="cuat"><option value="saving">savings</option><option value="current">current</option></select></td></tr>
<tr><td>Balance   &#x20B9</td>
<td><input type="text" value=""  name="bal"></td></tr>
<tr><td colspan="2" align="center">
<input type="submit" name="submit" value="Submit">
</td>
</tr>
</table><br><br><br>

<input type="hidden" name="action" value="add2acc">
</center>
</form>

</body><br><br><br><br><br><br><br><br><br><br>
<div>
			<center><h3 style="background: Wheat">
				<b>Copyright @ Group_G</b>
			</h3></center>
		</div>
</html>