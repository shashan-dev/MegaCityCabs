/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package src.data.dao;


import src.data.utils.DataLayer;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import src.app.model.Customer;
import java.sql.ResultSet;

/**
 *
 * @author Shashan(ShashanPrabo
 */
public class CustomerDAO {
     // Method to insert a new customer into the database
    public boolean registerCustomer(Customer customer) {
        String sql = "INSERT INTO customers (name, email, nic, mobile, address, password) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection conn = DataLayer.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

     
            pstmt.setString(1, customer.getName());
            pstmt.setString(2, customer.getEmail());
            pstmt.setString(3, customer.getNic());
            pstmt.setString(4, customer.getMobile());
            pstmt.setString(5, customer.getAddress());
            pstmt.setString(6, customer.getPassword());

  
            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0; 

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        
        }
    }
    
    
            public Customer validateCustomer(String email, String password) {
        Customer customer = null;
        String query = "SELECT * FROM customers WHERE email = ? AND password = ?";

        try (Connection conn = DataLayer.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setString(1, email);
            pstmt.setString(2, password);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    customer = new Customer();
                    customer.setName(rs.getString("name"));
                    customer.setEmail(rs.getString("email"));
   
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return customer;
    }
}
    
    
    

