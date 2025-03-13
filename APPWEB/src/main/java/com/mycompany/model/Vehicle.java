package com.mycompany.model;

import java.sql.Date;

public class Vehicle {
    private int id;
    private String imageUrl;
    private String vehicleNo;
    private String color;
    private int modelYear;
    private String vehicleType;
    private Date insuranceExpired;

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public String getVehicleNo() {
        return vehicleNo;
    }

    public void setVehicleNo(String vehicleNo) {
        this.vehicleNo = vehicleNo;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public int getModelYear() {
        return modelYear;
    }

    public void setModelYear(int modelYear) {
        this.modelYear = modelYear;
    }

    public String getVehicleType() {
        return vehicleType;
    }

    public void setVehicleType(String vehicleType) {
        this.vehicleType = vehicleType;
    }

    public Date getInsuranceExpired() {
        return insuranceExpired;
    }

    public void setInsuranceExpired(Date insuranceExpired) {
        this.insuranceExpired = insuranceExpired;
    }
}