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

h1 {

	color: brown;
}
h5 {
	color: pink;
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
<title>Teller</title>
</head>
<body bgcolor="rosybrown">
<%HttpSession session1 =request.getSession(false);
String str=(String)session1.getAttribute("User");
if(str!=null)
{ %>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header"><center>
      <a style="color: red; font-size: 30px" class="navbar-brand" > WELCOME TO ATSDSNS BANK</a><br>
    <a style="color: Violet; font-size: 20px"> Your trust is our responsibility !</a>
    </div><br><br>
    <ul class="nav navbar-nav">
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown">Status Portal <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="Controller?action=accountstatus">Account Status</a></li>
        </ul>
      </li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown">Statement Portal <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="Controller?action=statement">Account Statement</a></li>
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
<center>

			<div><center><h1 style="background: DarkSeaGreen ">
				<b>Cashier/Teller</b>
			</h1></center>
		</div><hr>

<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox" width="80%" height="50%">
      <div class="item active">
        <img src="images/bigstock-Customer-Relationship-Manageme-84107636.jpg" alt="New York" width="800" height="300">
        <div class="carousel-caption">
          <p>A banker is a fellow who lends his umbrella when the sun is shining and wants it back the minute it begins to rain.</p>
        </div>      
      </div>

      <div class="item">
        <img src="images/download (1).jpg" alt="Chicago" width="600" height="300">
        <div class="carousel-caption">
          <p>A bank is a place that will lend you money if you can prove that you don't need it.</p>
        </div>      
      </div>
    
      <div class="item">
        <img src="images/bank-window-bonus-promotion-918x516.jpg" alt="Los Angeles" width="800" height="300">
        <div class="carousel-caption">
         <div color="black"><p>Because bankers measure their self-worth in money, and pay themselves a lot of it, they think they're fine fellows and don't need to explain themselves.</p></div>
        </div>      
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
</div>


</center>
<hr><div>
			<center><h3 style="background: lightblue">
				<b>Copyright @ Group_G</b>
			</h3></center>
		</div><hr>
<%} 
else
{
response.sendRedirect("BankHome.jsp");
}%>	
			
</body>
</html>