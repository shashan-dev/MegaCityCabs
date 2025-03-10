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
import src.app.model.Vehicle;
import src.data.dao.BookingDAO;
import src.data.dao.CityDAO;
import src.data.dao.UserDAO;
import src.data.dao.VehicleDAO;

@WebServlet(name = "UsersViewServlet", urlPatterns = {"/admin"})
public class AdminDataViewServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String vehicleType =  request.getParameter("alloVehicleType");
            
            // Fetch Users
            UserDAO userDAO = new UserDAO();
            List<User> users = userDAO.getAllUsers();
            List<String> drivers = userDAO.getDistinctDrivers();
            List<Integer> Ids = userDAO.getAllEmpIds();
            
            // Fetch all vehicles
            VehicleDAO vehicleDAO = new VehicleDAO();
            List<Vehicle> vehicles = vehicleDAO.getAllVehicles();
            List<String> vehicleNo = vehicleDAO.getDistinctVehicleNo();
            List<Vehicle> vehicleAllocation = vehicleDAO.getAllVehiclesAcclocations();
            
            
            // Fetch distinct city names from the database
            CityDAO cityDAO = new CityDAO();
            List<String> cities = cityDAO.getDistinctCities();
            
            BookingDAO bookingDAO = new BookingDAO();
            List<Receipt> allBookings = bookingDAO.getAllBooking();
            
            
            
            
            // Set Attribute
            request.setAttribute("users", users);
            request.setAttribute("vehicles", vehicles);
            request.setAttribute("cities", cities);
            request.setAttribute("vehicleNo",vehicleNo);
            request.setAttribute("drivers",drivers);
            request.setAttribute("vehicleAllocation",vehicleAllocation);
            request.setAttribute("allBookings",allBookings);
            request.setAttribute("Ids", Ids);
            
            
            // Admin JSP
            request.getRequestDispatcher("/AdminPortal.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(AdminDataViewServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
      
    }
}