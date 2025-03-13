<%@ page contentType="text/html" pageEncoding="UTF-8"%>
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
                        <!-- Vehicle cards will be populated dynamically -->
                    </div>
                </div>

                <!-- Driver Selection -->
                <div class="mb-6">
                    <h2 class="text-xl font-semibold mb-2">Select Driver</h2>
                    <div id="driverList" class="grid grid-cols-3 gap-4">
                        <!-- Driver cards will be populated dynamically -->
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
                            <!-- Allocated rows will be added dynamically -->
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <script>
            let vehicles = [
                { vehicleNo: "V001", imageUrl: "vehicle1.jpg", vehicleType: "SUV", color: "Red" },
                { vehicleNo: "V002", imageUrl: "vehicle2.jpg", vehicleType: "Sedan", color: "Blue" }
            ];

            let drivers = [
                { name: "John Doe", imageUrl: "driver1.jpg", phone: "+1234567890" },
                { name: "Jane Smith", imageUrl: "driver2.jpg", phone: "+0987654321" }
            ];

            let selectedVehicle = null;
            let selectedDriver = null;

            function renderVehicles() {
                const vehicleList = document.getElementById("vehicleList");
                vehicleList.innerHTML = "";
                vehicles.forEach(vehicle => {
                    const isSelected = selectedVehicle && selectedVehicle.vehicleNo === vehicle.vehicleNo ? 'border-4 border-blue-500' : '';
                    const card = `<div class='p-4 bg-white rounded-lg shadow-md cursor-pointer ${isSelected}' onclick='selectVehicle("${vehicle.vehicleNo}")'>
                                    <img src='${vehicle.imageUrl}' class='w-full h-32 object-cover rounded-md mb-2'>
                                    <p><strong>${vehicle.vehicleNo}</strong></p>
                                    <p>${vehicle.vehicleType} - ${vehicle.color}</p>
                                </div>`;
                    vehicleList.innerHTML += card;
                });
            }

            function renderDrivers() {
                const driverList = document.getElementById("driverList");
                driverList.innerHTML = "";
                drivers.forEach(driver => {
                    const isSelected = selectedDriver && selectedDriver.name === driver.name ? 'border-4 border-blue-500' : '';
                    const card = `<div class='p-4 bg-white rounded-lg shadow-md cursor-pointer ${isSelected}' onclick='selectDriver("${driver.name}")'>
                                    <img src='${driver.imageUrl}' class='w-full h-32 object-cover rounded-md mb-2'>
                                    <p><strong>${driver.name}</strong></p>
                                    <p>${driver.phone}</p>
                                </div>`;
                    driverList.innerHTML += card;
                });
            }

            function selectVehicle(vehicleNo) {
                selectedVehicle = vehicles.find(v => v.vehicleNo === vehicleNo);
                renderVehicles();
            }

            function selectDriver(driverName) {
                selectedDriver = drivers.find(d => d.name === driverName);
                renderDrivers();
            }

            document.getElementById("allocateBtn").addEventListener("click", function() {
                if (!selectedVehicle || !selectedDriver) {
                    alert("Please select both a vehicle and a driver.");
                    return;
                }
                const allocationTable = document.getElementById("allocationTable");
                const row = `<tr>
                                <td class='px-6 py-4'>${selectedVehicle.vehicleNo}</td>
                                <td class='px-6 py-4'><img src='${selectedVehicle.imageUrl}' class='w-16 h-16 rounded-md'></td>
                                <td class='px-6 py-4'>${selectedVehicle.vehicleType}</td>
                                <td class='px-6 py-4'>${selectedVehicle.color}</td>
                                <td class='px-6 py-4'>${selectedDriver.name}</td>
                                <td class='px-6 py-4'><img src='${selectedDriver.imageUrl}' class='w-16 h-16 rounded-md'></td>
                                <td class='px-6 py-4'>${selectedDriver.phone}</td>
                            </tr>`;
                allocationTable.innerHTML += row;
                selectedVehicle = null;
                selectedDriver = null;
                renderVehicles();
                renderDrivers();
            });

            renderVehicles();
            renderDrivers();
        </script>
    </body>
</html>
