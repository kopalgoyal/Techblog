/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.tech.blog.servlet;

import com.tech.blog.daoo.Userdao;
import com.tech.blog.entities1.Message;
import com.tech.blog.entities1.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author LENOVO
 */
@MultipartConfig
public class EditServlet1 extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditServlet1</title>");            
            out.println("</head>");
            out.println("<body>");
            String userEmail=request.getParameter("user_email");
            String userName=request.getParameter("user_name");
            String userPassword=request.getParameter("user_password");
            String userAbout=request.getParameter("user_about");
            Part part=request.getPart("image");
            String imageName=part.getSubmittedFileName();
            HttpSession s=request.getSession();
            User user=(User) s.getAttribute("currentUser");
            user.setEmail(userEmail);
            user.setName(userName);
            user.setPassword(userPassword);
            user.setAbout(userAbout);
            String oldFile=user.getPassword();
            user.setProfile(imageName);
            
            Userdao userdao=new Userdao(ConnectionProvider.getConnection());
          boolean ans=  userdao.updateUser(user);
          if(ans){
              
              
              String path=request.getRealPath("/")+"pics"+File.separator+user.getProfile();
              String pathOldFile =request.getRealPath("/")+"pics"+File.separator+oldFile;
              if(!oldFile.equals("default.png")){
              Helper.deleteFile(pathOldFile);
              }
               if( Helper.saveFile(part.getInputStream(), path)){
                   //out.println("profile updated");
                   Message msg=new Message("profile details updated......", "success", "alert-success");
           
            s.setAttribute("msg", msg);
                
               }
               else{
               // out.println("file not deleted");
                Message msg=new Message("something went wrong", "error", "alert-danger");
            
            s.setAttribute("msg", msg);
                
            }
            
              
          }
          else{
              //out.println("not updated");
              Message msg=new Message("something went wrong", "error", "alert-danger");
            
            s.setAttribute("msg", msg);
          }
       response.sendRedirect("profile.jsp");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
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
     *
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
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
