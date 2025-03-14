<%@page import="java.util.List"%>
<%@page import="com.mycompany.model.VehicleDriverAllocation"%>
<%@page import="com.mycompany.dao.VehicleDriverAllocationDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Our Cab Services - Sri Lanka</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        .blur-background { filter: blur(5px); pointer-events: none; }
    </style>
    <script>
        // Vehicle Pricing
        const vehiclePrices = {
            "bike": { baseFare: 150, extraFare: 40 },
            "car": { baseFare: 250, extraFare: 60 },
            "van": { baseFare: 350, extraFare: 80 },
            "tuktuk": { baseFare: 100, extraFare: 30 },
            "xl": { baseFare: 500, extraFare: 100 },
            "luxury": { baseFare: 1000, extraFare: 200 },
        };

        // Function to geocode a place name into coordinates (focused on Sri Lanka)
// Function to geocode a place name into coordinates (focused on Sri Lanka)
async function geocodePlace(placeName) {
    const url = "https://nominatim.openstreetmap.org/search?format=json&q=" + encodeURIComponent(placeName) + "&countrycodes=lk";
    try {
        const response = await fetch(url);
        const data = await response.json();
        console.log(`Geocoding response for: ${placeName}`, data); // Log the full geocoding response

        if (data.length > 0) {
            const { lat, lon } = data[0]; // Get the first result's coordinates
            console.log(`Geocoded coordinates for ${placeName}: ${lat}, ${lon}`); // Log the valid coordinates
            return `${lat},${lon}`; // Return coordinates in 'lat,lon' format
        } else {
            console.error("No matching results found for:", placeName); // Log if no results are found
            alert("Location not found. Please try a different location.");
            throw new Error("Place not found.");
        }
    } catch (error) {
        console.error("Geocoding error:", error);
        alert("Error in geocoding. Please check the location and try again.");
        throw error;
    }
}

// Function to calculate distance using OSRM
async function calculateDistance() {
    const pickupPlace = document.getElementById('pickup-location').value;
    const dropPlace = document.getElementById('drop-location').value;

    if (!pickupPlace || !dropPlace) {
        alert("Please enter both pickup and drop locations.");
        return;
    }

    try {
        // Geocode pickup and drop locations
        const pickupCoords = await geocodePlace(pickupPlace);
        const dropCoords = await geocodePlace(dropPlace);

        // Log the coordinates to check if they are valid
        console.log("Pickup Coordinates:", pickupCoords);
        console.log("Drop Coordinates:", dropCoords);

        // Ensure coordinates are valid before proceeding
        if (!pickupCoords || !dropCoords || pickupCoords === "," || dropCoords === ",") {
            alert("Invalid coordinates. Please try again.");
            return;
        }

        // Construct OSRM URL with coordinates properly formatted
        const osrmUrl = `https://router.project-osrm.org/route/v1/driving/${pickupCoords};${dropCoords}?overview=false`;

        // Log the OSRM URL to debug
        console.log("OSRM URL:", osrmUrl);

        // Use OSRM to calculate distance
        const response = await fetch(osrmUrl);
        const data = await response.json();

        if (data.routes && data.routes.length > 0) {
            const distance = data.routes[0].distance / 1000; // Convert meters to kilometers
            document.getElementById('distance').value = distance.toFixed(2);
            calculatePrice(distance); // Recalculate price based on distance
        } else {
            alert("Unable to calculate distance. Please check the locations.");
        }
    } catch (error) {
        console.error("Error calculating distance:", error);
        alert("Error calculating distance. Please ensure the locations are valid and try again.");
    }
}

// Function to calculate price based on distance and vehicle type
function calculatePrice(distance) {
    const selectedVehicleType = document.getElementById('vehicle-type').value.toLowerCase();
    const { baseFare, extraFare } = vehiclePrices[selectedVehicleType] || { baseFare: 250, extraFare: 50 };

    const totalPrice = baseFare + (distance > 1 ? (distance - 1) * extraFare : 0);
    document.getElementById('total-price').value = totalPrice.toFixed(2);
}


        function showBooking(vehicleNo, imageUrl, color, type, driverName, driverPhone, driverImage) {
            document.getElementById('selected-vehicle').classList.remove('hidden');
            document.getElementById('booking-form').classList.remove('hidden');
            document.getElementById('vehicle-list').classList.add('blur-background');
            document.getElementById('vehicle-img').src = imageUrl;
            document.getElementById('vehicle-no').textContent = vehicleNo;
            document.getElementById('vehicle-color').textContent = color;
            document.getElementById('vehicle-type').textContent = type;
            document.getElementById('driver-img').src = driverImage;
            document.getElementById('driver-name').textContent = driverName;
            document.getElementById('driver-phone').textContent = driverPhone;

            // Populate hidden fields for form submission
            document.getElementById('vehicle-no').value = vehicleNo;
            document.getElementById('vehicle-type').value = type;
            document.getElementById('driver-name').value = driverName;
            document.getElementById('driver-phone').value = driverPhone;
        }

        function filterVehicles() {
            const filterType = document.getElementById('filter-type').value.toLowerCase();
            const vehicles = document.querySelectorAll('#vehicle-list > div');
            vehicles.forEach(vehicle => {
                const type = vehicle.querySelector('p:nth-child(3)').textContent.toLowerCase();
                if (filterType === 'all' || type.includes(filterType)) {
                    vehicle.style.display = 'block';
                } else {
                    vehicle.style.display = 'none';
                }
            });
        }
    </script>
