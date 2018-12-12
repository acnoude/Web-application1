<%-- 
    Document   : delcart
    
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <%

    try{
        String id=request.getParameter("pid");
        int i=Integer.parseInt(id);

        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/shoppingcart?user=;password=","root","");

        PreparedStatement pst=con.prepareStatement("delete from cart where pid=?");
        pst.setInt(1, i);
        pst.executeUpdate();
 
        pst.close();

        
    }catch(Exception e){
        e.printStackTrace();
        }


%>

<jsp:forward page="viewcart.jsp"></jsp:forward>
</html>
