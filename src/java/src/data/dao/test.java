/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package src.data.dao;

import java.util.List;
import src.app.model.User;

/**
 *
 * @author Shashan(ShashanPrabo
 */
public class test {
    public static void main(String[] args) {
        // Create an instance of UserDAO
        UserDAO userDAO = new UserDAO();

        // Fetch all users from the database
        List<User> users = userDAO.getAllUsers();

        // Print the users to verify the data
        if (users != null && !users.isEmpty()) {
            System.out.println("Users fetched successfully:");
            for (User user : users) {
           
                System.out.println("Name: " + user.getUserName());
                System.out.println("Role: " + user.getUserRole());
                System.out.println("Status: " + user.getUserNIC());
                System.out.println("-----------------------------");
            }
        } else {
            System.out.println("No users found in the database.");
        }
}
}
