package com.mycompany.servlet;

import com.mycompany.dao.VehicleDriverAllocationDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/VehicleDriverAllocationServlet")
public class VehicleDriverAllocationServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve parameters from the request
        String vehicleNo = request.getParameter("vehicleNo");
        String vehicleImage = request.getParameter("vehicleImage");
        String vehicleType = request.getParameter("vehicleType");
        String vehicleColor = request.getParameter("vehicleColor");
        String driverName = request.getParameter("driverName");
        String driverImage = request.getParameter("driverImage");
        String driverPhone = request.getParameter("driverPhone");

        // Debugging: Print the received parameters
        System.out.println("Received parameters:");
        System.out.println("Vehicle No: " + vehicleNo);
        System.out.println("Vehicle Image: " + vehicleImage);
        System.out.println("Vehicle Type: " + vehicleType);
        System.out.println("Vehicle Color: " + vehicleColor);
        System.out.println("Driver Name: " + driverName);
        System.out.println("Driver Image: " + driverImage);
        System.out.println("Driver Phone: " + driverPhone);

        // Null check for all parameters
        if (vehicleNo == null || vehicleImage == null || vehicleType == null || vehicleColor == null ||
            driverName == null || driverImage == null || driverPhone == null ||
            vehicleNo.trim().isEmpty() || driverName.trim().isEmpty()) {
            System.err.println("One or more parameters are null or empty.");
            response.getWriter().write("failure");
            return;
        }

        // Save the allocation using the DAO
        boolean isSuccess = VehicleDriverAllocationDAO.getInstance().saveAllocation(
            vehicleNo, vehicleImage, vehicleType, vehicleColor,
            driverName, driverImage, driverPhone
        );

        // Debugging: Verify if insertion was successful
        if (isSuccess) {
            System.out.println("Allocation saved successfully.");
            response.getWriter().write("success");
        } else {
            System.err.println("Error: Allocation could not be saved.");
            response.getWriter().write("failure");
        }
    }
}
