<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
body {
 background-image: url("images/London.bankofengland.arp.jpg");
}

h1 {
	color: blue;
}
h3{color:blue}
table,th,td {
	border: 1px solid blue;
	 border-collapse: collapse; 
}

th,td {
	padding: 10px;
}
</style>
<style>
/* Full-width input fields */
input[type=text], input[type=password] {
    width: 60%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
}

/* Set a style for all buttons */
button {
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 20%;
}

button:hover {
    opacity: 0.8;
}

/* Extra styles for the cancel button */
.cancelbtn {
    width: auto;
    padding: 10px 18px;
    background-color: #f44336;
}

/* Center the image and position the close button */
.imgcontainer {
    text-align: center;
    margin: 24px 0 12px 0;
    position: relative;
}

img.avatar {
    width: 20%;
    border-radius: 30%;
}

.container {
    padding: 16px;
}

span.psw {
    float: right;
    padding-top: 16px;
}

/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
    padding-top: 60px;
}

/* Modal Content/Box */
.modal-content {
    background-color: #fefefe;
    margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
    border: 1px solid #888;
    width: 50%; /* Could be more or less, depending on screen size */
}

/* The Close Button (x) */
.close {
    position: absolute;
    right: 25px;
    top: 0;
    color: #000;
    font-size: 35px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: red;
    cursor: pointer;
}

/* Add Zoom Animation */
.animate {
    -webkit-animation: animatezoom 0.6s;
    animation: animatezoom 0.6s
}

@-webkit-keyframes animatezoom {
    from {-webkit-transform: scale(0)} 
    to {-webkit-transform: scale(1)}
}
    
@keyframes animatezoom {
    from {transform: scale(0)} 
    to {transform: scale(1)}
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
    span.psw {
       display: block;
       float: none;
    }
    .cancelbtn {
       width: 100%;
    }
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home Page</title>
</head>
<body bgcolor="MediumOrchid">
<script>  
function validateform(login)
{  
var id=document.login.userid.value;  
var password=document.login.password.value;  
  
if (id==null || id=="")
{  
  alert("Id can't be blank");  
  return false;  
}
if (password==null || password=="")
{  
  alert("Password can't be blank");  
  return false;  
}

}  
</script>  

<hr><div>
			<center><h1 style="background: lightblue">
				<b>WELCOME TO ATSDSNS BANK</b>
			</h1></center>
		</div><hr>

<br><br><br><br><br><br><br><br><br><br><br><br>


<center><button onclick="document.getElementById('id01').style.display='block'" style="width:auto;">Login</button></center>

<div id="id01" class="modal">
  
  <form class="modal-content animate" action="Controller" method="post" name="login" onsubmit="return validateform(this)">
    <div class="imgcontainer" width="50%" height="50%" >
      <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
      <img src="images/images.png" alt="Avatar" class="avatar">
    </div>

    <div class="container">
      <center><label><b>Username</b></label>
      <input type="text" placeholder="Enter Username" name="userid" required><br></center>

     <center><label><b>Password</b></label>
      <input type="password" placeholder="Enter Password" name="password" required></center>
        
      <center><button type="submit">Login</button> <div class="container" style="background-color:#f1f1f1">
      <button type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">Cancel</button></center>
    </div>  
     <input type="hidden" name="action" value="user">
     </div>
     <h3><%String s=(String)request.getAttribute("message"); %></h3>
     <%if(s!=null){%>
    <font color="red"><%=s%></font> 
     <%} %>
  </form>
</div>
</body>
</html>