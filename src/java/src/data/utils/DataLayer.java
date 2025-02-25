/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package src.data.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Shashan(ShashanPrabo
 */
public class DataLayer {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/megacitycabs?useSSL=false&serverTimezone=UTC";
    private static final String DB_USER = "root";  
    private static final String DB_PASSWORD = "";  
    public static Connection getConnection() throws SQLException {
        try {
     
            Class.forName("com.mysql.cj.jdbc.Driver");

     
            return DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
        } catch (ClassNotFoundException e) {
            throw new SQLException("MySQL JDBC Driver not found.", e);
        }
    }
}
