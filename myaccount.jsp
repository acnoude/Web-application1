<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Cyber Shopping</title>
<%@page import="java.sql.*"%>
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
<form name="uform" method="post" action="update_ac.jsp">
<%

 ResultSet rs=null;
 int uid=Integer.parseInt(session.getAttribute("uid").toString());
     try{



        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/shoppingcart?user=;password=","root","");

        Statement st=con.createStatement();
        rs=st.executeQuery("select * from users where uid="+uid);

        %>
        <table><tr><td colspan="2" align="center"><b>My Account Information</b></td></tr>
        <%
        while(rs.next()){%>

        <tr><td><b>First Name</b></td><td><input type="text" name="fname" value="<%=rs.getString("fname")%>" ></td></tr>
        <tr><td><b>Last Name</b></td><td><input type="text" name="lname" value="<%=rs.getString("lname")%>" ></td></tr>
        <tr><td><b>User Name</b></td><td><input type="text" name="uname" value="<%=rs.getString("uname")%>" ></td></tr>
        <tr><td><b>Password</b></td><td><input type="text" name="password" value="<%=rs.getString("password")%>" ></td></tr>
        <tr><td><b>Phone</b></td><td><input type="text" name="phno" value="<%=rs.getString("phno")%>" ></td></tr>
        <tr><td><b>Mobile</b></td><td><input type="text" name="contact" value="<%=rs.getString("contact")%>" ></td></tr>
        <tr><td><b>Address</b></td><td><textarea name="address"><%=rs.getString("address")%></textarea></td></tr>
        <tr><td><b>Email</b></td><td><input type="text" name="email" value="<%=rs.getString("email")%>" ></td></tr>
        <tr><td><b>Payment Option</b></td><td><input type="text" name="paymentoption" value="<%=rs.getString("payment_option")%>" ></td></tr>
            <%}
}catch(Exception e){
    e.printStackTrace();  
    }
    %>

        <tr><td colspan="2" align="center"><input type="submit" value="Update"></td></tr>
        </table>
</form>
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