package com.mycompany.servlet;

import com.mycompany.dao.VehicleDAO;
import com.mycompany.model.Vehicle;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.google.gson.Gson;

@WebServlet("/GetVehicleDetailsServlet")
public class GetVehicleDetailsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String vehicleNo = request.getParameter("vehicleNo");
        Vehicle vehicle = VehicleDAO.getInstance().getVehicleByNo(vehicleNo);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(new Gson().toJson(vehicle));
    }
}