<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="bg-gray-800 text-white w-64 min-h-screen p-6">
            <h1 class="text-2xl font-bold mb-6">Admin Panel</h1>
            <ul class="space-y-3">
                <li>
                    <a href="admindashboard.jsp" class="flex items-center p-2 hover:bg-gray-700 rounded">
                        <span>Dashboard</span>
                    </a>
                </li>
                <li>
                    <a href="admindrivermanage.jsp" class="flex items-center p-2 hover:bg-gray-700 rounded">
                        <span>Driver Manage</span>
                    </a>
                </li>
                <li>
                    <a href="adminvehiclemanage.jsp" class="flex items-center p-2 hover:bg-gray-700 rounded">
                        <span>Vehicle Manage</span>
                    </a>
                </li>
                <li>
                    <a href="adminbookeddetails.jsp" class="flex items-center p-2 hover:bg-gray-700 rounded">
                        <span>Booked Details</span>
                    </a>
                </li>
                <li>
                    <a href="adminallocation.jsp" class="flex items-center p-2 hover:bg-gray-700 rounded">
                        <span>Vehicle&Driver Allocation</span>
                    </a>
                </li>
                <li>
                    <a href="admincustomerdetails.jsp" class="flex items-center p-2 hover:bg-gray-700 rounded">
                        <span>Customer Manage</span>
                    </a>
                </li>
                <li>
                    <a href="admincontactmanage.jsp" class="flex items-center p-2 hover:bg-gray-700 rounded">
                        <span>Customer Contact Manage</span>
                    </a>
                </li>
                <li>
                    <a href="adminfeedbackmanage.jsp" class="flex items-center p-2 hover:bg-gray-700 rounded">
                        <span>Feedback Manage</span>
                    </a>
                </li>
                <li class="mt-6">
                    <a href="logout.jsp" class="flex items-center p-2 hover:bg-gray-700 rounded">
                        <span>Logout</span>
                    </a>
                </li>
            </ul>
        </div>
    </body>
</html>
