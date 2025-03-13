package com.mycompany.dao;

import com.mycompany.model.VehicleDriverAllocation;
import com.mycompany.util.DbConfig;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class VehicleDriverAllocationDAO {
    private static VehicleDriverAllocationDAO instance;
    
    private VehicleDriverAllocationDAO() {}

    public static VehicleDriverAllocationDAO getInstance() {
        if (instance == null) {
            instance = new VehicleDriverAllocationDAO();
        }
        return instance;
    }

    public boolean allocateDriverToVehicle(String vehicleNo, String driverName) {
        String vehicleQuery = "SELECT id, vehicleType, color, imageUrl FROM vehicles WHERE vehicleNo=?";
        String driverQuery = "SELECT id, phone, imageUrl FROM drivers WHERE name=?";
        String checkQuery = "SELECT id FROM vehicle_driver_allocation WHERE vehicle_no=? AND driver_name=?";
        String insertQuery = "INSERT INTO vehicle_driver_allocation (vehicle_no, vehicle_type, vehicle_color, vehicle_image, driver_name, driver_phone, driver_image) VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection connection = DbConfig.getConnection();
             PreparedStatement vehicleStmt = connection.prepareStatement(vehicleQuery);
             PreparedStatement driverStmt = connection.prepareStatement(driverQuery)) {

            vehicleStmt.setString(1, vehicleNo);
            driverStmt.setString(1, driverName);

            ResultSet vrs = vehicleStmt.executeQuery();
            ResultSet drs = driverStmt.executeQuery();

            if (vrs.next() && drs.next()) {
                String vehicleType = vrs.getString("vehicleType");
                String vehicleColor = vrs.getString("color");
                String vehicleImage = vrs.getString("imageUrl");

                String driverPhone = drs.getString("phone");
                String driverImage = drs.getString("imageUrl");

                // Check if allocation already exists
                try (PreparedStatement checkStmt = connection.prepareStatement(checkQuery)) {
                    checkStmt.setString(1, vehicleNo);
                    checkStmt.setString(2, driverName);
                    ResultSet checkRs = checkStmt.executeQuery();
                    if (checkRs.next()) {
                        System.out.println("Allocation already exists.");
                        return false;
                    }
                }

                // Insert allocation
                try (PreparedStatement insertStmt = connection.prepareStatement(insertQuery)) {
                    insertStmt.setString(1, vehicleNo);
                    insertStmt.setString(2, vehicleType);
                    insertStmt.setString(3, vehicleColor);
                    insertStmt.setString(4, vehicleImage);
                    insertStmt.setString(5, driverName);
                    insertStmt.setString(6, driverPhone);
                    insertStmt.setString(7, driverImage);

                    int rows = insertStmt.executeUpdate();
                    return rows > 0;
                }
            } else {
                System.out.println("Vehicle or driver not found.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<VehicleDriverAllocation> getAllAllocations() {
        List<VehicleDriverAllocation> allocations = new ArrayList<>();
        String query = "SELECT vehicle_no, vehicle_type, vehicle_color, vehicle_image, driver_name, driver_phone, driver_image FROM vehicle_driver_allocation";

        try (Connection connection = DbConfig.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                allocations.add(new VehicleDriverAllocation(
                    0,  // ID is not needed for frontend display
                    rs.getString("vehicle_no"),
                    rs.getString("vehicle_type"),
                    rs.getString("vehicle_color"),
                    rs.getString("vehicle_image"),
                    rs.getString("driver_name"),
                    rs.getString("driver_phone"),
                    rs.getString("driver_image")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return allocations;
    }
}
