package com.mycompany.dao;

import com.mycompany.model.Driver;
import com.mycompany.util.DbConfig;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DriverDAO {

    // Singleton instance
    private static DriverDAO instance;

    // Private constructor to prevent instantiation
    private DriverDAO() {}

    // Method to get the singleton instance
    public static synchronized DriverDAO getInstance() {
        if (instance == null) {
            instance = new DriverDAO();
        }
        return instance;
    }

    // Method to add a driver
    public boolean addDriver(Driver driver) {
    String sql = "INSERT INTO drivers (name, nic, email, address, phone, license_no, license_expired_date, image_url) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
    try (Connection conn = DbConfig.getConnection();
         PreparedStatement stmt = conn.prepareStatement(sql)) {

        System.out.println("Inserting driver into database...");
        System.out.println("Name: " + driver.getName());
        System.out.println("NIC: " + driver.getNic());
        System.out.println("Email: " + driver.getEmail());
        System.out.println("License Expiry Date: " + driver.getLicenseExpiredDate());
        System.out.println("Image URL: " + driver.getImageUrl());

        stmt.setString(1, driver.getName());
        stmt.setString(2, driver.getNic());
        stmt.setString(3, driver.getEmail());
        stmt.setString(4, driver.getAddress());
        stmt.setString(5, driver.getPhone());
        stmt.setString(6, driver.getLicenseNo());
        stmt.setDate(7, driver.getLicenseExpiredDate());
        stmt.setString(8, driver.getImageUrl());

        int rowsInserted = stmt.executeUpdate();
        System.out.println("Rows affected: " + rowsInserted);
        
        return rowsInserted > 0;
    } catch (SQLException e) {
        e.printStackTrace();
        System.out.println("Database error: " + e.getMessage());
        return false;
    }
}

    // Method to update a driver
    public boolean updateDriver(Driver driver) {
        String sql = "UPDATE drivers SET name=?, nic=?, email=?, address=?, phone=?, license_no=?, license_expired_date=?, image_url=? WHERE id=?";
        try (Connection conn = DbConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, driver.getName());
            stmt.setString(2, driver.getNic());
            stmt.setString(3, driver.getEmail());
            stmt.setString(4, driver.getAddress());
            stmt.setString(5, driver.getPhone());
            stmt.setString(6, driver.getLicenseNo());
            stmt.setDate(7, driver.getLicenseExpiredDate());
            stmt.setString(8, driver.getImageUrl());
            stmt.setInt(9, driver.getId());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Method to delete a driver
    public boolean deleteDriver(int id) {
        String sql = "DELETE FROM drivers WHERE id=?";
        try (Connection conn = DbConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Method to get all drivers
    public List<Driver> getAllDrivers() {
        List<Driver> drivers = new ArrayList<>();
        String sql = "SELECT * FROM drivers";
        try (Connection conn = DbConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Driver driver = new Driver();
                driver.setId(rs.getInt("id"));
                driver.setName(rs.getString("name"));
                driver.setNic(rs.getString("nic"));
                driver.setEmail(rs.getString("email"));
                driver.setAddress(rs.getString("address"));
                driver.setPhone(rs.getString("phone"));
                driver.setLicenseNo(rs.getString("license_no"));
                driver.setLicenseExpiredDate(rs.getDate("license_expired_date"));
                driver.setImageUrl(rs.getString("image_url"));
                drivers.add(driver);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return drivers;
    }

    // Method to get a driver by ID
    public Driver getDriverById(int id) {
        String sql = "SELECT * FROM drivers WHERE id=?";
        try (Connection conn = DbConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    Driver driver = new Driver();
                    driver.setId(rs.getInt("id"));
                    driver.setName(rs.getString("name"));
                    driver.setNic(rs.getString("nic"));
                    driver.setEmail(rs.getString("email"));
                    driver.setAddress(rs.getString("address"));
                    driver.setPhone(rs.getString("phone"));
                    driver.setLicenseNo(rs.getString("license_no"));
                    driver.setLicenseExpiredDate(rs.getDate("license_expired_date"));
                    driver.setImageUrl(rs.getString("image_url"));
                    return driver;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    // Method to get a driver by name
public Driver getDriverByName(String name) {
    String sql = "SELECT * FROM drivers WHERE name=?";
    try (Connection conn = DbConfig.getConnection();
         PreparedStatement stmt = conn.prepareStatement(sql)) {
        stmt.setString(1, name);
        try (ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                Driver driver = new Driver();
                driver.setId(rs.getInt("id"));
                driver.setName(rs.getString("name"));
                driver.setNic(rs.getString("nic"));
                driver.setEmail(rs.getString("email"));
                driver.setAddress(rs.getString("address"));
                driver.setPhone(rs.getString("phone"));
                driver.setLicenseNo(rs.getString("license_no"));
                driver.setLicenseExpiredDate(rs.getDate("license_expired_date"));
                driver.setImageUrl(rs.getString("image_url"));
                return driver;
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return null;
}
}