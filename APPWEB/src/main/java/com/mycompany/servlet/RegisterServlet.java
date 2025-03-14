package com.mycompany.servlet;

import com.mycompany.dao.UserDAO;
import com.mycompany.model.User;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data
        String registerNo = request.getParameter("registerNo");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String nic = request.getParameter("nic");
        String address = request.getParameter("address");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Create User object
        User user = new User();
        user.setRegisterNo(registerNo);
        user.setName(name);
        user.setEmail(email);
        user.setPhone(phone);
        user.setNic(nic);
        user.setAddress(address);
        user.setUsername(username);
        user.setPassword(password);

        // Insert user into the database
        boolean isRegistered = UserDAO.getInstance().registerUser(user);

        if (isRegistered) {
            response.sendRedirect("login.jsp"); // Redirect to login page on success
        } else {
            response.sendRedirect("register.jsp"); // Redirect back to registration page on failure
        }
    }
}