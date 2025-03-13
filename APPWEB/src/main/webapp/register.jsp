<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cab Service Registration</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <script>
            // Function to generate Register No
            function generateRegisterNo() {
                const registerNo = 'CSR ' + String(Math.floor(Math.random() * 100000)).padStart(5, '0');
                document.getElementById('registerNo').value = registerNo;
            }

            // Function for form validation
            function validateForm() {
                const username = document.getElementById('username').value;
                const password = document.getElementById('password').value;
                const confirmPassword = document.getElementById('confirm_password').value;
                const usernamePattern = /^(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d@$!%*?&]{5,}$/; // Username should be at least 5 chars with number & special char
                const passwordPattern = /^(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d@$!%*?&]{7,}$/; // Password should be at least 7 chars with number & special char
                
                // Validate username
                if (!usernamePattern.test(username)) {
                    alert('Username must be at least 5 characters long, containing numbers and special characters.');
                    return false;
                }

                // Validate password
                if (!passwordPattern.test(password)) {
                    alert('Password must be at least 7 characters long, containing numbers and special characters.');
                    return false;
                }

                // Validate confirm password
                if (password !== confirmPassword) {
                    alert('Passwords do not match!');
                    return false;
                }

                return true;
            }

            window.onload = function() {
                generateRegisterNo(); // Generate Register No when page loads
            }
        </script>
    </head>
    <body>
        <!-- Cab Service Registration Page -->
        <div class="font-sans">
            <div class="relative min-h-screen flex flex-col sm:justify-center items-center bg-gray-100">
                <div class="relative sm:max-w-lg w-full">
                    <div class="card bg-blue-400 shadow-lg w-full h-full rounded-3xl absolute transform -rotate-6"></div>
                    <div class="card bg-red-400 shadow-lg w-full h-full rounded-3xl absolute transform rotate-6"></div>
                    <div class="relative w-full rounded-3xl px-6 py-4 bg-gray-100 shadow-md">
                        <label for="" class="block mt-3 text-sm text-gray-700 text-center font-semibold">
                            Register
                        </label>
                        <form method="post" action="#" class="mt-10" onsubmit="return validateForm()">

                            <!-- Flex container for the form -->
                            <div class="grid grid-cols-2 gap-6">

                                <!-- Left side of the form -->
                                <div class="flex flex-col">
                                    <div>
                                        <input type="text" name="name" placeholder="Full Name" class="mt-7 block w-full border-none bg-gray-100 h-11 rounded-xl shadow-lg hover:bg-blue-100 focus:bg-blue-100 focus:ring-0">
                                    </div>

                                    <div class="mt-7">
                                        <input type="email" name="email" placeholder="Email Address" class="mt-1 block w-full border-none bg-gray-100 h-11 rounded-xl shadow-lg hover:bg-blue-100 focus:bg-blue-100 focus:ring-0">
                                    </div>
            
                                    <div class="mt-7">
                                        <input type="text" name="phone" placeholder="Phone Number" class="mt-1 block w-full border-none bg-gray-100 h-11 rounded-xl shadow-lg hover:bg-blue-100 focus:bg-blue-100 focus:ring-0">
                                    </div>

                                    <!-- Added NIC field here -->
                                    <div class="mt-7">
                                        <input type="text" name="nic" placeholder="NIC Number" class="mt-1 block w-full border-none bg-gray-100 h-11 rounded-xl shadow-lg hover:bg-blue-100 focus:bg-blue-100 focus:ring-0">
                                    </div>

                                    <div class="mt-7">
                                        <input type="text" name="address" placeholder="Address" class="mt-1 block w-full border-none bg-gray-100 h-11 rounded-xl shadow-lg hover:bg-blue-100 focus:bg-blue-100 focus:ring-0">
                                    </div>
                                </div>

                                <!-- Right side of the form -->
                                <div class="flex flex-col">
                                    <div>
                                        <input type="text" id="registerNo" name="registerNo" placeholder="Register No" value="" class="mt-1 block w-full border-none bg-gray-100 h-11 rounded-xl shadow-lg hover:bg-blue-100 focus:bg-blue-100 focus:ring-0" readonly>
                                    </div>
                                    
                                    <div class="mt-7">
                                        <input type="text" id="username" name="username" placeholder="Username" class="mt-1 block w-full border-none bg-gray-100 h-11 rounded-xl shadow-lg hover:bg-blue-100 focus:bg-blue-100 focus:ring-0">
                                    </div>

                                    <div class="mt-7">
                                        <input type="password" id="password" name="password" placeholder="Password" class="mt-1 block w-full border-none bg-gray-100 h-11 rounded-xl shadow-lg hover:bg-blue-100 focus:bg-blue-100 focus:ring-0">
                                    </div>

                                    <div class="mt-7">
                                        <input type="password" id="confirm_password" name="confirm_password" placeholder="Confirm Password" class="mt-1 block w-full border-none bg-gray-100 h-11 rounded-xl shadow-lg hover:bg-blue-100 focus:bg-blue-100 focus:ring-0">
                                    </div>
                                </div>

                            </div>

                            <!-- Register Button -->
                            <div class="mt-7">
                                <button type="submit" class="bg-blue-500 w-full py-3 rounded-xl text-white shadow-xl hover:shadow-inner focus:outline-none transition duration-500 ease-in-out transform hover:-translate-x hover:scale-105">
                                    Register
                                </button>
                            </div>
                            
                            <!-- Login Link -->
                            <div class="mt-7">
                                <div class="flex justify-center items-center">
                                    <label class="mr-2">Already have an account?</label>
                                    <a href="login.jsp" class="text-blue-500 transition duration-500 ease-in-out transform hover:-translate-x hover:scale-105">
                                        Login
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
