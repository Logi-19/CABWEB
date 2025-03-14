package com.mycompany.servlet;

import com.mycompany.dao.DriverDAO;
import com.mycompany.model.Driver;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.google.gson.Gson;

@WebServlet("/GetDriverDetailsServlet")
public class GetDriverDetailsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String driverName = request.getParameter("driverName");
        Driver driver = DriverDAO.getInstance().getDriverByName(driverName);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(new Gson().toJson(driver));
    }
}