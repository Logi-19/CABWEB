<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.mycompany.model.Driver, com.mycompany.dao.DriverDAO, java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Admin Dashboard - Driver Management</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100">
    <div class="flex min-h-screen">
        <!-- Sidebar -->
        <%@ include file="adminsidebar.jsp" %>

        <!-- Main content area -->
        <div class="flex-1 p-10">
            <h1 class="text-3xl font-bold mb-5">Driver Management</h1>

            <!-- Driver Form -->
            <form id="driverForm" class="bg-white p-6 rounded-lg shadow-md mb-6" action="DriverServlet" method="POST" enctype="multipart/form-data">
                <h2 class="text-xl font-semibold mb-4">Add/Edit Driver</h2>
                
                <input type="hidden" id="action" name="action" value="add">
                <input type="hidden" id="driverId" name="driverId">
                <input type="hidden" id="existingImageUrl" name="existingImageUrl">

                <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                    <div>
                        <label class="block text-sm font-medium text-gray-700">Name</label>
                        <input type="text" id="name" name="name" class="mt-1 block w-full p-2 border border-gray-300 rounded-md" required>
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700">NIC</label>
                        <input type="text" id="nic" name="nic" class="mt-1 block w-full p-2 border border-gray-300 rounded-md" required>
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700">Email</label>
                        <input type="email" id="email" name="email" class="mt-1 block w-full p-2 border border-gray-300 rounded-md" required>
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700">Address</label>
                        <input type="text" id="address" name="address" class="mt-1 block w-full p-2 border border-gray-300 rounded-md" required>
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700">Phone</label>
                        <input type="text" id="phone" name="phone" class="mt-1 block w-full p-2 border border-gray-300 rounded-md" required>
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700">License No</label>
                        <input type="text" id="licenseNo" name="licenseNo" class="mt-1 block w-full p-2 border border-gray-300 rounded-md" required>
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700">License Expiry Date</label>
                        <input type="date" id="licenseExpiredDate" name="licenseExpiredDate" class="mt-1 block w-full p-2 border border-gray-300 rounded-md" required>
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700">Image</label>
                        <input type="file" id="image" name="image" class="mt-1 block w-full p-2 border border-gray-300 rounded-md" accept="image/*">
                    </div>
                </div>

                <div class="mt-4">
                    <button type="submit" class="bg-blue-500 text-white px-4 py-2 rounded-md">Save Driver</button>
                    <button type="button" onclick="clearForm()" class="bg-gray-500 text-white px-4 py-2 rounded-md ml-2">Clear</button>
                </div>
            </form>

            <!-- Search Bar -->
            <div class="mb-6">
                <input type="text" id="searchBar" placeholder="Search by Name or NIC" class="w-full p-2 border border-gray-300 rounded-md">
            </div>

            <!-- Driver Table -->
            <div class="bg-white rounded-lg shadow-md overflow-hidden">
                <table class="min-w-full">
                    <thead class="bg-gray-50">
                        <tr>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Image</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Name</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">NIC</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Email</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Phone</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">License No</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">License Expiry Date</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Actions</th>
                        </tr>
                    </thead>
                    <tbody id="driverTable" class="divide-y divide-gray-200">
    <% 
        DriverDAO driverDAO = DriverDAO.getInstance();
        List<Driver> drivers = driverDAO.getAllDrivers();
        for (Driver driver : drivers) { 
    %>
    <tr data-id="<%= driver.getId() %>">
        <td class="px-6 py-4">
            <img src="<%= driver.getImageUrl() != null ? driver.getImageUrl() : "default.jpg" %>" 
                 alt="Driver Image" class="w-10 h-10 rounded-full driverImage">
        </td>
        <td class="px-6 py-4 name"><%= driver.getName() %></td>
        <td class="px-6 py-4 nic"><%= driver.getNic() %></td>
        <td class="px-6 py-4 email"><%= driver.getEmail() %></td>
        <td class="px-6 py-4 address" hidden><%= driver.getAddress() %></td>
        <td class="px-6 py-4 phone"><%= driver.getPhone() %></td>
        <td class="px-6 py-4 licenseNo"><%= driver.getLicenseNo() %></td>
        <td class="px-6 py-4 licenseExpiredDate"><%= driver.getLicenseExpiredDate() %></td>
        <td class="px-6 py-4">
            <button onclick="editDriver(this)" class="text-blue-500 hover:text-blue-700">Edit</button>
            <button onclick="deleteDriver(<%= driver.getId() %>)" class="text-red-500 hover:text-red-700 ml-2">Delete</button>
        </td>
    </tr>
    <% } %>
</tbody>

                </table>
            </div>
        </div>
    </div>

    <script>
    function editDriver(button) {
        const row = button.closest('tr');
        document.getElementById('action').value = "update";
        document.getElementById('driverId').value = row.dataset.id;
        document.getElementById('name').value = row.querySelector(".name").innerText;
        document.getElementById('nic').value = row.querySelector(".nic").innerText;
        document.getElementById('email').value = row.querySelector(".email").innerText;
        document.getElementById('address').value = row.querySelector(".address").innerText;
        document.getElementById('phone').value = row.querySelector(".phone").innerText;
        document.getElementById('licenseNo').value = row.querySelector(".licenseNo").innerText;
        document.getElementById('licenseExpiredDate').value = row.querySelector(".licenseExpiredDate").innerText;
        document.getElementById('existingImageUrl').value = row.querySelector(".driverImage").getAttribute("src");
    }

    function deleteDriver(driverId) {
        if (confirm("Are you sure you want to delete this driver?")) {
            fetch('DriverServlet?action=delete&driverId=' + driverId, {
                method: 'GET'
            }).then(response => {
                if (response.ok) {
                    location.reload();
                } else {
                    alert("Error deleting driver.");
                }
            });
        }
    }

    function clearForm() {
        document.getElementById('driverForm').reset();
        document.getElementById('action').value = "add";
        document.getElementById('driverId').value = "";
        document.getElementById('existingImageUrl').value = "";
    }

    document.getElementById('searchBar').addEventListener('input', function () {
        let filter = this.value.toLowerCase();
        let rows = document.querySelectorAll("#driverTable tr");

        rows.forEach(row => {
            let name = row.querySelector(".name").innerText.toLowerCase();
            let nic = row.querySelector(".nic").innerText.toLowerCase();
            row.style.display = (name.includes(filter) || nic.includes(filter)) ? "" : "none";
        });
    });
</script>

</body>
</html>
