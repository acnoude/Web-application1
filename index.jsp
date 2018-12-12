<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Cyber Shopping</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" type="text/css" href="style.css" media="screen" />
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
<li><a href="signout.jsp">Sign Out</a></li>
<%
String utype=session.getAttribute("utype").toString();
%>
<%if(utype.equals("a")){ %>
<li><a href="addProduct.jsp">Add New Product</a></li>
<li><a href="viewsales.jsp">View Sales</a></li>

<%}else{%>
<li><a href="myaccount.jsp">My Account</a></li>
<%}%> 
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


<%if(request.getAttribute("reg")!=null){
    %>
    <b>Your Registration Successful! You can loing now</b>
<%}%>
<%if(request.getAttribute("productadded")!=null){
    %>
    <b>Product has been added Successfully!</b>
<%}%>
    <%if(request.getAttribute("update")!=null){
    %>
    <b>Your account updated Successfully!</b>
<%}%>
<%if(request.getAttribute("checkout")!=null){
    %>
  <br>  <b>Thanks for Shopping! Have a nice Day
    <br>
       Visit Again!!</b>
<%}%>

<br>
    Cyber Shopping technology is making online shopping informative,
effective and rewarding. Smart shoppers can save time, money and effort by using Cyber Shopping
to find the right product from the best merchant at the best price. Product pictures, descriptions,
specifications and prices are provided to assist shoppers in making the best buying decisions.

    <br><br>

      <h3>  Powerful Information Puts You in Control </h3>
      <ol>
With Cyber Shopping you control the shopping experience. The core of our service is information. Product information, product specifications, store information and pricing.
 <li><b>Consumers want to make their own decisions.</b> Use power of information to make the best shopping decision.
<li><b>Consumers demand a wide range of choices.</b> Use our comprehensive selection to find exactly what you want.
<li><b>Consumers deserve the best.</b> The consumer always comes first. You deserve outstanding service and should have your expectations exceeded.
      </ol>
       
</div>

<div class="right">
<h2>Advertisements</h2>
<table>
    <tr><td width="200">
        <img src="images/honda.gif" width="150">
    </td></tr>
</table>
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