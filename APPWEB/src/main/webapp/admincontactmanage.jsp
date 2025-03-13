<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.mycompany.model.Contact" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Contact Management</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100">
    <div class="flex min-h-screen">
        <%@ include file="adminsidebar.jsp" %>

        <div class="flex-1 p-10">
            <h1 class="text-3xl font-bold mb-5">Contact Management</h1>

            <!-- Search Bar -->
            <div class="mb-6">
                <input type="text" id="searchBar" placeholder="Search by Name or Email" class="w-full p-2 border border-gray-300 rounded-md">
            </div>

            <!-- Table for displaying contact details -->
            <div class="bg-white rounded-lg shadow-md overflow-hidden">
                <table class="min-w-full">
                    <thead class="bg-gray-50">
                        <tr>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Name</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Email</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Phone</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Message</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Send on</th>
                        </tr>
                    </thead>
                    <tbody id="contactTable" class="divide-y divide-gray-200">
                        <%
                            Object obj = request.getAttribute("contactList");
                            if (obj instanceof List) {
                                List<Contact> contactList = (List<Contact>) obj;
                                if (contactList != null && !contactList.isEmpty()) {
                                    for (Contact contact : contactList) {
                        %>
                        <tr>
                            <td class="px-6 py-4"><%= contact.getName() %></td>
                            <td class="px-6 py-4"><%= contact.getEmail() %></td>
                            <td class="px-6 py-4"><%= contact.getPhone() %></td>
                            <td class="px-6 py-4"><%= contact.getMessage() %></td>
                            <td class="px-6 py-4"><%= contact.getCreatedAt() %></td>
                        </tr>
                        <%
                                    }
                                } else {
                        %>
                        <tr>
                            <td colspan="5" class="text-center py-4 text-red-500">No contacts found.</td>
                        </tr>
                        <%
                                }
                            } else {
                        %>
                        <tr>
                            <td colspan="5" class="text-center py-4 text-red-500">Error fetching contact list. Please check the servlet.</td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <script>
        // Function to handle search
        document.getElementById('searchBar').addEventListener('input', function (e) {
            const searchTerm = e.target.value.toLowerCase();
            const rows = document.querySelectorAll('#contactTable tr');
            rows.forEach(row => {
                const name = row.querySelector('td:nth-child(1)').textContent.toLowerCase();
                const email = row.querySelector('td:nth-child(2)').textContent.toLowerCase();
                if (name.includes(searchTerm) || email.includes(searchTerm)) {
                    row.style.display = '';
                } else {
                    row.style.display = 'none';
                }
            });
        });
    </script>
</body>
</html>
