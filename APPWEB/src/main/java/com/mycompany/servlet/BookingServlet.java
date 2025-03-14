package com.mycompany.servlet;

import com.mycompany.model.Booking;
import com.mycompany.dao.BookingDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/submitBooking")
public class BookingServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String pickupLocation = request.getParameter("pickup-location");
        String dropLocation = request.getParameter("drop-location");
        double distance = Double.parseDouble(request.getParameter("distance"));
        double totalPrice = Double.parseDouble(request.getParameter("total-price"));
        String vehicleNo = request.getParameter("vehicle-no");
        String vehicleType = request.getParameter("vehicle-type");
        String driverName = request.getParameter("driver-name");
        String driverPhone = request.getParameter("driver-phone");

        // Create a Booking object
        Booking booking = new Booking();
        booking.setName(name);
        booking.setAddress(address);
        booking.setPhone(phone);
        booking.setPickupLocation(pickupLocation);
        booking.setDropLocation(dropLocation);
        booking.setDistance(distance);
        booking.setTotalPrice(totalPrice);
        booking.setVehicleNo(vehicleNo);
        booking.setVehicleType(vehicleType);
        booking.setDriverName(driverName);
        booking.setDriverPhone(driverPhone);

        // Save the booking to the database
        boolean isSaved = BookingDAO.getInstance().saveBooking(booking);

        // Redirect based on success or failure
        if (isSaved) {
            response.sendRedirect("success.jsp"); // Redirect to a success page
        } else {
            response.sendRedirect("error.jsp"); // Redirect to an error page
        }
    }
}