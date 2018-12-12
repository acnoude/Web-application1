<%-- 
    Document   : userReg
    
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <%
        
        String fname=request.getParameter("fname");
        String lname=request.getParameter("lname");
        String sex=request.getParameter("sex");
        String address=request.getParameter("address");
        String phno=request.getParameter("phno");
        String contact=request.getParameter("contact");
        String email=request.getParameter("email");
        String dob=request.getParameter("dob");
        String uname=request.getParameter("uname");
        String password=request.getParameter("password");
        String paymentoption=request.getParameter("paymentoption");
        try{ 
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/shoppingcart?user=;password=","root","");

        PreparedStatement pstmt=con.prepareStatement("insert into users(fname,lname,uname,password,contact,address,email,payment_option,dob,type,gender,phno) values(?,?,?,?,?,?,?,?,?,?,?,?)");
        pstmt.setString(1, fname);
        pstmt.setString(2, lname);
        pstmt.setString(3, uname);
        pstmt.setString(4, password);
        pstmt.setString(5, contact);
        pstmt.setString(6, address);
        pstmt.setString(7, email); 
        pstmt.setString(8, paymentoption);
        pstmt.setString(9, dob);
        pstmt.setString(10, "u");
        pstmt.setString(11,sex);
        pstmt.setString(12,phno);
        int i=pstmt.executeUpdate();
        if(i>0)
            {
            request.setAttribute("reg", "success");
          
            }
        else{ 
            request.setAttribute("reg", "failed");
            
            }
        }catch(Exception e){
          e.printStackTrace();
            }
    %> 
    <jsp:forward page="index.jsp"></jsp:forward>
</html>
