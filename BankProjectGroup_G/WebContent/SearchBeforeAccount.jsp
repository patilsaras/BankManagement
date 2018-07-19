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
<title>Search before account</title>
</head>
<script> 
function validateform()
{  
var custid=document.upcust.CuID.value;  
if (custid==null||custid=="")
{  
  alert("Field is empty");  
  return false; 
}
else if(custid!=null||custid!="")

{
	if(custid.length!=9)
		{
	alert("Customer ID should be 9 digit");  
	  return false;
		}
	if(!custid.match(/^[0-9]+$/))
	{
		alert("Customer ID should be numeric");
		return false;
	}
	}
}
</script> 
<body bgcolor="Lavender">
<%@include file="Header.jsp" %>

<center>

<div>
	
	<form name="upcust" action="Controller" method="post" onsubmit="return validateform(this)">
	<br><br>
	<h2>Enter Customer ID</h2>
	<table>
	<tr><td>Customer ID <input type="text" name="CuID"></td></tr>
	<tr><td><center><input type="submit" name="SUBMIT" value="Submit"></center></td></tr>
	</table>
	<input type="hidden" name="action" value="searchbeforeaccount">
	
	</form>
</div><br><br><br><br><br><br>

</center>
	
</body><br><br><br><br><br><br><br>
<div>
			<center><h3 style="background: Wheat ">
				<b>Copyright @ Group_G</b>
			</h3></center>
		</div>
</html>