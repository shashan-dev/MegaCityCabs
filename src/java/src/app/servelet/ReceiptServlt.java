/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package src.app.servelet;

import java.io.IOException;

import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import src.app.model.Receipt;
import src.app.model.User;
import src.data.dao.BookingDAO;
import src.data.dao.UserDAO;

/**
 *
 * @author Shashan(ShashanPrabo
 */


@WebServlet(name = "ReceiptServlt", urlPatterns = {"/Receipt"})
public class ReceiptServlt extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // Process the orderNumber parameter from the URL
            processRequest(req, resp);
        } catch (SQLException ex) {
            Logger.getLogger(ReceiptServlt.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        try {
            processRequest(req, resp);
        } catch (SQLException ex) {
            Logger.getLogger(ReceiptServlt.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    protected void processRequest(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException, SQLException {

        System.out.println("Servlet triggered!"); 

        String id = req.getParameter("orderNumber");
        System.out.println("Order Number: " + id); 
        if (id != null && !id.isEmpty()) {
            int orderNumber = Integer.parseInt(id);
            System.out.println("Parsed Order Number: " + orderNumber); 
            BookingDAO bookingDAO = new BookingDAO();
            List<Receipt> receipt = bookingDAO.getBookingReceipt(orderNumber);
            
            req.setAttribute("receipt", receipt);
        } else {
            System.out.println("Order Number parameter is missing!"); 
        }

        req.getRequestDispatcher("Receipt.jsp").forward(req, resp);
    }
}