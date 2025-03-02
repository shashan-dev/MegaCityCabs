/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package src.app.servelet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import src.app.model.Customer;
import src.data.dao.CustomerDAO;

/**
 *
 * @author Shashan(ShashanPrabo
 */
@WebServlet(name = "CustomerRegistrationServelet", urlPatterns = {"/CustomerRegistrationServelet"})
public class CustomerRegistrationServelet extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String nic = request.getParameter("nic");
        String mobile = request.getParameter("mobile");
        String address = request.getParameter("address");
        String password = request.getParameter("password");
        

        // Create a Customer object
        Customer customer = new Customer(name, email, nic, mobile, address, password);
        
        // Register the customer using CustomerDAO
        CustomerDAO customerDAO = new CustomerDAO();
        boolean isRegistered = customerDAO.registerCustomer(customer);
        
        
        if (isRegistered) {
            response.sendRedirect("SignIn.jsp?registration=success"); // success message
        } else {
            response.sendRedirect("SignUp.jsp?error=registration_failed"); // error message
        }
        
    }

  
}
