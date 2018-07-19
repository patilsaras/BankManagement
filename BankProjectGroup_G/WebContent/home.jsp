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
<title>Home</title>
</head>
<script>
function validateform()
{
	var Customer_ID=document.myproject.Customer_ID.value;
	var Account_ID=document.myproject.Account_ID.value;
	
	if((Customer_ID==null||Customer_ID=="")&&(Account_ID==null||Account_ID==""))
		{
		alert ("Both the field can't be blank");
		return false;
		}
	
		else if(Customer_ID&&Account_ID)
		{
			if(!Customer_ID.match(/^[0-9]+$/))
			{
		 	alert('Customer ID should be numeric ');
	    	 return false;  	
			}
			else if(!Account_ID.match(/^[0-9]+$/))
			{
			 alert('Account ID should be numeric');
	    	 return false;  	
	    	}
			else if(Customer_ID.length!=9 && Account_ID.length!=9)
			{
			alert("Enter correct id with proper length");
			return false;
			}
			
		}
	else if((Customer_ID!=null||Customer_ID!="")&&(Account_ID==null||Account_ID=="") )
		{
	 	if(!Customer_ID.match(/^[0-9]+$/))
		{
		 alert('Customer ID should be numeric ');
	     return false;  	
		}
		 if(Customer_ID.length!=9)
		{
		alert("Enter correct id with proper length");
		return false;
		}
		}
	else if((Account_ID!=null||Account_ID!="")&&(Customer_ID==null||Customer_ID==""))
	{
	 if(!Account_ID.match(/^[0-9]+$/))
		{
		 alert('Account ID should be numeric');
    	 return false;  	
    	}
	 if(Account_ID.length!=9)
		{
		alert("Enter correct id with proper length");
		return false;
		}
	}
	
}
</script>
<body>
<%@include file="Header1.jsp" %>

<form name="myproject"action="Controller" method="post" onsubmit="return validateform(this) ">

<center>

<h2>Enter any one of the details</h2>
<table font-style:italic; font:bold; font-size: 20px"  border="1" bgcolor="White  " width=30%>
<tr>
<td><b>Customer_ID:</b><input type="text" name="Customer_ID"></td>
</tr>
<tr>
<td><b>Account_ID:</b><input type="text" name="Account_ID"></td>
</tr>
<tr><td><center><input type="submit" name="submit" value="submit" style="height:30px; width:100px;color: green;"></center></td></tr>
</table>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<div>
			<center><h3 style="background: lightblue">
				<b>Copyright @ Group_G</b>
			</h3></center>
		</div>
</center>
<input type="hidden" name="action" value="hidden1">

</form>

</body>
</html>