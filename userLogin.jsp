<%-- 
    Document   : userLogin
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>

   <%   String uname=request.getParameter("uname");
        String password=request.getParameter("password");
        int uid=-1;
        String type="";
         try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/shoppingcart?user=;password=","root","");
        PreparedStatement pstmt=con.prepareStatement("select * from users where uname=? and password=?");
        pstmt.setString(1,uname);
        pstmt.setString(2, password);

        pstmt.execute();
        ResultSet rs=pstmt.getResultSet();
        if(rs.next()){
        uid=rs.getInt("uid");
        type=rs.getString("type");
        session.setAttribute("user", uname);
        session.setAttribute("uid", uid);
        session.setAttribute("utype",type);
        %>
        <jsp:forward page="index.jsp"></jsp:forward>
        <%
              }else{
            request.setAttribute("loginfail", "yes"); %>
            <jsp:forward page="login.jsp"></jsp:forward>
           <% }

        }catch(Exception e){
            e.printStackTrace();
            }
        %>
</html>
