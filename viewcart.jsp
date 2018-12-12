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
<%
if(session.getAttribute("uid")!=null){
String userid=session.getAttribute("uid").toString();
ResultSet rs=null;
try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/shoppingcart?user=;password=","root","");

        PreparedStatement pst=con.prepareStatement("select * from cart where uid=?");
        pst.setInt(1,Integer.parseInt(userid));
        pst.execute();
        rs=pst.getResultSet();

    }catch(Exception e){
        e.printStackTrace();
        }
if(rs!=null){
%>
<form name="cform" method="post" action="checkout.jsp">

    <table width="100%" border="1">
        <tr bgColor=#e4f3f9 ><td width="100%" colspan="3" align="center"><b>Cart Information</b></td></tr>
        <tr><td>
            <table cellpadding="0" cellspacing="10">
         <tr>
            <td><b>Product Name</b></td> <td><b>Price</b></td><td><b>Quantity</b></td><td><b>Total</b></td><td></td>
        </tr>

       <%while(rs.next()){%>

        <tr>
        <td><%=rs.getString("pname")%></td> <td><%=rs.getString("price")%></td><td><%=rs.getInt("qty")%></td><td><%=rs.getString("total")%></td><td>&nbsp;&nbsp;<a href="delcart.jsp?pid=<%=rs.getInt("pid")%>">delete</a></td>
        </tr>


     <%}%>

       <tr><td><a href="viewproducts.jsp">Want to buy more?</a></td><td colspan="2"><input type="submit" value="Check Out"></td></tr>
      </table></td></tr>
    </table>

</form>

<%}else{%>
<b>There are no items in the cart!</b>
<%}}else{%>

<b>There are no items in the cart!</b>
<%}%>
<br><br><br>
    
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