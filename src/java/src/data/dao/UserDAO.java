/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package src.data.dao;

import java.beans.Statement;
import src.app.model.User;
import src.data.utils.DataLayer;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import static src.data.utils.DataLayer.getConnection;

/**
 *
 * @author Shashan(ShashanPrabo
 */
public class UserDAO {

    // Method to insert a new user into the database
    public boolean registerUser(User user) {
        String sql = "INSERT INTO users (role, name, nic, contact,s password) VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = DataLayer.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, user.getUserRole());
            pstmt.setString(2, user.getUserName());
            pstmt.setString(3, user.getUserNIC());
            pstmt.setString(4, user.getUserContact());
            pstmt.setString(5, user.getUserPassword());

            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("SQL Error: " + e.getMessage());
            return false;
        }
    }

    public List<User> getAllUsers() {
        List<User> users = new ArrayList<>();
        String sql = "SELECT id,name, role, nic, contact FROM users";

        try (Connection conn = DataLayer.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql); ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                User user = new User();
                user.setUserId(rs.getShort("id"));
                user.setUserName(rs.getString("name"));
                user.setUserRole(rs.getString("role"));
                user.setUserNIC(rs.getString("nic"));
                user.setUserContact(rs.getString("contact"));
                users.add(user);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return users;
    }

    // Get Distinct Drivers
    public List<String> getDistinctDrivers() {
        List<String> drivers = new ArrayList<>();
        String sql = "SELECT DISTINCT id, CONCAT(id, ' : ', name) AS FormattedDriver FROM users WHERE role = 'driver' ";

        try (Connection conn = DataLayer.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql); ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                String driverId = rs.getString("FormattedDriver");
                drivers.add(driverId);
            }

        } catch (SQLException e) {
            System.err.println("SQL Error: " + e.getMessage());
            e.printStackTrace();
        }

        return drivers;
    }

    public User validateUser(Integer empID, String password) {
        User user = null;
        String query = "SELECT * FROM users WHERE id = ? AND password = ?";

        try (Connection conn = DataLayer.getConnection(); PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setInt(1, empID);
            pstmt.setString(2, password);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    user = new User();
                    user.setUserName(rs.getString("name"));
                    user.setUserRole(rs.getString("role"));

                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return user;
    }
}
