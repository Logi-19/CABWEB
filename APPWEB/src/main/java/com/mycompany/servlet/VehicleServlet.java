package com.mycompany.servlet;

import com.mycompany.dao.VehicleDAO;
import com.mycompany.model.Vehicle;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.Date;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/VehicleServlet")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2, // 2MB
    maxFileSize = 1024 * 1024 * 10,      // 10MB
    maxRequestSize = 1024 * 1024 * 50    // 50MB
)
public class VehicleServlet extends HttpServlet {

    private VehicleDAO vehicleDAO;

    @Override
    public void init() {
        vehicleDAO = VehicleDAO.getInstance();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("add".equals(action)) {
            addVehicle(request, response);
        } else if ("update".equals(action)) {
            updateVehicle(request, response);
        } else if ("delete".equals(action)) {
            deleteVehicle(request, response);
        }
    }

    private void addVehicle(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String vehicleNo = request.getParameter("vehicleNo");
        String color = request.getParameter("color");
        int modelYear = Integer.parseInt(request.getParameter("modelYear"));
        String vehicleType = request.getParameter("vehicleType");
        Date insuranceExpired = Date.valueOf(request.getParameter("insuranceExpired"));

        String imageUrl = uploadImage(request, "image");

        Vehicle vehicle = new Vehicle();
        vehicle.setImageUrl(imageUrl);
        vehicle.setVehicleNo(vehicleNo);
        vehicle.setColor(color);
        vehicle.setModelYear(modelYear);
        vehicle.setVehicleType(vehicleType);
        vehicle.setInsuranceExpired(insuranceExpired);

        vehicleDAO.addVehicle(vehicle);
        response.sendRedirect("adminvehiclemanage.jsp");
    }

    private void updateVehicle(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        Vehicle vehicle = new Vehicle();
        vehicle.setId(Integer.parseInt(request.getParameter("vehicleId")));
        vehicle.setVehicleNo(request.getParameter("vehicleNo"));
        vehicle.setColor(request.getParameter("color"));
        vehicle.setModelYear(Integer.parseInt(request.getParameter("modelYear")));
        vehicle.setVehicleType(request.getParameter("vehicleType"));
        vehicle.setInsuranceExpired(Date.valueOf(request.getParameter("insuranceExpired")));

        // Handle Image Upload (Only update if new image is provided)
        String imageUrl = uploadImage(request, "image");
        if (imageUrl != null) {
            vehicle.setImageUrl(imageUrl);
        } else {
            vehicle.setImageUrl(request.getParameter("existingImageUrl"));
        }

        vehicleDAO.updateVehicle(vehicle);
        response.sendRedirect("adminvehiclemanage.jsp");
    }

    private void deleteVehicle(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("vehicleId"));
        vehicleDAO.deleteVehicle(id);
        response.sendRedirect("adminvehiclemanage.jsp");
    }

    private String uploadImage(HttpServletRequest request, String partName) throws IOException, ServletException {
        Part filePart = request.getPart(partName);
        if (filePart != null && filePart.getSize() > 0) {
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdirs();

            String filePath = uploadPath + File.separator + fileName;
            filePart.write(filePath);

            return "uploads/" + fileName; // Save relative path
        }
        return null;
    }
}