package com.mycompany.dao;

import com.mycompany.model.VehicleDriverAllocation;
import com.mycompany.util.DbConfig;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class VehicleDriverAllocationDAO {

    // Singleton instance
    private static VehicleDriverAllocationDAO instance;

    private VehicleDriverAllocationDAO() {}

    public static VehicleDriverAllocationDAO getInstance() {
        if (instance == null) {
            instance = new VehicleDriverAllocationDAO();
        }
        return instance;
    }

    // Method to save allocation to the database
    public boolean saveAllocation(String vehicleNo, String vehicleImage, String vehicleType, String vehicleColor,
                              String driverName, String driverImage, String driverPhone) {
    String query = "INSERT INTO vehicle_driver_allocation (vehicle_no, vehicle_image, vehicle_type, vehicle_color, " +
                   "driver_name, driver_image, driver_phone) VALUES (?, ?, ?, ?, ?, ?, ?)";
    try (Connection conn = DbConfig.getConnection();
         PreparedStatement stmt = conn.prepareStatement(query)) {

        // Debugging: Print the query and parameters
        System.out.println("Executing query: " + query);
        System.out.println("Parameters: " + vehicleNo + ", " + vehicleImage + ", " + vehicleType + ", " + vehicleColor + ", " + driverName + ", " + driverImage + ", " + driverPhone);

        stmt.setString(1, vehicleNo);
        stmt.setString(2, vehicleImage);
        stmt.setString(3, vehicleType);
        stmt.setString(4, vehicleColor);
        stmt.setString(5, driverName);
        stmt.setString(6, driverImage);
        stmt.setString(7, driverPhone);

        int rowsInserted = stmt.executeUpdate();
        System.out.println("Rows inserted: " + rowsInserted); // Debugging

        return rowsInserted > 0;
    } catch (SQLException e) {
        // Debugging: Print the exception
        System.err.println("Error saving allocation: " + e.getMessage());
        e.printStackTrace();
        return false;
    }
}
    
    // Method to fetch all allocations from the database
    public List<VehicleDriverAllocation> getAllAllocations() {
    List<VehicleDriverAllocation> allocations = new ArrayList<>();
    String query = "SELECT vehicle_no, vehicle_image, vehicle_type, vehicle_color, " +
                   "driver_name, driver_image, driver_phone " +
                   "FROM vehicle_driver_allocation";
    try (Connection conn = DbConfig.getConnection();
         PreparedStatement stmt = conn.prepareStatement(query);
         ResultSet rs = stmt.executeQuery()) {

        // Debugging: Print the query
        System.out.println("Executing query: " + query);

        while (rs.next()) {
            // Debugging: Print each row
            System.out.println("Row: " + rs.getString("vehicle_no") + ", " + rs.getString("vehicle_image") + ", " + rs.getString("vehicle_type") + ", " + rs.getString("vehicle_color") + ", " + rs.getString("driver_name") + ", " + rs.getString("driver_image") + ", " + rs.getString("driver_phone"));

            allocations.add(new VehicleDriverAllocation(
                rs.getString("vehicle_no"),
                rs.getString("vehicle_image"),
                rs.getString("vehicle_type"),
                rs.getString("vehicle_color"),
                rs.getString("driver_name"),
                rs.getString("driver_image"),
                rs.getString("driver_phone")
            ));
        }
    } catch (SQLException e) {
        // Debugging: Print the exception
        System.err.println("Error fetching allocations: " + e.getMessage());
        e.printStackTrace();
    }
    return allocations;
}
}