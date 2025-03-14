package com.mycompany.model;

public class VehicleDriverAllocation {
    private String vehicleNo;
    private String vehicleImage;
    private String vehicleType;
    private String vehicleColor;
    private String driverName;
    private String driverImage;
    private String driverPhone;

    // Constructor
    public VehicleDriverAllocation(String vehicleNo, String vehicleImage, String vehicleType, String vehicleColor, 
                                   String driverName, String driverImage, String driverPhone) {
        this.vehicleNo = vehicleNo;
        this.vehicleImage = vehicleImage;
        this.vehicleType = vehicleType;
        this.vehicleColor = vehicleColor;
        this.driverName = driverName;
        this.driverImage = driverImage;
        this.driverPhone = driverPhone;
    }

    // Getters and Setters
    public String getVehicleNo() { return vehicleNo; }
    public void setVehicleNo(String vehicleNo) { this.vehicleNo = vehicleNo; }

    public String getVehicleImage() { return vehicleImage; }
    public void setVehicleImage(String vehicleImage) { this.vehicleImage = vehicleImage; }

    public String getVehicleType() { return vehicleType; }
    public void setVehicleType(String vehicleType) { this.vehicleType = vehicleType; }

    public String getVehicleColor() { return vehicleColor; }
    public void setVehicleColor(String vehicleColor) { this.vehicleColor = vehicleColor; }

    public String getDriverName() { return driverName; }
    public void setDriverName(String driverName) { this.driverName = driverName; }

    public String getDriverImage() { return driverImage; }
    public void setDriverImage(String driverImage) { this.driverImage = driverImage; }

    public String getDriverPhone() { return driverPhone; }
    public void setDriverPhone(String driverPhone) { this.driverPhone = driverPhone; }
}