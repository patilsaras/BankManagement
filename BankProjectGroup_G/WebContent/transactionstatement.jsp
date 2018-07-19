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
<title>Transaction Statement</title>
</head>
<script> 
function validateform()
{  
var sac=document.myform.searchaccunt.value;  
var not=document.myform.tran.value;
if (sac==null||sac=="")
{  
  alert("Please enter Account ID");  
  return false; 
}
if(sac.length!=9)
{
	alert("Account ID should be 9 digit");  
	  return false;
	}
	if(!sac.match(/^[0-9]+$/))
	{
		alert("Account ID should be numeric");
		return false;
	}
	if(not==""||not==null)
	{
		alert("Please select number of transaction");
		return false;
	}
	
}
</script>
<body>
<%@include file="Header1.jsp" %>

<form action="Controller" method="post" name="myform" onsubmit="return validateform(this)">
<center><h2>Please enter the details</h2></center>
<br>
<center><h3>Account Id :  <input type ="text" name="searchaccunt"></h3>
<center><h3>Select Number of Transaction: <select name="tran">
<option>1</option>
<option>2</option>
<option>3</option>
<option>4</option>
<option>5</option>
<option>6</option>
<option>7</option>
<option>8</option>
<option>9</option>
<option>10</option>
</select> </h3></center>

<input type="submit" value="submit" name="Search" style="font-size:12pt;color:white;background-color:green;height:30px; width:100px;">
<br><br><br><br><br><br><br><br><br><br><br><br><br><br>

<input type="hidden" value="searchacc1" name="action"></center>
<div>
			<center><h3 style="background: lightblue">
				<b>Copyright @ Group_G</b>
			</h3></center>
		</div>
</form>

		
</body>
</html>