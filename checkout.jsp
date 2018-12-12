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
<form method="post" action="done.jsp">
 <%
 int grandTotal=0;
    ResultSet rs=null;
     try{



        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/shoppingcart?user=;password=","root","");

        String uid=session.getAttribute("uid").toString();
                
        Statement st=con.createStatement();
        %>
        <table> <tr bgColor=#e4f3f9><td width="100%" colspan="4" align="center"><b>Cart Information</b></td></tr>
         <tr>
            <td wigth="100"><b>Product Name</b></td> <td width="100"><b>Price</b></td><td width="100"><b>Quantity</b></td><td><b>Total</b></td>
        </tr>
        <%

        rs=st.executeQuery("select * from cart where uid="+uid);
        while(rs.next()){
        int pid= rs.getInt("pid");
        String pname=rs.getString("pname");
        String price=rs.getString("price");
        int qty=rs.getInt("qty");
        String total=rs.getString("total");
        float tot=Float.parseFloat(total);
        grandTotal+=tot;
        
        %>

       
        


         

 

        <tr>
        <td><%=pname%></td> <td><%=price%></td><td><%=qty%></td><td><%=total%></td>
        </tr>

      


        <%PreparedStatement pst=con.prepareStatement("insert into salesreport values(?,?,?,?,?,?)");
        pst.setInt(1,pid);
        pst.setInt(2,Integer.parseInt(uid));
        pst.setString(3,pname);
        pst.setString(4,price);
        pst.setInt(5,qty);
        pst.setString(6,total);
        pst.executeUpdate();
        pst.close();

        

        }


        PreparedStatement pst1=con.prepareStatement("delete from cart where uid=?");
        pst1.setInt(1,Integer.parseInt(uid));
        pst1.executeUpdate();

 
    }catch(Exception e){
        e.printStackTrace();
        }
    
%>
  <tr><td colspan="4" align="right"><font color="blue"><b>Grand Total:&nbsp;</b></font><font color="red"><b>INR&nbsp;<%=grandTotal%></b></font></td></tr>
  <tr><td><font color="red"><b>Note:Your order will be processed & products will be delivered in 24Hrs</b></font></td></tr>
  <tr><td>Shipping Address:</td><td><textarea name="saddr" cols="20" rows="5"></textarea></td>
  </tr>
  <tr><td colspan="4"><input type="submit" value="CheckOut"></td></tr>
 </table>

 </form>
 
    
</div>

<div class="right">


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