<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Management</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body class="bg-gray-100">
        <div class="flex min-h-screen">
            <!-- Sidebar -->
            <%@ include file="adminsidebar.jsp" %>
            
            <!-- Main content area -->
            <div class="flex-1 p-10">
                <h1 class="text-3xl font-bold mb-5">Customer Management</h1>

                <!-- Search Bar -->
                <div class="mb-6">
                    <input type="text" id="searchBar" placeholder="Search by Name or Register No" class="w-full p-2 border border-gray-300 rounded-md">
                </div>

                <!-- Table for displaying customer details -->
                <div class="bg-white rounded-lg shadow-md overflow-hidden">
                    <table class="min-w-full">
                        <thead class="bg-gray-50">
                            <tr>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Register No</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Name</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">NIC</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Address</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Phone</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Actions</th>
                            </tr>
                        </thead>
                        <tbody id="customerTable" class="divide-y divide-gray-200">
                            <!-- Table rows will be populated dynamically -->
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <!-- View Customer Modal (Popup) -->
        <div id="viewModal" class="fixed inset-0 bg-gray-600 bg-opacity-50 flex items-center justify-center hidden">
            <div class="bg-white p-6 rounded-lg w-1/3">
                <h2 class="text-2xl font-semibold mb-4">Customer Details</h2>
                <p id="viewName" class="mb-2"><strong>Name:</strong> </p>
                <p id="viewRegisterNo" class="mb-2"><strong>Register No:</strong> </p>
                <p id="viewNIC" class="mb-2"><strong>NIC:</strong> </p>
                <p id="viewAddress" class="mb-2"><strong>Address:</strong> </p>
                <p id="viewPhone" class="mb-2"><strong>Phone:</strong> </p>
                <button onclick="closeModal()" class="mt-4 bg-gray-500 text-white px-4 py-2 rounded-md">Close</button>
            </div>
        </div>

        <script>
            // Sample data for demonstration (can be removed or fetched dynamically from the backend)
            let customers = [
                {
                    id: 1,
                    registerNo: "R001",
                    name: "John Doe",
                    nic: "123456789V",
                    address: "123 Main St, City",
                    phone: "+1234567890"
                },
                {
                    id: 2,
                    registerNo: "R002",
                    name: "Jane Smith",
                    nic: "987654321V",
                    address: "456 Elm St, Town",
                    phone: "+0987654321"
                }
            ];

            // Function to show customer details in a modal (popup)
            function viewCustomer(button) {
                const row = button.closest('tr');
                const customerId = row.getAttribute('data-id');
                const customer = customers.find(c => c.id === parseInt(customerId));

                document.getElementById('viewName').textContent = `Name: ${customer.name}`;
                document.getElementById('viewRegisterNo').textContent = `Register No: ${customer.registerNo}`;
                document.getElementById('viewNIC').textContent = `NIC: ${customer.nic}`;
                document.getElementById('viewAddress').textContent = `Address: ${customer.address}`;
                document.getElementById('viewPhone').textContent = `Phone: ${customer.phone}`;

                // Show the modal
                document.getElementById('viewModal').classList.remove('hidden');
            }

            // Function to close the modal
            function closeModal() {
                document.getElementById('viewModal').classList.add('hidden');
            }

            // Function to refresh the table
            function refreshTable() {
                const tbody = document.getElementById('customerTable');
                tbody.innerHTML = '';
                customers.forEach(customer => {
                    const row = `
                        <tr data-id="${customer.id}">
                            <td class="px-6 py-4">${customer.registerNo}</td>
                            <td class="px-6 py-4">${customer.name}</td>
                            <td class="px-6 py-4">${customer.nic}</td>
                            <td class="px-6 py-4">${customer.address}</td>
                            <td class="px-6 py-4">${customer.phone}</td>
                            <td class="px-6 py-4">
                                <button onclick="viewCustomer(this)" class="text-blue-500 hover:text-blue-700">View</button>
                            </td>
                        </tr>
                    `;
                    tbody.insertAdjacentHTML('beforeend', row);
                });
            }

            // Function to handle search
            document.getElementById('searchBar').addEventListener('input', function (e) {
                const searchTerm = e.target.value.toLowerCase();
                const rows = document.querySelectorAll('#customerTable tr');
                rows.forEach(row => {
                    const name = row.querySelector('td:nth-child(2)').textContent.toLowerCase();
                    const registerNo = row.querySelector('td:nth-child(1)').textContent.toLowerCase();
                    if (name.includes(searchTerm) || registerNo.includes(searchTerm)) {
                        row.style.display = '';
                    } else {
                        row.style.display = 'none';
                    }
                });
            });

            // Initial table population
            refreshTable();
        </script>
    </body>
</html>
