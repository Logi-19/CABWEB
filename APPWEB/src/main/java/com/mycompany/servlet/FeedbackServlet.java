package com.mycompany.servlet;

import com.mycompany.dao.FeedbackDAO;
import com.mycompany.model.Feedback;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/FeedbackServlet")
public class FeedbackServlet extends HttpServlet {
    private FeedbackDAO feedbackDAO;

    @Override
    public void init() throws ServletException {
        try {
            feedbackDAO = FeedbackDAO.getInstance();
        } catch (SQLException e) {
            throw new ServletException("Database connection failed", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("submit".equals(action)) {
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String message = request.getParameter("message");

            Feedback feedback = new Feedback();
            feedback.setName(name);
            feedback.setEmail(email);
            feedback.setMessage(message);

            boolean isAdded = feedbackDAO.addFeedback(feedback);
            if (isAdded) {
                response.sendRedirect("index.jsp");
            } else {
                request.setAttribute("errorMessage", "Failed to submit feedback.");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
        } else if ("delete".equals(action)) {
            String email = request.getParameter("email");
            feedbackDAO.deleteFeedback(email);
            response.sendRedirect("adminfeedbackmanage.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Feedback> feedbackList = feedbackDAO.getAllFeedback();
        request.setAttribute("feedbackList", feedbackList);
        request.getRequestDispatcher("adminfeedbackmanage.jsp").forward(request, response);
    }
}
