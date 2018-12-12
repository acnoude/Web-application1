<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Cyber Shopping</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" type="text/css" href="style.css" media="screen" />
     <script type="text/javascript" src="script/calendarDateInput.js"></script>
</head>
<script language="JavaScript">
function doRegister(){

	var valid=true;
	var errorMsg = "";

	var unamecheck=new RegExp("^[a-zA-Z0-9_\\d]+$","g");
   // var datecheck=new RegExp("^[{2}0-9");
	/*var value1=new RegExp("^[a-zA-Z'-._\\d]+$","g");
	var value2=new RegExp("[a-zA-Z\\d]+$","g");//no special chars
	var value3=new RegExp("^[a-zA-Z\\d.]+$","g");//no spaces,no special chars(^ for space)
	var value4=new RegExp("[\\d]+$");//no letters
	var value5=new RegExp("[a-zA-Z\\d.]+$","g");//no special chars except dot

	if(!value.match(value1))
{alert("please enter valid details");return valid;}

	 */

	var name=document.rform.fname.value;
	var namecheck = new RegExp("^[a-zA-Z0-9\\d]+$","g");

	if(name == "")
	{
		errorMsg += "\nNAME: Provide your first name\n";
	}

	else if(name.length<3 || name.length >30)
	{

		errorMsg += "\nNAME: Name lenght MAX 30 MIN 3 Chars\n";
	}

	else if(!name.match(namecheck))
	{

		errorMsg += "\nNAME: Your name should not contain any special characters\n";

	}




	var phone = document.rform.contact.value;
	if(phone == "")
	{

		errorMsg += "\nPHONE: Enter phone no.\n";
	}
	else if(isNaN(phone))
	{

		errorMsg += "\nPHONE: Enter valid phone no.\n";
	}

    var email = document.rform.email.value;

	var apos=document.rform.email.value.indexOf("@");


	var dotpos=document.rform.email.value.lastIndexOf(".")


	if(email=="")
	{

		errorMsg += "\nEMAIL: Provide  your emailid\n";
	}
	else if((apos<1)||((dotpos-apos)<2))
	{
		errorMsg += "\nEMAIL: Provide valid emailid\n";
	}


    var address = document.rform.address.value;
	if(address == "")
	{

		errorMsg += "\nADDRESS: Enter address\n";
	}


    var username=document.rform.uname.value;
	var password=document.rform.password.value;
	var repassword=document.rform.rpassword.value;

	if(username==""||username.length < 6||username.length > 20)
	{
		errorMsg += "\nUSERNAME: Your Username must be at least 6 characters\n";

	}
	else if(!username.match(unamecheck))
	{
		errorMsg += "\nUSERNAME: Your username should not contain any special characters except UNDERSCORE and should start with alphabet\n";
	}


	if (password.length < 6||password.length > 20)
	{
		errorMsg += "\nPASSWORD: Password should be atleast 6 characters and atmost 20 characters\n";

	}
	if((password.search("'"))>=0)
	{
		errorMsg+="\nPASSWORD: Please remove apostrophe from your Password!\n";

	}

	if(password!=repassword)
	{
		errorMsg += "\nPASSWORDS: Passwords not matching\n";
	}
if (errorMsg != "")
	{
		alert(errorMsg);
		return false;
	}
	else
	{

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
 <%}else{%>
<li><a href="registration.jsp">Register</a></li>
<li><a href="login.jsp">Sign In</a></li>
<%}%>
<li><a href="#">Cart</a></li>
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
<form name="rform" method="post" action="userReg.jsp" onsubmit="return doRegister()">

    <table width="100%">
        <tr bgColor=#e4f3f9 ><td width="100%" colspan="2"><b>Registration</b></td></tr>
        <tr><td colspan="2">Registration with Cyber Shopping is Fast and Easy !
            By registering with Cyber Shopping, you get access to India's largest Cyber services ,more value for your shopping. </td></tr>
      <tr bgColor=#e4f3f9><td colspan="2"><b>Personal Information</b></td></tr>
      <tr>
            <td>First Name</td> <td><input type="text" name="fname"></td>
        </tr>
        <tr>
            <td>Last Name</td> <td><input type="text" name="lname"></td>
        </tr>
        <tr>
            <td>Gender: </td>
			
            <td>

            <select name="sex">
              <option value="" selected="selected">--Select --</option>
              <option value="M">Male</option>		
              <option value="F">Female</option>
           </select>
            </td>

    	</tr>
        <tr>
            <td valign="top">Address</td><td><textarea name="address" cols="20" rows="5"></textarea></td>
        </tr>
        <tr><td>Phone No</td><td><input type="text" name="phno"></td></tr>
        <tr><td>Mobile No</td><td><input type="text" name="contact"></td></tr>
        <tr><td>Email</td><td><input type="text" name="email"></td></tr>
        <tr><td>Date of Birth</td><td><script>DateInput('dob', true, 'YYYY/MM/DD')</script></td></tr>
        <tr bgColor=#e4f3f9><td colspan="2"><b>Account Information</b></td></tr>
       <tr>
            <td>User Name</td> <td><input type="text" name="uname"></td> 
        </tr>
        <tr>
            <td>Password</td> <td><input type="password" name="password"></td> 
        </tr>
        <tr>
            <td>Retype Password</td> <td><input type="password" name="rpassword"></td>
        </tr>
        <tr>
			<td>Default Payment Option:</td>
			<td>


		   <select name="paymentoption">
               <option value="">--Select Default Payment Option--</option>              
                <option value="Credit Card(Visa/MasterCard/Diner-W2l)">Credit Card(Visa/MasterCard/Diner-W2l)</option>
                <option value="Kotak Mahindra Bank Visa Net C@rd">Kotak Mahindra Bank Visa Net C@rd</option>
                <option value="HDFC Net Banking">HDFC Net Banking</option>
                <option value="Pay in 6 easy installments with your ICICI BANK Credit Card">Pay in 6 easy installments with your ICICI BANK Credit Card</option>
            
                <option value="American Express Credit Card">American Express Credit Card</option>
                <option value="SBI Credit Card">SBI Credit Card</option>
                <option value="ICICI Bank Cyber Credit Card">ICICI Bank Cyber Credit Card</option>

                </select>


	       <td>
       </tr>
       <tr><td colspan="2"><input type="submit" value="Register"></td></tr>

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