package com.mycompany.dao;

import com.mycompany.model.User;
import com.mycompany.util.DbConfig;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {
    // Singleton instance
    private static UserDAO instance;

    // Private constructor to prevent instantiation
    private UserDAO() {}

    // Method to get the singleton instance
    public static UserDAO getInstance() {
        if (instance == null) {
            instance = new UserDAO();
        }
        return instance;
    }

    // Method to insert a new user into the database
    public boolean registerUser(User user) {
        String query = "INSERT INTO users (registerNo, name, email, phone, nic, address, username, password) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DbConfig.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setString(1, user.getRegisterNo());
            pstmt.setString(2, user.getName());
            pstmt.setString(3, user.getEmail());
            pstmt.setString(4, user.getPhone());
            pstmt.setString(5, user.getNic());
            pstmt.setString(6, user.getAddress());
            pstmt.setString(7, user.getUsername());
            pstmt.setString(8, user.getPassword());

            int rowsInserted = pstmt.executeUpdate();
            return rowsInserted > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Method to validate user login
    public boolean validateUser(String username, String password) {
        String query = "SELECT * FROM users WHERE username = ? AND password = ?";
        try (Connection conn = DbConfig.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setString(1, username);
            pstmt.setString(2, password);

            System.out.println("Executing query: " + query);
            System.out.println("Username: " + username);
            System.out.println("Password: " + password);

            ResultSet rs = pstmt.executeQuery();
            boolean isValid = rs.next(); // Returns true if a matching user is found

            System.out.println("Query result: " + isValid);
            return isValid;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}