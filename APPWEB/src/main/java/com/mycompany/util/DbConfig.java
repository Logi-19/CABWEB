package com.mycompany.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConfig {
    private static Connection connection = null; // Single instance of Connection

    // Database details
    private static final String DB_URL = "jdbc:mysql://localhost:3306/cabweb";
    private static final String DB_USERNAME = "root";
    private static final String DB_PASSWORD = "MySQL";

    // Private constructor to prevent instantiation
    private DbConfig() {}

    // Public method to get a single instance of Connection
    public static synchronized Connection getConnection() throws SQLException {
        if (connection == null || connection.isClosed()) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                connection = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
            } catch (ClassNotFoundException e) {
                throw new SQLException("MySQL JDBC Driver not found", e);
            }
        }
        return connection;
    }
}
