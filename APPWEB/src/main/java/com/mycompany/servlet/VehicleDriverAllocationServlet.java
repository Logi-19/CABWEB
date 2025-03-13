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

        System.out.println("Received Vehicle: " + vehicleNo);
        System.out.println("Received Driver: " + driverName);

        if (vehicleNo == null || vehicleNo.isEmpty() || driverName == null || driverName.isEmpty()) {
            response.getWriter().write("fail: missing parameters");
            return;
        }

        boolean isAllocated = VehicleDriverAllocationDAO.getInstance().allocateDriverToVehicle(vehicleNo, driverName);

        if (isAllocated) {
            System.out.println("Allocation SUCCESS");
            response.getWriter().write("success");
        } else {
            System.out.println("Allocation FAILED");
            response.getWriter().write("fail");
        }
    }
}

