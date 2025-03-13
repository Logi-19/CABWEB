<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.mycompany.dao.VehicleDAO, com.mycompany.dao.DriverDAO, com.mycompany.dao.VehicleDriverAllocationDAO" %>
<%@ page import="com.mycompany.model.Vehicle, com.mycompany.model.Driver, com.mycompany.model.VehicleDriverAllocation" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Vehicle Driver Allocation</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100">
    <div class="flex min-h-screen">
        <%@ include file="adminsidebar.jsp" %>

        <div class="flex-1 p-10">
            <h1 class="text-3xl font-bold mb-5">Vehicle Driver Allocation</h1>

            <!-- Vehicle Selection -->
            <div class="mb-6">
                <h2 class="text-xl font-semibold mb-2">Select Vehicle</h2>
                <div id="vehicleList" class="grid grid-cols-3 gap-4">
                    <% 
                        List<Vehicle> vehicles = VehicleDAO.getInstance().getAllVehicles();
                        for (Vehicle vehicle : vehicles) { 
                    %>
                    <div class='p-4 bg-white rounded-lg shadow-md cursor-pointer' onclick='selectVehicle("<%= vehicle.getVehicleNo() %>", "<%= vehicle.getImageUrl() %>", "<%= vehicle.getVehicleType() %>", "<%= vehicle.getColor() %>")'>
                        <img src='<%= vehicle.getImageUrl() %>' class='w-full h-32 object-cover rounded-md mb-2'>
                        <p><strong><%= vehicle.getVehicleNo() %></strong></p>
                        <p><%= vehicle.getVehicleType() %> - <%= vehicle.getColor() %></p>
                    </div>
                    <% } %>
                </div>
            </div>

            <!-- Driver Selection -->
            <div class="mb-6">
                <h2 class="text-xl font-semibold mb-2">Select Driver</h2>
                <div id="driverList" class="grid grid-cols-3 gap-4">
                    <% 
                        List<Driver> drivers = DriverDAO.getInstance().getAllDrivers();
                        for (Driver driver : drivers) { 
                    %>
                    <div class='p-4 bg-white rounded-lg shadow-md cursor-pointer' onclick='selectDriver("<%= driver.getName() %>", "<%= driver.getImageUrl() %>", "<%= driver.getPhone() %>")'>
                        <img src='<%= driver.getImageUrl() %>' class='w-full h-32 object-cover rounded-md mb-2'>
                        <p><strong><%= driver.getName() %></strong></p>
                        <p><%= driver.getPhone() %></p>
                    </div>
                    <% } %>
                </div>
            </div>

            <!-- Allocate Button -->
            <button id="allocateBtn" class="bg-blue-500 text-white px-4 py-2 rounded-md">Allocate</button>

            <!-- Allocation Table -->
            <div class="mt-10 bg-white rounded-lg shadow-md overflow-hidden">
                <h2 class="text-xl font-semibold p-4">Allocated Vehicles & Drivers</h2>
                <table class="min-w-full">
                    <thead class="bg-gray-50">
                        <tr>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Vehicle No</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Vehicle Image</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Vehicle Type</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Color</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Driver Name</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Driver Image</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Phone</th>
                        </tr>
                    </thead>
                    <tbody id="allocationTable" class="divide-y divide-gray-200">
                        <% 
                            List<VehicleDriverAllocation> allocations = VehicleDriverAllocationDAO.getInstance().getAllAllocations();
                            for (VehicleDriverAllocation allocation : allocations) { 
                        %>
                        <tr>
                            <td class='px-6 py-4'><%= allocation.getVehicleNo() %></td>
                            <td class='px-6 py-4'><img src='<%= allocation.getVehicleImage() %>' class='w-16 h-16 rounded-md'></td>
                            <td class='px-6 py-4'><%= allocation.getVehicleType() %></td>
                            <td class='px-6 py-4'><%= allocation.getVehicleColor() %></td>
                            <td class='px-6 py-4'><%= allocation.getDriverName() %></td>
                            <td class='px-6 py-4'><img src='<%= allocation.getDriverImage() %>' class='w-16 h-16 rounded-md'></td>
                            <td class='px-6 py-4'><%= allocation.getDriverPhone() %></td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <script>
        let selectedVehicle = null;
        let selectedVehicleImage = null;
        let selectedVehicleType = null;
        let selectedVehicleColor = null;
        let selectedDriver = null;
        let selectedDriverImage = null;
        let selectedDriverPhone = null;

        function selectVehicle(vehicleNo, imageUrl, vehicleType, color) {
            selectedVehicle = vehicleNo;
            selectedVehicleImage = imageUrl;
            selectedVehicleType = vehicleType;
            selectedVehicleColor = color;
            console.log("Selected Vehicle:", vehicleNo);
        }

        function selectDriver(driverName, imageUrl, phone) {
            selectedDriver = driverName;
            selectedDriverImage = imageUrl;
            selectedDriverPhone = phone;
            console.log("Selected Driver:", driverName);
        }

        document.getElementById("allocateBtn").addEventListener("click", function() {
            if (!selectedVehicle || !selectedDriver) {
                alert("Please select both a vehicle and a driver.");
                return;
            }

            fetch('VehicleDriverAllocationServlet', {
                method: 'POST',
                headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                body: `vehicleNo=${selectedVehicle}&driverName=${selectedDriver}`
            })
            .then(response => response.text())
            .then(result => {
                if (result === "success") {
                    alert("Vehicle and Driver allocated successfully!");
                    location.reload();
                } else {
                    alert("Allocation failed. Try again.");
                }
            })
            .catch(error => console.error('Error:', error));
        });
    </script>
</body>
</html>
