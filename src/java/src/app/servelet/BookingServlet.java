package src.app.servelet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;
import src.app.model.Booking;
import src.app.model.Customer;
import src.app.model.Receipt;
import src.app.model.User;
import src.app.model.Vehicle;
import src.data.dao.BookingDAO;
import src.data.dao.CityDAO;
import src.data.dao.VehicleDAO;

@WebServlet("/booking")
public class BookingServlet extends HttpServlet {

    private BookingDAO bookingDAO;

    @Override
    public void init() throws ServletException {
        // Initialize the BookingDAO object
        bookingDAO = new BookingDAO();
        System.out.println("BookingServlet initialized. bookingDAO is set.");

        
    }
    
    

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        
        try {
            CityDAO cityDAO = new CityDAO();
            List<String> cities = cityDAO.getDistinctCities();
            List<String> Dropcities = cityDAO.getDistinctDropCities();
            req.setAttribute("cities", cities);
            req.setAttribute("Dropcities", Dropcities);
            
            VehicleDAO vehicleDAO = new VehicleDAO();
            List<String> vehicles = vehicleDAO.getDistinctVehicleType();
            req.setAttribute("vehicleTypes", vehicles);
            
            HttpSession session = req.getSession(false);
            Customer customer = (Customer) session.getAttribute("user");
            String Name = customer.getName();
            System.out.println(Name);
            BookingDAO bookingDAO = new BookingDAO();
            List<Receipt> myBooking = bookingDAO.getMyBooking(Name);
            req.setAttribute("myBooking", myBooking);
            
            
            
            req.getRequestDispatcher("CustomerBooking.jsp").forward(req, resp);
        } catch (SQLException ex) {
            Logger.getLogger(BookingServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    protected void processRequest(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        String startLocation = null;
        String endLocation = null;
        String vehicleType = null;
        String userName = null;

        
          
         

        if ("step1".equals(action)) {
            try {
                // Retrieve parameters from Step 1
                startLocation = req.getParameter("startLocation");
                endLocation = req.getParameter("endLocation");
                vehicleType = req.getParameter("vehicleType");
                userName = req.getParameter("userName");
                
                System.out.println(userName);
                 System.out.println(vehicleType);

                List<String> vehicleNames = bookingDAO.getVehicleNames(startLocation, vehicleType);

                req.setAttribute("vehicleNames", vehicleNames);

                req.getRequestDispatcher("CustomerBooking.jsp").forward(req, resp);
            } catch (SQLException ex) {
                ex.printStackTrace();
                resp.sendRedirect("error.jsp?message=database_error");
            }
        } else if ("step2".equals(action)) {
            startLocation = req.getParameter("startLocation");
            endLocation = req.getParameter("endLocation");
            vehicleType = req.getParameter("vehicleType");
            
            Booking booking = new Booking();
            booking.setStartLocation(startLocation);
            booking.setEndLocation(endLocation);
            booking.setVehicleType(vehicleType);
            booking.setVehicleName(req.getParameter("vehicleName"));
            booking.setPaymentMethod(req.getParameter("paymentMethod"));
            
            
            String bookingDate = req.getParameter("bookingDate");
            String bookingHour = req.getParameter("bookingHour");
            String bookingMinute = req.getParameter("bookingMinute");
            String bookingTime = bookingHour + ":" + bookingMinute + ":00";
            userName = req.getParameter("userName");
            
            

            if (bookingDate != null && bookingTime != null && !bookingDate.isEmpty() && !bookingTime.isEmpty()) {
                String bookingDateTime = bookingDate + " " + bookingTime;
                booking.setBookingDateTime(Timestamp.valueOf(bookingDateTime));

            } else {
                resp.sendRedirect("CustomerBooking.jsp?error=invalid_date_time");
                return;
            }

            try {
       
                BookingDAO bookingDAO = new BookingDAO();
                Integer id = bookingDAO.saveBooking(booking, userName);
                resp.sendRedirect("Receipt?orderNumber=" + id);
            } catch (SQLException ex) {
                ex.printStackTrace();
                resp.sendRedirect("error.jsp?message=database_error");
            }
        }
    }
}
