<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>  
<style>
body {
 background-image: url("images/fondo22.jpg");
}
h1 {
	color: blue;
}
h2 {
	color: black;
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
<title>Search Account</title>
</head>
<script> 
function validateform()
{  
var sac=document.myform.searchaccunt.value;  

if (sac==null||sac=="")
{  
  alert("Account ID can't be blank");  
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
}
</script> 
<body ng-app="">
<%@include file="Header.jsp" %>

<form action="Controller" method="post" name="myform" onsubmit="return validateform()">

<center>
<h2>Enter your Account Id</h2><br>
<table >
<tr><td><b>Account Id :</b><input type ="text" name="searchaccunt" ng-model="accidserch"></td></tr>
<tr><td><center><input type="submit" value="submit" name="Search" style="font-size:12pt;color:white;background-color:green;height:30px; width:100px;"></center></td></tr>

</table>
<div><h2>You Entered :{{accidserch}}</h2></div></center>
<input type="hidden" value="searchacc" name="action">
<br><br><br><br><br>

</form>
		
</body><br><br><br><br><br><br><br>
<div>
			<center><h3 style="background: PaleGoldenRod ">
				<b>Copyright @ Group_G</b>
			</h3></center>
		</div>
</html>