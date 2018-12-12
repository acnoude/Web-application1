<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Cyber Shopping</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" type="text/css" href="style.css" media="screen" />
     <script type="text/javascript" src="script/calendarDateInput.js"></script>
</head>

<body>
<div id="wrap">

<div id="header">
    <br>
<h2>Cyber Shopping</h2>
<h2></h2>
</div>

<div id="top"> </div>
<div id="contentt">
<div id="headermenu">
<div class="headerm">
<ul>
<li><a href="index.jsp">Home</a></li>
<li><a href="about.jsp">About Us</a></li>
<li><a href="contact.jsp">Contact US</a></li>
<%if(session.getAttribute("user")!=null){%>
<li><a href="#">Welcome, <%=session.getAttribute("user")%></a></li>
 <%}else{%>
<li><a href="registration.jsp">Register</a></li>
<li><a href="login.jsp">Sign In</a></li>
<%}%>
<li><a href="viewcart.jsp">Cart</a></li>
</ul>
</div>
</div> 

<div class="left">
<h2>Categories :</h2>
<ul>
<li><a href="viewproducts.jsp?cid=1">Automobiles</a></li>
<li><a href="viewproducts.jsp?cid=2">Electornics & Computers</a></li>
<li><a href="viewproducts.jsp?cid=3">Home Appliances</a></li>
<li><a href="viewproducts.jsp?cid=4">Jewellery</a></li>

<li><a href="viewproducts.jsp?cid=5">Moblies & Cameras</a></li>
<li><a href="viewproducts.jsp?cid=6">Toys & Gifts</a></li>
</ul>

 <img src="images/7.gif" width="150">
</div>

<div class="middle">
<br>

<table width="300" bgcolor="#e4f3f9" cellspacing="0"  align="center" cellpadding=5>
<tr bgcolor="#883388"><th colspan=2><font color=white>Tech Innova</font></th></tr>
<tr><th align="left">Address :</th><td align="left"><font color=maroon>T8,Ballad Estates,Tarnaka</font></td></tr>
<tr><th align="left">Phone No:</th><td align="left"><font color=maroon>040-65262564</font></td></tr>
<tr><th align="left">E-mail:</th><td align="left"><font color=maroon>reachus@techinnova.co.in</font></td></tr>
<tr><th align="left">Website:</th><td align="left"><font color=maroon>www.techinnova.co.in</font></td></tr>
</table>
<br><br><br><br><br><br>
    <br><br><br><br><br><br>
</div>

<div class="right">
<h2>Advertisements</h2>

</div>

<div style="clear: both;"> </div>

</div>
<div id="bottom"> </div>
<div id="footer">
&copy; 2009 Cyber Shopping. All Rights Reserved
</div>

</div>
</body>
</html>