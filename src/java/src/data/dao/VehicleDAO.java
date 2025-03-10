/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package src.data.dao;

import src.app.model.Vehicle;
import src.data.utils.DataLayer;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Shashan(ShashanPrabo
 */
public class VehicleDAO {

    public boolean registerVehicle(Vehicle vehicle) {
        String sql = "INSERT INTO vehicles (vehicleType, vehicleName, vehicleNumber, ownerName, ownerContact) VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = DataLayer.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, vehicle.getVehicleType());
            pstmt.setString(2, vehicle.getVehicleName());
            pstmt.setString(3, vehicle.getVehicleNumber());
            pstmt.setString(4, vehicle.getOwnerName());
            pstmt.setString(5, vehicle.getOwnerContact());

            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("SQL Error: " + e.getMessage());
            return false;
        }
    }

    // View All Vehicles
    public List<Vehicle> getAllVehicles() {
        List<Vehicle> vehicles = new ArrayList<>();
        String sql = "SELECT vehicleType, vehicleName, vehicleNumber, ownerName, ownerContact FROM vehicles";

        try (Connection conn = DataLayer.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql); ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                Vehicle vehicle = new Vehicle();
                vehicle.setVehicleType(rs.getString("vehicleType"));
                vehicle.setVehicleName(rs.getString("vehicleName"));
                vehicle.setVehicleNumber(rs.getString("vehicleNumber"));
                vehicle.setOwnerName(rs.getString("ownerName"));
                vehicle.setOwnerContact(rs.getString("ownerContact"));
                vehicles.add(vehicle);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return vehicles;
    }

    public List<String> getDistinctVehicleNo() {
        List<String> vehicles = new ArrayList<>();
        String sql = "SELECT vehicleNumber, CONCAT(vehicleNumber, ' : ', vehicleName, ' : ', vehicleType ) AS formattedVehicle FROM vehicles";

        try (Connection conn = DataLayer.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql); ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                String VehicleNo = rs.getString("formattedVehicle");
                vehicles.add(VehicleNo);
            }

        } catch (SQLException e) {
            System.err.println("SQL Error: " + e.getMessage());
            e.printStackTrace();
        }

        return vehicles;
    }

    public boolean allocateVehicle(Vehicle vehicle) {
        String sql = "INSERT INTO vehicleallocations (vehicleType, vehicleName, vehicleNumber, driverId, driverName, city, price) VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DataLayer.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, vehicle.getVehicleType());
            pstmt.setString(2, vehicle.getVehicleName());
            pstmt.setString(3, vehicle.getVehicleNumber());
            pstmt.setInt(4, vehicle.getDriverId());
            pstmt.setString(5, vehicle.getDrivrName());
            pstmt.setString(6, vehicle.getCity());
            pstmt.setFloat(7, vehicle.getPrice());

            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("SQL Error: " + e.getMessage());
            return false;
        }
    }

    // View All Vehicles
    public List<Vehicle> getAllVehiclesAcclocations() {
        List<Vehicle> vehicleAllocations = new ArrayList<>();
        String sql = "SELECT vehicleType, vehicleName, vehicleNumber, driverId, driverName, city, price FROM vehicleallocations";

        try (Connection conn = DataLayer.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql); ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                Vehicle vehicle = new Vehicle();
                vehicle.setVehicleType(rs.getString("vehicleType"));
                vehicle.setVehicleName(rs.getString("vehicleName"));
                vehicle.setVehicleNumber(rs.getString("vehicleNumber"));
                vehicle.setDriverId(rs.getInt("driverId"));
                vehicle.setDriverName(rs.getString("driverName"));
                vehicle.setCity(rs.getString("city"));
                vehicle.setPrice(rs.getFloat("price"));
                vehicleAllocations.add(vehicle);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return vehicleAllocations;
    }
    
        public List<String> getDistinctVehicleType() {
        List<String> vehicles = new ArrayList<>();
        String sql = "SELECT DISTINCT vehicleType  FROM vehicles";

        try (Connection conn = DataLayer.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql); ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                String VehicleNo = rs.getString("vehicleType");
                vehicles.add(VehicleNo);
            }

        } catch (SQLException e) {
            System.err.println("SQL Error: " + e.getMessage());
            e.printStackTrace();
        }

        return vehicles;
    }
        
        public boolean updateVehicle(Vehicle vehicle) {
        String sql = "UPDATE vehicles  SET vehicleName = ?, ownerName = ?, ownerContact = ? WHERE vehicleNumber = ?";

        try (Connection conn = DataLayer.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, vehicle.getVehicleName());
            pstmt.setString(2, vehicle.getOwnerName());
            pstmt.setString(3, vehicle.getOwnerContact());
            pstmt.setString(4, vehicle.getVehicleNumber());
            
     

            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("SQL Error: " + e.getMessage());
            return false;
        }
    }
        
               public boolean deleteVehicle(String vehiclNo) {
        String sql = "DELETE FROM vehicles WHERE vehicleNumber = ?"; 

        try (Connection conn = DataLayer.getConnection(); 
             PreparedStatement pstmt = conn.prepareStatement(sql)) { 

            pstmt.setString(1, vehiclNo);
            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {

            e.printStackTrace();
            System.err.println("SQL Error: " + e.getMessage());
            return false;
        }
    
}
               
 


}
