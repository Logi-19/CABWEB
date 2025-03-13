<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.jsdelivr.net/npm/alpinejs@3.0.0/dist/cdn.min.js" defer></script>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        /* Custom styles for white-blue theme */
        .navbar-bg {
            background-color: #1E3A8A; /* Blue background */
        }
        .navbar-text {
            color: #FFFFFF; /* White text */
        }
        .navbar-hover:hover {
            background-color: #3B82F6; /* Hover effect for links */
        }
        /* Fixed navbar at top */
        .navbar-fixed {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            z-index: 50;
        }
    </style>
</head>
<body class="bg-white text-gray-800">
    <div class="bg-white shadow-md navbar-fixed">
        <div class="w-full px-4 py-4 text-white navbar-bg">
            <div x-data="{ open: false }" class="flex items-center justify-between max-w-screen-xl mx-auto md:px-6 lg:px-8">
                <!-- Logo/Brand Name -->
                <a href="index.jsp" class="text-2xl font-semibold text-white tracking-widest uppercase focus:outline-none">Cab Service</a>

                <!-- Desktop Navigation Menu -->
                <div class="hidden md:flex space-x-8">
                    <a href="index.jsp" class="navbar-text navbar-hover px-4 py-2 rounded-lg">Home</a>
                    <a href="service.jsp" class="navbar-text navbar-hover px-4 py-2 rounded-lg">Services</a>
                    <a href="booking.jsp" class="navbar-text navbar-hover px-4 py-2 rounded-lg">Book a Ride</a>
                    <a href="login.jsp" class="navbar-text navbar-hover px-4 py-2 rounded-lg">Login</a>
                </div>

                <!-- Mobile Menu Button -->
                <button class="md:hidden text-white focus:outline-none" @click="open = !open">
                    <svg fill="currentColor" viewBox="0 0 20 20" class="w-6 h-6">
                        <path x-show="!open" fill-rule="evenodd" d="M3 5a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 10a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM9 15a1 1 0 011-1h6a1 1 0 110 2h-6a1 1 0 01-1-1z" clip-rule="evenodd"></path>
                        <path x-show="open" fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path>
                    </svg>
                </button>
            </div>

            <!-- Mobile Navigation Menu (only visible when open is true) -->
            <nav :class="{'flex': open, 'hidden': !open}" class="flex-col flex-grow hidden md:hidden pt-4 space-y-4">
                <a href="index.jsp" class="navbar-text navbar-hover px-4 py-2 rounded-lg">Home</a>
                <a href="service.jsp" class="navbar-text navbar-hover px-4 py-2 rounded-lg">Services</a>
                <a href="booking.jsp" class="navbar-text navbar-hover px-4 py-2 rounded-lg">Book a Ride</a>
                <a href="#" class="navbar-text navbar-hover px-4 py-2 rounded-lg">Login</a>
            </nav>
        </div>
    </div>
</body>
</html>
