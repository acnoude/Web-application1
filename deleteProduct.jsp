
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Cyber Shopping</title>
<%@page import="java.sql.*"%>
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


<%

String pid=request.getParameter("pid");
System.out.print(pid);

 ResultSet rs=null;
 try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/shoppingcart?user=;password=","root","");
        PreparedStatement pstmt=con.prepareStatement("delete from salesreport where pid="+pid+"");
        pstmt.executeUpdate();
        PreparedStatement pstmt1=con.prepareStatement("delete from products where pid="+pid+"");
        pstmt1.executeUpdate();
        PreparedStatement pstmt2=con.prepareStatement("delete from cart where pid="+pid+"");
        pstmt2.executeUpdate();
        
    }catch(Exception e){
        e.printStackTrace();
        }
%>





Product removed
</div>

<div class="right">
<h2>Advertisements</h2>
<table>
    <tr><td width="200">
        <img src="images/6.gif" width="150">
    </td></tr>
</table>
</div>

<div style="clear: both;">

    </div>


</div>
<div id="bottom"> </div>
<div id="footer">
&copy; 2009 Cyber Shopping. All Rights Reserved
</div>

</div>
</body>
</html>