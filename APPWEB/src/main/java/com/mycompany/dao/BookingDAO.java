package com.mycompany.dao;

import com.mycompany.model.Booking;
import com.mycompany.util.DbConfig;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class BookingDAO {
    // Singleton instance
    private static BookingDAO instance;

    // Private constructor to prevent instantiation
    private BookingDAO() {}

    // Method to get the singleton instance
    public static BookingDAO getInstance() {
        if (instance == null) {
            instance = new BookingDAO();
        }
        return instance;
    }

    // Method to save a booking to the database
    public boolean saveBooking(Booking booking) {
        String sql = "INSERT INTO bookings (name, address, phone, pickup_location, drop_location, distance, total_price, vehicle_no, vehicle_type, driver_name, driver_phone) " +
                      "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DbConfig.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, booking.getName());
            pstmt.setString(2, booking.getAddress());
            pstmt.setString(3, booking.getPhone());
            pstmt.setString(4, booking.getPickupLocation());
            pstmt.setString(5, booking.getDropLocation());
            pstmt.setDouble(6, booking.getDistance());
            pstmt.setDouble(7, booking.getTotalPrice());
            pstmt.setString(8, booking.getVehicleNo());
            pstmt.setString(9, booking.getVehicleType());
            pstmt.setString(10, booking.getDriverName());
            pstmt.setString(11, booking.getDriverPhone());

            int rowsInserted = pstmt.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}