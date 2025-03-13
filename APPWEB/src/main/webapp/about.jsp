<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.jsdelivr.net/npm/alpinejs@3.0.0/dist/cdn.min.js" defer></script>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        .bg-gradient {
            background: linear-gradient(to top, #fffbf5, #fffef4);
        }
    </style>
    <title>About Us - Cab Service</title>
</head>
<body class="bg-white text-gray-800">

    <!-- About Section -->
    <div class="relative mt-10 h-screen bg-gradient pt-10 sm:pt-0 mb-10">
        <div class="container mx-auto grid grid-cols-1 md:grid-cols-2 items-center md:gap-20 bg-gradient">
            <!-- Left side Content -->
            <div class="content">
                <div class="flex items-center gap-3">
                    <hr class="w-10 bg-orange-500 border" />
                    <span class="md:text-[18px] font-medium text-gray-800">Reliable & Efficient</span>
                </div>
                <p class="text-[40px] lg:text-[45px] xl:text-[55px] font-bold leading-tight mt-5 sm:mt-0">
                    About Our Cab Service
                </p>
                <p class="mt-5 md:text-md">
                    We are a reliable cab service provider dedicated to getting you where you need to go safely and comfortably. 
                    Whether you're heading to the airport or commuting to work, we are here to provide the best transportation experience. 
                    Our mission is to offer the safest and most efficient ride, ensuring your satisfaction on every trip.
                </p>
                <div class="flex gap-4 mt-10">
                    <button class="font-medium text-[16px] flex items-center px-5 py-3 md:py-4 md:px-8 rounded-xl capitalize bg-gradient-to-r from-blue-300 to-blue-500 hover:from-pink-500 hover:to-yellow-500 relative gap-2 transition duration-300 hover:scale-105 text-white shadow-glass">
                        Get In Touch
                        <span class="animate-ping absolute right-0 top-0 w-3 h-3 rounded-full bg-gradient-to-r from-orange-400 to-orange-700"></span>
                    </button>
                    <a href="https://www.facebook.com" target="_blank" class="text-gray-800 hover:text-orange-500 text-2xl">
                        <i class="fab fa-facebook-square"></i>
                    </a>
                    <a href="https://www.behance.net" target="_blank" class="text-gray-800 hover:text-orange-500 text-2xl">
                        <i class="fab fa-behance"></i>
                    </a>
                </div>
            </div>

            <!-- Right side Image -->
            <div class="relative sm:mt-0 mt-10 px-6 sm:px-0">
                <img class="w-[600px] animate__animated animate__fadeInRight animate__delay-.5s" 
                    src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRaW5H89i5BGPkE4fxpeWnREZYr0KhfmuHswg&s" 
                    alt="Cab Service" />
            </div>
        </div>
    </div>

</body>
</html>
