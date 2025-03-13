package com.mycompany.dao;

import com.mycompany.model.Contact;
import com.mycompany.util.DbConfig;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ContactDAO {
    private static ContactDAO instance;
    private Connection connection;

    private ContactDAO() throws SQLException {
        this.connection = DbConfig.getConnection();
    }

    public static ContactDAO getInstance() throws SQLException {
        if (instance == null) {
            synchronized (ContactDAO.class) {
                if (instance == null) {
                    instance = new ContactDAO();
                }
            }
        }
        return instance;
    }

    // Insert a new contact message
    public boolean saveContact(Contact contact) {
        String sql = "INSERT INTO contact (name, email, phone, message, created_at) VALUES (?, ?, ?, ?, NOW())";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, contact.getName());
            stmt.setString(2, contact.getEmail());
            stmt.setString(3, contact.getPhone());
            stmt.setString(4, contact.getMessage());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Retrieve all contact messages
    public List<Contact> getAllContacts() {
    List<Contact> contacts = new ArrayList<>();
    String sql = "SELECT * FROM contact ORDER BY created_at DESC";

    try (Statement stmt = connection.createStatement();
         ResultSet rs = stmt.executeQuery(sql)) {
        
        System.out.println("Executing SQL Query: " + sql);

        while (rs.next()) {
            contacts.add(new Contact(
                    rs.getInt("id"),
                    rs.getString("name"),
                    rs.getString("email"),
                    rs.getString("phone"),
                    rs.getString("message"),
                    rs.getString("created_at")
            ));
        }

        System.out.println("Total contacts fetched: " + contacts.size());
        
    } catch (SQLException e) {
        System.out.println("Error fetching contacts: " + e.getMessage()); // Log error
        e.printStackTrace();
    }

    return contacts; // Ensures it never returns null
}


}
