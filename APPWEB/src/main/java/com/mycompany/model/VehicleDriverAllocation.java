package com.mycompany.model;

public class VehicleDriverAllocation {
    private int id;
    private String vehicleNo;
    private String vehicleType;
    private String vehicleColor;
    private String vehicleImage;
    private String driverName;
    private String driverPhone;
    private String driverImage;

    public VehicleDriverAllocation(int id, String vehicleNo, String vehicleType, String vehicleColor, String vehicleImage, String driverName, String driverPhone, String driverImage) {
        this.id = id;
        this.vehicleNo = vehicleNo;
        this.vehicleType = vehicleType;
        this.vehicleColor = vehicleColor;
        this.vehicleImage = vehicleImage;
        this.driverName = driverName;
        this.driverPhone = driverPhone;
        this.driverImage = driverImage;
    }

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getVehicleNo() { return vehicleNo; }
    public void setVehicleNo(String vehicleNo) { this.vehicleNo = vehicleNo; }
    public String getVehicleType() { return vehicleType; }
    public void setVehicleType(String vehicleType) { this.vehicleType = vehicleType; }
    public String getVehicleColor() { return vehicleColor; }
    public void setVehicleColor(String vehicleColor) { this.vehicleColor = vehicleColor; }
    public String getVehicleImage() { return vehicleImage; }
    public void setVehicleImage(String vehicleImage) { this.vehicleImage = vehicleImage; }
    public String getDriverName() { return driverName; }
    public void setDriverName(String driverName) { this.driverName = driverName; }
    public String getDriverPhone() { return driverPhone; }
    public void setDriverPhone(String driverPhone) { this.driverPhone = driverPhone; }
    public String getDriverImage() { return driverImage; }
    public void setDriverImage(String driverImage) { this.driverImage = driverImage; }
}
