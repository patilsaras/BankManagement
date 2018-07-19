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
<title>Withdraw</title>
</head>
<body>
<%@include file="Header1.jsp" %>

		<script>
function validateform()
{  
var amt=document.abc.amount.value;  

if (amt==null||amt=="")
{  
  alert("Please enter some amount");  
  return false; 
}
	if(!amt.match(/^[0-9]+$/))
	{
		alert("Amount should be numeric");
		return false;
	}
	if(amt<=0)
	{
		alert("Please enter valid amount");
		return false;
	}
}
</script>


<form action="Controller" method="post" name="abc" onsubmit="return validateform()">
<center>
<% long acc=(Long)request.getAttribute("accid");%>
<h2>Please Enter Amount</h2>
<table>
<tr><td><b>Account Id:<%=acc%></b><br><br></td></tr>
<tr><td><b>Withdraw amount: &#x20B9<input type="text" name="amount"></b><br><br></td></tr>
<tr><td><center><input type="submit" name="submit" value="submit" style="font-size:12pt;color:white;background-color:green;height:30px; width:100px;"></center></td></tr>
</table>
<input type="hidden" name="action" value="with1">
<input type="hidden" name="acc1" value="<%=acc%>">
</center><br><br><br><br><br><br><br><br><br><br><br>
<div>
			<center><h3 style="background: lightblue">
				<b>Copyright @ Group_G</b>
			</h3></center>
		</div>
</form>
	
</body>
</html>