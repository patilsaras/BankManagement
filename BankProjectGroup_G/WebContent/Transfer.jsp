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
<title>Transfer</title>
</head>
<body>
<%@include file="Header1.jsp" %>

<script>  
function validateform(transfer)
{  
var ta=document.transfer.amount.value;  
var da=document.transfer.dacc.value;  
if (ta==null || da==null)
{  
  alert("Please Enter Details");  
  return false;  
}
if (ta=="" || da=="")
{  
  alert("Please Enter Details");  
  return false;  
}
 if(ta>50000)
{
alert("Amount should be less than 50000");  
return false;  
}
 if(!ta.match(/^[0-9]+$/))
{
	alert("Amount should be numeric");
	return false;
}

 if(!da.match(/^[0-9]+$/))
{
	alert("Destination account should be numeric");
	return false;
}
 if(da.length!=9)
	 {
	 	alert("Account should be of 9 digits");
	 	return false;
	 }
}  
</script> 
<%long scc=(Long)request.getAttribute("sacc1");%>
<center>
<div><br><br>
<form action="Controller" name="transfer" method="post" onsubmit="return validateform(this)">
<h2>Please enter the details</h2>
<table>
<tr>
<td><b>Source account</b></td>
<td><b><%=scc%></b></td>
</tr>
<tr>
<td><b>Transfer Amount &#x20B9</b></td>
<td><input type="text" name="amount"></td>
</tr>

<tr>
<td><b>Destination account</b></td>
<td><input type="text" name="dacc"></td>
</tr>
<tr>
<td colspan="2"><center><input type="submit" name="Submit" value="Submit" style="font-size:12pt;color:white;background-color:green;height:30px; width:100px;"></center></td>
</tr>
</table>
<input type="hidden" name="action" value="transfer">
<input type="hidden" name="sacc" value="<%=scc%>">
</form>
</div>
</center><br><br><br><br><br><br><br><br><br>
<div>
			<center><h3 style="background: lightblue">
				<b>Copyright @ Group_G</b>
			</h3></center>
		</div>
		
</body>
</html>