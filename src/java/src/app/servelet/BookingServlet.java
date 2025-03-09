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
import src.app.model.Booking;
import src.data.dao.BookingDAO;

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

        req.getRequestDispatcher("CustomerBooking.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        String startLocation = null;
        String endLocation = null;
        String vehicleType = null;

        if ("step1".equals(action)) {
            try {
                // Retrieve parameters from Step 1
                startLocation = req.getParameter("startLocation");
                endLocation = req.getParameter("endLocation");
                vehicleType = req.getParameter("vehicleType");

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

            if (bookingDate != null && bookingTime != null && !bookingDate.isEmpty() && !bookingTime.isEmpty()) {
                String bookingDateTime = bookingDate + " " + bookingTime;
                booking.setBookingDateTime(Timestamp.valueOf(bookingDateTime));

            } else {
                resp.sendRedirect("CustomerBooking.jsp?error=invalid_date_time");
                return;
            }

            try {
                BookingDAO bookingDAO = new BookingDAO();
                Integer id = bookingDAO.saveBooking(booking);
                resp.sendRedirect("Receipt?orderNumber=" + id);
            } catch (SQLException ex) {
                ex.printStackTrace();
                resp.sendRedirect("error.jsp?message=database_error");
            }
        }
    }
}
