/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package src.app.servelet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import src.app.model.User;
import src.data.dao.UserDAO;

/**
 *
 * @author Shashan(ShashanPrabo
 */
@WebServlet(name = "UserUpdateServlt", urlPatterns = {"/UserUpdateServlt"})
public class UserUpdateServlt extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userName = request.getParameter("editUserName");
        String userNIC =  request.getParameter("editUserNIC");
        String userContactNumber =  request.getParameter("editUserContact");
        String userPassword = request.getParameter("editUserPassword");
        int userId = Integer.parseInt(request.getParameter("editUserRole"));
         
        User user = new User("", userName, userNIC, userContactNumber, userPassword,userId);
        

        UserDAO userDAO = new UserDAO();
        boolean isUpdated= userDAO.updateUser(user);
        
            if (isUpdated) {
            response.sendRedirect("admin?status=success"); 
        } else {
            response.sendRedirect("admin?status=failed"); 
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
