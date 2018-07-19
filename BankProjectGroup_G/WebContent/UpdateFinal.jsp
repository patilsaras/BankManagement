<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.bean.*" %>
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
<title>Update Final</title>
</head>
<script>
function validateform(crcust)
{ 
  var val = document.crcust.name.value; 
    if (!val.match(/^[a-zA-Z ]+$/)) 
    {
        alert('Only alphabets are allowed');
       return false;  
    }
    var add = document.crcust.address.value;
    if(!add.match (/^[a-z0-9, ]+$/i))
    	{
        alert('Address should be Alphanumeric');
        return false;  

    	}
    var age=document.crcust.age.value;
    if(age.length>3) 
       { 
       alert("Invalid Age");
       return false;  

       }  
    if(age<18)
    {
    	alert("Customer should be minimum 18 years old");
    	return false;
    }
    if(age>120)
    {
    	alert("Invalid age");
    	return false;
    }
    if(!age.match(/^[0-9]+$/))
    {
    	alert("Age should be numeric");
    	return false;
    }


}

</script>
<body>
<%@include file="Header.jsp" %>
<center><div>
	<br><br>
	<h2>Update Customer Details</h2>
	<form action="Controller" method="post" name="crcust" onsubmit="return validateform(this)">
		<table>
			<%Customer c=(Customer)request.getAttribute("customerobj");%>
			<tr>
			<td>Customer Id:</td><td> <%=c.getCustid() %></td>
			</tr>
			<tr>
			<td>SSN ID:</td><td> <%=c.getSsnid() %></td>
			</tr>
			<tr>
			<td>Name: </td>
			<td><input type="text" name="name" value=<%=c.getName() %>></td>
			</tr>
			<tr>
			<td>Address: </td>
			<td><input type="text" name="address" value=<%=c.getAddress() %>></td>
			</tr>
			<tr>
			<td>Age: </td>
			<td><input type="text" name="age" value=<%=c.getAge() %>></td>
			</tr>
			<tr>
				<td><input type="reset" value="RESET" name="reset" style="font-size:12pt;color:white;background-color:green;height:30px; width:100px;"></td>
				<td><input type="submit" value="SUBMIT" name="submit" style="font-size:12pt;color:white;background-color:green;height:30px; width:100px;"></td>
			</tr>
		</table>
		<input type="hidden" name="action" value="updatefinal">
		<input type="hidden" name="custid" value="<%=c.getCustid()%>">
		<input type="hidden" name="ssnid" value="<%=c.getSsnid()%>">
	</form>
</div>
</center><br><br><br>
<div>
			<center><h3 style="background: lightblue">
				<b>Copyright @ Group_G</b>
			</h3></center>
		</div>	
			
</body>
</html>