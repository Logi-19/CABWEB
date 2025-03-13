<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Raleway:wght@300;400;500;600;700&display=swap" rel="stylesheet" />
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        body {
            font-family: "Raleway", sans-serif;
        }
    </style>
    <title>Contact Us - Cab Service</title>
</head>
<body class="bg-white text-gray-800">

    <!-- Contact Section -->
    <section class="relative py-32 lg:py-36 bg-white">
        <div class="mx-auto lg:max-w-7xl w-full px-5 sm:px-10 md:px-12 lg:px-5 flex flex-col lg:flex-row gap-10 lg:gap-12">
            <!-- Left Side: Image + Contact Details -->
            <div class="flex-1 lg:w-1/2 relative space-y-6">
                <!-- Image -->
                <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSrfrea9J5X-5AKAPtnolldNaHz363odzOL0w&s" alt="Cab Service" class="w-full h-auto rounded-xl object-cover shadow-lg" />

                <!-- Contact Details -->
                <div class="text-center lg:text-left space-y-4">
                    <h1 class="text-3xl font-bold text-gray-900">Contact Details</h1>
                    <p class="mt-4 text-lg text-gray-700">You can also reach us through the following channels:</p>
                    
                    <!-- Address / Phone / Email -->
                    <div class="mt-6 space-y-4">
                        <div class="flex items-center space-x-2">
                            <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6 text-blue-600" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <path d="M21 16a8.29 8.29 0 0 1-4-1.089A10.145 10.145 0 0 0 12 13a10.145 10.145 0 0 0-5 1.911A8.29 8.29 0 0 1 3 16"></path>
                            </svg>
                            <span class="text-lg text-gray-600">+1 (555) 123-4567</span>
                        </div>
                        <div class="flex items-center space-x-2">
                            <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6 text-blue-600" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <path d="M3 12l2-2 4 4 8-8 4 4"></path>
                            </svg>
                            <span class="text-lg text-gray-600">contact@cabservice.com</span>
                        </div>
                        <div class="flex items-center space-x-2">
                            <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6 text-blue-600" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <path d="M21 10h-3v6h-3V10H9v6H6V10H3"></path>
                            </svg>
                            <span class="text-lg text-gray-600">1234 Cab Street, City, Country</span>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Right Side: Contact Form -->
            <div class="flex-1 lg:w-1/2 mx-auto lg:mx-0 max-w-3xl space-y-6">
                <form action="ContactServlet" method="post" class="space-y-6">
                    <!-- Name Input -->
                    <div>
                        <label for="name" class="block text-lg font-medium text-gray-700">Your Name</label>
                        <input type="text" name="name" id="name" required class="w-full px-4 py-3 mt-2 border border-gray-300 rounded-md focus:ring-blue-600 focus:border-blue-600">
                    </div>

                    <!-- Email Input -->
                    <div>
                        <label for="email" class="block text-lg font-medium text-gray-700">Your Email</label>
                        <input type="email" name="email" id="email" required class="w-full px-4 py-3 mt-2 border border-gray-300 rounded-md focus:ring-blue-600 focus:border-blue-600">
                    </div>

                    <!-- Phone Number Input -->
                    <div>
                        <label for="phone" class="block text-lg font-medium text-gray-700">Your Phone Number</label>
                        <input type="tel" name="phone" id="phone" required class="w-full px-4 py-3 mt-2 border border-gray-300 rounded-md focus:ring-blue-600 focus:border-blue-600">
                    </div>

                    <!-- Message Input -->
                    <div>
                        <label for="message" class="block text-lg font-medium text-gray-700">Your Message</label>
                        <textarea name="message" id="message" rows="5" required class="w-full px-4 py-3 mt-2 border border-gray-300 rounded-md focus:ring-blue-600 focus:border-blue-600"></textarea>
                    </div>

                    <!-- Submit Button -->
                    <div class="mt-6">
                        <button type="submit" class="w-full px-6 py-3 bg-blue-600 text-white font-semibold rounded-md hover:bg-blue-700">
                            Send Message
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </section>

</body>
</html>
