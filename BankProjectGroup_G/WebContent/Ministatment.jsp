<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.text.SimpleDateFormat" %>    
    <%@page import="com.bean.TransactionGroup_G" %>
        <%@page import="java.util.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css"
href="NewFile.css">
<!-- you can download the css and can edit it accordingly -->
<script type="text/javascript" charset="utf8"
src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.7.1.min.js"></script>
<script type="text/javascript" charset="utf8"
src="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.1/jquery.dataTables.min.js">
</script>
<script type="text/javascript" charset="utf-8">
$(document).ready(function() {
$('#assocTable').dataTable({"sPaginationType": "full_numbers",'iDisplayLength': 10 });
} );
</script>
<title>Mini Statement</title>
</head>
<body background="images/fondo22.jpg">

<%@include file="Header1.jsp" %>

<div>
			<center><h1 style="background: Wheat ; color: Sienna">
				<b>Mini Statement</b>
			</h1></center>
		</div>


<center>
<table id="assocTable" class="display" border=4 bordercolor="black">
<thead>
<tr>
<td>Transaction ID</td>
<td>Account ID</td>
<td>Transaction Date(YYYY-MM-DD hr:mm:ss)</td>
<td>Description</td>
<td>Amount </td>
<td>Balance </td>
</tr>
</thead>
<tbody>
<% ArrayList<TransactionGroup_G> tr=(ArrayList<TransactionGroup_G>)request.getAttribute("TranList");%>
<%for( TransactionGroup_G t:tr) {%>
<tr>
<td><%=t.getTransid()%></td>
<td><%=t.getAccids() %></td>
<td><%=t.getTransdate()%></td>
<td><%=t.getDescr()%></td>
<td>(&#x20B9)<%=t.getAmount()%></td>
<td>(&#x20B9)<%=t.getBalance()%></td>
</tr>
<%}%>
</tbody>
</table>
<br><br><br><br>
			<a href="Controller?action=menu1">Teller Home Page</a></center>

</center>
<div><br><br><br><br><br><br>
			<center><h3 style="background: lightblue; color: brown">
				<b>Copyright @ Group_G</b>
			</h3></center>
		</div>
		
</center>
</body>
</html>