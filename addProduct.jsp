<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Cyber Shopping</title>
<%@page import="java.sql.*" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" type="text/css" href="style.css" media="screen" />
     <script type="text/javascript" src="script/calendarDateInput.js"></script>
</head>
<script language="JavaScript">

function addProduct(){
    if(document.pform.pname.value=="" || document.pform.mrp.value=="" || document.pform.imagefile.value=="")
        {
            alert("Enter details properly");
            return false;
        }else{
            document.pform.fname.value=document.pform.imagefile.value;
            document.pform.action="addProduct";
            document.pform.submit();
            return true;
        }
}
</script>
<body>
<div id="wrap">

<div id="header">
    <br>
<h2>Cyber Shopping</h2>
<h2></h2>
</div>
<%
String utype=session.getAttribute("utype").toString();
%>
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

<%
ResultSet rs=null;
 try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/shoppingcart?user=;password=","root","");
        Statement st=con.createStatement();
        rs=st.executeQuery("select * from categories");
}catch(Exception e){
    e.printStackTrace();
    }
%>
<div class="middle">

<form name="pform" method="post" onsubmit="return addProduct()"  enctype="multipart/form-data">

<table>
    <tr bgColor=#e4f3f9 width="100%">
        
    <td width="100%" colspan="2"><b>Add a New Product</b></td>
    </tr>
    <tr>
        <td>Select Product Category</td>
        <td>
            <select name="cid">
                <% 
                while(rs.next()){
                %>
                <option value="<%=rs.getInt("cid")%>"><%=rs.getString("cname")%></option>

                <%}%>
            </select>
        </td>
        </tr>
        <tr>
            <td>Product Name</td><td><input type="text" name="pname"></td>
        </tr>
         <tr>
            <td>MRP</td><td><input type="text" name="mrp"></td>
        </tr>
         <tr>
            <td>Discount</td><td><input type="text" name="discount"></td>
        </tr>
         <tr>
            <td>Brand</td><td><input type="text" name="brand"></td>
        </tr>
         <tr>
            <td>Manufacture Date</td><td><script>DateInput('mfd', true, 'YYYY/MM/DD')</script></td>
        </tr>
         <tr>
            <td>Image file</td><td><input type="file" name="imagefile"></td>
        </tr>
        <tr>
            <td colspan="2"><input type="submit" value="Add Product"></td>
        </tr>
</table>
 <input type="hidden" name="fname">
    
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