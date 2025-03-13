package com.mycompany.dao;

import com.mycompany.model.Feedback;
import com.mycompany.util.DbConfig;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FeedbackDAO {
    private static FeedbackDAO instance;
    private Connection connection;

    private FeedbackDAO() throws SQLException {
        this.connection = DbConfig.getConnection();
    }

    public static FeedbackDAO getInstance() throws SQLException {
        if (instance == null) {
            synchronized (FeedbackDAO.class) {
                if (instance == null) {
                    instance = new FeedbackDAO();
                }
            }
        }
        return instance;
    }

    // Insert feedback
    public boolean addFeedback(Feedback feedback) {
        String sql = "INSERT INTO feedback (name, email, message, created_at) VALUES (?, ?, ?, NOW())";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, feedback.getName());
            ps.setString(2, feedback.getEmail());
            ps.setString(3, feedback.getMessage());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Get all feedback
    public List<Feedback> getAllFeedback() {
        List<Feedback> feedbackList = new ArrayList<>();
        String sql = "SELECT * FROM feedback ORDER BY created_at DESC";

        try (Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Feedback feedback = new Feedback(
                    rs.getInt("id"),
                    rs.getString("name"),
                    rs.getString("email"),
                    rs.getString("message"),
                    rs.getTimestamp("created_at")
                );
                feedbackList.add(feedback);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return feedbackList;
    }

    // Delete feedback
    public boolean deleteFeedback(String email) {
        String sql = "DELETE FROM feedback WHERE email = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, email);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
