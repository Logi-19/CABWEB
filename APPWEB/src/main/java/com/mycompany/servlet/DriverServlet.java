package com.mycompany.servlet;

import com.mycompany.dao.DriverDAO;
import com.mycompany.model.Driver;
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

@WebServlet("/DriverServlet")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2, // 2MB
    maxFileSize = 1024 * 1024 * 10,      // 10MB
    maxRequestSize = 1024 * 1024 * 50    // 50MB
)
public class DriverServlet extends HttpServlet {

    private DriverDAO driverDAO;

    @Override
    public void init() {
        driverDAO = DriverDAO.getInstance();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("add".equals(action)) {
            addDriver(request, response);
        } else if ("update".equals(action)) {
            updateDriver(request, response);
        } else if ("delete".equals(action)) {
            deleteDriver(request, response);
        }
    }

    private void addDriver(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
    System.out.println("Received request to add driver...");

    String name = request.getParameter("name");
    String nic = request.getParameter("nic");
    String email = request.getParameter("email");
    String address = request.getParameter("address");
    String phone = request.getParameter("phone");
    String licenseNo = request.getParameter("licenseNo");
    String licenseExpiredDateStr = request.getParameter("licenseExpiredDate");

    System.out.println("Name: " + name);
    System.out.println("NIC: " + nic);
    System.out.println("Email: " + email);
    System.out.println("Address: " + address);
    System.out.println("Phone: " + phone);
    System.out.println("License No: " + licenseNo);
    System.out.println("License Expiry Date: " + licenseExpiredDateStr);

    try {
        Date licenseExpiredDate = Date.valueOf(licenseExpiredDateStr);
        System.out.println("Parsed Date: " + licenseExpiredDate);

        String imageUrl = uploadImage(request, "image");
        System.out.println("Uploaded Image Path: " + imageUrl);

        Driver driver = new Driver();
        driver.setName(name);
        driver.setNic(nic);
        driver.setEmail(email);
        driver.setAddress(address);
        driver.setPhone(phone);
        driver.setLicenseNo(licenseNo);
        driver.setLicenseExpiredDate(licenseExpiredDate);
        driver.setImageUrl(imageUrl);

        boolean result = driverDAO.addDriver(driver);
        System.out.println("Driver Inserted: " + result);

        if (result) {
            System.out.println("Redirecting to admindrivermanage.jsp...");
            response.sendRedirect("admindrivermanage.jsp");
        } else {
            System.out.println("Failed to insert driver.");
            response.getWriter().write("Error: Could not insert driver. Check logs.");
        }
    } catch (Exception e) {
        e.printStackTrace();
        response.getWriter().write("Error processing request: " + e.getMessage());
    }
}


    private void updateDriver(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        Driver driver = new Driver();
        driver.setId(Integer.parseInt(request.getParameter("driverId")));
        driver.setName(request.getParameter("name"));
        driver.setNic(request.getParameter("nic"));
        driver.setEmail(request.getParameter("email"));
        driver.setAddress(request.getParameter("address"));
        driver.setPhone(request.getParameter("phone"));
        driver.setLicenseNo(request.getParameter("licenseNo"));
        driver.setLicenseExpiredDate(Date.valueOf(request.getParameter("licenseExpiredDate")));

        // Handle Image Upload (Only update if new image is provided)
        String imageUrl = uploadImage(request, "image");
        if (imageUrl != null) {
            driver.setImageUrl(imageUrl);
        } else {
            driver.setImageUrl(request.getParameter("existingImageUrl"));
        }

        driverDAO.updateDriver(driver);
        response.sendRedirect("admindrivermanage.jsp");
    }

    private void deleteDriver(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("driverId"));
        driverDAO.deleteDriver(id);
        response.sendRedirect("admindrivermanage.jsp");
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
