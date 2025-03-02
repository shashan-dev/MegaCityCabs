/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package src.app.model;

/**
 *
 * @author Shashan(ShashanPrabo
 */
public class Vehicle {
    private String vehicleType;
    private String vehicleName;
    private String vehicleNumber; 
    private String ownerName;
    private String ownerContact;
    private int driverId;
    private String driverName;
    private String city;
    private float price;

    // Default Constructor
    public Vehicle() {}

    // Parameterized Constructor
    public Vehicle(String vehicleType, String vehicleName, String vehicleNumber, String ownerName, String ownerContact, int driverId, String driverName, String city, float price) {
        this.vehicleType = vehicleType;
        this.vehicleName = vehicleName;
        this.vehicleNumber = vehicleNumber;
        this.ownerName = ownerName;
        this.ownerContact = ownerContact;
        this.driverId = driverId;
        this.driverName = driverName;
        this.city = city;
        this.price = price;
    }

    // Getters and Setters
    public String getVehicleType() {
        return vehicleType;
    }

    public void setVehicleType(String vehicleType) {
        this.vehicleType = vehicleType;
    }

    public String getVehicleName() {
        return vehicleName;
    }

    public void setVehicleName(String vehicleName) {
        this.vehicleName = vehicleName;
    }

    public String getVehicleNumber() {
        return vehicleNumber;
    }

    public void setVehicleNumber(String vehicleNumber) {
        this.vehicleNumber = vehicleNumber;
    }

    public String getOwnerName() {
        return ownerName;
    }

    public void setOwnerName(String ownerName) {
        this.ownerName = ownerName;
    }

    public String getOwnerContact() {
        return ownerContact;
    }

    public void setOwnerContact(String ownerContact) {
        this.ownerContact = ownerContact;
    }
    
        public int getDriverId() {
        return driverId;
    }

    public void setDriverId(int driverId) {
        this.driverId = driverId;
    }
    
        public String getDrivrName() {
        return driverName;
    }

    public void setDriverName(String driverName) {
        this.driverName = driverName;
    }
    
        public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }
    
    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }
    
}
