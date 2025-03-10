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
import javax.servlet.http.HttpSession;
import src.app.model.Customer;
import src.app.model.User;
import src.data.dao.CustomerDAO;
import src.data.dao.UserDAO;

/**
 *
 * @author Shashan(ShashanPrabo
 */
@WebServlet(name = "SignInServlt", urlPatterns = {"/SignInServlt"})
public class SignInServlt extends HttpServlet {

    protected void processRequest(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String loginType = req.getParameter("loginType");

        if ("customer".equals(loginType)) {

            handleCustomerLogin(req, resp);
        } else if ("employee".equals(loginType)) {

            handleEmployeeLogin(req, resp);
        }
    }

    // CUSTOMER
    private void handleCustomerLogin(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String email = req.getParameter("email");
        String password = req.getParameter("password");
        CustomerDAO customerDAO = new CustomerDAO();
        Customer customer = customerDAO.validateCustomer(email, password);

        if (customer != null) {
            HttpSession session = req.getSession();
            session.setAttribute("user", customer);
            resp.sendRedirect("booking");
        } else {
            resp.sendRedirect("SignIn.jsp?error=login_failed");

        }

    }

    // EMPLOYEE - DRIVER OR ADMIN
    private void handleEmployeeLogin(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        System.out.println("TIGEER");

        String stringUserID = req.getParameter("userId");
        Integer IntUserID = Integer.parseInt(stringUserID);

        String userPassword = req.getParameter("userPassword");

        UserDAO userDAO = new UserDAO();
        User user = userDAO.validateUser(IntUserID, userPassword);

        System.out.println(IntUserID);
        System.out.println(userPassword);

        if (user != null) {

            if ("admin".equals(user.getUserRole())) {
                HttpSession session = req.getSession();
                session.setAttribute("user", user);
                resp.sendRedirect("admin");
            } else {
                HttpSession session = req.getSession();
                session.setAttribute("user", user);
                resp.sendRedirect("driver");
            }
        } else {
            resp.sendRedirect("SignIn.jsp?error=login_failed");
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
