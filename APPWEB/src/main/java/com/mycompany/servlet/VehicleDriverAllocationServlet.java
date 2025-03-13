package com.mycompany.servlet;

import com.mycompany.dao.VehicleDriverAllocationDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/VehicleDriverAllocationServlet")
public class VehicleDriverAllocationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String vehicleNo = request.getParameter("vehicleNo");
        String driverName = request.getParameter("driverName");

        boolean allocated = VehicleDriverAllocationDAO.getInstance().allocateDriverToVehicle(vehicleNo, driverName);
        response.getWriter().write(allocated ? "success" : "failure");
    }
}
