/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package src.app.model;

/**
 *
 * @author Shashan(ShashanPrabo
 */
public class User {
    private int userId;
    private String userRole;
    private String userName;
    private String userNIC;
    private String userContact;
    private String userPassword;

    // Default Constructor
    public User() {}

    // Parameterized Constructor
    public User( String userRole, String userName, String userNIC, String userContact, String userPassword, int userId) {
    
        this.userRole = userRole;
        this.userName = userName;
        this.userNIC = userNIC;
        this.userContact = userContact;
        this.userPassword = userPassword;
        this.userId = userId;
    }

  public int getUserId(){
      return userId;
  }
  
  public void setUserId(int userId){
      this.userId = userId;
  }
    
    public String getUserRole() {
        return userRole;
    }

    public void setUserRole(String userRole) {
        this.userRole = userRole;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserNIC() {
        return userNIC;
    }

    public void setUserNIC(String userNIC) {
        this.userNIC = userNIC;
    }

    public String getUserContact() {
        return userContact;
    }

    public void setUserContact(String userContact) {
        this.userContact = userContact;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public void setUserId(String string) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
