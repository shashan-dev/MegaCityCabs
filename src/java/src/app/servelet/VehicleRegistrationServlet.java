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
import src.app.model.Vehicle;
import src.data.dao.VehicleDAO;

/**
 *
 * @author Shashan(ShashanPrabo
 */
@WebServlet(name = "VehicleRegistrationServlet", urlPatterns = {"/VehicleRegistrationServlet"})
public class VehicleRegistrationServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        
        // Retrieve form data
        String vehicleType = request.getParameter("vehicleType");
        String vehicleName = request.getParameter("vehicleName");
        String vehicleNumber = request.getParameter("vehicleNumber");
        String ownerName = request.getParameter("ownerName");
        String ownerContact = request.getParameter("ownerContact");
        int driverId = 0;
        String driverName = "";
        String city = "";
        int price = 0;
        

        // Create a Vehicle object
        Vehicle vehicle = new Vehicle(vehicleType, vehicleName, vehicleNumber, ownerName, ownerContact, driverId, driverName, city, price);

        // Register the vehicle using VehicleDAO
        VehicleDAO vehicleDAO = new VehicleDAO();
        boolean isRegistered = vehicleDAO.registerVehicle(vehicle);

        // Redirect based on registration status
        if (isRegistered) {
            response.sendRedirect("admin?status=success"); // Redirect to success page
        } else {
            response.sendRedirect("admin?status=failed"); // Redirect to error page
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
