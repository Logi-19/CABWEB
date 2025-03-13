<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Dashboard</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body class="bg-gray-100">
        <div class="flex min-h-screen">
            <!-- Sidebar -->
            <%@ include file="adminsidebar.jsp" %>
            
            <!-- Main content area -->
            <div class="flex-1 p-10">
                <h1 class="text-3xl font-bold mb-5">Admin Dashboard</h1>
                
                <!-- Main Content -->
                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                    <div class="bg-white p-6 rounded-lg shadow-md">
                        <h2 class="text-xl font-semibold">Total Drivers</h2>
                        <p class="text-2xl font-bold mt-2">150</p>
                    </div>
                    <div class="bg-white p-6 rounded-lg shadow-md">
                        <h2 class="text-xl font-semibold">Total Vehicles</h2>
                        <p class="text-2xl font-bold mt-2">75</p>
                    </div>
                    <div class="bg-white p-6 rounded-lg shadow-md">
                        <h2 class="text-xl font-semibold">Total Customers</h2>
                        <p class="text-2xl font-bold mt-2">500</p>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
