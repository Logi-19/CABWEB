package com.mycompany.servlet;

import com.mycompany.dao.UserDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        System.out.println("Username from form: " + username);
        System.out.println("Password from form: " + password);

        // Validate user credentials
        boolean isValidUser = UserDAO.getInstance().validateUser(username, password);

        System.out.println("Is user valid? " + isValidUser);

        if (isValidUser) {
            response.sendRedirect("index.jsp"); // Redirect to index.jsp on success
        } else {
            response.sendRedirect("login.jsp"); // Redirect back to login page on failure
        }
    }
}