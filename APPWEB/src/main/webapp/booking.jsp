<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Our Cab Services</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&callback=initMap&libraries=places" async defer></script>
    <style>
        #map { height: 200px; width: 100%; }
        .blur-background { filter: blur(5px); pointer-events: none; }
    </style>
    <script>
        let map, pickupMarker, dropoffMarker;
        function initMap() {
            map = new google.maps.Map(document.getElementById('map'), { center: { lat: 40.712776, lng: -74.005974 }, zoom: 12 });
            pickupMarker = new google.maps.Marker({ position: map.getCenter(), map: map, title: "Pickup Location" });
            dropoffMarker = new google.maps.Marker({ position: map.getCenter(), map: map, title: "Drop-off Location" });
            const pickupInput = document.getElementById('pickup-location');
            const dropoffInput = document.getElementById('drop-location');
            const autocompletePickup = new google.maps.places.Autocomplete(pickupInput);
            const autocompleteDropoff = new google.maps.places.Autocomplete(dropoffInput);
            autocompletePickup.addListener('place_changed', () => {
                const place = autocompletePickup.getPlace();
                if (place.geometry) { pickupMarker.setPosition(place.geometry.location); map.setCenter(place.geometry.location); }
            });
            autocompleteDropoff.addListener('place_changed', () => {
                const place = autocompleteDropoff.getPlace();
                if (place.geometry) { dropoffMarker.setPosition(place.geometry.location); map.setCenter(place.geometry.location); }
            });
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

            // Scroll to the selected vehicle section smoothly
            document.getElementById('selected-vehicle').scrollIntoView({ behavior: 'smooth' });
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
                <option value="sedan">Sedan</option>
                <option value="suv">SUV</option>
                <option value="hatchback">Hatchback</option>
                <option value="luxury">Luxury</option>
            </select>
        </div>
        <div id="vehicle-list" class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
            <!-- Sample Vehicle 1 -->
            <div class="bg-white p-3 shadow-md rounded-lg cursor-pointer" onclick="showBooking('ABC123', 'https://via.placeholder.com/200', 'Red', 'Sedan', 'John Doe', '123-456-7890', 'https://via.placeholder.com/40')">
                <img src="https://via.placeholder.com/200" alt="Vehicle" class="w-full h-32 object-cover rounded-md">
                <p class="mt-1 text-sm font-semibold">Vehicle No: ABC123</p>
                <p class="text-xs">Color: Red</p>
                <p class="text-xs">Type: Sedan</p>
                <hr class="my-1">
                <div class="flex items-center">
                    <img src="https://via.placeholder.com/40" alt="Driver" class="w-8 h-8 rounded-full mr-2">
                    <div>
                        <p class="text-sm font-semibold">John Doe</p>
                        <p class="text-xs">Phone: 123-456-7890</p>
                    </div>
                </div>
            </div>
            <!-- Sample Vehicle 2 -->
            <div class="bg-white p-3 shadow-md rounded-lg cursor-pointer" onclick="showBooking('XYZ456', 'https://via.placeholder.com/200', 'Blue', 'SUV', 'Jane Smith', '987-654-3210', 'https://via.placeholder.com/40')">
                <img src="https://via.placeholder.com/200" alt="Vehicle" class="w-full h-32 object-cover rounded-md">
                <p class="mt-1 text-sm font-semibold">Vehicle No: XYZ456</p>
                <p class="text-xs">Color: Blue</p>
                <p class="text-xs">Type: SUV</p>
                <hr class="my-1">
                <div class="flex items-center">
                    <img src="https://via.placeholder.com/40" alt="Driver" class="w-8 h-8 rounded-full mr-2">
                    <div>
                        <p class="text-sm font-semibold">Jane Smith</p>
                        <p class="text-xs">Phone: 987-654-3210</p>
                    </div>
                </div>
            </div>
            <!-- Sample Vehicle 3 -->
            <div class="bg-white p-3 shadow-md rounded-lg cursor-pointer" onclick="showBooking('LMN789', 'https://via.placeholder.com/200', 'Black', 'Luxury', 'Mike Johnson', '456-789-0123', 'https://via.placeholder.com/40')">
                <img src="https://via.placeholder.com/200" alt="Vehicle" class="w-full h-32 object-cover rounded-md">
                <p class="mt-1 text-sm font-semibold">Vehicle No: LMN789</p>
                <p class="text-xs">Color: Black</p>
                <p class="text-xs">Type: Luxury</p>
                <hr class="my-1">
                <div class="flex items-center">
                    <img src="https://via.placeholder.com/40" alt="Driver" class="w-8 h-8 rounded-full mr-2">
                    <div>
                        <p class="text-sm font-semibold">Mike Johnson</p>
                        <p class="text-xs">Phone: 456-789-0123</p>
                    </div>
                </div>
            </div>
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
                    <div><label class="block text-xs font-semibold">Pickup Location</label><input type="text" id="pickup-location" name="pickup-location" class="w-full p-2 border border-gray-300 rounded-lg" required /></div>
                    <div><label class="block text-xs font-semibold">Drop Location</label><input type="text" id="drop-location" name="drop-location" class="w-full p-2 border border-gray-300 rounded-lg" required /></div>
                    <div><div id="map"></div></div>
                    <div class="flex justify-between mt-3">
                        <button type="button" class="px-4 py-2 bg-gray-500 text-white rounded-full text-sm" onclick="window.location.reload()">Cancel</button>
                        <button type="submit" class="px-4 py-2 bg-blue-500 text-white rounded-full text-sm">Confirm</button>
                    </div>
                </form>
            </section>
        </div>
    </div>
</body>
</html>