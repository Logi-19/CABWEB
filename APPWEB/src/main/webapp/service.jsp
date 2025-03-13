<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Our Cab Services</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
    
    <%@ include file="navbar.jsp" %> <!-- Include the navbar -->

    <!-- Component -->
    <div id="services" class="section relative pt-20 pb-8 md:pt-16 md:pb-0 bg-white mt-16"> <!-- Added mt-16 for spacing below fixed navbar -->
        <div class="container xl:max-w-6xl mx-auto px-4">
            <!-- Heading start -->
            <header class="text-center mx-auto mb-12 lg:px-20">
                <h2 class="text-2xl leading-normal mb-2 font-bold text-black">Our Cab Services</h2>
                <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 100 60" style="margin: 0 auto;height: 35px;" xml:space="preserve">
                    <circle cx="50.1" cy="30.4" r="5" class="stroke-primary" style="fill: transparent;stroke-width: 2;stroke-miterlimit: 10;"></circle>
                    <line x1="55.1" y1="30.4" x2="100" y2="30.4" class="stroke-primary" style="stroke-width: 2;stroke-miterlimit: 10;"></line>
                    <line x1="45.1" y1="30.4" x2="0" y2="30.4" class="stroke-primary" style="stroke-width: 2;stroke-miterlimit: 10;"></line>
                </svg>
                <p class="text-gray-500 leading-relaxed font-light text-xl mx-auto pb-2">Efficient and reliable transportation for your needs.</p>
            </header>
            <!-- End heading -->

            <!-- Row start -->
            <div class="flex flex-wrap flex-row -mx-4 text-center">
                
                <!-- Service 1: Airport Transfers -->
                <div class="flex-shrink px-4 max-w-full w-full sm:w-1/2 lg:w-1/3 lg:px-6 wow fadeInUp" data-wow-duration="1s" data-wow-delay="0s">
                    <!-- Service block -->
                    <div class="py-8 px-12 mb-12 bg-gray-50 border-b border-gray-100 transform transition duration-300 ease-in-out hover:-translate-y-2">
                        <div class="inline-block text-gray-900 mb-4">
                            <!-- Icon -->
                            <svg xmlns="http://www.w3.org/2000/svg" width="2rem" height="2rem" fill="currentColor" class="bi bi-car-front" viewBox="0 0 16 16">
                                <path d="M6 9V5h4v4H6zM8 2H4a1 1 0 0 0-1 1v6h6V3a1 1 0 0 0-1-1H8zm4 7H4v7h8V9z"></path>
                            </svg>
                        </div>
                        <h3 class="text-lg leading-normal mb-2 font-semibold text-black">Airport Transfers</h3>
                        <p class="text-gray-500">Convenient and comfortable rides to and from the airport, ensuring timely arrivals.</p>
                    </div>
                    <!-- End service block -->
                </div>

                <!-- Service 2: City Rides -->
                <div class="flex-shrink px-4 max-w-full w-full sm:w-1/2 lg:w-1/3 lg:px-6 wow fadeInUp" data-wow-duration="1s" data-wow-delay=".1s">
                    <!-- Service block -->
                    <div class="py-8 px-12 mb-12 bg-gray-50 border-b border-gray-100 transform transition duration-300 ease-in-out hover:-translate-y-2">
                        <div class="inline-block text-gray-900 mb-4">
                            <!-- Icon -->
                            <svg xmlns="http://www.w3.org/2000/svg" width="2rem" height="2rem" fill="currentColor" class="bi bi-car-front" viewBox="0 0 16 16">
                                <path d="M6 9V5h4v4H6zM8 2H4a1 1 0 0 0-1 1v6h6V3a1 1 0 0 0-1-1H8zm4 7H4v7h8V9z"></path>
                            </svg>
                        </div>
                        <h3 class="text-lg leading-normal mb-2 font-semibold text-black">City Rides</h3>
                        <p class="text-gray-500">Reliable and affordable rides within the city, with flexible pick-up and drop-off options.</p>
                    </div>
                    <!-- End service block -->
                </div>

                <!-- Service 3: Long Distance Travel -->
                <div class="flex-shrink px-4 max-w-full w-full sm:w-1/2 lg:w-1/3 lg:px-6 wow fadeInUp" data-wow-duration="1s" data-wow-delay=".2s">
                    <!-- Service block -->
                    <div class="py-8 px-12 mb-12 bg-gray-50 border-b border-gray-100 transform transition duration-300 ease-in-out hover:-translate-y-2">
                        <div class="inline-block text-gray-900 mb-4">
                            <!-- Icon -->
                            <svg xmlns="http://www.w3.org/2000/svg" width="2rem" height="2rem" fill="currentColor" class="bi bi-car-front" viewBox="0 0 16 16">
                                <path d="M6 9V5h4v4H6zM8 2H4a1 1 0 0 0-1 1v6h6V3a1 1 0 0 0-1-1H8zm4 7H4v7h8V9z"></path>
                            </svg>
                        </div>
                        <h3 class="text-lg leading-normal mb-2 font-semibold text-black">Long Distance Travel</h3>
                        <p class="text-gray-500">Comfortable and affordable long-distance cab rides for travel between cities or regions.</p>
                    </div>
                    <!-- End service block -->
                </div>

                <!-- Service 4: Corporate Services -->
                <div class="flex-shrink px-4 max-w-full w-full sm:w-1/2 lg:w-1/3 lg:px-6 wow fadeInUp" data-wow-duration="1s" data-wow-delay=".3s">
                    <!-- Service block -->
                    <div class="py-8 px-12 mb-12 bg-gray-50 border-b border-gray-100 transform transition duration-300 ease-in-out hover:-translate-y-2">
                        <div class="inline-block text-gray-900 mb-4">
                            <!-- Icon -->
                            <svg xmlns="http://www.w3.org/2000/svg" width="2rem" height="2rem" fill="currentColor" class="bi bi-car-front" viewBox="0 0 16 16">
                                <path d="M6 9V5h4v4H6zM8 2H4a1 1 0 0 0-1 1v6h6V3a1 1 0 0 0-1-1H8zm4 7H4v7h8V9z"></path>
                            </svg>
                        </div>
                        <h3 class="text-lg leading-normal mb-2 font-semibold text-black">Corporate Services</h3>
                        <p class="text-gray-500">Professional transport services tailored for corporate clients, ensuring punctuality and comfort.</p>
                    </div>
                    <!-- End service block -->
                </div>

                <!-- Service 5: Event Transportation -->
                <div class="flex-shrink px-4 max-w-full w-full sm:w-1/2 lg:w-1/3 lg:px-6 wow fadeInUp" data-wow-duration="1s" data-wow-delay=".4s">
                    <!-- Service block -->
                    <div class="py-8 px-12 mb-12 bg-gray-50 border-b border-gray-100 transform transition duration-300 ease-in-out hover:-translate-y-2">
                        <div class="inline-block text-gray-900 mb-4">
                            <!-- Icon -->
                            <svg xmlns="http://www.w3.org/2000/svg" width="2rem" height="2rem" fill="currentColor" class="bi bi-car-front" viewBox="0 0 16 16">
                                <path d="M6 9V5h4v4H6zM8 2H4a1 1 0 0 0-1 1v6h6V3a1 1 0 0 0-1-1H8zm4 7H4v7h8V9z"></path>
                            </svg>
                        </div>
                        <h3 class="text-lg leading-normal mb-2 font-semibold text-black">Event Transportation</h3>
                        <p class="text-gray-500">Specialized transportation for events such as weddings, conferences, or large group outings.</p>
                    </div>
                    <!-- End service block -->
                </div>

                <!-- Service 6: 24/7 Customer Support -->
                <div class="flex-shrink px-4 max-w-full w-full sm:w-1/2 lg:w-1/3 lg:px-6 wow fadeInUp" data-wow-duration="1s" data-wow-delay=".5s">
                    <!-- Service block -->
                    <div class="py-8 px-12 mb-12 bg-gray-50 border-b border-gray-100 transform transition duration-300 ease-in-out hover:-translate-y-2">
                        <div class="inline-block text-gray-900 mb-4">
                            <!-- Icon -->
                            <svg xmlns="http://www.w3.org/2000/svg" width="2rem" height="2rem" fill="currentColor" class="bi bi-car-front" viewBox="0 0 16 16">
                                <path d="M6 9V5h4v4H6zM8 2H4a1 1 0 0 0-1 1v6h6V3a1 1 0 0 0-1-1H8zm4 7H4v7h8V9z"></path>
                            </svg>
                        </div>
                        <h3 class="text-lg leading-normal mb-2 font-semibold text-black">24/7 Customer Support</h3>
                        <p class="text-gray-500">Our support team is available round the clock to assist you with any queries or booking requirements.</p>
                    </div>
                    <!-- End service block -->
                </div>
            </div>
            <!-- End row -->

        </div>
    </div>
    <!-- End component -->
</body>
</html>
