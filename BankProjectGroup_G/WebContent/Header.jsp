<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
h3 {
	color: brown;
}
h1 {
	color: brown;

}

h5 {
	color: pink;
}
h2 {
	color: Sienna ;
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
<title>Insert title here</title>
</head>
<body>
<body bgcolor="rosybrown">
<%HttpSession session1 =request.getSession(false);
String str=(String)session1.getAttribute("User");
if(str!=null)
{ %>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a style="color: red; font-size: 30px" class="navbar-brand" > WELCOME TO ATSDSNS BANK</a><br>
    <a style="color: Violet; font-size: 20px"> Your trust is our responsibility !</a>
    </div><br><br>
    <ul class="nav navbar-nav">
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown">Customer Portal <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="Controller?action=createcustomer"> Create New Customer </a></li>
          <li><a href="Controller?action=updatecustomer">Update Customer</a></li>
          <li><a href="Controller?action=deletecustomer">Delete Customer</a></li>
        </ul>
      </li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown">Account Portal <span class="caret"></span></a>
        <ul class="dropdown-menu">
      <li><a href="Controller?action=createaccount">Create Account</a></li>
      <li><a href="Controller?action=deleteaccount">Delete Account</a></li>
      </ul>
    </li>
     <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown">Status <span class="caret"></span></a>
        <ul class="dropdown-menu">
      <li><a href="Controller?action=accountstatus1"> Account Status</a></li>
      <li><a href="Controller?action=customerstatus">Customer Status</a></li>
      </ul>
    </li>
     <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown">View Customer <span class="caret"></span></a>
        <ul class="dropdown-menu">
        
      <li><a href="Controller?action=viewcustomer">View Customer</a></li>
      </ul>
    </li>
     <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown">Logout <span class="caret"></span></a>
        <ul class="dropdown-menu">
    <li  class="active"><a href="Controller?action=home1">Logout</a></li>
    </ul>
    </li>
    </ul>
    	 <div style="float:right;width:15%;"><h5> Welcome <%=str %></h5> <h5> <%= java.util.Calendar.getInstance().getTime() %></h5></div>  
    
  </div>
  
</nav>
   

	<div>
			<center><h1 style="background: lightblue ">
				<b>Customer Executive</b>
			</h1></center>
		</div><%} 
else
{
	response.sendRedirect("BankHome.jsp");
}%>
</body>
</html>