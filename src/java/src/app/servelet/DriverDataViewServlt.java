/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package src.app.servelet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import src.app.model.Receipt;
import src.app.model.User;
import src.data.dao.BookingDAO;

/**
 *
 * @author Shashan(ShashanPrabo
 */
@WebServlet(name = "DriverDataViewServlt", urlPatterns = {"/driver"})
public class DriverDataViewServlt extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            HttpSession session = req.getSession(false);
            User user = (User) session.getAttribute("user");
            int userID = user.getUserId();
            System.out.println("Driver" + userID);
            
            BookingDAO bookingDAO = new BookingDAO();
            List<Receipt> driverBooking = bookingDAO.getDriverBooking(userID);
            req.setAttribute("driverBooking", driverBooking);
            
            req.getRequestDispatcher("DriverPortal.jsp").forward(req, resp);
        } catch (SQLException ex) {
            Logger.getLogger(DriverDataViewServlt.class.getName()).log(Level.SEVERE, null, ex);
        }
    
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        String name = null;
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
