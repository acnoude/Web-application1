<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Cyber Shopping</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" type="text/css" href="style.css" media="screen" />
<script language="javascript">
function validate()
{
	var qty= document.f1.qty.value;

	if(isNaN(qty))
	{
		window.alert("Please enter proper quantity");
		return false;
	}
	else
	{
		return true;
	}
}
</script>

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
<li><a href="#">About Us</a></li>
<li><a href="#">Contact US</a></li>
<%if(session.getAttribute("user")!=null){%>
<li><a href="#">Welcome, <%=session.getAttribute("user")%></a></li>
<li><a href="signout.jsp">Sign Out</a></li>
<%
String utype=session.getAttribute("utype").toString();
%>
<%if(utype.equals("a")){ %>
<li><a href="addProduct.jsp">Add New Product</a></li>


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
if(session.getAttribute("uid")!=null){
String userid=session.getAttribute("uid").toString();


String pid=request.getParameter("pid");


String pname=request.getParameter("pname");
String price=request.getParameter("cost");
String discount=request.getParameter("discount");
System.out.println("dis in cart"+discount);

%> 
<form name="f1"method="post" action="updatecart.jsp">
 <table>
     <tr bgColor=#e4f3f9>
         <td colspan="3" align="center"><b>Your Cart</b></td>
     </tr>
     <tr>
         <td width="140"><b>Product</b></td><td width="100"><b>Price</b></td><td><b>Quantity</b></td>
     </tr>
     <tr><td><%=pname%></td><td><%=price%></td><td><input type="text" size="5" name="qty"></td></tr>
     <tr><td colspan="3" align="center"><input type="submit" value="Add" onclick="return validate()"></td></tr>
 </table>
 <input type="hidden" name="pid" value="<%=pid%>">
  <input type="hidden" name="uid" value="<%=userid%>">
  <input type="hidden" name="pname" value="<%=pname%>">
  <input type="hidden" name="price" value="<%=price%>">
  <input type="hidden" name="discount" value="<%=discount%>">
</form>
<%}else{%>
<a href="login.jsp">Sign In to shop</a>
<%}%>
</div>
 
<div class="right">
<h2>Advertisements</h2>
<table>
    <tr><td width="200">
        <img src="images/6.gif" width="150">
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