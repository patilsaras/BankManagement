<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.bean.CustomerStatus"%>
<%@page import="com.bean.Customer"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css"
href="NewFile.css">
<!-- you can download the css and can edit it accordingly -->
<script type="text/javascript" charset="utf8"
src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.7.1.min.js">
</script>
<script type="text/javascript" charset="utf8"
src="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.1/jquery.dataTables.min.js">
</script>
<script type="text/javascript" charset="utf-8">
$(document).ready(function() {
$('#viewAllCust').dataTable({"sPaginationType": "full_numbers",'iDisplayLength': 10 });
} );
</script>
<title>View All C</title>
</head>
<body background="images/fondo22.jpg">

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
    	 <div style="float:right;width:15%;"><font size="2" color="pink"> Welcome <%=str %></font> <font size="2" color="pink"> <%= java.util.Calendar.getInstance().getTime() %></font></div>  
    
  </div>
  
</nav>
   

	<div>
			<center><h1 style="background: lightblue;color: brown ">
				<b>Customer Executive</b>
			</h1></center>
		</div>
<div>
			<center><h1 style="background: Wheat ; color: Sienna ">
				<b>All Customer Status</b>
			</h1></center>
		</div>

<center>
<table id="viewAllCust" class="display" border=4 bordercolor="black">
<thead>

<tr>
<td>CUSTOMER ID</td>
<td>SSN ID</td>
<td>STATUS</td>
<td>DATE(YYYY-MM-DD)</td>
<td>Refresh</td>
</tr>
</thead>
<tbody>
<%ArrayList<CustomerStatus> ac= (ArrayList<CustomerStatus>)request.getAttribute("viewallC"); %>
<%for( CustomerStatus a:ac) {%>

<tr>
<td><%=a.getCustid() %></td>
<td><%=a.getSsnid()%></td>
<td><%=a.getStatus()%></td>
<td><%=a.getLastupdated()%></td>
<td><a href="Controller?action=view2C">Refresh</a></td>
</tr>
<%}%>
</tbody>
</table>

</center>
<br><br>
<div><center><a href="Controller?action=menu"style="font-size: 25px; text-decoration: underline;">Executive Home Page</a>
</center></div><br><br><br><br><br><br><br><br><br>
<div>
			<center><h3 style="background:lightblue; color: brown">
				<b>Copyright @ Group_G</b>
			</h3></center>
		</div>
		<%} 
else
{
	response.sendRedirect("BankHome.jsp");
}%>	
		
</body>
</html>