</head>
<body class="bg-gray-100">
    <%@ include file="navbar.jsp" %>
    <div class="container mx-auto px-4 mt-8">
        <h2 class="text-2xl font-bold text-center mb-4">Available Vehicles</h2>
        <div class="mb-4">
            <label for="filter-type" class="block text-sm font-semibold mb-1">Filter by Vehicle Type:</label>
            <select id="filter-type" onchange="filterVehicles()" class="w-full md:w-1/3 p-2 border border-gray-300 rounded-lg">
                <option value="all">All</option>
                <option value="bike">Bike</option>
                <option value="car">Car</option>
                <option value="van">Van</option>
                <option value="tuktuk">TukTuk</option>
                <option value="xl">XL</option>
                <option value="luxury">Luxury</option>
            </select>
        </div>
        <div id="vehicle-list" class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
            <% 
            List<VehicleDriverAllocation> allocations = VehicleDriverAllocationDAO.getInstance().getAllAllocations();
            for (VehicleDriverAllocation allocation : allocations) { %>
                <div class="bg-white p-3 shadow-md rounded-lg cursor-pointer" 
                     onclick="showBooking('<%= allocation.getVehicleNo() %>', '<%= allocation.getVehicleImage() %>', '<%= allocation.getVehicleColor() %>', '<%= allocation.getVehicleType() %>', '<%= allocation.getDriverName() %>', '<%= allocation.getDriverPhone() %>', '<%= allocation.getDriverImage() %>')"
                     data-type="<%= allocation.getVehicleType().toLowerCase() %>">
                    <img src="<%= allocation.getVehicleImage() %>" alt="Vehicle" class="w-full h-32 object-cover rounded-md">
                    <p class="mt-1 text-sm font-semibold">Vehicle No: <%= allocation.getVehicleNo() %></p>
                    <p class="text-xs">Color: <%= allocation.getVehicleColor() %></p>
                    <p class="text-xs">Type: <%= allocation.getVehicleType() %></p>
                    <hr class="my-1">
                    <div class="flex items-center">
                        <img src="<%= allocation.getDriverImage() %>" alt="Driver" class="w-8 h-8 rounded-full mr-2">
                        <div>
                            <p class="text-sm font-semibold"><%= allocation.getDriverName() %></p>
                            <p class="text-xs">Phone: <%= allocation.getDriverPhone() %></p>
                        </div>
                    </div>
                </div>
            <% } %>
        </div>
        <div id="selected-vehicle" class="hidden mt-6 grid grid-cols-1 md:grid-cols-2 gap-4">
            <div class="bg-white p-4 shadow-md rounded-lg">
                <img id="vehicle-img" src="" alt="Vehicle" class="w-full h-32 object-cover rounded-md">
                <p class="mt-1 text-sm font-semibold">Vehicle No: <span id="vehicle-no"></span></p>
                <p class="text-xs">Color: <span id="vehicle-color"></span></p>
                <p class="text-xs">Type: <span id="vehicle-type"></span></p>
                <hr class="my-1">
                <div class="flex items-center">
                    <img id="driver-img" src="" alt="Driver" class="w-8 h-8 rounded-full mr-2">
                    <div>
                        <p class="text-sm font-semibold" id="driver-name"></p>
                        <p class="text-xs">Phone: <span id="driver-phone"></span></p>
                    </div>
                </div>
            </div>
            <section id="booking-form" class="hidden bg-white p-4 shadow-md rounded-lg">
                <h3 class="text-xl font-semibold text-center mb-4">Cab Booking Form</h3>
                <form action="submitBooking" method="POST" class="space-y-3">
                    <div><label class="block text-xs font-semibold">Name</label><input type="text" name="name" class="w-full p-2 border border-gray-300 rounded-lg" required /></div>
                    <div><label class="block text-xs font-semibold">Address</label><input type="text" name="address" class="w-full p-2 border border-gray-300 rounded-lg" required /></div>
                    <div><label class="block text-xs font-semibold">Phone Number</label><input type="tel" name="phone" class="w-full p-2 border border-gray-300 rounded-lg" required /></div>
                    <div><label class="block text-xs font-semibold">Pickup Location (e.g., Colombo)</label><input id="pickup-location" type="text" name="pickup-location" class="w-full p-2 border border-gray-300 rounded-lg" required /></div>
                    <div><label class="block text-xs font-semibold">Drop Location (e.g., Kandy)</label><input id="drop-location" type="text" name="drop-location" class="w-full p-2 border border-gray-300 rounded-lg" required /></div>
                    <div><label class="block text-xs font-semibold">Distance (km)</label><input id="distance" type="text" name="distance" class="w-full p-2 border border-gray-300 rounded-lg" readonly required /></div>
                    <div><label class="block text-xs font-semibold">Total Price</label><input id="total-price" type="text" name="total-price" class="w-full p-2 border border-gray-300 rounded-lg" readonly required /></div>
                    <div><button type="button" onclick="calculateDistance()" class="w-full p-2 bg-blue-500 text-white rounded-lg">Calculate Distance & Price</button></div>
                    <div><button type="submit" class="w-full p-2 bg-green-500 text-white rounded-lg">Confirm Booking</button></div>
                </form>
            </section>
        </div>
    </div>
</body>
</html>
