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
<title>transactionStatByDate</title>
</head>
<script> 
function validateform()
{  
var sac=document.myform.searchaccunt.value;  
var sd=document.myform.sdate.value;  
var ed=document.myform.ldate.value;  
var validformat=/^\d{4}\/\d{2}\/\d{2}$/; //Basic check for format validity
var returnval=false;
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
	if (!validformat.test(sd))
	{
	    alert("Invalid Date Format. Please correct and submit again.");
		return false;

	}
	else
	{ 
		var yearfield=sd.split("/")[0];
		var monthfield=sd.split("/")[1];
		var dayfield=sd.split("/")[2];
		var dayobj = new Date(yearfield, monthfield-1, dayfield);
		if ((dayobj.getMonth()+1!=monthfield)||(dayobj.getDate()!=dayfield)||(dayobj.getFullYear()!=yearfield))
		{
		alert("Invalid Day, Month, or Year range detected. Please correct and submit again.");
		return false;

		}	
	}
	if (!validformat.test(ed))
	{
	    alert("Invalid Date Format. Please correct and submit again.");
		return false;

	}
	else
	{ 
		var yearfield=ed.split("/")[0];
		var monthfield=ed.split("/")[1];
		var dayfield=ed.split("/")[2];
		var dayobj = new Date(yearfield, monthfield-1, dayfield);
		if ((dayobj.getMonth()+1!=monthfield)||(dayobj.getDate()!=dayfield)||(dayobj.getFullYear()!=yearfield))
		{
		alert("Invalid Day, Month, or Year range detected. Please correct and submit again.");
		return false;

		}	
	}
	if(Date.parse(ed) <= Date.parse(sd))
		{
		 alert("Start date should be before end date.");
			return false;
		}
	
}
</script>
<body>
<%@include file="Header1.jsp" %>

<br><br>
<form action="Controller" method="post" name="myform" onsubmit="return validateform(this)">
<center><h2>Please enter the details</h2></center>
<center><h3>Account Id :<input type ="text" name="searchaccunt" required></h3>
Start Date:<input type ="text" name="sdate" placeholder="YYYY/MM/DD" pattern="\d{4}/\d{1,2}/\d{1,2}" required><br><br>
End Date:<input type ="text" name="ldate" placeholder="YYYY/MM/DD" pattern="\d{4}/\d{1,2}/\d{1,2}" required><br><br>
<input type="submit" value="submit" name="Search" style="font-size:12pt;color:white;background-color:green;height:30px; width:100px;">

<input type="hidden" value="searchacc11" name="action"></center>
</form><br><br><br><br><br><br><br><br>	<br><br>
<div>
			<center><h3 style="background: lightblue">
				<b>Copyright @ Group_G</b>
			</h3></center>
		</div>
		
		
</body>
</html>