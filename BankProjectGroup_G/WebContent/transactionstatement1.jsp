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
<title>Insert title here</title>
</head>

<body>
<%@include file="Header1.jsp" %>
<br><br><br><br><br>

<script> 
function validateform()
{  
var not=document.myform.TransactionHistory.value;

	if(not==""||not==null)
	{
		alert("Please select any one option");
		return false;
	}
	
}
</script>
<body>

<center>
<h2>Please select an option</h2>
<form action="Controller" method="post" name="myform" onsubmit="return validateform()">
<input type="radio" name="TransactionHistory" value="ByNtrans"><b>Get Last N Transactions</b><br><br>
<input type="radio" name="TransactionHistory" value="ByDatetrans"><b>Get By Start Date And End Date</b><br><br>
<input type="submit" name="submit" value="submit" style="font-size:12pt;color:white;background-color:green;height:30px; width:100px;">

<br><br><br><br><br><br><br><br><br><br><br><br>
<div>
			<center><h3 style="background: lightblue">
				<b>Copyright @ Group_G</b>
			</h3></center>
		</div>
		<input type="hidden" name="action" value="transactionState">
</form>
</center>

</body>
</html>