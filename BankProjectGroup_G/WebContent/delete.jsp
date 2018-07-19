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
<title>Delete</title>
</head>

  
  
<script> 
function validateform()
{  
var custid=document.myform.custid.value;  

if (custid==null||custid=="")
{  
  alert("Customer ID can't be blank");  
  return false; 
}
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
</script> 
<body bgcolor="LightSteelBlue ">
<%@include file="Header.jsp" %>

<form name="myform" action="Controller" method="post" onsubmit="return validateform()">
<center>
<table >
<tr>
<td><center><b>ENTER THE CUSTOMER ID</b></center></td>
</tr>
<tr>
<td><center><input type="text" name="custid" /></center></td>
</tr>
<tr>
<td><center><input type="submit" value="Search" style="font-size:12pt;color:white;background-color:green;height:30px; width:100px;"/></center></td>
</tr>
</table>
<input type="hidden" name="action" value="deleteid"/>
</center><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</form>
</body>
<div>
			<center><h3 style="background: lightblue">
				<b>Copyright @ Group_G</b>
			</h3></center>
		</div>
</html>