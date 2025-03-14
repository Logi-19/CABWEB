<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cab Service Login</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body>
        <!-- Cab Service Login Page -->
        <div class="font-sans">
            <div class="relative min-h-screen flex flex-col sm:justify-center items-center bg-gray-100 ">
                <div class="relative sm:max-w-sm w-full">
                    <div class="card bg-blue-400 shadow-lg  w-full h-full rounded-3xl absolute transform -rotate-6"></div>
                    <div class="card bg-red-400 shadow-lg  w-full h-full rounded-3xl absolute transform rotate-6"></div>
                    <div class="relative w-full rounded-3xl  px-6 py-4 bg-gray-100 shadow-md">
                        <label for="" class="block mt-3 text-sm text-gray-700 text-center font-semibold">
                            Login
                        </label>
                        <!-- Update the form method and action -->
                        <form method="post" action="login" class="mt-10">
                            
                            <!-- Add name attributes to inputs for servlet to retrieve values -->
                            <div>
                                <input type="text" name="username" placeholder="Username" class="mt-1 block w-full border-none bg-gray-100 h-11 rounded-xl shadow-lg hover:bg-blue-100 focus:bg-blue-100 focus:ring-0">
                            </div>
            
                            <div class="mt-7">                
                                <input type="password" name="password" placeholder="Password" class="mt-1 block w-full border-none bg-gray-100 h-11 rounded-xl shadow-lg hover:bg-blue-100 focus:bg-blue-100 focus:ring-0">                           
                            </div>
            
                            <div class="mt-7">
                                <button type="submit" class="bg-blue-500 w-full py-3 rounded-xl text-white shadow-xl hover:shadow-inner focus:outline-none transition duration-500 ease-in-out transform hover:-translate-x hover:scale-105">
                                    Login
                                </button>
                            </div>
            
                            <div class="mt-7">
                                <div class="flex justify-center items-center">
                                    <label class="mr-2">New here?</label>
                                    <a href="register.jsp" class="text-blue-500 transition duration-500 ease-in-out transform hover:-translate-x hover:scale-105">
                                        Create an account
                                    </a>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>