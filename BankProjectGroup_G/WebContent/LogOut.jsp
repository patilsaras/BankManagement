<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Log Out</title>
</head>
<body bgcolor="LavenderBlush ">
<%HttpSession session1 =request.getSession(false);
String str=(String)session1.getAttribute("User");
if(str!=null)
{ %>
<center>
<div>
<h3><%=request.getAttribute("message") %></h3>
<a href="Controller?action=home1">Log Out</a>
</div><br><br><br><br><br><br><br><br><br><br><br><br>
<div>
			<center><h3 style="background: lightblue">
				<b>Copyright @ Group_G</b>
			</h3></center>
		</div>
</center>
<%} 
else
{
response.sendRedirect("BankHome.jsp");
}%>
</body>
</html>