/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package src.data.dao;


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
public class CityDAO {

    public List<String> getDistinctCities() {
        List<String> cities = new ArrayList<>();
        String sql = "SELECT DISTINCT cityName FROM cities"; 
        
        try (Connection conn = DataLayer.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                String cityName = rs.getString("cityName");
                cities.add(cityName);
            }

        } catch (SQLException e) {
            System.err.println("SQL Error: " + e.getMessage());
            e.printStackTrace();
        }

        return cities;
    }
    
}
