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
@WebServlet(name = "UserRegistrationServlet", urlPatterns = {"/UserRegistrationServlet"})
public class UserRegistrationServlet extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String userRole = request.getParameter("userRole");
        String userName = request.getParameter("userName");
        String userNIC = request.getParameter("userNIC");
        String userContact = request.getParameter("userContact");
        String userPassword = request.getParameter("userPassword");
        int userId = 1;
         

        // Create a User object
        User user = new User(userRole, userName, userNIC, userContact, userPassword, userId);

     
        
        // Register the user using UserDAO
        UserDAO userDAO = new UserDAO();
        boolean isRegistered = userDAO.registerUser(user);

        // Redirect based on registration status
        if (isRegistered) {
            response.sendRedirect("admin?status=success"); // Redirect to SignIn page with success message
        } else {
            response.sendRedirect("admin?status=failed"); // Redirect back to SignUp page with error message
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
