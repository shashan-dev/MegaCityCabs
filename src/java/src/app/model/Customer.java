/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package src.app.model;

/**
 *
 * @author Shashan(ShashanPrabo
 */
public class Customer {
    private String name;
    private String email;
    private String nic;
    private String mobile;
    private String address;
    private String password;
    
    public Customer() {}

   
    public Customer(String name, String email, String nic, String mobile, String address, String password) {
        this.name = name;
        this.email = email;
        this.nic = nic;
        this.mobile = mobile;
        this.address = address;
        this.password = password;
    }

    // Getters and Setters
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getNic() {
        return nic;
    }

    public void setNic(String nic) {
        this.nic = nic;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
}
