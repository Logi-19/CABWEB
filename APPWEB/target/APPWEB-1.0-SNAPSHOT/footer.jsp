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
        .footer-bg {
            background-color: #1E3A8A; /* Blue background */
        }
        .footer-text {
            color: #FFFFFF; /* White text */
        }
        .footer-hover:hover {
            background-color: #3B82F6; /* Hover effect for links */
        }
    </style>
</head>
<body class="bg-white text-gray-800">
    <!-- Footer Section -->
    <div class="footer-bg py-8">
        <div class="max-w-screen-xl mx-auto text-white px-4 sm:px-6 lg:px-8">
            <div class="flex flex-col md:flex-row justify-between">
                <!-- Footer Brand/Logo -->
                <div class="mb-6 md:mb-0">
                    <a href="index.jsp" class="text-2xl font-semibold text-white tracking-widest uppercase focus:outline-none">Cab Service</a>
                    <p class="mt-2 text-sm">Your reliable partner for comfortable and safe rides.</p>
                </div>

                <!-- Footer Links -->
                <div class="flex space-x-6">
                    <div>
                        <h5 class="font-semibold text-lg">Quick Links</h5>
                        <ul class="space-y-2 mt-2">
                            <li><a href="index.jsp" class="footer-text footer-hover">Home</a></li>
                            <li><a href="service.jsp" class="footer-text footer-hover">Services</a></li>
                            <li><a href="booking.jsp" class="footer-text footer-hover">Book a Ride</a></li>
                            <li><a href="login.jsp" class="footer-text footer-hover">Login</a></li>
                        </ul>
                    </div>

                    <div>
                        <h5 class="font-semibold text-lg">Support</h5>
                        <ul class="space-y-2 mt-2">
                            <li><a href="#" class="footer-text footer-hover">Contact Us</a></li>
                            <li><a href="#" class="footer-text footer-hover">Privacy Policy</a></li>
                            <li><a href="#" class="footer-text footer-hover">Terms & Conditions</a></li>
                        </ul>
                    </div>

                    <!-- Social Media Links -->
                    <div>
                        <h5 class="font-semibold text-lg">Follow Us</h5>
                        <div class="flex space-x-4 mt-2">
                            <a href="#" class="footer-text footer-hover">Facebook</a>
                            <a href="#" class="footer-text footer-hover">Twitter</a>
                            <a href="#" class="footer-text footer-hover">Instagram</a>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Footer Bottom -->
            <div class="mt-8 border-t border-white pt-4 text-center text-sm">
                <p>&copy; 2025 Cab Service. All rights reserved.</p>
            </div>
        </div>
    </div>
</body>
</html>
