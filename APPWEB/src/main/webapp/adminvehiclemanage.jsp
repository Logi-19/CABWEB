<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.mycompany.model.Vehicle, com.mycompany.dao.VehicleDAO, java.util.List" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Dashboard - Vehicle Management</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body class="bg-gray-100">
        <div class="flex min-h-screen">
            <!-- Sidebar -->
            <%@ include file="adminsidebar.jsp" %>
            
            <!-- Main content area -->
            <div class="flex-1 p-10">
                <h1 class="text-3xl font-bold mb-5">Vehicle Management</h1>

                <!-- Form for adding/editing vehicle details -->
                <form id="vehicleForm" action="VehicleServlet" method="POST" enctype="multipart/form-data" class="bg-white p-6 rounded-lg shadow-md mb-6">
                    <h2 class="text-xl font-semibold mb-4">Add/Edit Vehicle</h2>
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                        <input type="hidden" id="vehicleId" name="vehicleId">
                        <div>
                            <label for="image" class="block text-sm font-medium text-gray-700">Image</label>
                            <input type="file" id="image" name="image" class="mt-1 block w-full p-2 border border-gray-300 rounded-md" accept="image/*">
                        </div>
                        <div>
                            <label for="vehicleNo" class="block text-sm font-medium text-gray-700">Vehicle No</label>
                            <input type="text" id="vehicleNo" name="vehicleNo" class="mt-1 block w-full p-2 border border-gray-300 rounded-md">
                        </div>
                        <div>
                            <label for="color" class="block text-sm font-medium text-gray-700">Color</label>
                            <input type="text" id="color" name="color" class="mt-1 block w-full p-2 border border-gray-300 rounded-md">
                        </div>
                        <div>
                            <label for="modelYear" class="block text-sm font-medium text-gray-700">Model Year</label>
                            <input type="number" id="modelYear" name="modelYear" class="mt-1 block w-full p-2 border border-gray-300 rounded-md">
                        </div>
                        <div>
                            <label for="vehicleType" class="block text-sm font-medium text-gray-700">Vehicle Type</label>
                            <select id="vehicleType" name="vehicleType" class="mt-1 block w-full p-2 border border-gray-300 rounded-md">
                                <option value="Bike">Bike</option>
                                <option value="Car">Car</option>
                                <option value="Van">Van</option>
                                <option value="TukTuk">TukTuk</option>
                                <option value="XL">XL</option>
                                <option value="Luxury">Luxury</option>
                            </select>
                        </div>
                        <div>
                            <label for="insuranceExpired" class="block text-sm font-medium text-gray-700">Insurance Expiry Date</label>
                            <input type="date" id="insuranceExpired" name="insuranceExpired" class="mt-1 block w-full p-2 border border-gray-300 rounded-md">
                        </div>
                    </div>
                    <div class="mt-4">
                        <button type="submit" name="action" value="add" class="bg-blue-500 text-white px-4 py-2 rounded-md">Save Vehicle</button>
                        <button type="button" onclick="clearForm()" class="bg-gray-500 text-white px-4 py-2 rounded-md ml-2">Clear</button>
                    </div>
                </form>

                <!-- Search Bar -->
                <div class="mb-6">
                    <input type="text" id="searchBar" placeholder="Search by Vehicle No" class="w-full p-2 border border-gray-300 rounded-md">
                </div>

                <!-- Table for displaying vehicle details -->
                <div class="bg-white rounded-lg shadow-md overflow-hidden">
                    <table class="min-w-full">
                        <thead class="bg-gray-50">
                            <tr>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Image</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Vehicle No</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Color</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Model Year</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Vehicle Type</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Insurance Expiry</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Actions</th>
                            </tr>
                        </thead>
                        <tbody id="vehicleTable" class="divide-y divide-gray-200">
                            <%
                                VehicleDAO vehicleDAO = VehicleDAO.getInstance();
                                List<Vehicle> vehicles = vehicleDAO.getAllVehicles();
                                for (Vehicle vehicle : vehicles) {
                            %>
                            <tr data-id="<%= vehicle.getId() %>">
                                <td class="px-6 py-4"><img src="<%= vehicle.getImageUrl() %>" alt="Vehicle Image" class="w-10 h-10 rounded-full"></td>
                                <td class="px-6 py-4"><%= vehicle.getVehicleNo() %></td>
                                <td class="px-6 py-4"><%= vehicle.getColor() %></td>
                                <td class="px-6 py-4"><%= vehicle.getModelYear() %></td>
                                <td class="px-6 py-4"><%= vehicle.getVehicleType() %></td>
                                <td class="px-6 py-4"><%= vehicle.getInsuranceExpired() %></td>
                                <td class="px-6 py-4">
                                    <button onclick="editVehicle(<%= vehicle.getId() %>)" class="text-blue-500 hover:text-blue-700">Edit</button>
                                    <button onclick="deleteVehicle(<%= vehicle.getId() %>)" class="text-red-500 hover:text-red-700 ml-2">Delete</button>
                                </td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <script>
            // Function to populate the form for editing
            function editVehicle(vehicleId) {
                fetch(`VehicleServlet?action=get&id=${vehicleId}`)
                    .then(response => response.json())
                    .then(vehicle => {
                        document.getElementById('vehicleId').value = vehicle.id;
                        document.getElementById('vehicleNo').value = vehicle.vehicleNo;
                        document.getElementById('color').value = vehicle.color;
                        document.getElementById('modelYear').value = vehicle.modelYear;
                        document.getElementById('vehicleType').value = vehicle.vehicleType;
                        document.getElementById('insuranceExpired').value = vehicle.insuranceExpired;
                        // Note: Image upload cannot be pre-filled due to security reasons
                    });
            }

            // Function to delete a vehicle
            function deleteVehicle(vehicleId) {
                if (confirm("Are you sure you want to delete this vehicle?")) {
                    fetch(`VehicleServlet?action=delete&id=${vehicleId}`, { method: 'POST' })
                        .then(response => {
                            if (response.ok) {
                                location.reload(); // Reload the page to reflect changes
                            }
                        });
                }
            }

            // Function to clear the form
            function clearForm() {
                document.getElementById('vehicleForm').reset();
                document.getElementById('vehicleId').value = '';
            }

            // Function to handle search
            document.getElementById('searchBar').addEventListener('input', function (e) {
                const searchTerm = e.target.value.toLowerCase();
                const rows = document.querySelectorAll('#vehicleTable tr');
                rows.forEach(row => {
                    const vehicleNo = row.querySelector('td:nth-child(2)').textContent.toLowerCase();
                    if (vehicleNo.includes(searchTerm)) {
                        row.style.display = '';
                    } else {
                        row.style.display = 'none';
                    }
                });
            });
        </script>
    </body>
</html>