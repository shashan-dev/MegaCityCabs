package src.data.dao;

import com.mysql.cj.jdbc.Driver;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;
import src.app.model.Booking;
import src.app.model.Receipt;
import src.app.model.Vehicle;
import src.data.utils.DataLayer;

public class BookingDAO {
    
    

    public List<String> getVehicleNames(String startLocation, String vehicleType) throws SQLException {
        List<String> vehicleNames = new ArrayList<>();
        String sql = "SELECT vehicleName FROM vehicleallocations WHERE city = ? AND vehicleType = ?";

        System.out.println("Executing SQL Query: " + sql);
        System.out.println("Parameters: startLocation=" + startLocation + ", vehicleType=" + vehicleType);

        try (Connection conn = DataLayer.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, startLocation);
            ps.setString(2, vehicleType);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    vehicleNames.add(rs.getString("vehicleName"));
                }
            }
        }

        System.out.println("Retrieved Vehicle Names: " + vehicleNames);

        return vehicleNames;
    }

    public int saveBooking(Booking booking, String userName) throws SQLException {

        Vehicle vehicle = getAllocatedVehicleDetails(booking.getVehicleType(), booking.getVehicleName(), booking.getStartLocation());
        if (vehicle == null) {
            throw new SQLException("No vehicle found for the given details.");
        }

        Integer mileage = getMileage(booking.getStartLocation(), booking.getEndLocation());
        if (mileage == null) {
            throw new SQLException("Mileage calculation failed.");
        }

        String sql = "INSERT INTO bookingdetails (startLocation, endLocation, vehicleType, vehicleName, bookingDateTime, paymentType, clientName, amount, driverID, driverName, created, mileage, vehicleNo) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        System.out.println("Executing SQL Query: " + sql);
        System.out.println("Parameters: startLocation=" + booking.getStartLocation()
                + ", endLocation=" + booking.getEndLocation()
                + ", vehicleType=" + booking.getVehicleType()
                + ", vehicleName=" + booking.getVehicleName()
                + ", bookingDateTime=" + booking.getBookingDateTime()
                + ", paymentType=" + booking.getPaymentMethod());
        System.out.println(userName);

        try (Connection conn = DataLayer.getConnection(); PreparedStatement ps = conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) { // Fix: Add RETURN_GENERATED_KEYS
            ps.setString(1, booking.getStartLocation());
            ps.setString(2, booking.getEndLocation());
            ps.setString(3, booking.getVehicleType());
            ps.setString(4, booking.getVehicleName());
            ps.setTimestamp(5, booking.getBookingDateTime());
            ps.setString(6, booking.getPaymentMethod());
            ps.setString(7, userName);
            ps.setFloat(8, vehicle.getPrice());
            ps.setInt(9, vehicle.getDriverId());
            ps.setString(10, vehicle.getDrivrName());
            ps.setTimestamp(11, booking.getBookingDateTime());
            ps.setInt(12, mileage);
            ps.setString(13, vehicle.getVehicleNumber());

            int affectedRows = ps.executeUpdate();

            if (affectedRows == 0) {
                throw new SQLException("Creating booking failed, no rows affected.");
            }

            try (ResultSet generatedKeys = ps.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    int logId = generatedKeys.getInt(1);
                    System.out.println("Booking saved successfully. Log ID: " + logId);
                    return logId;
                } else {
                    throw new SQLException("Creating booking failed, no ID obtained.");
                }
            }
        }
    }

    public Vehicle getAllocatedVehicleDetails(String vehicleType, String vehicleName, String startLocation) throws SQLException {
        String sql = "SELECT driverID, driverName, city, price, vehicleNumber FROM vehicleallocations WHERE vehicleType = ? AND vehicleName = ? AND city = ?";
        try (Connection conn = DataLayer.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, vehicleType);
            ps.setString(2, vehicleName);
            ps.setString(3, startLocation);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    int driverId = rs.getInt("driverID");
                    String driverName = rs.getString("driverName");
                    String vehicleNumber = rs.getString("vehicleNumber");
                    String city = rs.getString("city");
                    Float price = rs.getFloat("price");
                    return new Vehicle(vehicleType, vehicleName, vehicleNumber, "ownerId", "ownerContact", driverId, driverName, city, price);
                } else {
                    throw new SQLException("Driver not found for vehicle: " + vehicleName + " and location: " + startLocation);
                }
            }
        }
    }

    public int getMileage(String startLocation, String endLocation) throws SQLException {
        String sql = "SELECT KM FROM cities WHERE cityName = ? AND EndCity = ?";
        try (Connection conn = DataLayer.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, startLocation);
            ps.setString(2, endLocation);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("KM");
                } else {
                    throw new SQLException(" not found");
                }
            }
        }
    }

    public Receipt getBookingDetails(int orderNumber) throws SQLException {
        String sql = "SELECT * FROM bookingdetails WHERE orderNumber = ?";
        try (Connection conn = DataLayer.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, orderNumber);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Receipt receipt = new Receipt();
                    receipt.setOrderNumber(rs.getInt("orderNumber"));
                    receipt.setClientName(rs.getString("clientName"));
                    receipt.setStartLocation(rs.getString("startLocation"));
                    receipt.setEndLocation(rs.getString("endLocation"));
                    receipt.setBookingDateTime(rs.getTimestamp("bookingDateTime"));
                    receipt.setVehicleNumber(rs.getString("vehicleNumber"));
                    receipt.setVehicleType(rs.getString("vehicleType"));
                    receipt.setVehicleName(rs.getString("vehicleName"));
                    receipt.setKmCount(rs.getFloat("kmCount"));
                    receipt.setPricePerKm(rs.getFloat("pricePerKm"));
                    receipt.setTotalPrice(rs.getFloat("totalPrice"));
                    receipt.setPaymentMethod(rs.getString("paymentMethod"));
                    return receipt;
                } else {
                    throw new SQLException("Booking not found for order number: " + orderNumber);
                }
            }
        }
    }

    public List<Receipt> getBookingReceipt(int orderNumber) throws SQLException {
        List<Receipt> receipts = new ArrayList<>(); // List to store Receipt objects
        String sql = "SELECT * FROM bookingdetails WHERE bookingId = ?";

        try (Connection conn = DataLayer.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, orderNumber);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) { 
                    Receipt receipt = new Receipt(); 

                    // Populate the Receipt object with data from the ResultSet
                    receipt.setOrderNumber(rs.getInt("bookingId"));
                    receipt.setClientName(rs.getString("clientName"));
                    receipt.setStartLocation(rs.getString("startLocation"));
                    receipt.setEndLocation(rs.getString("endLocation"));
                    receipt.setBookingDateTime(rs.getTimestamp("bookingDateTime"));
                    receipt.setVehicleNumber(rs.getString("vehicleNo"));
                    receipt.setVehicleType(rs.getString("vehicleType"));
                    receipt.setVehicleName(rs.getString("vehicleName"));
                    receipt.setKmCount(rs.getFloat("mileage"));
                    receipt.setPricePerKm(rs.getFloat("amount"));
                    receipt.setTotalPrice(rs.getFloat("mileage") * rs.getFloat("amount"));

                    receipt.setPaymentMethod(rs.getString("paymentType"));

                    receipts.add(receipt); 
                }
            }
        }

        if (receipts.isEmpty()) {
            throw new SQLException("Booking not found for order number: " + orderNumber);
        }

        return receipts; 
    }

    
       public List<Receipt> getMyBooking(String userName) throws SQLException {
        List<Receipt> receipts = new ArrayList<>(); // List to store Receipt objects
        String sql = "SELECT * FROM bookingdetails WHERE clientName = ? ORDER BY bookingId DESC";

        try (Connection conn = DataLayer.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, userName);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) { 
                    Receipt receipt = new Receipt(); 

                    // Populate the Receipt object with data from the ResultSet
                    receipt.setOrderNumber(rs.getInt("bookingId"));
                    receipt.setClientName(rs.getString("clientName"));
                    receipt.setStartLocation(rs.getString("startLocation"));
                    receipt.setEndLocation(rs.getString("endLocation"));
                    receipt.setBookingDateTime(rs.getTimestamp("bookingDateTime"));
                    receipt.setVehicleNumber(rs.getString("vehicleNo"));
                    receipt.setVehicleType(rs.getString("vehicleType"));
                    receipt.setVehicleName(rs.getString("vehicleName"));
                    receipt.setKmCount(rs.getFloat("mileage"));
                    receipt.setPricePerKm(rs.getFloat("amount"));
                    receipt.setTotalPrice(rs.getFloat("mileage") * rs.getFloat("amount"));

                    receipt.setPaymentMethod(rs.getString("paymentType"));

                    receipts.add(receipt); 
                }
            }
        }

        if (receipts.isEmpty()) {
            throw new SQLException("Booking not found for: " + userName);
        }

        return receipts; 
    }
       
       
        public List<Receipt> getDriverBooking(int userId) throws SQLException {
        List<Receipt> receipts = new ArrayList<>(); // List to store Receipt objects
        String sql = "SELECT * FROM bookingdetails WHERE driverID = ? ORDER BY bookingId DESC";

        try (Connection conn = DataLayer.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) { 
                    Receipt receipt = new Receipt(); 

                    receipt.setOrderNumber(rs.getInt("bookingId"));
                    receipt.setClientName(rs.getString("clientName"));
                    receipt.setStartLocation(rs.getString("startLocation"));
                    receipt.setEndLocation(rs.getString("endLocation"));
                    receipt.setBookingDateTime(rs.getTimestamp("bookingDateTime"));
                    receipt.setVehicleNumber(rs.getString("vehicleNo"));
                    receipt.setVehicleType(rs.getString("vehicleType"));
                    receipt.setVehicleName(rs.getString("vehicleName"));
                    receipt.setKmCount(rs.getFloat("mileage"));
                    receipt.setPricePerKm(rs.getFloat("amount"));
                    receipt.setTotalPrice(rs.getFloat("mileage") * rs.getFloat("amount"));
                    receipt.setPaymentMethod(rs.getString("paymentType"));

                    receipts.add(receipt); 
                }
            }
        }

        if (receipts.isEmpty()) {
            throw new SQLException("Booking not found for");
        }

        return receipts; 
    }
        
         public List<Receipt> getAllBooking() throws SQLException {
        List<Receipt> receipts = new ArrayList<>(); // List to store Receipt objects
        String sql = "SELECT * FROM bookingdetails ORDER BY bookingId DESC";

        try (Connection conn = DataLayer.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
  

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) { 
                    Receipt receipt = new Receipt(); 

                    receipt.setOrderNumber(rs.getInt("bookingId"));
                    receipt.setClientName(rs.getString("clientName"));
                    receipt.setStartLocation(rs.getString("startLocation"));
                    receipt.setEndLocation(rs.getString("endLocation"));
                    receipt.setBookingDateTime(rs.getTimestamp("bookingDateTime"));
                    receipt.setVehicleNumber(rs.getString("vehicleNo"));
                    receipt.setVehicleType(rs.getString("vehicleType"));
                    receipt.setVehicleName(rs.getString("vehicleName"));
                    receipt.setKmCount(rs.getFloat("mileage"));
                    receipt.setPricePerKm(rs.getFloat("amount"));
                    receipt.setTotalPrice(rs.getFloat("mileage") * rs.getFloat("amount"));
                    receipt.setPaymentMethod(rs.getString("paymentType"));

                    receipts.add(receipt); 
                }
            }
        }

        if (receipts.isEmpty()) {
            throw new SQLException("Booking not found for");
        }

        return receipts; 
    }
}
