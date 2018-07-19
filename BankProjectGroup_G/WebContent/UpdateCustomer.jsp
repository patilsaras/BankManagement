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
h3{color: brown}
 h2{color: Sienna}
table,th,td {
	border: 1px solid blue;
	 border-collapse: collapse; 
}

th,td {
	padding: 10px;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Customer</title>
</head>
<script> 
function validateform()
{  
var custid=document.upcust.custid.value;  
var ssn=document.upcust.ssnid.value;
if ((custid==null||custid=="") && (ssn==null|| ssn==""))
{  
  alert("Both fields are empty");  
  return false; 
}
else if (custid && ssn)
	
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
<body>
<%@include file="Header.jsp" %>
<center><div>
	<form name="upcust" action="Controller" method="post" onsubmit="return validateform(this)">
	<h2>Enter SSNID or Customer ID</h2>
	<br><br><table>
	<tr><td>SSN ID <input type="text" name="ssnid"><br><br></td></tr>
	<tr><td>Customer ID <input type="text" name="custid"><br><br></td></tr>
	<tr><td colspan="2"><center><input type="submit" name="SUBMIT" value="Submit" style="font-size:12pt;color:white;background-color:green;height:30px; width:100px;"></center></td></tr>
	</table>
	<input type="hidden" name="action" value="searchbeforeupdate">
	</form>
</div>
</center><br><br><br><br><br><br><br>

		
</body>
<div>
			<center><h3 style="background: lightblue">
				<b>Copyright @ Group_G</b>
			</h3></center>
		</div>
</html>