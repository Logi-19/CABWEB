package com.mycompany.dao;

import com.mycompany.model.Vehicle;
import com.mycompany.util.DbConfig;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class VehicleDAO {

    // Singleton instance
    private static VehicleDAO instance;

    // Private constructor to prevent instantiation
    private VehicleDAO() {}

    // Method to get the singleton instance
    public static synchronized VehicleDAO getInstance() {
        if (instance == null) {
            instance = new VehicleDAO();
        }
        return instance;
    }

    // Method to add a vehicle
    public boolean addVehicle(Vehicle vehicle) {
        String sql = "INSERT INTO vehicles (image_url, vehicle_no, color, model_year, vehicle_type, insurance_expired) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = DbConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, vehicle.getImageUrl());
            stmt.setString(2, vehicle.getVehicleNo());
            stmt.setString(3, vehicle.getColor());
            stmt.setInt(4, vehicle.getModelYear());
            stmt.setString(5, vehicle.getVehicleType());
            stmt.setDate(6, vehicle.getInsuranceExpired());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Method to update a vehicle
    public boolean updateVehicle(Vehicle vehicle) {
        String sql = "UPDATE vehicles SET image_url=?, vehicle_no=?, color=?, model_year=?, vehicle_type=?, insurance_expired=? WHERE id=?";
        try (Connection conn = DbConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, vehicle.getImageUrl());
            stmt.setString(2, vehicle.getVehicleNo());
            stmt.setString(3, vehicle.getColor());
            stmt.setInt(4, vehicle.getModelYear());
            stmt.setString(5, vehicle.getVehicleType());
            stmt.setDate(6, vehicle.getInsuranceExpired());
            stmt.setInt(7, vehicle.getId());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Method to delete a vehicle
    public boolean deleteVehicle(int id) {
        String sql = "DELETE FROM vehicles WHERE id=?";
        try (Connection conn = DbConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Method to get all vehicles
    public List<Vehicle> getAllVehicles() {
        List<Vehicle> vehicles = new ArrayList<>();
        String sql = "SELECT * FROM vehicles";
        try (Connection conn = DbConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Vehicle vehicle = new Vehicle();
                vehicle.setId(rs.getInt("id"));
                vehicle.setImageUrl(rs.getString("image_url"));
                vehicle.setVehicleNo(rs.getString("vehicle_no"));
                vehicle.setColor(rs.getString("color"));
                vehicle.setModelYear(rs.getInt("model_year"));
                vehicle.setVehicleType(rs.getString("vehicle_type"));
                vehicle.setInsuranceExpired(rs.getDate("insurance_expired"));
                vehicles.add(vehicle);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return vehicles;
    }

    // Method to get a vehicle by ID
    public Vehicle getVehicleById(int id) {
        String sql = "SELECT * FROM vehicles WHERE id=?";
        try (Connection conn = DbConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    Vehicle vehicle = new Vehicle();
                    vehicle.setId(rs.getInt("id"));
                    vehicle.setImageUrl(rs.getString("image_url"));
                    vehicle.setVehicleNo(rs.getString("vehicle_no"));
                    vehicle.setColor(rs.getString("color"));
                    vehicle.setModelYear(rs.getInt("model_year"));
                    vehicle.setVehicleType(rs.getString("vehicle_type"));
                    vehicle.setInsuranceExpired(rs.getDate("insurance_expired"));
                    return vehicle;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    // Method to get a vehicle by vehicle number
public Vehicle getVehicleByNo(String vehicleNo) {
    String sql = "SELECT * FROM vehicles WHERE vehicle_no=?";
    try (Connection conn = DbConfig.getConnection();
         PreparedStatement stmt = conn.prepareStatement(sql)) {
        stmt.setString(1, vehicleNo);
        try (ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                Vehicle vehicle = new Vehicle();
                vehicle.setId(rs.getInt("id"));
                vehicle.setImageUrl(rs.getString("image_url"));
                vehicle.setVehicleNo(rs.getString("vehicle_no"));
                vehicle.setColor(rs.getString("color"));
                vehicle.setModelYear(rs.getInt("model_year"));
                vehicle.setVehicleType(rs.getString("vehicle_type"));
                vehicle.setInsuranceExpired(rs.getDate("insurance_expired"));
                return vehicle;
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return null;
}
}