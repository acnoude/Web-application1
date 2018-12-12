/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


import java.io.IOException;
import java.io.PrintWriter;
import java.io.File;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import java.util.*;
import java.sql.*;
/**
 *
 *
 * @author Naveen
 */
public class AddProduct extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException,IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {

        MultipartFormDataRequest mrequest=null;
        String filetoUpload="";
        String filetype="";
        String pname="";
        String mfd="";
        String brand="";
        String discount="";
        String cid="";
        String mrp="";
        UploadBean upBean=new UploadBean();
        if (MultipartFormDataRequest.isMultipartFormData(request)){
            System.out.println("multipart request");
						mrequest = new MultipartFormDataRequest(request);
						Hashtable files = mrequest.getFiles();


                        filetype=mrequest.getParameter("imagefile");
                        filetoUpload=mrequest.getParameter("fname");

                        // upBean.setFolderstore(getServletConfig().getServletContext().getRealPath("/cartimages/"));
                        upBean.setFolderstore("/cartimages/");
                        upBean.store(mrequest,"imagefile");
 
                        File ftu=new File(filetoUpload);    
                        String fileName=ftu.getName();

                        pname=mrequest.getParameter("pname");
                        mfd=mrequest.getParameter("mfd");
                        brand=mrequest.getParameter("brand");
                        discount=mrequest.getParameter("discount");
                        cid=mrequest.getParameter("cid");
                        mrp=mrequest.getParameter("mrp");

            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/shoppingcart?user=;password=","root","");
            PreparedStatement pst=con.prepareStatement("insert into products(cid,pname,mrp,discount,imagename,brand,mfd) values(?,?,?,?,?,?,?)");
            pst.setInt(1,Integer.parseInt(cid));
            pst.setString(2, pname);
            pst.setString(3, mrp);
            pst.setString(4,discount);
            pst.setString(5, fileName);
            pst.setString(6, brand);
            pst.setString(7, mfd);
            int i=pst.executeUpdate();
            if(i>0)
                request.setAttribute("productadded", "yes");
            getServletConfig().getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
        }
        } catch(Exception e){
            e.printStackTrace();
            out.close();
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
