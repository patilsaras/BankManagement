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
h2 {
	color: Sienna;
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
<title>View 1</title>
<script> 
function validateform()
{  
var custid=document.myproject.customerID.value;  
var ssn=document.myproject.ssnid.value;
if ((custid==null||custid=="") && (ssn==null|| ssn==""))
{  
  alert("Both fields are empty");  
  return false; 
}
else if((custid!=null||custid!="") && (ssn==null||ssn==""))

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
else if((ssn!=null||ssn!="") && (custid==null||custid==""))

{
	if(ssn.length!=9)
		{
	alert("SSN ID should be 9 digit");  
	  return false;
		}
	if(!ssn.match(/^[0-9]+$/))
	{
		alert("SSN ID should be numeric");
		return false;
	}
	}

}
</script> 

</head>
<body>
<%@include file="Header.jsp" %>

<h2 align="center">Enter any of the following details</h2><br>
<form name="myproject" action="Controller" method="post" onsubmit="return validateform(this)">
<center>
<table>
<tr><td>CUSTOMERID:<input type="text" name="customerID"></td></tr>
<tr><td>SSNID:<input type="text" name="ssnid"></td></tr>
<tr><td><center><input type="submit" name="submit" value="submit" style="font-size:12pt;color:white;background-color:green;height:30px; width:100px;"></center></td></tr>
</table>
</center>
<tr><td><input type="hidden" name="action" value="view1"></td></tr>
<input type="hidden" name="customerid" value="customerID">
<input type="hidden" name="ssnid1" value="ssnid">
</form><br><br><br><br><br><br><br><br><br><br><br><br><br>
<div>
			<center><h3 style="background: lightblue">
				<b>Copyright @ Group_G</b>
			</h3></center>
		</div>
			
</body>
</html>