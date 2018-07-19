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
h4{color: red}

table,th,td {
	border: 1px solid blue;
	 border-collapse: collapse; 
}

th,td {
	padding: 10px;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create Customer</title>
</head>
<style>
input.ng-invalid {
    background-color:pink;
}
input.ng-valid {
    background-color:lightgreen;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>  
<body bgcolor="LightSteelBlue " ng-app="">
<%@include file="Header.jsp" %>
<script>  
function validateform(crcust)
{ 
var ssn=document.crcust.ssnid.value;
if(ssn==null|| ssn=="")
{
   alert("SSN ID Should not be Empty");
   return false;  
}
if(!ssn.match(/^[0-9]+$/))
{
	 alert('SSN ID should be numeric');
     return false;  	
}
if(ssn.length != 9) 
   {
   alert("SSN ID Should be 9 digits");
   return false;  

   }  
  var val = document.crcust.name.value; 
    if (!val.match(/^[a-zA-Z ]+$/)) 
    {
        alert('Name should be alphabetic only');
       return false;  
    }
    var add = document.crcust.add1.value;
    if(!add.match (/^[a-zA-Z0-9 ]+$/i))
    	{
        alert('Address should be Alphanumeric');
        return false;  

    	}
    var cit=document.crcust.city.value;
    if(!cit.match(/^[a-zA-Z]+$/))
    {
    	alert('Please enter valid city');
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
<center>

<form action="Controller" name="crcust" method="post" onsubmit="return validateform(this)">
<h2>Enter Customer Details</h2>
<h4>(All fields are mandatory)</h4>
<table style="color: SaddleBrown  ;font-style:italic;font:bold; font-size: 20px"  border="1" bgcolor="Bisque " width=50%>
<tr>
<td>SSN ID</td>
<td><input type="text" name="ssnid" ng-model="ssnid" required="required" pattern="[1-9][0-9]{8}" title="SSN ID required">
<span ng-show="crcust.ssnid.$touched && crcust.ssnid.$invalid"> <h4>*SSN id is required</h4></span></td>
</tr>
<tr>
<td>Name</td>
<td><input type="text" name="name" ng-model="name" required="required" pattern="[A-Za-z]*">
<span ng-show="crcust.name.$touched && crcust.name.$invalid"> <h4>*Name is required</h4></span></td>
</tr>
<tr>
<td>Age</td>
<td><input type="text" name="age" ng-model="age" required="required" pattern="[1-9][0-9]{1}">
<span ng-show="crcust.age.$touched && crcust.age.$invalid"> <h4>*Age is required</h4></span></td>
</tr>
<tr>
<td>AddressLine 1</td>
<td><input type="text" name="add1" ng-model="add1" required>
<span ng-show="crcust.add1.$touched && crcust.add1.$invalid"> <h4>*Field is required</h4></span></td>
</tr>
<tr>
<td>AddressLine 2</td>
<td><input type="text" name="add2" ng-model="add2" required>
<span ng-show="crcust.add2.$touched && crcust.add2.$invalid"> <h4>*Field is required</h4></span></td>
</tr>
<tr>
<td>City</td>
<td><input type="text" name="city" ng-model="city" required>
<span ng-show="crcust.city.$touched && crcust.city.$invalid"> <h4>*City is required</h4></span></td>
</tr>
<tr>
<td>State</td>
<td><input type="text" name="state" ng-model="state" required>
<span ng-show="crcust.state.$touched && crcust.state.$invalid"> <h4>*State is required</h4></span></td>
</tr>
<tr>
<td><input type="reset" value="Reset" name="Reset" style="font-size:12pt;color:white;background-color:green;height:30px; width:100px;"></td>
<td><input type="submit" value="Submit" name="Submit" style="font-size:12pt;color:white;background-color:green;height:30px; width:100px;"></td>
</tr>
</table>
<input type="hidden" name="action" value="customercreation">
</form>
<br><br><br>
<div>
			<center><h3 style="background: PaleGoldenRod ">
				<b>Copyright @ Group_G</b>
			</h3></center>
		</div>
</center>

</body>
</html>