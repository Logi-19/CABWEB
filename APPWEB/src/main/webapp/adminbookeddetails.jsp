<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Booked Details</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body class="bg-gray-100">
        <div class="flex min-h-screen">
            <%@ include file="adminsidebar.jsp" %>
            
            <div class="flex-1 p-10">
                <h1 class="text-3xl font-bold mb-5">Booked Details</h1>

                <div class="bg-white rounded-lg shadow-md overflow-hidden">
                    <table class="min-w-full">
                        <thead class="bg-gray-50">
                            <tr>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Vehicle No</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Vehicle Type</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Driver Name</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Driver Phone</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Customer Name</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Pickup Location</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Drop Location</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Total Distance</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Total Price</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Actions</th>
                            </tr>
                        </thead>
                        <tbody id="bookedTable" class="divide-y divide-gray-200">
                            <tr data-id="1">
                                <td class="px-6 py-4">V001</td>
                                <td class="px-6 py-4">SUV</td>
                                <td class="px-6 py-4">John Doe</td>
                                <td class="px-6 py-4">+1234567890</td>
                                <td class="px-6 py-4">Alice Brown</td>
                                <td class="px-6 py-4">Central Park</td>
                                <td class="px-6 py-4">Airport</td>
                                <td class="px-6 py-4">15km</td>
                                <td class="px-6 py-4">$50</td>
                                <td class="px-6 py-4">
                                    <button onclick="viewBooking(this)" class="text-blue-500 hover:text-blue-700">View</button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <!-- View Details Modal -->
        <div id="viewModal" class="fixed inset-0 bg-gray-600 bg-opacity-50 flex items-center justify-center hidden">
            <div class="bg-white p-6 rounded-lg w-1/3 shadow-lg">
                <h2 class="text-2xl font-semibold mb-4 text-gray-700">Booking Details</h2>
                <p id="modalVehicleNo" class="mb-2"><strong>Vehicle No:</strong> </p>
                <p id="modalVehicleType" class="mb-2"><strong>Vehicle Type:</strong> </p>
                <p id="modalDriverName" class="mb-2"><strong>Driver Name:</strong> </p>
                <p id="modalDriverPhone" class="mb-2"><strong>Driver Phone:</strong> </p>
                <p id="modalCustomerName" class="mb-2"><strong>Customer Name:</strong> </p>
                <p id="modalPickupLocation" class="mb-2"><strong>Pickup Location:</strong> </p>
                <p id="modalDropLocation" class="mb-2"><strong>Drop Location:</strong> </p>
                <p id="modalTotalDistance" class="mb-2"><strong>Total Distance:</strong> </p>
                <p id="modalTotalPrice" class="mb-2"><strong>Total Price:</strong> </p>
                <button onclick="closeModal()" class="mt-4 bg-blue-500 text-white px-4 py-2 rounded-md hover:bg-blue-600">Close</button>
            </div>
        </div>

        <script>
            let bookings = [
                {
                    id: 1,
                    vehicleNo: "V001",
                    vehicleType: "SUV",
                    driverName: "John Doe",
                    driverPhone: "+1234567890",
                    customerName: "Alice Brown",
                    pickupLocation: "Central Park",
                    dropLocation: "Airport",
                    totalDistance: "15km",
                    totalPrice: "$50"
                }
            ];

            function viewBooking(button) {
                const row = button.closest('tr');
                const bookingId = row.getAttribute('data-id');
                const booking = bookings.find(b => b.id === parseInt(bookingId));

                document.getElementById('modalVehicleNo').textContent = `Vehicle No: ${booking.vehicleNo}`;
                document.getElementById('modalVehicleType').textContent = `Vehicle Type: ${booking.vehicleType}`;
                document.getElementById('modalDriverName').textContent = `Driver Name: ${booking.driverName}`;
                document.getElementById('modalDriverPhone').textContent = `Driver Phone: ${booking.driverPhone}`;
                document.getElementById('modalCustomerName').textContent = `Customer Name: ${booking.customerName}`;
                document.getElementById('modalPickupLocation').textContent = `Pickup Location: ${booking.pickupLocation}`;
                document.getElementById('modalDropLocation').textContent = `Drop Location: ${booking.dropLocation}`;
                document.getElementById('modalTotalDistance').textContent = `Total Distance: ${booking.totalDistance}`;
                document.getElementById('modalTotalPrice').textContent = `Total Price: ${booking.totalPrice}`;

                document.getElementById('viewModal').classList.remove('hidden');
            }

            function closeModal() {
                document.getElementById('viewModal').classList.add('hidden');
            }
        </script>
    </body>
</html>
