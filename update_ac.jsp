<%-- 
    Document   : update_ac
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
 <%
        int uid=Integer.parseInt(session.getAttribute("uid").toString());
        String fname=request.getParameter("fname");
        String lname=request.getParameter("lname");
        String address=request.getParameter("address");
        String phno=request.getParameter("phno");
        String contact=request.getParameter("contact");
        String email=request.getParameter("email");
        String uname=request.getParameter("uname");
        String password=request.getParameter("password");
        String paymentoption=request.getParameter("paymentoption");
        
        try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/shoppingcart?user=;password=","root","");

        PreparedStatement pstmt=con.prepareStatement("update users set fname=?,lname=?,uname=?,password=?,contact=?,address=?,email=?,payment_option=?,phno=? where uid=?");
        pstmt.setString(1, fname);
        pstmt.setString(2, lname);
        pstmt.setString(3, uname);
        pstmt.setString(4, password);
        pstmt.setString(5, contact);
        pstmt.setString(6, address);
        pstmt.setString(7, email);
        pstmt.setString(8, paymentoption);
        pstmt.setString(9,phno);
        pstmt.setInt(10, uid);

        
        int i=pstmt.executeUpdate();

        }catch(Exception e){
            e.printStackTrace();
            }
        request.setAttribute("update","success");
        %>
        <jsp:forward page="index.jsp"></jsp:forward>
    </body>

</html>
