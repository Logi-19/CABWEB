package com.mycompany.dao;

import com.mycompany.model.VehicleDriverAllocation;
import com.mycompany.util.DbConfig;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.sql.*;

public class VehicleDriverAllocationDAO {
    private static VehicleDriverAllocationDAO instance;
    private Connection connection;

    private VehicleDriverAllocationDAO() {
        try {
            this.connection = DbConfig.getConnection();
            System.out.println("Database connection established successfully.");
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Database connection failed.");
        }
    }

    public static VehicleDriverAllocationDAO getInstance() {
        if (instance == null) {
            instance = new VehicleDriverAllocationDAO();
        }
        return instance;
    }

    public boolean allocateDriverToVehicle(String vehicleNo, String driverName) {
        String vehicleQuery = "SELECT id, vehicleType, color, imageUrl FROM vehicles WHERE vehicleNo=?";
        String driverQuery = "SELECT id, phone, imageUrl FROM drivers WHERE name=?";
        String insertQuery = "INSERT INTO vehicle_driver_allocation (vehicle_id, vehicle_no, vehicle_type, vehicle_color, vehicle_image, driver_id, driver_name, driver_phone, driver_image) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (PreparedStatement vehicleStmt = connection.prepareStatement(vehicleQuery);
             PreparedStatement driverStmt = connection.prepareStatement(driverQuery)) {

            vehicleStmt.setString(1, vehicleNo);
            ResultSet vrs = vehicleStmt.executeQuery();

            driverStmt.setString(1, driverName);
            ResultSet drs = driverStmt.executeQuery();

            if (vrs.next() && drs.next()) {
                int vehicleId = vrs.getInt("id");
                int driverId = drs.getInt("id");

                System.out.println("✅ Vehicle Found: ID=" + vehicleId);
                System.out.println("✅ Driver Found: ID=" + driverId);

                try (PreparedStatement insertStmt = connection.prepareStatement(insertQuery)) {
                    insertStmt.setInt(1, vehicleId);
                    insertStmt.setString(2, vehicleNo);
                    insertStmt.setString(3, vrs.getString("vehicleType"));
                    insertStmt.setString(4, vrs.getString("color"));
                    insertStmt.setString(5, vrs.getString("imageUrl"));
                    insertStmt.setInt(6, driverId);
                    insertStmt.setString(7, driverName);
                    insertStmt.setString(8, drs.getString("phone"));
                    insertStmt.setString(9, drs.getString("imageUrl"));

                    int rows = insertStmt.executeUpdate();
                    if (rows > 0) {
                        System.out.println("✅ Allocation saved successfully.");
                        return true;
                    } else {
                        System.out.println("❌ Allocation failed.");
                    }
                }
            } else {
                System.out.println("❌ Vehicle or Driver not found. Check your database.");
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
