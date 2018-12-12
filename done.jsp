<%-- 
    Document   : done
  
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@page import="java.sql.*"%>
        <%

    ResultSet rs=null;
     try{



        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/shoppingcart?user=;password=","root","");
        String saddr=request.getParameter("saddr");
        String uid=session.getAttribute("uid").toString();

        Statement st=con.createStatement();
        rs=st.executeQuery("select * from users where uid="+uid);
        while(rs.next()){
        System.out.println("Before Update");
        PreparedStatement pst1=con.prepareStatement("update users set shippingadd=?  where uid='"+uid+"'");
        pst1.setString(1,saddr);
        pst1.executeUpdate();
        System.out.println("After Update");
        pst1.close();

            }

        }
     catch(Exception e){
        e.printStackTrace();
        }%>
    </head>
    <body>


        <%request.setAttribute("checkout","success");%>
        <jsp:forward page="index.jsp"></jsp:forward>

    </body>
</html>
